require('LuaU')
config = require('config')
require('strings')
require('tables')
texts = require('texts')
buffs = require('res/buffs')
job_abilities = require('res/abilities')
spells = require('res/spells')
jobs = require('res/jobs')
items = require('res/items')
isbusy = require('isbusy')
monster_families = require("andreaslibs/monster_families")

_addon.name = 'Samurai Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'samurai_helper', 'sh'}
----Don't touch!  Magic numbers! ---
hasso  = 12345
seigan = 12456
------------------------------------

addon_enabled = true
meditate_below_tp = 3000
do_auto_weaponskills = true
mobhp_ws_pct = false -- Percent at which to weaponskill for single weaponskills
do_sengikori = false
do_hagakure = false
do_auto_hasso_seigan = hasso
default_weaponskill_tp = 1000
keep_aftermath_up = false
aftermath_level = 3
aftermath_weaponskill = "tachi: rana"
do_auto_warding_circle = true
do_auto_hamanoha = true

-- 6 step skillchain double light
--Gravitation    Tachi: Rana

--Fragmentation  Tachi: Shoha, Tachi: Kaiten
--Distortion     Tachi: Fudo,  Tachi: Gekko
--Fusion         Tachi: Kasha
--Fragmentation  Tachi: Shoha, Tachi: Kaiten
--Light          Tachi: Fudo
--Light          Tachi: Fudo


tsu_double_light = {
	"Tachi: Kasha",
	"Tachi: Shoha",
	"Tachi: Fudo",
}

six_step_double_light = {
	"Tachi: Ageha",
	"Tachi: Yukikaze",
	"Tachi: Kasha",
	"Tachi: Shoha",
	"Tachi: Kasha",
	"Tachi: Fudo"
}

six_step_double_light2 = {
--"Tachi: Ageha",
"Tachi: Rana",
"Tachi: Shoha",
"Tachi: Fudo",
"Tachi: Kasha",
"Tachi: Shoha",
"Tachi: Fudo"
}


six_step_double_light_kaiten = {
	"Tachi: Kaiten",
	"Tachi: Gekko",
	"Tachi: Kasha",
	"Tachi: Shoha",
	"Tachi: Fudo",
	"Tachi: Fudo",
}


sc_weaponskills = {
  "Tachi: Kasha",
  "Tachi: Kaiten",
	"Tachi: Fudo",
}

basic_ws = "Tachi: Gekko"

vw_weaponskills = {
    "Tachi: Enpi",
    "Tachi: Hobaku",
    "Tachi: Goten",
    "Tachi: Kagero",
    "Tachi: Jinpu",
    "Tachi: Koki",
    "Tachi: Yukikaze",
    "Tachi: Gekko",
    "Tachi: Kasha",
    "Tachi: Ageha",
}

konzen_double_light_or_darkness = {
	function(def_ws)
		def_ws = def_ws or "Tachi: Rana"
		local retVal = false
		local ability_recasts = windower.ffxi.get_job_ability_recast()
		
		-- Is Konzen-ittai ready?
		if ability_recasts[job_ability_names['Konzen-ittai']] == 0 then
			windower.send_command('input /ja "Konzen-ittai" <me>')
			retVal = true
		elseif ability_recasts[job_ability_names['Konzen-ittai']] >= (180-6) then
			retVal = "Tachi: Rana"
		else
			retVal = def_ws
		end		
		return retVal
  end,
  "Tachi: Fudo",
}

--weaponskills = six_step_double_light2
--weaponskills = {"Tachi: Hobaku",}
weaponskills = {"Tachi: Gekko",}

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false,
	['on'] = true,
	['off'] = false,
	['enabled'] = true,
	['disabled'] = false
}

function init_abilities()
	auto_abilities = {
		['Third Eye'] ={['enabled']     =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Third Eye'], ['requiresub']=nil,  ['target']='<me>'},
		['Meditate'] ={['enabled']     =true, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Meditate'], ['requiresub']=nil,  ['target']='<me>'},
		['Berserk']  ={['enabled']     =false, ['requireengaged']=false,['statusid']=nil,                     ['abilityid']=job_ability_names['Berserk'],  ['requiresub']="WAR",['target']='<me>'},
		['Aggressor']={['enabled']     =true, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Aggressor'],['requiresub']="WAR",['target']='<me>'},
		['Blade Bash']={['enabled']    =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Blade Bash'],['requiresub']=nil,['target']='<t>'},
		['Warding Circle']={['enabled']=false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Warding Circle'],['requiresub']=nil,['target']='<me>'},
		['Hamanoha']={['enabled']=false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Hamanoha'],['requiresub']=nil,['target']='<t>'},
		['Provoke']={['enabled']       =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Provoke'],['requiresub']="WAR",['target']='<t>'},
		['Last Resort']={['enabled']   =true, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Last Resort'],['requiresub']="DRK",['target']='<me>'},
		['Arcane Circle']={['enabled'] =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Arcane Circle'],['requiresub']="DRK",['target']='<me>'},
		['Souleater']={['enabled']     =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Souleater'],['requiresub']="DRK",['target']='<me>'},
		['Weapon Bash']={['enabled']   =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Weapon Bash'],['requiresub']="DRK",['target']='<t>'},
		['Sentinel']={['enabled']      =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Sentinel'],['requiresub']="PLD",['target']='<me>'},
		['Holy Circle']={['enabled']   =false, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Holy Circle'],['requiresub']="PLD",['target']='<me>'},
		['Ancient Circle']={['enabled'] =true, ['requireengaged']=false,['statusid']=nil,                    ['abilityid']=job_ability_names['Ancient Circle'],['requiresub']="DRG",['target']='<me>'},
		['Swordplay']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=24,['requiresub']='RUN',['target']='<me>'},
		['Unda']					={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=10,['requiresub']='RUN',['target']='<me>'},
		['Lunge']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=25,['requiresub']='RUN',['target']='<t>'},
		['Swipe']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=241,['requiresub']='RUN',['target']='<t>'},
		['Vallation']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=23,['requiresub']='RUN',['target']='<me>'},
		['Pflug']						={['enabled']=true,['requireengaged']=true,['statusid']=nil,['abilityid']=59,['requiresub']='RUN',['target']='<me>'},
	}
end

function capitalize(me)
	return (string.upper(string.sub(me,1,1)) .. string.lower(string.sub(me, 2)))
end

debug_text = nil
debug_textbox = nil
debug = false
buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}
item_names = {}

function init()
	for buffid, buffinfo in pairs(buffs) do
		buff_names[buffinfo.en] = buffid
	end
	
	for spellid, spellinfo in pairs(spells) do
		spell_names[spellinfo.en] = spellid
	end

	for ablilityid, abilityinfo in pairs(job_abilities) do
			job_ability_names[abilityinfo.en] = abilityinfo.recast_id
	end
	job_ability_names['Berserk'] = 1

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.en] = jobid
	end	

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end
	
	init_abilities()
end

lua_loop = nil
windower.register_event('load', function()
	debug_textbox = texts.new(' ')
	debug_textbox.pos(debug_textbox, 50,700)
	if debug == true then
		texts.visible(debug_textbox, true)
	end
	init()

	-- Verify spells, abilities, and statuses do_auto_spell_and_abilities

	lua_loop = coroutine.schedule(infinity_loop, 1)
	
	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
	end
end)

windower.register_event('unload', function()
	if lua_loop then
		coroutine.close(lua_loop)
	end
end)

curr_ws = 1
function auto_weaponskill()
	local retVal = false
	local player = windower.ffxi.get_player()
	local target = windower.ffxi.get_mob_by_target('t')
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local weaponskill_command = nill
	
	-- We're only concerned for sam with auto weaponskills
	if player.main_job == 'SAM' 
	   and do_auto_weaponskills 
	   and player.status == 1 
	   and canDoAbilities()
	then
		if keep_aftermath_up
		   and aftermath_up() < aftermath_level
		then
			if player.vitals.tp >= (aftermath_level * 1000) then
				weaponskill_command = 'input /ws "' .. aftermath_weaponskill .. '" <t>'
				retVal = true
			end
		else
			if player.vitals.tp >= default_weaponskill_tp then
				if do_sengikori and ability_recasts[job_ability_names['Sengikori']] == 0 and curr_ws == 1 then
					windower.send_command('input /ja Sengikori <me>')
					retVal = true
				elseif do_hagakure and ability_recasts[job_ability_names['Hagakure']] == 0 and curr_ws == 1 then
					windower.send_command('input /ja Hagakure <me>')
					retVal = true
				elseif type(weaponskills) == 'table' then
					if table.length(weaponskills) > 0 then
						if curr_ws > table.length(weaponskills) then
							curr_ws = 1
						end

						weaponskill_command = 'input /ws "' .. weaponskills[curr_ws] .. '" <t>'
						--windower.send_command('input /ws "' .. weaponskills[curr_ws] .. '" <t>')
						curr_ws = curr_ws + 1
						if curr_ws > table.length(weaponskills) then
							curr_ws = 1
						end
						retVal = true
					end
				else
					if mobhp_ws_pct then
						if target.hpp > mobhp_ws_pct then
							return false
						end
					end
					weaponskill_command = 'input /ws "' .. weaponskills .. '" <t>'
					--windower.send_command('input /ws "' .. weaponskills .. '" <t>')
					curr_ws = 1
					retVal = true
				end
			end
		end
		
		if target and math.sqrt(target.distance) <= 6 and weaponskill_command then
			windower.send_command(weaponskill_command)
		end 
	end
	
	return retVal
end

windower.register_event("status change", function(new,old)
	curr_ws = 1
end)

windower.register_event("target change", function(index)
	curr_ws = 1
end)

function canDoAbilities()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {2,10,16,19,28,14,17}
	
	for key, id in pairs(blocking) do
		if table.contains(player.buffs, id) == true then
			retVal = false
		end
	end
	
	return retVal
end

function auto_hasso_seigan()
	local retVal = false
	local player = windower.ffxi.get_player()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	
	if do_auto_hasso_seigan == hasso then
		if not table.contains(player.buffs, buff_names['Hasso']) and ability_recasts[job_ability_names['Hasso']] == 0 then
			windower.send_command('input /ja hasso <me>')
			retVal = true
		end
	elseif do_auto_hasso_seigan == seigan then
		if not table.contains(player.buffs, buff_names['Seigan']) and ability_recasts[job_ability_names['Seigan']] == 0 then
			windower.send_command('input /ja seigan <me>')
			retVal = true
		elseif table.contains(player.buffs, buff_names['Seigan']) and ability_recasts[job_ability_names['Third Eye']] == 0 then
			windower.send_command('input /ja "Third Eye" <me>')
			retVal = true
		end
	end

	return retVal
end

function autoabilities()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	
	-- Only do auto_abilities when this is the first ws
	if isbusy == true or canDoAbilities() == false or curr_ws > 1 then
		return retVal
	end
	
	if player.status == 1 then
		engaged = true
	elseif player.status == 0 then
		engaged = false
	end

	for abil_name,abil_info in pairs(auto_abilities) do
		if abil_info.enabled == true and
			 (abil_info.requiresub == nil or abil_info.requiresub == player.sub_job) and
		   (abil_info.statusid == nil or table.contains(player.buffs, abil_info.statusid) == false) and
		   recasts[abil_info.abilityid] == 0 then
		  if (abil_name == "Meditate" and player.vitals.tp < meditate_below_tp)
		  	 or abil_name ~= "Meditate"
		  then
				windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
				retVal = true
				break
			end
		end
	end	
	return retVal
end

function has_item(item_id)
	local retVal = false
	local bag_list = T{0
	                   -- ,5
	                   -- ,6
	                   -- ,7
	                   }
	local bags = windower.ffxi.get_items()
	
	if bags ~= nil then
		for _,bag in pairs(T{'inventory', 'sack', 'satchel', 'case'}) do
			for slot,item_info in pairs(bags[bag]) do
				if false and item_info.id == item_id then
					retVal = true
					break
				end
			end
			if retVal == true then
				break
			end
		end
  end
	
	return retVal
end

function auto_echo()
	local retVal = false
--if true then return false end
	if has_item(item_names["Remedy"]) == true then
		local player = windower.ffxi.get_player()
		if player ~= nil and has_item(4155) and
		 (table.contains(player.buffs, 6) == true  or table.contains(player.buffs, 4)) then
			windower.send_command('input /item "remedy" <me>')
			retVal = true
		end
	end
	return retVal
end

function auto_holy_water()
	local retVal = false
	if has_item(item_names["Holy Water"]) == true then
		local player = windower.ffxi.get_player()
		if player ~= nil and has_item(4154) and
		                     table.contains(player.buffs, 9 ) == true or
		                     table.contains(player.buffs, 15) == true then
			-- There is also 20 for curse, but that might be super curse
			windower.send_command('input /item "holy water" <me>')
			retVal = true
		end
	end
	return retVal
end

queuedactions = {}

function queued_actions()
	local retVal = false
	
	return retVal
end

ifl=0
function infinity_loop()
	local player
	local temp
	while true do
		if ifl > 0 then
			ifl = ifl - 1
		else
			player = windower.ffxi.get_player()
			if player and T{player.main_job, player.sub_job}:contains('SAM') and 
			   player.status == 1 and addon_enabled then
				 temp = isbusy['isbusy'] 
				       or queued_actions()
				       or auto_holy_water() 
				       or auto_hasso_seigan()
				       or auto_weaponskill()
				       or auto_warding_circle()  
				       or auto_hamanoha()
				       or autoabilities() 
				 if temp then ifl = 1 end
			end
		end
		coroutine.sleep(.6)
	end

end

windower.register_event('addon command', function(...)
	local command = 'toggle'
	local args = {...}
	local player = windower.ffxi.get_player()
	
	if table.length(args) > 0 then
		command = args[1]
	end
	
--	windower.add_to_chat(1, command .. ' ' .. args[2])
	
	if     command == 'enable' then
		addon_enabled = true
		windower.add_to_chat(5, "Samurai helper enabled.")
	elseif command == 'disable' then
		addon_enabled = false
		windower.add_to_chat(5, "Samurai helper disabled.")
	elseif command == 'toggle' then
		if addon_enabled then
			addon_enabled = false
			windower.add_to_chat(5, "Samurai helper disabled.")
		else
			addon_enabled = true
			windower.add_to_chat(5, "Samurai helper enabled.")
		end
	elseif string.lower(command) == 'hasso' then
			do_auto_hasso_seigan = hasso
			local ability_recasts = windower.ffxi.get_ability_recasts()
			if ability_recasts[job_ability_names['Hasso']] == 0 then
				windower.send_command('input /ja hasso <me>')
			end
			windower.add_to_chat(5, 'Hasso enabled')
	elseif string.lower(command) == 'seigan' then
			do_auto_hasso_seigan = seigan
			local ability_recasts = windower.ffxi.get_ability_recasts()
			if ability_recasts[job_ability_names['Seigan']] == 0 then
				windower.send_command('input /ja Seigan <me>')
			end
			windower.add_to_chat(5, 'Seigan enabled')
	elseif T{'doautows', 'aws', 'aw', 'autows'}:contains(string.lower(command)) == true then
		if logic[args[2]] == true then
			do_auto_weaponskills = true
		else
			do_auto_weaponskills = false
		end
		
		windower.add_to_chat(5, 'Auto Weaponskill: ' .. tostring(do_auto_weaponskills))
	end
end)

function aftermath_up()
	local retVal = 0
	local aftermaths = {
		270,
		271,
		272,
		273,}
	local player = windower.ffxi.get_player()
	
	for key, aftermath in ipairs(aftermaths) do
		if table.contains(player.buffs, aftermath) then
			retVal = aftermath - 269
			break
		end
	end	
	--windower.add_to_chat(5, "Aftermath level=" .. tostring(retVal))
	return retVal
end

function auto_warding_circle()
	local retVal = false
	local player = windower.ffxi.get_player()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local target = windower.ffxi.get_mob_by_target('t')
	
	if do_auto_warding_circle == true
	   and target 
		 and monster_families[target.name] == "Demons"
	then
		if not table.contains(player.buffs, buff_names['Warding Circle']) and ability_recasts[job_ability_names['Warding Circle']] == 0 then
			windower.send_command('input /ja "Warding Circle" <me>')
			retVal = true
		end
	end
	
	return retVal
end

function auto_hamanoha()
	local retVal = false
	local player = windower.ffxi.get_player()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local target = windower.ffxi.get_mob_by_target('t')
	
	if do_auto_hamanoha == true
	   and target 
		 and monster_families[target.name] == "Demons"
	then
		if ability_recasts[job_ability_names['Warding Circle']] == 0 then
			windower.send_command('input /ja "Hamanoha" <t>')
			retVal = true
		end
	end
	
	return retVal
end
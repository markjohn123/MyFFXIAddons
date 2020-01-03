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
monster_abilities = require('res/monster_abilities')
--monster_spells = reqire('res/monster_spells.lua')
isbusy = require('isbusy')
require('auto_stun')
require('data/stun_list')
require('andreaslibs/auto_weaponskill')
require('andreaslibs/auto_shadows')

_addon.name = 'Blue Mage Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'bluemage_helper', 'blu'}

addon_enabled = true
do_auto_stun = false
stun_for_job = "BLU"
for_job = "BLU"
--do_auto_weaponskill = true
--do_skillchain = false
--sc_weaponskill = 'Savage Blade'
--sc_spell = 'Thrashing Assault'
--sc_spell_mp = 119
--single_weaponskill = "Chant du Cygne"
--default_weaponskill_tp = 1000
--do_auto_ws_sanguine = false -- If hp is 80% or below, will do sanguine blade instead
--do_auto_abilities = true
do_auto_spells = true
do_spells_during_weather = true
do_auto_cures = false
do_auto_debuffs = false
infinity_sleep_interval = 1

do_auto_weaponskills = true -- Do automatic weaponskills
mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
default_weaponskill_tp = 1000 -- TP to weaponskill at
weaponskill_distance = 4.5 -- Distance within to weaponskill
keep_aftermath_up = false -- Keep aftermath active
aftermath_level = 3 -- Aftermath leel to maintain
aftermath_weaponskill = nil -- The aftermath weaponskill
weaponskills = {"Chant du Cygne",} --List of weaponskill to use
close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
autows_forjob = 'BLU' -- The job that this addon pertains to.
-- pre_weaponskill_abilities() Define this do do stuff before you weaponskill
--                             Return true if successful, false otherwise.


ul_blue_spells = {
	"Thunderbolt","Harden Shell","Absolute Terror","Gates of Hades","Tourbillion","Pyric Bulwark",
	"Bilgestorm","Bloodrake","Droning Whirlwind","Carcharian Verve",
	"Blistering Roar","Crashing Thunder","Polar Roar","Mighty Guard","Cruel Joke","Cesspool","Tearing Gust",
}

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false,
	['on'] = true,
	['off'] = false
}

function init_abilities()
	auto_abilities = {
		['Berserk']={['enabled']= true,['requireengaged']=false,['statusid']=buff_names['Berserk'],['abilityid']=job_ability_names['Berserk'],['requiresub']="WAR",['target']='<me>',['requirelevel']=nil},
		['Aggressor']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=job_ability_names['Aggressor'],['requiresub']="WAR",['target']='<me>',['requirelevel']=nil},
		['Provoke']={['enabled']=false,['requireengaged']=false,['statusid']=nil,['abilityid']=job_ability_names['Provoke'],['requiresub']="WAR",['target']='<t>',['requirelevel']=nil},
	}
end

function init_spells()
	auto_spells = {
		['Battery Charge'] ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names['Refresh'],['spellid']=spell_names['Battery Charge'], ['requiremp']=50,['requiresub']=nil,  ['target']='<me>'},
		['Erratic Flutter'] ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names['Haste'],['spellid']=710, ['requiremp']=92,['requiresub']=nil,  ['target']='<me>', doaoe=false},
		['Occultation'] ={['enabled']=false , ['requireengaged']=false,['statusid']=buff_names['Blink'],['spellid']=spell_names['Occultation'], ['requiremp']=138,['requiresub']=nil,  ['target']='<me>', doaoe=false},
		['Mighty Guard'] ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names['Mighty Guard'],['spellid']=spell_names['Mighty Guard'], ['requiremp']=299,['requiresub']=nil,  ['target']='<me>', doaoe=true},
		["Nat. Meditation"] ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names['Attack Boost'],['spellid']=spell_names['Nat. Meditation'], ['requiremp']=38,['requiresub']=nil,  ['target']='<me>', doaoe=false},
		["Regeneration"] ={['enabled']=false, ['requireengaged']=false,['statusid']=42,['spellid']=spell_names['Regeneration'], ['requiremp']=38,['requiresub']=nil,  ['target']='<me>', doaoe=false},
		['Cocoon'] ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names['Defense Boost'],['spellid']=spell_names['Cocoon'], ['requiremp']=10,['requiresub']=nil,  ['target']='<me>'},
		['Saline Coat'] ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names['Magic Def. Boost'],['spellid']=spell_names['Saline Coat'], ['requiremp']=66,['requiresub']=nil,  ['target']='<me>'},
		['Magic Barrier'] ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names['Magic Shield'],['spellid']=spell_names['Magic Barrier'], ['requiremp']=29,['requiresub']=nil,  ['target']='<me>'},
		['Actinic Burst'] ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,['spellid']=spell_names['Actinic Burst'], ['requiremp']=24,['requiresub']=nil,  ['target']='<t>'},
		['Delta Thrust'] ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,['spellid']=spell_names['Delta Thrust'], ['requiremp']=28,['requiresub']=nil,  ['target']='<t>'},
		['Tenebral Crush'] ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,['spellid']=spell_names['Tenebral Crush'], ['requiremp']=116,['requiresub']=nil,  ['target']='<t>'},
	}
end

	debuffs = T{
		buff_names['Attack Down'],
		buff_names['Defense Down'],
		buff_names['DEX Down'],
		buff_names['STR Down'],
		buff_names['Accuracy Down'],
		buff_names['Choke'],
		buff_names['Rasp'],
		buff_names['Burn'],
		buff_names['Drown'],
		buff_names['Shock'],
	}

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
	buff_names['Haste'] = 33
	
	for spellid, spellinfo in pairs(spells) do
		spell_names[spellinfo.en] = spellid
	end

	for ablilityid, abilityinfo in pairs(job_abilities) do
			if abilityinfo.prefix == '/jobability' then
				job_ability_names[abilityinfo.en] = abilityinfo.recast_id
			end
	end

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.en] = jobid
	end	

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end
	

	init_abilities()
	init_spells()
	--validate_stun_list()
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


function autoabilities()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	local temp_debug
	if do_auto_abilities == false or isbusy == true or canDoAbilities() == false then
		return retVal
	end
	
	if player.status == 1 then
		engaged = true
	elseif player.status == 0 then
		engaged = false
	end
	
	for abil_name,abil_info in pairs(auto_abilities) do
		if  abil_info.enabled == true and
			 (abil_info.requiresub == nil or abil_info.requiresub == player.sub_job) and
		   (abil_info.statusid == nil or table.contains(player.buffs, abil_info.statusid) == false) and
		   (abil_info['requirelevel'] == nil or abil_info.requirelevel <= player.main_job_level) and
		   recasts[abil_info.abilityid] == 0 then
			windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
			retVal = true
			break
		end
	end
	return retVal
end

function isWeather()
	local retVal = false
	weather = windower.ffxi.get_info().weather
		if weather > 3 then
			retVal = true
		end
	
	if do_spells_during_weather then retVal = false end
	return retVal
end

function autospells()
	local retVal = false
	if isWeather() then
		return false
	end
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_spell_recasts()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	local mobname = ''
	local mob = windower.ffxi.get_mob_by_target('t')
	if mob ~= nil and mob.name ~= nil then
		mobname = mob.name
	end
	
	if isbusy == true or canDoSpells() == false then
		return retVal
	end

	if player.status == 1 then
		engaged = true
	elseif player.status == 0 then
		engaged = false
	end
	
	for spell_name,spell_info in pairs(auto_spells) do
		if spell_info.enabled == true and
			 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
		   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
		   recasts[spell_info.spellid] == 0 and (player.vitals.mp >= (spell_info.requiremp+50) or 
		   (spell_name == 'Battery Charge' and spell_info.requiremp >=50)) and 
		   monster_check(spell_name, mobname) == false
		then
		  if spell_info.doaoe 
		     and ability_recasts[job_ability_names['Diffusion']] == 0 
		  then
		  	if table.contains(ul_blue_spells,spell_name) 
		  		 and (ability_recasts[job_ability_names['Unbridled Learning']] == 0 
		  		 			or table.contains(player.buffs, buff_names['Unbridled Learning']))
		  	then
			  	windower.send_command('input /ja "diffusion" <me>')
					isbusy['busy_delay'] = 2
					coroutine.sleep(1)
				elseif not table.contains(ul_blue_spells,spell_name) then
			  	windower.send_command('input /ja "diffusion" <me>')
					isbusy['busy_delay'] = 2
					coroutine.sleep(1)
				end
		  end
		  
		  -- See if this is a UL spell
		  if table.contains(ul_blue_spells,spell_name) then
		  	if ability_recasts[job_ability_names['Unbridled Learning']] == 0 then 	
		  	windower.send_command('input /ja "Unbridled Learning" <me>')
		  	isbusy['busy_delay'] =2
		  	coroutine.sleep(1)
		  	windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
				end
			elseif table.contains(player.buffs, buff_names['Unbridled Learning']) then
				windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
			else
				windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)				
		  end
		  
			
			retVal = true
			break
		end
	end
	
	
	
	-- Did we not cast and refresh is not up?
	if retVal == false and table.contains(player.buffs, 43) == false and recasts[108] == 0 and player.vitals.mp >= 0 and player.subjob == 'RDM' then
		windower.send_command('input /ma refresh <me>')
	end
	
	return retVal
end

healing_delay = 0
function autocures()
	if windower.ffxi.get_info().logged_in == false then
		return false
	end
	if not do_auto_cures then return false end
	if isWeather() then
		return false
	end
	if healing_delay > 0 then
		healing_delay = healing_delay - 1
		return false
	end
	local player = windower.ffxi.get_player()
	local party
	local member
	local temp = ""
	local key = ""
	local retVal = false
	--windower.add_to_chat(2, 'In do heals')
	if player.main_job == 'BLU' then
		party = windower.ffxi.get_party()
		
		--for key,value in pairs(party) do
			--temp = temp .. key .. " "
		--end
		
		--windower.add_to_chat(4, temp)
		if player.status == 1 then
		  local spell_recasts = windower.ffxi.get_spell_recasts()
		  
			for target,member in pairs(party) do
			  if type(member) == 'table' and isValidMember(member) and 
			  	(member.hpp < 50 or (member.name == player.name and member.hpp <= 75)) and 
			  spell_recasts[spell_names['Magic Fruit']] == 0 then
		  		-- windower.add_to_chat(2, 'member.hpp ' .. member.hpp)
		  		if table.contains(player.buffs, 6) == false and table.contains(player.buffs, 29) == false then
		  			if string.lower(target) == 'p0'  and player.vitals.mp > (72+50) then
					  	windower.send_command('input /ma "Magic Fruit" <' .. target .. '>')
						elseif player.vitals.mp > (72+50) then
							windower.send_command('input /ma "Magic Fruit" <' .. target .. '>')
						end
				  end
					healing_delay = 1
			  	retVal = true
			  	break
			  end
			end
		end
	end
	
	return retVal
end


function autodebuffs()
	local retVal = false
	local player
	if do_auto_debuffs and canDoSpells() then
		player = windower.ffxi.get_player()
		
		for key, debuff in ipairs(debuffs) do
			if table.contains(player.buffs, debuff) then
				windower.send_command('input /ma "Winds of Promy." <me>')
				retVal = true
				break
			end
		end
		
	end
	
	return retVal
end

function has_item(item_id)
	local retVal = false
	local bag_list = T{0,
	--5,
	--6,
	--7
	}
	if true then return false end

	local bags = windower.ffxi.get_items()
	
	if bags ~= nil then
		for _,bag in pairs(T{'inventory', 'sack', 'satchel', 'case'}) do
			for slot,item_info in pairs(bags[bag]) do
				if item_info.id == item_id then
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

function autoecho()
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

function autoholywater()
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

function monster_check(spell,mobname)
	local retVal = false
	
	if spell == nil or mobname == nil then
		return retVal
	end
	
	if T{'flash','blank gaze', 'jettatura'}:contains(string.lower(spell)) and string.lower(mobname) == 'broxa' then
		retVal = true
	end
	
	return retVal
end


function canDoSpells()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {6,29,7,2,19,14,17,10}
	
	for key, id in pairs(blocking) do
		if table.contains(player.buffs, id) == true then
			retVal = false
		end
	end
	
	return retVal
end


function isValidMember(member)
	local retVal = false
	if member ~= nil and member.mob ~= nill and member.mob.distance < 201 and member.hpp > 0 then
		retVal = true
	end
	return retVal
end


queued_actions = {}

function queuedactions()
	local retVal = false
	
	return retVal
end

function infinity_loop()
	local player
	local temp
	while true do
		player = windower.ffxi.get_player()
		if player and player.main_job == 'BLU' and 
		   player.status == 1 and addon_enabled == true then
			temp = isbusy['isbusy'] or queuedactions() or 
			       autoholywater() or autoecho() or autocures()
			       or auto_shadows()
			       or autoabilities() 
			       or auto_weaponskill()  
			       or autodebuffs() 
			       or autospells()
		end
		coroutine.sleep(1)
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
		windower.add_to_chat(5, "Blue Mage helper enabled.")
	elseif command == 'disable' then
		addon_enabled = false
		windower.add_to_chat(5, "Blue Mage helper disabled.")
	elseif command == 'toggle' then
		if addon_enabled then
			addon_enabled = false
			windower.add_to_chat(5, "Blue Mage helper disabled.")
		else
			addon_enabled = true
			windower.add_to_chat(5, "Blue Mage helper enabled.")
		end
	--elseif T{'aws', 'autows', 'autoweaponskill', 'auto_ws', 'auto_weaponskill'}:contains(command) then
	---	if logic[string.lower(args[2])] then
	--		do_auto_weaponskill = true
	--		windower.add_to_chat(5, 'Auto weaponskill enabled')
	--	else
	--		do_auto_weaponskill = false
	--		windower.add_to_chat(5, 'Auto weaponskill disabled')
	--	end
	elseif T{'autoabils', 'autoabilities', 'auto_abils', 'auto_abilities'}:contains(command) then
		if logic[string.lower(args[2])] then
			do_auto_abilities = true
			windower.add_to_chat(5, 'Auto abilities enabled')
		else
			do_auto_abilities = false
			windower.add_to_chat(5, 'Auto abilities disabled')
		end
--	elseif T{'ws', 'weaponskill', 'weapon_skill'}:contains(command) then
--		local space = ''
--		local myws = ''
--		for arg in pairs(arg) do
--			if arg ~= command then
--				myws = myws .. space .. arg
--				space = ' '
--			end
--		end
--		single_weaponskill = myws
--		windower.add_to_chat(5, 'Weaponskill set to ' .. single_weaponskill)
	end
end)

windower.register_event("gain buff", function(buffid)
	-- windower.add_to_chat(5, "Gained buff: " .. tostring(buffid))
end)
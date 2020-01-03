require('LuaU')
config = require('config')
require('strings')
require('tables')
packets=require('packets')
texts = require('texts')
buffs = require('res/buffs')
job_abilities = require('res/abilities')
spells = require('res/spells')
jobs = require('res/jobs')
items = require('res/items')
monster_abilities = require('res/monster_abilities')
isbusy = require('isbusy')
require('auto_stun')
require('data/stun_list')

_addon.name = 'Mage Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'mage_helper', 'mh'}

addon_enabled = true
engaged_pc = 'Malthar' -- If true will only cure if this player is engaged
do_auto_stun = false
do_auto_abilities = true
do_auto_spells = true
do_spells_during_weather = true
do_auto_cures = true
do_auto_wake = true
auto_wake_spell = "curaga"
auto_wake_targets = {"Malthar"}
do_auto_buff = true
do_auto_debuff = true
do_auto_enfeeble = true
infinity_sleep_interval = 1
priority_pcs = {
	"Malthar",
	"Maltha",
	"Maltanna"
}

cure_levels = {
	{["hp"] = 800, ["spell"] = "Cure VI"}, -- If hp is <= 800 from maximum, then use cure 6, whm main only
	{["hp"] = 600, ["spell"] = "Cure V"}, --  If hp is <= 600 from maximum, then use cure 5, whm main only
	{["hp"] = 400, ["spell"] = "Cure IV"}, -- If hp is <= than 400, then use cure 4
	{["hp"] = 200, ["spell"] = "Cure III"}, -- If hp is <= than 200, then use cure 3
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
		['Composure']={['enabled']=true,['requireengaged']=false,['statusid']=buff_names['Composure'],['abilityid']=job_ability_names['Composure'],['requiremain']='RDM', ['requiresub']=nil,['target']='<me>',['requirelevel']=nil},
	}
end

function init_spells()
	auto_spells = {
	}
end

function init_buffs()
	auto_buffs = {
	
	}
end

function init_enfeebles()
	auto_enfeebles = {
	
	}
end

weaponskills = {
--	'fast blade',
--	'burning blade',
--	'red lotus blade',
--	'flat blade',
--	'shining blade',
--	'seraph blade',
--	'circle blade',
--	'spirits within',
--	'vorpal blade',
--	'swift blade',
	'savage blade',
--	'atonement',
--	'sanguine blade',
	'chant du cygne',
	'requiescat'
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
monster_ability_names = {}
monster_spell_names = {}

function init()
	for buffid, buffinfo in pairs(buffs) do
		buff_names[buffinfo.en] = buffid
	end
	
	for spellid, spellinfo in pairs(spells) do
		spell_names[spellinfo.en] = spellid
	end

	for ablilityid, abilityinfo in pairs(job_abilities) do
			if abilityinfo.prefix == '/jobability' then
				job_ability_names[abilityinfo.en] = abilityinfo.recast_id
			end
	end

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.short] = jobid
	end	

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end
	
	for abilityid, abilityinfo in pairs(monster_abilities) do
		-- Check to see if there is already an entry
		-- If there isn't create an array for it.
		if not monster_ability_names[abilityinfo.english] then
			monster_ability_names[abilityinfo.english] = {}
		end
		-- And add the abilityid for this ability name
		monster_ability_names[abilityinfo.english][table.length(monster_ability_names[abilityinfo.english])] = abilityid
	end

	for abilityid, abilityinfo in pairs(monster_abilities) do
		-- Check to see if there is already an entry
		-- If there isn't create an array for it.
		if not monster_ability_names[abilityinfo.english] then
			monster_ability_names[abilityinfo.english] = {}
		end
		-- And add the abilityid for this ability name
		monster_ability_names[abilityinfo.english][table.length(monster_ability_names[abilityinfo.english])] = abilityid
	end

	init_abilities()
	init_spells()
	init_buffs()
	init_enfeebles()
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

function autoweaponskill()
	local retVal = false
	local player = windower.ffxi.get_player()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	
	-- Only concerned with blue mage for weaponskills
	if player.main_job == 'BLU' then
		if cycle_weaponskills then
			if do_auto_weaponskill == true and player.status == 1 and 
				 player.vitals.tp >= default_weaponskill_tp and canDoAbilities() then
				if do_auto_ws_sanguine and player.vitals.hpp <= 85 then
					windower.send_command('input /ws "sanguine blade" <t>')
				else
					windower.send_command('input /ws "'.. weaponskills[math.random(table.length(weaponskills))] .. '" <t>')
				end
				retVal = true
			end
		else
			if do_auto_weaponskill == true and player.status == 1 and 
				 player.vitals.tp >= default_weaponskill_tp and canDoAbilities() then
				if do_auto_ws_sanguine and player.vitals.hpp <= 85 then
					windower.send_command('input /ws "sanguine blade" <t>')
				else
					if do_skillchain and 
					   ability_recasts[job_ability_names['Chain Afinity']] == 0 and
					   spell_recasts[spell_names[sc_spell]] == 0 and player.vitals.mp >= sc_spell_mp
					then
						is_busy['is_busy'] = true
						is_busy['busy_delay'] = 6
						if player.sub_job == 'WAR' and ability_reacsts[job_ability_names['Warcry']] == 0 then
							windower.send_command("input /ja warcry <me>")
							is_busy['busy_delay'] = is_busy['busy_delay'] + 1
							coroutine.sleep(1)
						end
						if ability_reacsts[job_ability_names['Efflux']] == 0 then
							windower.send_command("input /ja Efflux <me>")
							is_busy['busy_delay'] = is_busy['busy_delay'] + 1
							coroutine.sleep(1)
						end
						windower.send_command('input /ja "Chain Affinity" <me>')
						coroutine.sleep(1)
						windower.send_command('input /ws "' .. sc_weaponskill .. '" <t>')
						coroutine.sleep(4)
						windower.send_command('input /ma "' .. sc_spell .. '" <t>')
					else
						windower.send_command('input /ws "' .. single_weaponskill .. '" <t>')
					end
				end
				retVal = true
			end
		end
	end
	
	return retVal
end

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
		   monster_check(spell_name, mobname) == false then
		  if spell_info.doaoe and ability_recasts[job_ability_names['Diffusion']] == 0 then
		  	windower.send_command('input /ja "diffusion" <me>')
				coroutine.sleep(1)
				isbusy['busy_delay'] = 2
		  end
			windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
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
	if isWeather() then
		return false
	end
	if healing_delay > 0 then
		healing_delay = healing_delay - 1
		return false
	end
	local player = windower.ffxi.get_player()
	local engaged_player = windower.ffxi.get_mob_by_name(engaged_pc)
	local party
	local member
	local temp = ""
	local key = ""
	local retVal = false
	--windower.add_to_chat(2, 'In do heals')
	if T{'WHM', 'RDM'}:contains(player.main_job) or
	   T{'WHM', 'RDM'}:contains(player.sub_job)then
		party = windower.ffxi.get_party()
		
		--for key,value in pairs(party) do
			--temp = temp .. key .. " "
		--end
		
		--windower.add_to_chat(4, temp)
		if (not engaged_player) or engaged_player.status == 1 then
		  local spell_recasts = windower.ffxi.get_spell_recasts()
		  
			for target,member in pairs(party) do
			  if type(member) == 'table' and isValidMember(member) and 
			  	(member.hpp < 50 or (member.name == player.name and member.hpp <= 75)) and 
			  spell_recasts[spell_names['Magic Fruit']] == 0 then
		  		-- windower.add_to_chat(2, 'member.hpp ' .. member.hpp)
		  		if table.contains(player.buffs, 6) == false and table.contains(player.buffs, 29) == false then
		  			if string.lower(target) == 'p0'  and player.vitals.mp > (72+50) then
					  	windower.send_command('input /ma "cure iv" <' .. target .. '>')
						elseif player.vitals.mp > (72+50) then
							windower.send_command('input /ma "cure iv" <' .. target .. '>')
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

function autowake()
	local retVal = false
	
	return retVal
end

function has_item(item_id)
	local retVal = false
	local bag_list = T{0,5,6,7}
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

function autobuffs()
	local retVal = false

	return retVal
end

function autodebuffs()
	local retVal = false

	return retVal
end

function autoenfeebles()
	local retVal = false

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
			       autoholywater() or autoecho() or 
			       autowake() or autocures()  or
						 autobuffs() or autodebuffs() or autoenfeebles() or
			       autoabilities() or autoweaponskill() or autospells()
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
		windower.add_to_chat(5, "Ranger helper enabled.")
	elseif command == 'disable' then
		addon_enabled = false
		windower.add_to_chat(5, "Ranger helper disabled.")
	elseif command == 'toggle' then
		if addon_enabled then
			addon_enabled = false
			windower.add_to_chat(5, "Ranger helper disabled.")
		else
			addon_enabled = true
			windower.add_to_chat(5, "Ranger helper enabled.")
		end
	elseif T{'aws', 'autows', 'autoweaponskill', 'auto_ws', 'auto_weaponskill'}:contains(command) then
		if logic[string.lower(args[2])] then
			do_auto_weaponskill = true
			windower.add_to_chat(5, 'Auto weaponskill enabled')
		else
			do_auto_weaponskill = false
			windower.add_to_chat(5, 'Auto weaponskill disabled')
		end
	elseif T{'autoabils', 'autoabilities', 'auto_abils', 'auto_abilities'}:contains(command) then
		if logic[string.lower(args[2])] then
			do_auto_abilities = true
			windower.add_to_chat(5, 'Auto abilities enabled')
		else
			do_auto_abilities = false
			windower.add_to_chat(5, 'Auto abilities disabled')
		end
	elseif T{'ws', 'weaponskill', 'weapon_skill'}:contains(command) then
		local space = ''
		local myws = ''
		for arg in pairs(arg) do
			if arg ~= command then
				myws = myws .. space .. arg
				space = ' '
			end
		end
		single_weaponskill = myws
		windower.add_to_chat(5, 'Weaponskill set to ' .. single_weaponskill)
	end
end)

windower.register_event('action message', 
function(actor_id,target_id,actor_index,target_index,message_id,param_1,param_2,param_3)
	local retVal = blocked
	
	if message_id == false then
		
	end
	
	return retVal
end)

--[[
windower.register_event('incoming chunk',
function(id,original,modified,injected,blocked)
	local packet = packets.parse('incoming', original)
	local target
	if T{'E', 'DF', '37', '28', '1D', '67','61', '62', '63', 'D'}:contains(math.hex(id)) then
		return
	end
	
	windower.add_to_chat(5, math.hex(id))
	
	if id == 0x029 then
		actor =  windower.ffxi.get_mob_by_id(packet.Actor)
		target = windower.ffxi.get_mob_by_id(packet.Target)
		windower.add_to_chat(5, "Action " .. actor.name .. " did " .. tostring(packet.Message) ..
		                        " to target " .. tostring(target.name) .. ", with " ..
		                        "Param 1 = " .. tostring(packet["Param 1"]) .. ", " ..
		                        "Param 2 = " .. tostring(packet["Param 2"]))
	end
	
--	return blocked
end)
]]
--[[
windower.register_event('incoming chunk', function(id,original,modified,injected,blocked)
    if id == 0x029 then
        local action_message = packets.parse('incoming', original)
        print(action_message['Actor'])
        print(action_message['Message'])
        print(action_message['Target'])
        print(action_message['Param 1'])
        print(action_message['Param 2'])
        print(action_message['Actor Index'])
        print(action_message['Target Index'])
    end
end)
]]

windower.register_event('incoming chunk',function(id,original,modified,injected,blocked)
	local packet = packets.parse('incoming', original)
	windower.add_to_chat(5, "S>>>C " .. math.hex(id))
end)

windower.register_event('outgoing chunk',function(id,original,modified,injected,blocked)
	local packet = packets.parse('outgoing', original)
	windower.add_to_chat(5, "S<<<C " .. math.hex(id))
end)


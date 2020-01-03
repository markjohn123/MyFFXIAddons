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

_addon.name = 'Samurai Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'samurai_helper', 'sh'}

addon_enabled = true

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false
}

function init_abilities()
	auto_abilities = {
		['Hasso']    ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names['Hasso'],    ['abilityid']=job_ability_names['Hasso'],    ['requiresub']=nil,  ['target']='<me>'},
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

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.short] = jobid
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


windower.register_event("status change", function(new,old)

end)

windower.register_event("target change", function(index)

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


function auto_abilities()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	
	-- Only do auto_abilities when this is the first ws
	if isbusy == true or canDoAbilities() == false then
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
			windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
			retVal = true
			break
		end
	end	
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

function infinity_loop()
	local player
	local temp
	while true do
		player = windower.ffxi.get_player()
		if player and T{player.main_job, player.sub_job}:contains('SAM') and 
		   player.status == 1 and addon_enabled then
			temp = isbusy['isbusy'] or queued_actions() or 
			       auto_holy_water() or  auto_echo() or auto_abilities() or auto_weaponskill()
		end
		coroutine.sleep(1)
	end

end


-- Broadcast the buffs we gain or loose to the whm so she can remove them.
windower.register_event("gain buff", function(buff_id)

end)

windower.register_event("lose buff", function(buff_id)

end)

windower.register_event("ipc message", function(message)

end)

priority_players = {
	"Malthar",
	"Maltha",
	"Maltana"
}

player_buffs = {
-- place_holder
	["Playername"] = {
		[9999999] = false -- [buffid] = true/false
	|
}

debuff_priority

function auto_debuffs()
	local retVal = false
	local party = windower.ffxi.get_party()
	
	-- Go through the party and any player not in the party, remove them.  Don't debuff alliance
	tmp_player_buffs = {}
	tmp_priority_player_buffs = {}
	
	for memnum=0,5,1 do
		if party['p' .. memnum] and party['p' .. memnum].mob and player_buffs[party['p' .. memnum].name] then
			if table.contains(priority_palyers, party['p' .. memnum].name) then
				tmp_priority_player_buffs[party['p' .. memnum].name] = player_buffs[party['p' .. memnum].name]
			else
				tmp_player_buffs[party['p' .. memnum].name] = player_buffs[party['p' .. memnum].name]
			end
		end
	end

	-- Debuff priority players first
	retVal = debuff_players(tmp_priority_player_buffs) or debuff_players(tmp_player_buffs)
	
	return retVal
end

function debuff_players(playerbuffs)
	local retVal = false
	
	-- Search throgh debuff priorities

	-- Ok, now let's see who needs debuffing using tmp_player_buffs
	for player_name, buffs in pairs(tmp_player_buffs) do
		
	end

	return retVal
end
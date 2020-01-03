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
statuses=require('res/statuses')
require('geo_helper_resources')

require('directions')
isbusy = require('isbusy')

_addon.name = 'GeoHelper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'geohelper', 'gh'}

-- Static variables.  Do not modify
-- TODO
	assist_target_leader = 1231321
	assist_target_assist = 1232321 -- Target the mob assitWho is fighting.  Done with /assist
--

addon_enabled = true
assistWho     = "Malthar" -- If target is not a PC, then who to assist to cast the spell on.
indi_spell    = "indi-refresh"
indi_status   = "indi-refresh" -- Either a name or a number if a number then the duration is that number in seconds.  If a name then it will be checked against buffs.  TODO:  Add the indi buff status as indi-status
geo_spell     = "geo-haste"
geo_target = "Malthar" -- either nil for casting on self, a name for casting on a pc target, or one of the static variables above for casting on the enemy
entrust_spell = "indi-precision"
entrust_target = "Malthar"
do_auto_remedy = true
do_auto_geo = true
do_auto_indi = true
do_auto_entrust = true
do_auto_abilities = true
do_auto_spells = true

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}
item_names = {}
counters = {}

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false
}

function do_geo()
	local retVal = false
	local luopan = nil
	local assist_pc = nil
	
	if do_auto_geo then
		if not geo_target then
		else
			-- Figure out by spell if the target should be an npc or a pc
			if isOffensiveGeo(geo_spell) then
				geo_target = 't'
			elseif isDefensiveGeo(geo_spell) then
				geo_target = 'me'
			else
				windower.add_to_chat(5, 'Geo_Helper: Cannot figure out target for spell')
				return retVal
			end
		end

		assist_pc = windower.ffxi.get_mob_by_name(geo_target)
		
		-- Check to see that the target is correct for the spell (NPC, or PC)
		
		if assist_pc then
			luopan = windower.ffxi.get_mob_by_target('pet')
			
			if luopan and distance_between(assist_pc, luopan) > 6.5 then
				-- Check to see if the luopan is in range of assist_pc
				-- If not, then full cycle
				windower.send_command('input /ja "full cycle" <me>')
				retVal = true
			elseif math.sqrt(assist_pc.distance) <= 20 then
				-- Cast the luopan if geo_target is in range
				-- Advanced: If geo_target is not in range and is close, say, within 30 yalms,
				--           walk up to geo_target
				-- Advanced: If we are less than 20 yalms from geo_target's target
				--           walk away from it
					windower.send_command('input /ma ' .. geo_spell .. ' ' .. geo_target)
					retVal = true
			end
		end
	end
	
	return retVal
end


counters['indi_status_counter'] = -1
function do_indi()
	local retVal = false
	
	if do_auto_indi then
		
	end

	return retVal
end

function do_entrust()
	local retVal = false

	if do_auto_entrust then
		
	end

	return retVal
end

function do_abilities()
	local retVal = false
	
	if do_auto_abilities then
		
	end

	return retVal
end

function do_spells()
	local retVal = false
	
	if do_auto_spells then
		
	end

	return retVal
end

function do_remedy()
	local retVal = false
	
	if do_auto_remedy then
		
	end

	return retVal
end

function capitalize(me)
	return (string.upper(string.sub(me,1,1)) .. string.lower(string.sub(me, 2)))
end

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
end

lua_loop = nil
windower.register_event('load', function()
	init()
	
	-- Strip <> from geo target
	geo_target = string.lower(geo_target)

	if targets[geo_target] then
		geo_target = targets[geo_target]
	else
		geo_target = capitalize(geo_target)
	end

	if isOffensiveGeo() and isOffensiveTarget() === false then
		geo_target = 't'
		windower.add_to_chat(5, 'Geo_Helper: Invalid geo_target ' .. geo_target)
	end
	
	if isDefensiveGeo() and isDefensiveTarget() == false then
		windower.add_to_chat(5, 'Geo_Helper: Invalid geo_target ' .. geo_target)
		geo_target = 'me'
	end

	lua_loop = coroutine.schedule(infinity_loop, 1)
	
	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
	end
end)

function infinity_loop()
	local temp
	local asssist_pc
	
	while true do
		assist_pc = nil
		if geo_target then
			asssist_pc = windower.ffxi.get_mob_by_name(geo_target)
		end
		
		-- depreciate counters
		for key,value in pairs(counters) do
			if value and type(value) == 'number' and value > 0	then
				if value >= 1 then
					counters[key] = value - 1
				else
					counters[key] = 0
				end
			end
		end
		
		temp = isbusy['isbusy']
			     or do_geo()
					 or assist_pc == nil
					 or assist_pc.status ~= 1
					 or do_remedy()
			     or do_geo()
			     or do_indi()
			     or do_entrust()
			     or do_abilities()
			     or do_spells()  
		coroutine.sleep(1)
	end
end

--if true then return end
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

function has_item(item_id)
	local retVal = false
	local bag_list = T{0}
	local bags = windower.ffxi.get_items()
	
	if bags ~= nil then
		for _,bag in pairs(T{
		                        'inventory'
		                      --, "wardrobe"
		                      --, 'sack'
		                     -- , 'satchel'
		                      --, 'case'
		}) do
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
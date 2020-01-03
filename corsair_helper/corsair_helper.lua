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
require('andreaslibs/resource_functions')
require('andreaslibs/auto_weaponskill')
require("data/corsair_helper_settings")


require('directions')
isbusy = require('isbusy')

_addon.name = 'CorsairHelper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'corsairhelper', 'ch'}

addon_enabled = false
do_rolls = true
do_shots = false
shot = "Fire Shot"
do_auto_shoot = false
-- Set these values in addon_load for Maltha or Maltana
rolls = { 
	"Companion's Roll",
	"Corsair's Roll", 
}
do_auto_abilities = true
quickdraw_recast_time = 40

do_auto_weaponskills = false -- Do automatic weaponskills
mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
default_weaponskill_tp = 1000 -- TP to weaponskill at
weaponskill_distance = 20 -- Distance within to weaponskill
keep_aftermath_up = false -- Keep aftermath active
aftermath_level = 3 -- Aftermath leel to maintain
aftermath_weaponskill = nil -- The aftermath weaponskill
weaponskills = {"Wildfire"} --List of weaponskill to use
close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
autows_forjob = "COR" -- The job that this addon pertains to.

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}
item_names = {}

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false
}

function init_abilities()
	auto_abilities = {
		['Sharpshot']=     {['enabled']=true,['requireengaged']=false,['statusid']=buff_names['Sharpshot'],['abilityid']=job_ability_names['Sharpshot'],['requiresub']=nil,['target']='<me>',['requirelevel']=1},
		['Barrage']=       {['enabled']=true,['requireengaged']=false,['statusid']=buff_names['Barrage'],['abilityid']=job_ability_names['Barrage'],['requiresub']="RNG",['target']='<me>',['requirelevel']=30},
		['Berserk']=       {['enabled']=true,['requireengaged']=false,['statusid']=buff_names['Berserk'],['abilityid']=job_ability_names['Berserk'],['requiresub']="WAR",['target']='<me>',['requirelevel']=30},
		['Aggressor']=       {['enabled']=true,['requireengaged']=false,['statusid']=62,['abilityid']=job_ability_names['Aggressor'],['requiresub']="WAR",['target']='<me>',['requirelevel']=30},
	}
end


last_roll = ""
function do_roll()
	local retVal = false
	local ability_recasts
	local player
	
	if do_rolls then
		ability_recasts = windower.ffxi.get_ability_recasts()
		player = windower.ffxi.get_player()
--windower.add_to_chat(5, "Here " .. tostring(job_ability_names['Phantom Roll'])		)
		if ability_recasts[job_ability_names['Phantom Roll']] == 0 then
			-- Check to see if any buffs are missing
			for key, roll in ipairs(rolls) do
				if table.contains(player.buffs, buff_names[roll]) == false then
					last_roll = roll
					windower.send_command("input /ja \"" .. roll .. "\" <me>")
					retVal = true
					break
				end
			end
		elseif table.contains(player.buffs, buff_names['Bust']) and ability_recasts[job_ability_names['Fold']] == 0 then
			windower.send_command('input /ja fold <me>')
			retVal = true
		elseif table.contains(player.buffs, buff_names['Double-Up Chance']) 
		       and (not (player.main_job_level == 97 and last_roll == "Companion's Roll"))
		then
			if isLucky == false 
			   and ((currentRollNum and currentRollNum < 6) or 
			       (ability_recasts[job_ability_names['Fold']] == 0 
			        and (currentRollNum and currentRollNum < 10)))
			   and ability_recasts[job_ability_names['Double-Up']] == 0
			then
				windower.send_command('input /ja double-up <me>')
				retVal = true
			elseif T{10}:contains(currentRollNum) and ability_recasts[job_ability_names['Snake Eye']] == 0 then
				windower.send_command('input /ja "Snake Eye" <me>')
				retVal = true
			elseif table.contains(player.buffs, buff_names['Snake Eye']) 
			       and ability_recasts[job_ability_names['Double-Up']] == 0
			then
				windower.send_command('input /ja double-up <me>')
				retVal = true
			end		
		elseif ability_recasts[job_ability_names['Random Deal']] == 0 then
			-- If phantom roll isn't ready and not both rolls are on and random deal is ready,
			-- Use random deal
			for key, roll in ipairs(rolls) do
				if table.contains(player.buffs, buff_names[roll]) == false then
					windower.send_command('input /ja "random deal" <me>')
					retVal = true
					break
				end
			end
		end
		
	end
	
	return retVal
end

function do_shot()
	local retVal = false
	local target = windower.ffxi.get_mob_by_target("t")
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_ability_recasts()
	
	--windower.add_to_chat(5, 'Item has_item(item_names["Trump Card"]): ' .. tostring(has_item(item_names["Trump Card"])))
	
	if player 
		 --and player.status == 1 
		 and target and target.is_npc and target.valid_target
		 and shot and do_shots 
		 and has_item(item_names["Trump Card"])
		 and (recasts[job_ability_names[shot]] - quickdraw_recast_time ) <= 0
	then
		windower.send_command('input /ja "' .. shot .. '" <t>')
		retVal = true
	end
	
	return retVal
end

currentRollID = nil
currentRollNum = nil
isLucky = false
windower.register_event('action', function(act)
	local player = windower.ffxi.get_player()
	
	if act.actor_id == player.id and act.category == 6 and table.containskey(rollInfo, act.param) then
		local rollID = act.param
		local rollNum = act.targets[1].actions[1].param
		
		currentRollID = rollID
		currentRollNum = rollNum
		
		if rollNum == rollInfo[rollID][15] or rollNum == 11 then
			isLucky = true
		else
			isLucky = false
		end
		--windower.add_to_chat(5, "rollID=" .. tostring(rollID) .. ":rollNum=" 
		 --                       .. tostring(rollNum) .. ":lucky=" .. tostring(rollInfo[rollID][15]))
	end
end)



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
	
	job_ability_names['Phantom Roll'] = 193
	
	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.ens] = jobid
	end	

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end

    local rollInfoTemp = {
        -- Okay, this goes 1-11 boost, Bust effect, Effect, Lucky, +1 Phantom Roll Effect, Bonus Equipment and Effect,
        ['Chaos'] = {6,8,9,25,11,13,16,3,17,19,31,"-4", '% Attack!', 4, 3},
        ['Fighter\'s'] = {2,2,3,4,12,5,6,7,1,9,18,'-4','% Double-Attack!', 5, 1},
        ['Wizard\'s'] = {4,6,8,10,25,12,14,17,2,20,30, "-10", ' MAB', 5, 2},
        ['Evoker\'s'] = {1,1,1,1,3,2,2,2,1,3,4,'-1', ' Refresh!',5, 1},
        ['Rogue\'s'] = {2,2,3,4,12,5,6,6,1,8,14,'-6', '% Critical Hit Rate!', 5, 1},
        ['Corsair\'s'] = {10, 11, 11, 12, 20, 13, 15, 16, 8, 17, 24, '-6', '% Experience Bonus',5, 2},
        ['Hunter\'s'] = {10,13,15,40,18,20,25,5,27,30,50,'-?', ' Accuracy Bonus',4, 5},
        ['Magus\'s'] = {5,20,6,8,9,3,10,13,14,15,25,'-8',' Magic Defense Bonus',2, 2},
        ['Healer\'s'] = {3,4,12,5,6,7,1,8,9,10,16,'-4','% Cure Potency',3, 1},
        ['Drachen'] = {10,13,15,40,18,20,25,5,28,30,50,'-8',' Pet: Accuracy Bonus',4, 5},
        ['Choral'] = {8,42,11,15,19,4,23,27,31,35,50,'+25', '- Spell Interruption Rate',2, 0},
        ['Monk\'s'] = {8,10,32,12,14,15,4,20,22,24,40,'-?', ' Subtle Blow', 3, 4},
        ['Beast'] = {6,8,9,25,11,13,16,3,17,19,31,'-10', '% Pet: Attack Bonus',4, 3},
        ['Samurai'] = {7,32,10,12,14,4,16,20,22,24,40,'-10',' Store TP Bonus',2, 4},
        ['Warlock\'s'] = {2,3,4,12,5,6,7,1,8,9,15,'-5',' Magic Accuracy Bonus',4, 1},
        ['Puppet'] = {5,8,35,11,14,18,2,22,26,30,40,'-8',' Pet: Magic Attack Bonus',3, 3},
        ['Gallant\'s'] = {4,5,15,6,7,8,3,9,10,11,20,'-10','% Defense Bonus', 3, 2.4},
        ['Dancer\'s'] = {3,4,12,5,6,7,1,8,9,10,16,'-4',' Regen',3, 2},
        ['Bolter\'s'] = {0.3,0.3,0.8,0.4,0.4,0.5,0.5,0.6,0.2,0.7,1.0,'-8','% Movement Speed',3, 0.2},
        ['Caster\'s'] = {6,15,7,8,9,10,5,11,12,13,20,'-10','% Fast Cast',2, 3,{7,11140,10}},
        ['Tactician\'s'] = {10,10,10,10,30,10,10,0,20,20,40,'-10',' Regain',5, 2, {5, 11100, 10}},
        ['Miser\'s'] = {30,50,70,90,200,110,20,130,150,170,250,'0',' Save TP',5, 15},
        ['Ninja'] = {4,5,5,14,6,7,9,2,10,11,18,'-10',' Evasion Bonus',4, 2},
        ['Scholar\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Conserve MP',2, 0},
        ['Allies\''] = {6,7,17,9,11,13,15,17,17,5,17,'?','% Skillchain Damage',3, 1,{6,11120, 5}},
        ['Companion\'s'] = {{4,20},{20, 50},{6,20},{8, 20},{10,30},{12,30},{14,30},{16,40},{18, 40}, {3,10},{30, 70},'-?',' Pet: Regen/Regain',2, {1,5}},
        ['Avenger\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Counter Rate',4, 0},
        ['Blitzer\'s'] = {2,3.4,4.5,11.3,5.3,6.4,7.2,8.3,1.5,10.2,12.1,'-?', '% Attack delay reduction',4, 1, {4,11080, 5}},
        ['Courser\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?',' Snapshot',3, 0},
        ['Runeist\'s'] = {'?','?','?','?','?','?','?','?','?','?','?','?', 'Magic Evasion',4, 1, {4,11080, 5}},
    }

    rollInfo = {}
    for key, val in pairs(rollInfoTemp) do
        rollInfo[res.job_abilities:with('english', key .. ' Roll').id] = {key, unpack(val)}
    end
    
    -- Spelling corrections
    local shots = {
    	["fire shot"]="Fire Shot",
    	["earth shot"]="Earth Shot",
    	["water shot"]="Water Shot",
    	["wind shot"]="Wind Shot",
    	["ice shot"]="Ice Shot",
    	["thunder shot"]="Thunder Shot",
    	["light shot"]="Light Shot",
    	["dark shot"]="Dark Shot",
    }
    
    if do_shots then
	    if shots[string.lower(shot)] then
		    shot = shots[string.lower(shot)]
			else
				do_shots = false
				windower.add_to_chat(5, "Invalid shot " .. shot)
			end
		end
		init_abilities()
		
		if load_settings then
			load_settngs()
		end
end

lua_loop = nil
windower.register_event('load', function()
	init()

	lua_loop = coroutine.schedule(infinity_loop, 1)
	
	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
	end
end)

function infinity_loop()
	local temp
	local player
		
	while true do
		player = windower.ffxi.get_player()

		temp = player == nil
					 or addon_enabled == false
		       or player.main_job ~= 'COR'
		       or (not T{0,1}:contains(player.status))
					 or isbusy['isbusy']
					 or do_roll()
		       or player.status ~= 1
					 or do_shot()
					 or autoabilities()
					 or auto_weaponskill()
					 or auto_shoot()
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

function auto_shoot()
	local retVal = false
	local player = windower.ffxi.get_player()
	if do_auto_shoot and player.status == 1 then
		windower.send_command('input /ra <t>')
		retVal = true
		--windower.send_command('input /equip ammo "' .. shooting_ammo .. '"')
	end

	return retVal
end

function checkMonsTpMove()
	local retVal = false
	
	return retVal
end

function checkMonsTpMove()
	-- For the Maolith TODO:
	local retVal = false
	
	return retVal
end

function weaponskill_check(ws)
	local retVal = ws
	local substituteWeaponskill = {
		["Impervious Marolith"] = checkMonsTpMove,
		["Shambling Naraka"] = "Last Stand",
		["Breathless Clansman"] = "Wildfire",
		["Efluvial Acuex"] = "Wildfire",
		["Splenetic Umbril"] = "Laden Salute",
		["Perdurable Raptor"] = "Last Stand",
		["Tojil"]             = "Last Stand"
--		["Wafting Fluturini"] = "Wildfire",
	}
	local mob = windower.ffxi.get_mob_by_target('t')
	
	if mob and table.containskey(substituteWeaponskill,mob.name) and substituteWeaponskill[mob.name] then
		if type(substituteWeaponskill[mob.name]) == 'function' then
			retVal = (substituteWeaponskill[mob.name])()
		else
			retVal = substituteWeaponskill[mob.name]
		end
	end
	
	return retVal
end

--[[
function auto_weaponskill()
	local retVal = false
	local player = windower.ffxi.get_player()
	
	-- Only concerned with ranger for weaponskills
	if player.main_job == 'COR' then
		if cycle_weaponskills then
			if do_auto_weaponskill == true and player.status == 1 and 
				 player.vitals.tp >= default_weaponskill_tp and canDoAbilities() then
				--windower.send_commaond('input /equip ammo "' .. weaponskill_ammo .. '"')
				windower.send_command('input /ws "'.. weaponskills[math.random(table.length(weaponskills))] .. '" <t>')
				retVal = true
			end
		else
			if do_auto_weaponskill == true and player.status == 1 and 
				 player.vitals.tp >= default_weaponskill_tp and canDoAbilities() then
				local tmp_ws = weaponskill_check(single_weaponskill)
				if tmp_ws then
					windower.send_command('input /ws "' .. tmp_ws .. '" <t>')
				end
				retVal = true
			end
		end
	end
	
	return retVal
end
]]

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
		if abil_info.enabled == true and
			 (abil_info.requiresub == nil or abil_info.requiresub == player.sub_job) and
		   (abil_info.statusid == nil or table.contains(player.buffs, abil_info.statusid) == false) and
		   (abil_info['requirelevel'] and abil_info.requirelevel <= player.main_job_level) and
		   recasts[abil_info.abilityid] == 0 then
			windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
			retVal = true
			break
		end
	end
	return retVal
end

windower.register_event('addon command', function(...)
	local args = {...}
	local cmd = ''
	
	if table.length(args) > 0 then
		cmd = args[1]
	else
		cmd = "enable"
	end
	
	 if T{'enable', 'enabled', 'disable', 'disabled'}:contains(cmd) then
			if args[2] then
				if T{'enable', 'enabled'}:contains(cmd) then
					if logic[args[2]] then
						addon_enabled = true
					else
						addon_enabled = false
					end
				else
					if not logic[args[2]] then
						addon_enabled = true
					else
						addon_enabled = false
					end
				end
			else
				if addon_enabled then
					addon_enabled = false
				else
					addon_enabled = true
				end
			end
			windower.add_to_chat(5, "Corsair Helper: Addon Enabled = " .. tostring(addon_enabled))
	 else
	 
	 end
end)
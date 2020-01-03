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
--strategy = require('data/paladin_strategy')
require('auto_stun')
require('data/stun_list')
require('andreaslibs/auto_weaponskill')

_addon.name = 'Paladin Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'paladin_helper', 'ph'}

do_auto_stun = false
stun_for_job = "PLD"

addon_enabled = true

idletank = false -- Weather to tank when not engaged
docures = true
cure_threshold = 75
my_cure_threshold = 81
doAutoSpellAndAbilities=true
do_auto_chivalry = true
do_auto_strategy = false

do_auto_weaponskills = true -- Do automatic weaponskills
mobhp_ws_pct = 50 -- Percent at which to weaponskill for single weaponskills
default_weaponskill_tp = 1000 -- TP to weaponskill at
weaponskill_distance = 4 -- Distance within to weaponskill
keep_aftermath_up = true -- Keep aftermath active
aftermath_level = 3 -- Aftermath leel to maintain
aftermath_weaponskill = "Knights of Round" -- The aftermath weaponskill
weaponskills = {"Knights of Round"} --List of weaponskill to use
close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
autows_forjob = "PLD" -- The job that this addon pertains to.
-- pre_weaponskill_abilities() Define this do do stuff before you weaponskill
--                             Return true if successful, false otherwise.

debug_text = nil
debug_textbox = nil
debug = false
buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}
item_names = {}
isbusy.timers['aftermath_timer'] = 0

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false,
	['on'] = true,
	['off'] = false
}

auto_abilities = {
	['sepulcher']				={['enabled']=false,['requireengaged']=false,['statusid']=nil,['abilityid']=41,['requiresub']=nil,['target']='<t>'},
	['holy circle']			={['enabled']=false,['requireengaged']=false,['statusid']=74,['abilityid']=74,['requiresub']=nil,['target']='<me>'},
	['defender']				={['enabled']=true,['requireengaged']=true,['statusid']=57,['abilityid']=3,['requiresub']='WAR',['target']='<me>'},
	['berserk'] 				={['enabled']=false,['requireengaged']=false,['statusid']=56,['abilityid']=1,['requiresub']='WAR',['target']='<me>'},
	['provoke']					={['enabled']=false ,['requireengaged']=false,['statusid']=nil,['abilityid']=5,['requiresub']='WAR',['target']='<t>'},
	['aggressor']				={['enabled']=true, ['requireengaged']=true,['statusid']=nil,['abilityid']=4,['requiresub']='WAR',['target']='<me>'},
	['sentinel']				={['enabled']=true, ['requireengaged']=true,['statusid']=62,['abilityid']=75,['requiresub']=nil,['target']='<me>'},
	['palisade']				={['enabled']=true, ['requireengaged']=true,['statusid']=478,['abilityid']=42,['requiresub']=nil,['target']='<me>'},
	['rampart']					={['enabled']=false, ['requireengaged']=true,['statusid']=nil,['abilityid']=77,['requiresub']=nil,['target']='<me>'},
	['fealty']					={['enabled']=false, ['requireengaged']=true,['statusid']=344,['abilityid']=78,['requiresub']=nil,['target']='<me>'},
	['shield bash']			={['enabled']=false ,['requireengaged']=true,['statusid']=nil,['abilityid']=73,['requiresub']=nil,['target']='<t>'},
	['Cover']						={['enabled']=false ,['requireengaged']=false,['statusid']=nil,['abilityid']=76,['requiresub']=nil,['target']='<p1>'},
	['hasso']						={['enabled']=false,['requireengaged']=false,['statusid']=353,['abilityid']=138,['requiresub']='SAM',['target']='<me>'},
	['meditate']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=134,['requiresub']='SAM',['target']='<me>'},
	['third eye']				={['enabled']=false,['requireengaged']=false,['statusid']=67,['abilityid']=133,['requiresub']='SAM',['target']='<me>'},
	['Swordplay']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=24,['requiresub']='RUN',['target']='<me>'},
	['Unda']						={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=10,['requiresub']='RUN',['target']='<me>'},
	['Lunge']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=25,['requiresub']='RUN',['target']='<t>'},
	['Swipe']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=241,['requiresub']='RUN',['target']='<t>'},
	['Vallation']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=23,['requiresub']='RUN',['target']='<me>'},
	['Pflug']						={['enabled']=true,['requireengaged']=true,['statusid']=nil,['abilityid']=59,['requiresub']='RUN',['target']='<me>'},
	['Ancient Circle']	={['enabled']=false,['requireengaged']=true,['statusid']=118,['abilityid']=157,['requiresub']="DRG",['target']='<me>'},
}

auto_spells = {
	['flash']     ={['enabled']=false, ['requireengaged']=true,['statusid']=nil,['spellid']=112, ['requiremp']=25,['requiresub']=nil,  ['target']='<t>'},
	['banish ii'] ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,['spellid']=29, ['requiremp']=57,['requiresub']=nil,  ['target']='<t>'},
	['crusade']   ={['enabled']=false, ['requireengaged']=true,['statusid']=289,['spellid']=476, ['requiremp']=18,['requiresub']=nil,  ['target']='<me>'},
	['reprisal']  ={['enabled']=true, ['requireengaged']=true,['statusid']=403,['spellid']=97,  ['requiremp']=24,['requiresub']=nil,  ['target']='<me>'},
	['phalanx']   ={['enabled']=true, ['requireengaged']=true,['statusid']=116,['spellid']=106, ['requiremp']=21,['requiresub']=nil,  ['target']='<me>'},
	['protect v'] ={['enabled']=true, ['requireengaged']=true,['statusid']=40, ['spellid']=47,  ['requiremp']=84,['requiresub']=nil,  ['target']='<me>'},
	['shell iv']  ={['enabled']=true, ['requireengaged']=true,['statusid']=41, ['spellid']=51,  ['requiremp']=75,['requiresub']=nil,  ['target']='<me>'},
	['Enlight II']={['enabled']=true, ['requireengaged']=true,['statusid']=274,['spellid']=855, ['requiremp']=36,['requiresub']=nil,  ['target']='<me>'},
	['refresh']   ={['enabled']=true, ['requireengaged']=false,['statusid']=43, ['spellid']=108, ['requiremp']=40,['requiresub']='RDM',['target']='<me>'},
	['aquaveil']  ={['enabled']=true, ['requireengaged']=false,['statusid']=39, ['spellid']=55, ['requiremp']=12,['requiresub']='RUN',['target']='<me>'},
	['Barsilence']={['enabled']=true, ['requireengaged']=false,['statusid']=110, ['spellid']=76, ['requiremp']=15,['requiresub']='RUN',['target']='<me>'},
	['Baraero']  	={['enabled']=true, ['requireengaged']=false,['statusid']=102, ['spellid']=10, ['requiremp']=6,['requiresub']='RUN',['target']='<me>'},
	['Regen II']  ={['enabled']=false, ['requireengaged']=false,['statusid']=42, ['spellid']=16, ['requiremp']=36,['requiresub']='RUN',['target']='<me>'},
	['haste']     ={['enabled']=true, ['requireengaged']=false,['statusid']=33, ['spellid']=57,  ['requiremp']=40,['requiresub']='RDM',['target']='<me>'},
	['cocoon']    ={['enabled']=true, ['requireengaged']=true,['statusid']=93, ['spellid']=547, ['requiremp']=10,['requiresub']='BLU',['target']='<me>'},
	['blank gaze']={['enabled']=false, ['requireengaged']=false,['statusid']=nil,  ['spellid']=592, ['requiremp']=25,['requiresub']='BLU',['target']='<t>'},
	['jettatura'] ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,  ['spellid']=575, ['requiremp']=37,['requiresub']='BLU',['target']='<t>'},	
	['battle dance'] ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,  ['spellid']=517, ['requiremp']=12,['requiresub']='BLU',['target']='<t>'},	
}

function autospellstate(autocommand, state)
	if table.containskey(auto_abilities, string.lower(autocommand)) and table.containskey(logic, string.lower(state)) then
		if state ~= nil then
			auto_abilities[string.lower(autocommand)]['enabled'] = logic[string.lower(state)]
		elseif auto_abilities[string.lower(autocommand)]['enabled'] == true then
			auto_abilities[string.lower(autocommand)]['enabled'] = false
		elseif auto_abilities[string.lower(autocommand)]['enabled'] == false then
			auto_abilities[string.lower(autocommand)]['enabled'] = true
		end
	end
end


function autoabilitystate(autocommand, state)
	if table.containskey(auto_spells, string.lower(autocommand)) and table.containskey(logic, string.lower(state)) then
		if state ~= nil then
			auto_spells[string.lower(autocommand)]['enabled'] = logic[string.lower(state)]
		elseif auto_spells[string.lower(autocommand)]['enabled'] == true then
			auto_spells[string.lower(autocommand)]['enabled'] = false
		elseif auto_abilities[string.lower(autocommand)]['enabled'] == false then
			auto_spells[string.lower(autocommand)]['enabled'] = true
		end
	end
end

priority_spells_and_abils = {
	[1]={['name']='flash',   ['type']='magic',['enabled']=true,['requireengaged']=false,['statusid']=nil,['spellid']=112,['requiremp']=25,['requiresub']=nil,  ['target']='<t>'},
	[2]={['name']='sentinel',['type']='abil', ['enabled']=true,['requireengaged']=false,['statusid']=62, ['abilityid']=75,['requiresub']=nil,['target']='<me>'}
}

low_pri_spells_and_abils = {
	[1]={['name']='cocoon',   ['type']='magic',['enabled']=true,['requireengaged']=false,['statusid']=550,['spellid']=547,['requiremp']=10,['requiresub']=nil,  ['target']='<t>'}
}

function do_priority_spells_and_abils()
	local retval = false
	local player = windower.ffxi.get_player()
	local spellrecasts = windower.ffxi.get_spell_recasts()
	local abilrecasts  = windower.ffxi.get_ability_recasts()
	
	if player ~= nil and player.status == 1 then
		for priority, spell_info in ipairs(priority_spells_and_abils) do
			if spell_info.type == 'magic' and canDoSpells() == true and spell_info.enabled == true and
				 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
			   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
			   spellrecasts[spell_info.spellid] == 0 and player.vitals.mp >= spell_info.requiremp then
				windower.send_command('input /ma "' .. spell_info.name .. '" ' .. spell_info.target)
				retVal = true
				break
			elseif spell_info.type == 'abil' and canDoAbilities() == true and spell_info.enabled == true and
				 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
			   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
			   abilrecasts[spell_info.abilityid] == 0 then
				windower.send_command('input /ja "' .. spell_info.name .. '" <me>')
				retVal = true
				break
			end

		end
	end
	
	return retVal
end

low_pri_spells_and_abils = {
	[1]={['name']='cocoon',   ['type']='magic',['enabled']=true,['requireengaged']=false,['statusid']=550,['spellid']=547,['requiremp']=10,['requiresub']='BLU',  ['target']='<t>'}
}

function do_low_pri_spells_and_abils()
	local retval = false
	local player = windower.ffxi.get_player()
	local spellrecasts = windower.ffxi.get_spell_recasts()
	local abilrecasts  = windower.ffxi.get_ability_recasts()
	
	if player ~= nil and player.status == 1 then
		for priority, spell_info in ipairs(low_pri_spells_and_abils) do
			if spell_info.type == 'magic' and canDoSpells() == true and spell_info.enabled == true and
				 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
			   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
			   recasts[spell_info.spellid] == 0 and player.vitals.mp >= spell_info.requiremp then
				windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
				retVal = true
				break
			elseif spell_info.type == 'abil' and canDoAbilities() == true and spell_info.enabled == true and
				 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
			   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
			   recasts[spell_info.abilityid] == 0 then
				windower.send_command('input /ja "' .. abil_name .. '" <me>')
				retVal = true
				break
			end

		end
	end
	
	return retVal
end

function getActionCategory(category)
	local retVal = 'none'
	local categories = {
		'Melee attack',
		'Finish ranged attack',
		'Finish weapon skill',
		'Finish spell casting',
		'Finish item use',
		'Use job ability',
		'Begin weapon skill or TP move',
		'Begin spell casting or interrupt casting',
		'Begin item use or interrupt usage',
		'Unknown – Probably was intended to be the “readies” messages for JAs, which was unnecessary because they are instant.',
		'Finish TP move',
		'Begin ranged attack',
		'Pet completes ability/WS',
		'Unblinkable job ability',
		'Some RUN job abilities'}

		if table.containskey(categories, category) then
			retVal = categories[category]
		else
			retVal = 'Unknown category: ' .. tostring(category)
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
		job_names[jobinfo.ens] = jobid
	end	

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end
end

function load_settings(settings_file)
	local temp_saa = auto_spell_and_abilities
	-- Load spell_and_abilities_configuration
	local settings_file = 
		(settings_file and  windower.addon_path .. "data/" .. settings_file .. ".lua") or
		(windower.addon_path .. "data/spells_and_abilities.lua")
		
	local funct, err = loadfile(settings_file)
	if funct then
		local status, err = pcall(funct)
		if status then
		print("Loaded settings")
		else
			auto_spell_and_abilities = temp_saa
			print("Error executing settings function: " .. err)
		end
	else
		print("Error loading settngs: " .. err)
	end	
end

lua_loop = nil
windower.register_event('load', function()
	debug_textbox = texts.new(' ')
	debug_textbox.pos(debug_textbox, 50,700)
	if debug == true then
		texts.visible(debug_textbox, true)
	end
	init()

	load_settings()
	
	-- Verify spells, abilities, and statuses do_auto_spell_and_abilities
	if auto_spell_and_abilities then
		local tmp_saa = {}
		for priority, action in ipairs(auto_spell_and_abilities) do
			local name = action["name"] or nil
			local entrytype = action["entrytype"] or nil
			local enabled = action["enabled"] or false
			local requireengaged = action["requireengaged"] or false
			local hasstatus = action["hasstatus"] or false
			local requiresub = action["requiresub"] or nil
			local target = action["target"] or "<t>"
			local validation_function = (type(action["validation_function"]) == "function" and action["validation_function"]) or function() return true end
			
			local errorMsg = ""
			local period = ""
			
			
			
			if errorMsg == "" then
				tmp_saa[table.length(tmp_saa)+1] = {
					["name"] = name,
					["entrytype"] = entrytype,
					["enabled"] = enabled,
					["requireengaged"] = action["requireengagged"],
					["hasstatus"] = hasstatus,
					["requiresub"] = requiresub,
					["target"] = target,
					["validation_function"] = validation_function
				}
			end
		end
		auto_spell_and_abilities = tmp_saa
	else
		auto_spell_and_abilities = {}
	end
	
	-- Set a default timeout for aftermath just incase if aftermath is already up.
	-- This fixes a bug when this addon is reloaded with aftermah up,
	-- It will continually spam atonement because it thinks it needs to put aftermath up
	-- because isbusy.timers.aftermath_timer is 0.  And of course, aftermath will
	-- remain up.
	isbusy.timers.aftermath_timer = aftermath_level * 60
	
	windower.send_command("alias tank ph tank")
	
	lua_loop = coroutine.schedule(infinity_loop, 1)
	
	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
	end
end)

action = nil
ilt = 0
function infinity_loop()
	local player
	local temp = false
	
	
	while true do
	temp = false

	if not ilt then ilt = 0 end
		if ilt > 0 then
			ilt = ilt - 1
		else
			player = windower.ffxi.get_player()
			if player and T{0,1}:contains(player.status) then
				if player and player.main_job == 'PLD' and addon_enabled then
					temp = 	    temp
									 or isbusy['isbusy']
									 or queued_actions() 
	
					if player.status == 1 or idletank then
						temp =    temp
									 or isbusy['isbusy']
									 or queued_actions() 
									 or auto_chivalry() 
									 or auto_weaponskill() 
									 or auto_holy_water() 
									 or auto_echo() 
									 or do_auto_cures() 
									 or do_auto_spells() 
									 or do_auto_abilities()
					end
				end
				if temp then ilt = 2 end
			end
		end
		coroutine.sleep(.5)
	end
end

--if true then return end
windower.register_event('unload', function()
	if lua_loop then
		coroutine.close(lua_loop)
	end
	windower.send_command("unalias tank")
end)

function auto_chivalry()
	local player = windower.ffxi.get_player()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local retVal = false
	
	if do_auto_chivalry 
	   and player.vitals.tp == 3000 
	   and ability_recasts[job_ability_names['Chivalry']] == 0 
	   and player.vitals.mp < 100
	then
		windower.send_command('input /ja Chivalry <me>')
		retVal = true
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

function do_auto_spell_and_abilities()
	local retVal = false
	local player
	local ability_recasts
	local spell_recasts
	
	if doAutoSpellAndAbilities and isbusy ~= true then
		player = windower.ffxi.get_player()
		ability_recasts = windower.ffxi.get_ability_recasts()
		spell_recasts = windower.ffxi.get_spell_recasts()
		-- canDoAbilities() canDoSpells()
	end
	
	return retVal
end

function do_auto_abilities()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	
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
			if  (T{25,241}:contains(abil_info.abilityid) and runeCount()>0)
					or (abil_info.abilityid == 10 and runeCount() < 2)
					or (T{23,59}:contains(abil_info.abilityid) and runeCount() > 0)
					or (not T{25,241,10,23,59}:contains(abil_info.abilityid)) 
			then
				windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
				retVal = true
				break
--			elseif T{25,241}:contains(abil_info.abilityid) then
--				windower.add_to_chat(5, "Rune Count: " .. tostring(runeCount()))
			end
		end
	end	
	return retVal
end

function hasRunes()
	local retVal = false
	local runeids = {523-529}
	local player = windower.ffxi.get_player()
	
	if player and player.buffs then
		for runeid=523,529 do
			if table.contains(buffs, runeid) then
				retVal = true
				break
			end
		end
	end
	
	return retVal	
end

function runeCount()
	local retVal = 0
	local player = windower.ffxi.get_player()
	
	if player and player.buffs then
		for key, buffid in pairs(player.buffs) do
			if buffid >=523 and buffid <=529 then
				retVal = retVal +1
			end
		end	
	end
		
	return retVal
end

function canDoSpells()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {6,23,28,29,7,2,19,14,17,10}
	
	for key, id in pairs(blocking) do
		if table.contains(player.buffs, id) == true then
			retVal = false
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
	elseif  spell == 'flash' and T{'Mastop', "Tax'et"}:contains(mobname) then
		retVal = true
	end
	
	return retVal
end

function do_auto_spells()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_spell_recasts()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	local mobname = ''
	local mob = windower.ffxi.get_mob_by_target('t')
	if mob ~= nil and mob.name ~= nil then
		mobname = mob.name
	end
	
	if isbusy == true 
			or canDoSpells() == false 
		--or isbusy['ismoving'] 
	then
		return retVal
	end

	if player.status == 1 then
		engaged = true
	elseif player.status == 0 then
		engaged = false
	end
	
	-- Check for crusade first
	if false and table.containskey(auto_spells, 'crusade') and
			 auto_spells['crusade'].enabled == true and
			 recasts[auto_spells['crusade'].spellid] == 0 and
			 player.vitals.mp > 65 and
			 monster_check('crusade', mobname) == false then
			 windower.send_command('input /ma crusade <me>')
			 action="Paladin Helper: Auto Spells: Crusade"
			 retVal = true
	elseif table.containskey(auto_spells, 'flash') and
			 auto_spells['flash'].enabled == true and
			 recasts[auto_spells['flash'].spellid] == 0 and
			 player.vitals.mp > 65 and
			 monster_check('flash', mobname) == false 
			 and mob and mob.name ~= 'Mastop' then
			 windower.send_command('input /ma flash <t>')
			 action="Paladin Helper: Auto Spells: Flash"
			 retVal = true
	elseif table.containskey(auto_abilities, 'sentinel') and
			 auto_abilities['sentinel'].enabled == true and
			 ability_recasts[auto_abilities['sentinel'].abilityid] == 0 then
	 -- Check for sentinel next
		local abil_info = auto_abilities['sentinel']
		local abil_name = 'sentinel'

		if abil_info.enabled == true and
			 (abil_info.requiresub == nil or abil_info.requiresub == player.sub_job) and
		   (abil_info.statusid == nil or table.contains(player.buffs, abil_info.statusid) == false) and
		   ability_recasts[abil_info.abilityid] == 0 then
			windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
			 action="Paladin Helper: Auto Spells: Sentinel"
			retVal = true
		end
	else
		for spell_name,spell_info in pairs(auto_spells) do
			if spell_info.enabled == true and
				 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
			   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
			   recasts[spell_info.spellid] == 0 and (player.vitals.mp >= (spell_info.requiremp+40) or 
			   (spell_name == 'refresh' and spell_info.requiremp >=40)) and 
			   monster_check(spell_name, mobname) == false  and
			   T{"jettatura", "blank gaze"}:contains(spell_name) ~= true
			 then
				windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
			 	action="Paladin Helper: Auto Spells: " .. spell_name
				retVal = true
				break
			end
		end
		if not retVal then
			-- Check and see if we can cast jettatura or blank gaze
			for spell_name,spell_info in pairs(auto_spells) do
				if spell_info.enabled == true and
					 (spell_info.requiresub == nil or spell_info.requiresub == player.sub_job) and
				   (spell_info.statusid == nil or table.contains(player.buffs, spell_info.statusid) == false) and
				   recasts[spell_info.spellid] == 0 and (player.vitals.mp >= (spell_info.requiremp+40) or 
				   (spell_name == 'refresh' and spell_info.requiremp >=40)) and 
				   monster_check(spell_name, mobname) == false  and
				   T{"jettatura", "blank gaze"}:contains(spell_name) == true
				 then
					windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
			 	action="Paladin Helper: Auto Spells: " .. spell_name
					retVal = true
					break
				end
			end
		end
	end
	
	
	
	-- Did we not cast and refresh is not up?
	if retVal == false and table.contains(player.buffs, 43) == false and recasts[108] == 0 and player.vitals.mp >= 0 and player.subjob == 'RDM' then
		windower.send_command('input /ma refresh <me>')
	end
	
	return retVal
end

-- 0,5,6,7 Bags to check
-- mybags.inventory[1] keys: count slot bazaar extdata status id
-- Status has to be 0 to be usable

--function has_item(item_id)
--	local retVal = false
--	local bag_list = T{0,5,6,7}
--	local bags = windower.ffxi.get_items()
	
--	if bags ~= nil then
--		for _,bag in pairs(T{'inventory', 'sack', 'satchel', 'case'}) do
--			for slot,item_info in pairs(bags[bag]) do
--				if item_info.id == item_id then
--					retVal = true
--					break
--				end
--			end
--			if retVal == true then
--				break
--			end
--		end
--  end
	
--	return retVal
--end

function has_item(item_id)
	local retVal = false
	local bag_list = T{0,5,6,7}
	local bags = windower.ffxi.get_items()
	
	if bags ~= nil then
		for _,bag in pairs(T{'inventory', "wardrobe", 'sack', 'satchel', 'case'}) do
			for slot,item_info in pairs(bags[bag]) do
				if type(item_info) == 'table' and item_info.id == item_id then
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
		if player ~= nil and has_item(item_names["Holy Water"]) and
		                     table.contains(player.buffs, 9 ) == true or
		                     table.contains(player.buffs, 15) == true then
			-- There is also 20 for curse, but that might be super curse
			windower.send_command('input /item "holy water" <me>')
			retVal = true
		end
	elseif has_item(item_names["Hallowed Water"]) == true then
		local player = windower.ffxi.get_player()
		if player ~= nil and has_item(item_names["Hallowed Water"]) and
		                     table.contains(player.buffs, 9 ) == true or
		                     table.contains(player.buffs, 15) == true then
			-- There is also 20 for curse, but that might be super curse
			windower.send_command('input /item "Hallowed Water" <me>')
			retVal = true
		end

	end
	return retVal
end


function isValidMember(member)
	local retVal = false
	if member ~= nil and member.mob ~= nill and math.sqrt(member.mob.distance) <= 20 and member.hpp > 0 then
		retVal = true
	end
	return retVal
end

healing_delay = 0
function do_auto_cures()
	if windower.ffxi.get_info().logged_in == false then
		return false
	end
	if docures == false then
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
	local party2 = {}
	--windower.add_to_chat(2, 'In do heals')
	if player.main_job == 'PLD' then
		party = windower.ffxi.get_party()
		
		-- Recreate party structure to make sure the pld is cured first
		party2[1]= {['target']='p0', ['member'] = party['p0']}
		for target, member in pairs(party) do
			if target ~= 'p0' and type(member) == 'table' then
				party2[table.length(party2)+1] = {['target']=target, ['member'] = member}
			end
		end
		--for key,value in pairs(party) do
			--temp = temp .. key .. " "
		--end
		
		--windower.add_to_chat(4, temp)
		if player.status == 1 then
		  local spell_recasts = windower.ffxi.get_spell_recasts()
		  
			--for target,member in pairs(party) do
			for order,info in ipairs(party2) do
				target = info.target
				member = info.member
			  if isValidMember(member) and 
			  	(member.hpp < cure_threshold or (member.name == player.name and member.hpp <= my_cure_threshold)) and 
			  spell_recasts[4] == 0 then
		  		-- windower.add_to_chat(2, 'member.hpp ' .. member.hpp)
		  		if table.contains(player.buffs, 6) == false and table.contains(player.buffs, 29) == false then
		  			if string.lower(target) == 'p0'  and player.vitals.mp > (88+40) then
					  	windower.send_command('input /ma "cure iv" <' .. target .. '>')
						elseif player.vitals.mp > (46+40) then
							windower.send_command('input /ma "cure iii" <' .. target .. '>')
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

windower.register_event('addon command', function(...)
	local args = {...}
	local command = ''
	local autocommand = nil
	local arg1 = nil
	
	if table.length(args) > 0 then
		command = args[1]
		autocommand =  string.match (command, '^auto([a-z][A-Z])*')
		if autocommand ~= nil then
			if table.length(args) > 1 then
				args1 = args[2]
			end
			local temp = autospellstate(autocommand, arg1) or autoabilitystate(autocommand, arg1)
		elseif T{"tank", "idletank", "standandtank"}:contains(command) then
			if args[2] then
				if logic[args[2]] then
					idletank = true
				else
					idletank = false
				end
			else
				if idletank then
					idletank = false
				else
					idletank = true
				end
			end
			windower.add_to_chat(5, "Paladin Helper: Stand and Tank: " .. tostring(idletank))
		elseif T{"q", "que", "queue"}:contains(command) then
			local queued_command = ""
			local space = ""
			local count = 2
			
			while args[count] do
				queued_command = queued_command .. space .. args[count]
				count=count+1
				space = " "
			end
			
			if string.len(queued_command) > 0 then
				queuedactions[table.length(queuedactions) + 1 ] = queued_command
			end
			
			windower.add_to_chat(5, "Paladin_Helper queued " .. queued_command)
		end
	elseif addon_enabled == true then
		addon_enabled = false
		windower.add_to_chat(5, "Paladin Helper disabled")
	elseif addon_enabled == false then
		windower.add_to_chat(5, "Paladin Helper enabled")
		addon_enabled = true		
	end
end)

queuedactions = {}

function queued_actions()
	local retVal = false
	if queuedactions and table.length(queuedactions) > 0 then
		for key,value in ipairs(queuedactions) do
			if value and string.len(value) > 0 then
				windower.send_command("input " .. value)
				retVal = true
				queuedactions[key] = nil
				-- remake the queuedactions table
				local tmpqueuedactions = {}
				for key, value in pairs(queuedactions) do
					if value then
						tmpqueuedactions[table.length(tmpqueuedactions)+1] = value
					end
				end
				queuedactions = tmpqueuedactions
				break;
			end
		end	
	end
	
	return retVal
end

-- Experimental
--windower.register_event('action message',function (actor_id, target_id, actor_index, target_index, message_id, param_1, param_2, param_3)
--	windower.add_to_chat(5, "actor_id: " .. actor_id.. " -> target_id: " .. tostring(target_id) .. " (message_id: " .. message_id .. ")" )
--end)

current_buffs = {}
function what_changed()
	local player = windower.ffxi.get_player()
	local buffs = {}
	local comma = "New Buff ID's: "
	local output = ""
	local gained_buffs = false
	
	if player and player.buffs then
		buffs = player.buffs
	end
	
	for key, buffid in pairs(buffs) do
		if not table.contains(current_buffs, buffid) then
			output = output .. comma .. tostring(buffid)
			comma = ", "
			gained_buffs = true
		end
	end
	current_buffs = buffs
	
	if gained_buffs then
		windower.add_to_chat(5, output)
	end
 return false
end

windower.register_event('gain buff', function(buff_id)
	-- If aftermath is >= the aftermath_level then we don't need to refresh aftermath
	--if aftermath_up() >= aftermath_level then
	--	isbusy.timers.aftermath_timer = 0
	--end
	
	-- If we just gained the required aftermath, set a timer for aftermath_level * 60 - 30
	if T{270,271,272}:contains(buff_id) then
		if (buff_id - 269) >= aftermath_level then
			isbusy.timers.aftermath_timer = aftermath_level * 60 - 10
		end
	end
end)
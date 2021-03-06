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
require('auto_stun')
require('data/stun_list')
require('andreaslibs/auto_weaponskill')
require('andreaslibs/auto_shadows')
require('andreaslibs/auto_cure')

_addon.name = 'Red Mage Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'redmage_helper', 'rh'}

do_auto_stun = false
stun_for_job = "RDM"

addon_enabled = true

docures = true
cure_threshold = 85
my_cure_threshold = 75
do_curebot = false
doAutoSpellAndAbilities=true
--  How much each spell will cure for
cure_matrix = {
	{["spell"]="Cure",    ["cured_amount"] = 70  },
	{["spell"]="Cure II", ["cured_amount"] = 150  },
	{["spell"]="Cure III",["cured_amount"] = 300},
	{["spell"]="Cure IV", ["cured_amount"] = 600},
}

doComposure = true

-- Spell cycles
do_haste_cycle = true
do_refresh_cycle = true
do_regen_cycle = true
do_flurry_cycle = true

-- If the *_who arrays are empty, it will make it's best judgement

haste_who = {

}

refresh_who = {

}

regen_who = {

}

flurry_who = {

}

cycle_timers = {
	["Haste II"] = {},
	["Refresh II"] = {},
	["Regen II"] = {},
	["Flurry II"] = {}
}

do_auto_weaponskills = false -- Do automatic weaponskills
mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
default_weaponskill_tp = 1000 -- TP to weaponskill at
weaponskill_distance = 4 -- Distance within to weaponskill
keep_aftermath_up = false -- Keep aftermath active
aftermath_level = 3 -- Aftermath leel to maintain
aftermath_weaponskill = "Knights of Round" -- The aftermath weaponskill
weaponskills = {
"Death Blossom",
"Death Blossom",
"Knights of Round",
"Savage Blade",
"Chant du Cygne",
} --List of weaponskill to use
close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
autows_forjob = "RDM" -- The job that this addon pertains to.
-- pre_weaponskill_abilities() Define this do do stuff before you weaponskill
--                             Return true if successful, false otherwise.

shadows_required = 1
tempcast = false
do_auto_shadows = true
for_job = 'RDM'
doautoni = true
doAutoShadows = true

shadows_required = 1


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

function init_abilities_and_spells()
	auto_abilities = {
		['aggressor']				={['enabled']=false, ['requireengaged']=false,['statusid']=nil,['abilityid']=4,['requiresub']='WAR',['target']='<me>'},
		['defender']				={['enabled']=false,['requireengaged']=false,['statusid']=57,['abilityid']=3,['requiresub']='WAR',['target']='<me>'},
		['berserk'] 				={['enabled']=false,['requireengaged']=false,['statusid']=56,['abilityid']=1,['requiresub']='WAR',['target']='<me>'},
		['provoke']					={['enabled']=false,['requireengaged']=false,['statusid']=nil,['abilityid']=5,['requiresub']='WAR',['target']='<t>'},
	}
	
	auto_spells = {
		['Protect V']     ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Protect"],  ['spellid']=spell_names["Protect V"], ['requiremp']=84,['requiresub']=nil,  ['target']='<me>'},
		['Shell V']       ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Shell"],    ['spellid']=spell_names["Shell V"], ['requiremp']=93,['requiresub']=nil,  ['target']='<me>'},
		['Reraise']       ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Reraise"],    ['spellid']=spell_names["Reraise"], ['requiremp']=150,['requiresub']='WHM',  ['target']='<me>'},
		['Refresh III']    ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Refresh"],  ['spellid']=spell_names["Refresh III"], ['requiremp']=60,['requiresub']=nil,  ['target']='<me>'},
		['Haste II']      ={['enabled']=true, ['requireengaged']=false,['statusid']=33,                     ['spellid']=spell_names["Haste II"],  ['requiremp']=80,['requiresub']=nil,  ['target']='<me>'},
		['Temper II']        ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names["Multi Strikes"],                     ['spellid']=spell_names["Temper II"],  ['requiremp']=72,['requiresub']=nil,  ['target']='<me>'},
		['stoneskin']     ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Stoneskin"],['spellid']=spell_names["Stoneskin"], ['requiremp']=30,['requiresub']=nil,  ['target']='<me>'},
		['blink']         ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names["Blink"],    ['spellid']=spell_names["Blink"], ['requiremp']=21,['requiresub']=nil,  ['target']='<me>'},
		['phalanx']       ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Phalanx"],  ['spellid']=spell_names["Phalanx"], ['requiremp']=21,['requiresub']=nil,  ['target']='<me>'},
		['Enaero II'] ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names["Enaero II"],['spellid']=spell_names["Enaero II"], ['requiremp']=12,['requiresub']=nil,  ['target']='<me>'},
		['Regen ii']      ={['enabled']=true, ['requireengaged']=false,['statusid']=42,['spellid']=spell_names["Regen II"], ['requiremp']=36,['requiresub']=nil,  ['target']='<me>'},
		['aquaveil']      ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["Aquaveil"], ['spellid']=spell_names["Aquaveil"], ['requiremp']=12,['requiresub']=nil,['target']='<me>'},
		['Barfire']       ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names["Barfire"], ['spellid']=spell_names["Barfire"], ['requiremp']=12,['requiresub']=nil,['target']='<me>'},
		['Barpetrify']       ={['enabled']=false, ['requireengaged']=false,['statusid']=buff_names["Barpetrify"], ['spellid']=spell_names["Barpetrify"], ['requiremp']=12,['requiresub']=nil,['target']='<me>'},
		['cocoon']        ={['enabled']=true, ['requireengaged']=true,['statusid']=93, ['spellid']=547, ['requiremp']=10,['requiresub']='BLU',['target']='<me>'},
	  ['blank gaze']    ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,  ['spellid']=592, ['requiremp']=25,['requiresub']='BLU',['target']='<t>'},
	  ['jettatura']     ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,  ['spellid']=575, ['requiremp']=37,['requiresub']='BLU',['target']='<t>'},	
	  ['battle dance']  ={['enabled']=false, ['requireengaged']=false,['statusid']=nil,  ['spellid']=517, ['requiremp']=12,['requiresub']='BLU',['target']='<t>'},	
		['Gain-MND']      ={['enabled']=true, ['requireengaged']=false,['statusid']=buff_names["MND Boost"], ['spellid']=spell_names["Gain-MND"], ['requiremp']=36,['requiresub']=nil,['target']='<me>'},
	}
end

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
}

low_pri_spells_and_abils = {
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
		buff_names["STR Boost"] = 119
		buff_names["DEX Boost"] = 120
		buff_names["VIT Boost"] = 121
		buff_names["AGI Boost"] = 122
		buff_names["INT Boost"] = 123
		buff_names["MND Boost"] = 124
		buff_names["CHR Boost"] = 125

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
	
	init_abilities_and_spells()
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

	--load_settings()
	
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
	
	--windower.send_command("alias tank ph tank")
	
	lua_loop = coroutine.schedule(infinity_loop, 1)
	
	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
	end
	windower.send_command('alias curebot rh curebot')
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
				if player and player.main_job == 'RDM' and addon_enabled then
					temp = 	    temp
									 or isbusy['isbusy']
									 or queued_actions() 
	
					if player.status == 1 then
						temp =    temp
									 or isbusy['isbusy']
									 or queued_actions() 
									 or auto_holy_water() 
									 or auto_echo()
									 or (auto_shadows and auto_shadows())
									 or (do_auto_cures and do_auto_cures()) 
									 or do_auto_composure()
									 or auto_weaponskill() 
									 or do_auto_spells() 
									 or do_auto_abilities()
					elseif player.status == 0 and do_curebot then
						temp =    temp
									 or isbusy['isbusy']
									 or queued_actions() 
									 or auto_holy_water() 
									 or auto_echo() 
									 or do_auto_cures() 
									 or do_auto_composure()
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
	windower.send_command('unalias curebot')
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
		 	action="Red Mage Helper: Auto Spells: " .. spell_name
				retVal = true
				break
			end
		end
	end
	
	
	
	-- Did we not cast and refresh is not up?
	if retVal == false and table.contains(player.buffs, 43) == false and recasts[108] == 0 and player.vitals.mp >= 0 and player.subjob == 'RDM' then
		windower.send_command('input /ma refresh <me>')
	end
	
	return retVal
end

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
--		elseif T{"aws", "aw", "autoweaponskill", "auto_weapon_skill"}:contains(command) then
--			if args[2] then
--				if logic[args[2]] then
--					do_auto_weaponskill = true
--				else
--					do_auto_weaponskill = false
--				end
--			else
--				if do_auto_weaponskill then
--					do_auto_weaponskill = false
--				else
--					do_auto_weaponskill = true
--				end
--			end
--			windower.add_to_chat(5, "Red Mage Helper: Auto Weaponskill: " .. tostring(do_auto_weaponskill))
--		elseif T{"dws", "ws", "defaultweaponskill", "default_weaponskill", "weaponskill"}:contains(command) then
--			local count = 2
--			local temp  = ""
--			local space = ""
--			while args[count] do
--				temp = temp .. space .. args[count]
--				space = " "
--				count = count +1
--			end
--			single_weaponskill = temp
--			windower.add_to_chat(5, "Red Mage Helper: Single Weaponskill: " .. tostring(single_weaponskill))
		elseif command == "tp" then
			if args[2] then
				default_weaponskill_tp = tonumber(args[2])
			end
			windower.add_to_chat(5, "Weaponskill TP: " .. tostring(default_weaponskill_tp))
--		elseif T{"tank", "idletank", "standandtank"}:contains(command) then
--			if args[2] then
--				if logic[args[2]] then
--					idletank = true
--				else
--					idletank = false
--				end
--			else
--				if idletank then
--					idletank = false
--				else
--					idletank = true
--				end
--			end
--			windower.add_to_chat(5, "Paladin Helper: Stand and Tank: " .. tostring(idletank))
		elseif T{"curebot","cureplease","cure_bot", "cure_please"}:contains(command) then
			if args[2] then
				if logic[args[2]] then
					do_curebot = true
				else
					do_curebot = false
				end	
			else
				if do_curebot then
					do_curebot = false
				else
					do_curebot = true
				end
			end
			local message = "Redmage_Helper:  Curebot deactivated!"
			if do_curebot then
				message = "Redmage_Helper:  Curebot activated!" 
			end
			windower.add_to_chat(5, message)
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
			
			windower.add_to_chat(5, "Redmage_Helper queued " .. queued_command)
			-- See if we can run it right away
			if not isbusy.isbusy then
				queued_actions()
			end
		end
	elseif addon_enabled == true then
		addon_enabled = false
		windower.add_to_chat(5, "Redmage Helper disabled")
	elseif addon_enabled == false then
		windower.add_to_chat(5, "Redmage Helper enabled")
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

function do_auto_composure()
	local player = windower.ffxi.get_player()
	local abilrecasts  = windower.ffxi.get_ability_recasts()
	local retVal = false
	
	if player.main_job == 'RDM' 
		and doComposure
		and abilrecasts[job_ability_names["Composure"]] == 0
		and table.contains(player.buffs, buff_names["Composure"]) == false
	then
		windower.send_command('input /ja composure <me>')
		retVal = true
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

function init_cycle_timers()
	for _, player in ipairs(haste_who) do
		cycle_timers["Haste II"][capitalize_me(player)] = 0
	end
	for _, player in ipairs(refresh_who) do
		cycle_timers["Refresh II"][capitalize_me(player)] = 0
	end
	for _, player in ipairs(regen_who) do
		cycle_timers["Regen II"][capitalize_me(player)] = 0
	end
	for _, player in ipairs(flurry_who) do
		cycle_timers["Flurry II"][capitalize_me(player)] = 0
	end
end

function countdown_cycle_timers()
	for _, timer in ipairs(cycle_timers) do
		for player,cycle_time in pairs(timer) do
			if cycle_time > 0 then
				cycle_timers[timer][player] = cycle_time -1
			elseif cycle_time < 0 then
				cycle_timers[timer][player] = 0
			end
		end
	end
end

function cycles()
	local retVal = false
	local spells_to_cast = {}
	local party = nil
	local party_members = {}
	local spell_recasts = nil
	
	if do_haste_cycle   then spells_to_cast[table.length(spells_to_cast)+1] = "Haste II"   end
	if do_refresh_cycle then spells_to_cast[table.length(spells_to_cast)+1] = "Refresh II" end
	if do_regen_cycle   then spells_to_cast[table.length(spells_to_cast)+1] = "Regen II"   end
	if do_flurry_cycle  then spells_to_cast[table.length(spells_to_cast)+1] = "Flurry II"  end
	
	if table.length(spells_to_cast) > 0 then
		party = windower.ffxi.get_party()
		for _, pm in pairs(party) do
			-- This takes care of who is in party, in zone, and in range
			if pm.mob and math.sqrt(pm.mob.distance) <=20 then
				party_members[table.length(party_members)] = pm.name
			end
		end
	end
	
	local tmp_cycle_tables = {
		haste_who, refresh_who, regen_who, flurry_who
	}
	
	-- Iterate spells to cast and determine who to cast it on
	for _,spell in ipairs(spells_to_cast) do
		for _,cycle_table in ipairs(tmp_cycle_tables) do
			local tmp_spell_who = {}

			-- Go through the tmp_haste_who structure and see who is there and in range and in party
			-- And who has a timer of 0 for the spell
			for _, player_name in ipairs(cycle_table) do
				if table.contains(party_members, capitalize_me(player_name)) 
				   and cycle_timers[spell][player_name] == 0
				then
					-- Haste this person is the spell is ready
					spell_recasts = windower.ffxi.get_spell_recasts()
					if spell_recasts[spell_names[spell]] == 0 then
						windower.send_command('input /ma "' .. spell ..'" ' .. player_name)
						retVal =  true
						break
					end
				end
			end
			if retVal == true then break end
		end
	end
	return retVal
end

windower.register_event('gain buff', function(buff_id)
	-- If aftermath is >= the aftermath_level then we don't need to refresh aftermath
	--if aftermath_up() >= aftermath_level then
	--	isbusy.timers.aftermath_timer = 0
	--end
--	windower.add_to_chat(5, tostring(buff_id))
	-- If we just gained the required aftermath, set a timer for aftermath_level * 60 - 30
	if T{270,271,272}:contains(buff_id) then
		if (buff_id - 269) >= aftermath_level then
			isbusy.timers.aftermath_timer = aftermath_level * 60 - 10
		end
	end
end)

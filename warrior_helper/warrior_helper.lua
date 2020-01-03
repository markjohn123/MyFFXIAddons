config = require('config')
require('strings')
require('luau')
texts = require('texts')
require("resources/slots")
buffs = require('res/buffs')
job_abilities = require('res/abilities')
spells = require('res/spells')
jobs = require('res/jobs')
items = require('res/items')
isbusy = require('isbusy')
monster_families = require("andreaslibs/monster_families")
require('andreaslibs/resource_functions')
require('andreaslibs/auto_shadows')
require('andreaslibs/auto_voidwatch_temps')
require('directions')
require('andreaslibs/auto_weaponskill')

_addon.name = 'Warrior Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'warrior_helper', 'wh'}

autospells = true
sdoautoni = true
doAutoShadows = true
shadows_required = 1
for_job = 'WAR'
ws_target_hpp = 100

-- For automatically using voidwatch temps
do_vw_temps = true

temps = nil

do_auto_weaponskills = false -- Do automatic weaponskills
mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
default_weaponskill_tp = 1000 -- TP to weaponskill at
weaponskill_distance = 4 -- Distance within to weaponskill
keep_aftermath_up = true -- Keep aftermath active
aftermath_level = 3 -- Aftermath level to maintain
aftermath_weaponskill = "Cloudsplitter" -- The aftermath weaponskill
weaponskills = {"Cloudsplitter"} --List of weaponskill to use
close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
autows_forjob = "WAR" -- The job that this addon pertains to.
-- pre_weaponskill_abilities() Define this do do stuff before you weaponskill
--                             Return true if successful, false otherwise.


do_auto_stun = false
stun_for_job = "WAR"
auto_abilities = {
	['Berserk']={['enabled']=false,['requireengaged']=false,['statusid']=nil,['abilityid']=1,['requiresub']=nil,['target']='<me>'},
	['defender']				={['enabled']=true,['requireengaged']=false,['statusid']=57,['abilityid']=3,['requiresub']=nil,['target']='<me>'},
	['Aggressor']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=4,['requiresub']=nil,['target']='<me>'},
	['Retaliation']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=8,['requiresub']=nil,['target']='<me>'},
	['Restraint']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=9,['requiresub']=nil,['target']='<me>'},
	['Meditate']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=134,['requiresub']='SAM',['target']='<me>'},
	['Sekkanoki']={['enabled']=false,['requireengaged']=false,['statusid']=nil,['abilityid']=140,['requiresub']='SAM',['target']='<me>'},
	['Swordplay']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=24,['requiresub']='RUN',['target']='<me>'},
	['Unda']							={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=10,['requiresub']='RUN',['target']='<me>'},
	['Lunge']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=25,['requiresub']='RUN',['target']='<t>'},
	['Swipe']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=241,['requiresub']='RUN',['target']='<t>'},
	['Vallation']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=23,['requiresub']='RUN',['target']='<me>'},
	['Pflug']						={['enabled']=true,['requireengaged']=true,['statusid']=nil,['abilityid']=59,['requiresub']='RUN',['target']='<me>'},
}

auto_spells = {
	['phalanx']   ={['enabled']  =false, ['requireengaged']=false,['statusid']=116,  ['spellid']=106,   ['requiremp']=21,['requiresub']='RDM',  ['target']='<me>'},
	['protect iii'] ={['enabled']=false, ['requireengaged']=false,['statusid']=40, ['spellid']=45,      ['requiremp']=46,['requiresub']='RDM',  ['target']='<me>'},
	['shell ii']  ={['enabled']  =false, ['requireengaged']=false,['statusid']=41,   ['spellid']=50,    ['requiremp']=37,['requiresub']='RDM',  ['target']='<me>'},
	['refresh']   ={['enabled']  =false, ['requireengaged']=false,['statusid']=43,   ['spellid']=108,   ['requiremp']=40,['requiresub']='RDM',  ['target']='<me>'},
	['haste']     ={['enabled']  =false, ['requireengaged']=false,['statusid']=33,   ['spellid']=57,    ['requiremp']=40,['requiresub']='RDM',  ['target']='<me>'},
	['ice spikes'] ={['enabled'] =false,['requireengaged']=false,['statusid']=35,   ['spellid']=16,    ['requiremp']=37,['requiresub']='RDM',  ['target']='<me>'},
	['enaero']     ={['enabled'] =false, ['requireengaged']=false,['statusid']=96,   ['spellid']=110,  ['requiremp']=12,['requiresub']='RDM',  ['target']='<me>'},
}

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_ability_ids = {}
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
			job_ability_names[string.lower(abilityinfo.en)] = abilityinfo.recast_id
			job_ability_ids[abilityinfo.id] = abilityinfo.en
	end

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.ens] = jobid
	end	
	
	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = itemid
	end
end

function init_temps()
	temps={
		{
			[item_names['Lucid Potion I'  ]] = needs_healing,
			[item_names['Lucid Potion II' ]] = needs_healing,
			[item_names['Lucid Potion III']] = needs_healing,
		},
		{[item_names["Fool's Tonic"]] = true},
		{
		 [item_names["Stalwart's Tonic"]]  = true,
		 [item_names["Braver's Drink"]]    = true,
		 [item_names["Monarch's Drink"]]   = true,
		},
		{[item_names["Lucid Wings I"]]     = needs_tp},
	}
end



lua_loop = nil

windower.register_event('load', function()
	debug_textbox = texts.new(' ')
	debug_textbox.pos(debug_textbox, 50,700)
	--texts.visible(charges_txtbox, true)
	init()
	init_temps()
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

bags={[0]="inventory",[1]="safe",[2]="storage",[3]="locker",[4]="items",[5]="satchel",[6]="sack",[7]="case"}

function move_item(bag, id, count)
	local items = windower.ffxi.get_items()
	local foodInInventory = false
	local iCount = count
	local bagid
	if count == nil then
		iCount = 1
	end
	
	for key,value in ipairs(bags) do
		if value == bag then
			bagid = key
			break
		end
	end
	
	for key, item in ipairs(items[bag]) do
		if item.id == id then
			foodInInventory = true
			-- Move item from satchel to inventory
			windower.ffxi.get_item(bagid, key, 1)
			break
		end
	end	
	
	return foodInInventory
end

function has_item(item_id)
	local retVal = false
	local bag_list = T{0,3}
	local bags = windower.ffxi.get_items()
	
	if bags ~= nil then
		for _,bag in pairs(T{'inventory', 'Temporary'}) do
			if bags[bag] then
				for slot,item_info in pairs(bags[bag]) do
					--windower.add_to_chat(5,"bh: 229 type(item_info)=" .. type(item_info))
					if type(item_info) == 'table' and item_info.id == item_id then
						retVal = true
						break
					end
				end
			end
			if retVal == true then
				break
			end
		end
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

function do_auto_spells()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_spell_recasts()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	local mobname = ''
	local mob = windower.ffxi.get_mob_by_target('t')
	
	if (not autospells) or isbusy['ismoving'] then return false end
	if mob ~= nil and mob.name ~= nil 
	then
		mobname = mob.name
	end
	
	
	if isbusy['isbusy'] == true or canDoSpells() == false
		or player.status ~= 1
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
		   monster_check(spell_name, mobname) == false  then
			windower.send_command('input /ma "' .. spell_name .. '" ' .. spell_info.target)
			retVal = true
			break
		end
	end
	
	
	
	-- Did we not cast and refresh is not up?
	if retVal == false and table.contains(player.buffs, 43) == false and recasts[108] == 0 and player.vitals.mp >= 40 and player.subjob == 'RDM' then
		windower.send_command('input /ma refresh <me>')
	end
	
	return retVal
end

ifl = 0
function infinity_loop()
	local temp = false
	local player
	while true do
		ifl = .7
		player = windower.ffxi.get_player()
		if player and player.main_job == 'WAR' and player.status == 1 then
			temp = isbusy['isbusy'] 
			       or (auto_shadows and auto_shadows()) 
			       or do_auto_abilities()
			       or auto_weaponskill() 
			       --or voidwatch_temps()
			       or do_auto_spells()
			if temp then ifl = 2 end
		end
--windower.add_to_chat(5, "Infinity Loop 1")
		coroutine.sleep(ifl)
--windower.add_to_chat(5, "Infinity Loop 2")
	end
end

last_set_ws = nil

windower.register_event('addon command', function(...)
	local args = {...}
	local cmd = ''
	
	if table.length(args) > 0 then
		cmd = args[1]
	end
	
	 if T{"autostun", "auto_stun", "do_auto_stun", "doautostun", "stun", "das", "as", "dostun", "dostuns", "stuns"}:contains(cmd) then
	 	if logic[args[2]] then
	 		do_auto_stun = true
	 	else
	 		do_auto_stun = false
	 	end
	 	windower.add_to_chat(5, "Auto Stun: " .. tostring(do_auto_stun))
	 end
end)


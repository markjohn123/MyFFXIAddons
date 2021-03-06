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
require('auto_stun')
require('data/stun_list')
monster_families = require("andreaslibs/monster_families")
require('andreaslibs/resource_functions')
--require('andreaslibs/auto_shadows')
require('andreaslibs/auto_voidwatch_temps')
require('andreaslibs/auto_weaponskill')
require('beastmaster_helper_resources')
require('directions')

_addon.name = 'Beastmaster Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'beastmaster_helper', 'bh'}

debug_text = nil
debug_textbox = nil
debug = false
do_snarl = true
autospells = true
do_auto_sic = false
hold_sic_for_sc = false
sdoautoni = false
doautoni = false
doAutoShadows = true
shadows_required = 2
for_job = 'BST'
autofight = false
ready_recast = set_ready_recast()
report_charges = true
autoreward = true
ws_target_hpp = 100
reward_distance = 8
sic_ready_distance = 8

do_auto_weaponskills = false -- Do automatic weaponskills
mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
default_weaponskill_tp = 1000 -- TP to weaponskill at
weaponskill_distance = 4 -- Distance within to weaponskill
keep_aftermath_up = true -- Keep aftermath active
aftermath_level = 3 -- Aftermath leel to maintain
aftermath_weaponskill = "Primal Rend" -- The aftermath weaponskill
weaponskills = {"Calamity"} --List of weaponskill to use
close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
autows_forjob = "BST" -- The job that this addon pertains to.
-- pre_weaponskill_abilities() Define this do do stuff before you weaponskill
--                             Return true if successful, false otherwise.

--For DroopyDortwin and PonderingPeter's determine next move function
--whether to heal or do tp move.
heal_party = false

-- For automatically summoning pets
pet_jug = "Dire Broth"
do_auto_call_beast = false

-- For automatically using voidwatch temps
do_vw_temps = true

temps = nil

do_auto_stun = false
stun_for_job = "BST"
auto_abilities = {
	['Berserk']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=1,['requiresub']='WAR',['target']='<me>'},
	['Warcry']={['enabled']=false,['requireengaged']=false,['statusid']=nil,['abilityid']=2,['requiresub']='WAR',['target']='<me>'},
	['Aggressor']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=4,['requiresub']='WAR',['target']='<me>'},
	['Killer Instinct']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=106,['requiresub']=nil,['target']='<me>'},
	['Meditate']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=134,['requiresub']='SAM',['target']='<me>'},
	['Sekkanoki']={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=140,['requiresub']='SAM',['target']='<me>'},
	['Swordplay']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=24,['requiresub']='RUN',['target']='<me>'},
	['Tenebrae']					={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=10,['requiresub']='RUN',['target']='<me>'},
	['Lunge']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=25,['requiresub']='RUN',['target']='<t>'},
	['Swipe']						={['enabled']=false,['requireengaged']=true,['statusid']=nil,['abilityid']=241,['requiresub']='RUN',['target']='<t>'},
	['Vallation']				={['enabled']=true,['requireengaged']=false,['statusid']=nil,['abilityid']=23,['requiresub']='RUN',['target']='<me>'},
	['Pflug']						={['enabled']=true,['requireengaged']=true,['statusid']=nil,['abilityid']=59,['requiresub']='RUN',['target']='<me>'},
	['Sentinel']				={['enabled']=true,['requireengaged']=true,['statusid']=nil,['abilityid']=75,['requiresub']='PLD',['target']='<me>'},
	['Shield Bash']			={['enabled']=true,['requireengaged']=true,['statusid']=nil,['abilityid']=73,['requiresub']='RUN',['target']='<t>'},
}

auto_spells = {
	['phalanx']   ={['enabled']  =true, ['requireengaged']=false,['statusid']=116,  ['spellid']=106,   ['requiremp']=21,['requiresub']='RDM',  ['target']='<me>'},
	['protect iii'] ={['enabled']=true, ['requireengaged']=false,['statusid']=40, ['spellid']=45,      ['requiremp']=46,['requiresub']='RDM',  ['target']='<me>'},
	['shell ii']  ={['enabled']  =true, ['requireengaged']=false,['statusid']=41,   ['spellid']=50,    ['requiremp']=37,['requiresub']='RDM',  ['target']='<me>'},
	['refresh']   ={['enabled']  =true, ['requireengaged']=false,['statusid']=43,   ['spellid']=108,   ['requiremp']=40,['requiresub']='RDM',  ['target']='<me>'},
	['haste']     ={['enabled']  =true, ['requireengaged']=false,['statusid']=33,   ['spellid']=57,    ['requiremp']=40,['requiresub']='RDM',  ['target']='<me>'},
	['ice spikes'] ={['enabled'] =true,['requireengaged']=false,['statusid']=35,   ['spellid']=16,    ['requiremp']=37,['requiresub']='RDM',  ['target']='<me>'},
	['enaero']     ={['enabled'] =true, ['requireengaged']=false,['statusid']=96,   ['spellid']=110,  ['requiremp']=12,['requiresub']='RDM',  ['target']='<me>'},
}

tp_moves_count = 1
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
	if debug == true then
		texts.visible(debug_textbox, true)
	end
	
  charges_txtbox = texts.new('Charges: ${charges} ; Next Charge @${time_to_charge}')
  texts.pos(charges_txtbox, 20, 748)	
  palette_txtbox = texts.new('PetTP Palette CTRL+\nA-${pettp1}\nS-${pettp2}\nD-${pettp3}\nF-${pettp4}\nG-${pettp5}\nH-${pettp5}\nJ-${pettp5}\nK-${pettp5}' )
  texts.pos(palette_txtbox, 200, 720)	
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

auto_reward_delay = 0
function auto_reward()
	local pet_mob = windower.ffxi.get_mob_by_target('pet')
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local retVal = false
	
	if not autoreward then
		return false
	end
	
	if auto_reward_delay > 0 then
		auto_reward_delay = auto_reward_delay - 1
		return retVal
	end
	if pet_mob ~= nil and pet_mob.hpp < 40 then
		--windower.add_to_chat(2, "Pet needs curing")
	-- Checking for Healing Salve I and 2
   if has_item(item_names["Healing Salve I"]) then
		windower.send_command('input /item "Healing Salve" <me>')
		retVal = true
	 elseif has_item(item_names["Healing Salve II"]) then
			windower.send_command('input /item "Healing Salve II" <me>')
		retVal = true
	 elseif ability_recasts[103] == 0 
	        and has_item(item_names["Pet Food Theta"]) 
	        and canDoAbilities()
	        and math.sqrt(pet_mob.distance) <= reward_distance
		then
		windower.send_command('input /pet reward <me>')
		retVal = true
	 elseif has_item(item_names["Dawn Mulsum"]) then
		-- What about 5411 (dawn mulsum)?
		windower.send_command('input /item "Dawn Mulsum" <me>')
		retVal = true
		end
	end
	return retVal
end

sic_delay = 0
notified = false
function auto_sic()
	local retVal = false
	-- Use with jug pets :-)
	-- Index 255 is for ready
	local recasts = windower.ffxi.get_ability_recasts()
	local pet_mob = windower.ffxi.get_mob_by_target('pet')
	local me_mob = windower.ffxi.get_mob_by_target('me')
	local spur = ''
	local player = windower.ffxi.get_player()
	
	if notified and 
	   notified_count > 0
	   and hold_sic_for_sc and player.vitals.tp >=1000 then
		notified_count  = notified_count -1
	elseif player.status == 1 and player and hold_sic_for_sc and player.vitals.tp >=1000 then
		--windower.add_to_chat(5, "(Malthar's Pet) Holding for skillchain!")
		notified = true
		notified_count = 5
	elseif notified and player.vitals.tp >=1000 then
		-- We already notified
		notified = true
	else
		notified = false
	end
	
	if notified then return false end
	
	-- Is this a charmed pet or jug pet?
	if pet_mob and (not table.containskey(pet_tp_moves_and_cost, pet_mob.name)) then
		return false
	end
	
	if not do_auto_sic then return retVal end
	
	if recasts[45] == 0 then
		spur = 'input /pet spur <me>'
	end
	
	--debug_textbox.name="recasts['Sic']=" .. recasts['Sic']
	if me_mob ~= nil and me_mob.status == 1 and pet_mob ~= nil and pet_mob.status == 1 then
		if not get_pet_tp_move(pet_mob) then
			--windower.add_to_chat(5, "Line 277: returned type " .. tostring(get_pet_tp_move(pet_mob)) .. " for mob " .. pet_mob.name)
			return false
		elseif not pet_tp_moves_and_cost[pet_mob.name][get_pet_tp_move(pet_mob)] then
			windower.add_to_chat(5, 
			"Line 281:  returned type " 
			.. type(pet_tp_moves_and_cost[pet_mob.name][get_pet_tp_move(pet_mob)]) .. " for mob " .. pet_mob.name
			.. " ; get_pet_tp_move(pet_mob) type = " .. get_pet_tp_move(pet_mob))
			return false
		end
		local tmp_pet_tp_move = get_pet_tp_move(pet_mob)
		if tmp_pet_tp_move
--		   and pet_mob.tp >= 1000 -- TODO: Whether to wait for tp to execute tp move, or not.
		   and pet_tp_moves[pet_mob.name] and
--		recasts[job_ability_names["Sic"]] <= (180 -  pet_tp_moves_and_cost[pet_mob.name][get_pet_tp_move(pet_mob)] * 60) 
			get_number_of_charges() >= pet_tp_moves_and_cost[pet_mob.name][tmp_pet_tp_move] 
		  and math.sqrt(pet_mob.distance) <= sic_ready_distance	and canDoAbilities()
		then
			if spur ~= '' then
				spur = ' ; wait 1 ; ' .. spur
			end

			if tmp_pet_tp_move then
				-- windower.send_command('input /pet "' .. pet_tp_moves[pet_mob.name].spell  .. '" <me>' .. spur)
				windower.send_command('input /pet "' .. tmp_pet_tp_move  .. '" <me>' .. spur)
--				windower.add_to_chat(5,'Used: ' .. tmp_pet_tp_move)
				retVal = true
			end
		elseif spur ~= '' then
			windower.send_command(spur)
			retVal = true
		end
	end
	
	sic_delay = 3
	
	return retVal
end

fight_delay = 0
function auto_fight()
	local retVal = false
	
	if not autofight then 
		return retVal 
	end
	-- 100 is pet fight
	if fight_delay >0 then
		fight_delay = fight_delay - 1
		return retVal
	end
	
	local recasts = windower.ffxi.get_ability_recasts()
	local me_mob = windower.ffxi.get_mob_by_target('me')
	local pet_mob = windower.ffxi.get_mob_by_target('pet')

	if me_mob and (not pet_mob)
		 and me_mob.status == 1
	   and do_auto_call_beast
	   and pet_jug 
	   and canDoAbilities()
	then
		windower.send_command('input /equip ammo "' .. pet_jug .. '"')
		coroutine.sleep(1)
		windower.send_command('input /ja "call beast" <me>')
		retVal = true	
	elseif me_mob and pet_mob 
	   and me_mob.status == 1 and pet_mob.status ~= 1
	   and math.sqrt(pet_mob.distance) <= 15
	   and recasts[job_ability_names['Fight']] == 0 
	then
		--windower.add_to_chat(5, "Beastmaster Helper: Pet Fight! " .. tostring(pet_mob.status))
		coroutine.sleep(1)
		windower.send_command('input /pet fight <t>')
		coroutine.schedule(killer_instinct, 2)		
		retVal = true
	elseif me_mob and pet_mob 
	       and me_mob.status == 1 
	       and not (math.sqrt(pet_mob.distance) <= 15) 
	       and recasts[job_ability_names['Heel']] == 0 then
		coroutine.sleep(1)
		--windower.send_command('input /pet heel <me>')
		retVal = false
	end
	
	fight_delay = 2
	
	return retVal
end

function killer_instinct()
	local pet_mob = windower.ffxi.get_mob_by_target('pet')
	local target = windower.ffxi.get_mob_by_target('t')
	local retVal = false
	
	if not pet_mob then return false end
	if not target  then return false end
	
	if not can_pet_intimidate(target) then return false end

	-- Wait till we're not busy
--	while isbusy['isbusy'] do
--		coroutine.sleep(1)
--	end

	local job_ability_recasts = windower.ffxi.get_ability_recasts()
--	pet_mob = windower.ffxi.get_mob_by_target('pet')
	if pet_mob and job_ability_recasts[job_ability_names["Killer Instinct"]] == 0 then
		windower.send_command('input /ja "Killer Instinct" <me>')
		retVal = true
	end
	
	return retValue
end

function do_auto_abilities()
	local retVal = false
	local player = windower.ffxi.get_player()
	local recasts = windower.ffxi.get_ability_recasts()
	local engaged = nil
	
	if isbusy['isbusy'] == true or canDoAbilities() == false or player.status ~= 1 then
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
			  if abil_name ~= 'Killer Instinct' then
						if  (T{25,241}:contains(abil_info.abilityid) and runeCount()>0)
								or (abil_info.abilityid == 10 and runeCount() < 2)
								or (T{23,59}:contains(abil_info.abilityid) and runeCount() > 0)
								or (not T{25,241,10,23,59}:contains(abil_info.abilityid)) 
						then
							windower.send_command('input /ja "' .. abil_name .. '"' .. abil_info.target)
							retVal = true
							break
						end
				else
					retVal = killer_instinct()
				end
				break
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


function dosnarl()
	local retVal = false
	local job_ability_recasts = windower.ffxi.get_ability_recasts()
	
	if not do_snarl then return false end
	
	-- Wait till we're not busy
	while isbusy['isbusy'] or 
	 (job_ability_recasts[job_ability_names["Snarl"]] > 0 and
	  job_ability_recasts[job_ability_names["Snarl"]] < 5) do
		job_ability_recasts = windower.ffxi.get_ability_recasts()
		coroutine.sleep(1)
	end
	
	job_ability_recasts = windower.ffxi.get_ability_recasts()
	
	local job_ability_recasts = windower.ffxi.get_ability_recasts()
	local pet_mob = windower.ffxi.get_mob_by_target('pet')
	local player = windower.ffxi.get_player()
	local target = windower.ffxi.get_mob_by_target('t')
--	windower.add_to_chat(5, 'do_snarl=' .. tostring(do_snarl) .. 
--	                        ', pet_mob=' .. tostring(pet_mob) ..
--	                        ', job_ability_recasts[job_ability_names["Snarl"]]' .. 
--	                        tostring(job_ability_recasts[job_ability_names["Snarl"]])
--	                        )
	if do_snarl and pet_mob and player.status == 1 and target then
		if job_ability_recasts[job_ability_names["Snarl"]] == 0 then
			coroutine.sleep(1)
			windower.send_command('input /pet snarl <me>')
			retVal = true
		end
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
		charges_report()
		--pet_palette()
		if player and player.main_job == 'BST' then
			temp = isbusy['isbusy'] 
			       or (auto_shadows and auto_shadows()) 
			       or auto_reward() 
			       or do_auto_abilities()
			       or auto_fight() 
			       or auto_weaponskill() 
			       or auto_sic() 
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
	
	 if T{"autoproc", "proc", "doprocs", "auto_proc", "do_proc", "procs"}:contains(cmd) then
	 	if args[2] then
	 		if  logic[args[2]] == true then
	 			last_set_ws = weaponskill
		 		weaponskill = vw_ws
		 		windower.add_to_chat(5, "Beastmaster_Helper: Using proc auto_weaponskills")
		 	else
		 		if last_set_ws then
		 			weaponskill = last_set_ws
		 		else
		 			weaponskill = basic_ws
		 		end
		 		windower.add_to_chat(5, "Beastmaster_Helper: Using regular auto_weaponskill(s)")
		 	end
	 	end
	 elseif T{"jug", "pet_jug", "pet"}:contains(cmd) then
			local tmp_pet_jug = ""
			local tmpCount = 2
			local space = ""
			while args[tmpCount] do
				tmp_pet_jug = tmp_pet_jug .. space .. args[tmpCount]
				tmpCount = tmpCount +1
				space = " "
			end
			if string.len(tmp_pet_jug) > 0 then
				pet_jug = tmp_pet_jug
			end
			windower.add_to_chat(5, "Pet Jug: " .. pet_jug)
	 elseif T{"callbeast", "call_beast", "autocallbeast", "auto_call_beast", "docallbeast", "do_call_beast", "do_auto_call_beast", "doautocallbeast", "beast", "cb", "acb", "dcb"}:contains(cmd) then
	 	if args[2] and logic[args[2]] and logic[args[2]] == true then
	 		do_auto_call_beast = true
	 	else
	 		do_auto_call_beast = false
	 	end
	 	windower.add_to_chat(5, "Beastmaster_Helper: Auto Call Beast: " .. tostring(do_auto_call_beast))
	 elseif T{"autostun", "auto_stun", "do_auto_stun", "doautostun", "stun", "das", "as", "dostun", "dostuns", "stuns"}:contains(cmd) then
	 	if logic[args[2]] then
	 		do_auto_stun = true
	 	else
	 		do_auto_stun = false
	 	end
	 	windower.add_to_chat(5, "Auto Stun: " .. tostring(do_auto_stun))
	 elseif T{"autofight", "auto_fight", "fight", "doautofight", "do_auto_fight"}:contains(cmd) then
	 	if args[2] then
	 		if logic[args[2]] and logic[args[2]] == true then
	 			autofight = true
	 		else
	 			autofight = false
	 		end
	 	else
	 		if autofight then
	 			autofight = false
	 		else
	 			autofight = true
	 		end
	 	end
	 	windower.add_to_chat(5, "Auto Fight: " .. tostring(autofight))
	 elseif T{"autoreward", "auto_reward", "reward", "ar",}:contains(cmd) then
	 	if args[2] then
	 		if logic[args[2]] and logic[args[2]] == true then
	 			autoreward = true
	 		else
	 			autoreward = false
	 		end
	 	else
	 		if autoreward then
	 			autoreward = false
	 		else
	 			autoreward = true
	 		end
	 	end
	 	windower.add_to_chat(5, "Auto Reward: " .. tostring(autoreward))
	 elseif T{"ready", "readyrecast", "ready_recast", "readychargetime", "ready_charge_time"}:contains(cmd) then
	 	if args[2] then
	 		ready_recast = tonumber(args[2])
	 	else
	 		ready_recast = 15
	 	end
	 	windower.add_to_chat(5, "Ready Recast: " .. tostring(ready_recast))
	 elseif T{"autosic", "sic", "auto_sic", "ready", "auto_ready", "autoready"}:contains(cmd) then
	 if args[2] then 
		 	if logic[args[2]] and logic[args[2]] == true then
		 		do_auto_sic = true
		 	else
		 		do_auto_sic = false
		 	end
	 else
		if do_auto_sic then
			do_auto_sic = false
		else
			do_auto_sic = true
		end	
	 end
	 	
	 	windower.add_to_chat(5, "Beastmaster Helper: Auto Sic set to " .. tostring(do_auto_sic))
	 elseif cmd == 'check' then
	 	check_beast_chart()
	 elseif cmd == "pettp" and cmd[2] then
	 	  local pettpmove = ""
	 	  local count = 2
	 	  
	 	  while cmd[count] do
	 	  	pettpmove = pettpmove .. cmd[count]
	 	  	count = count + 1
	 	  end
	 	
	 		do_pet_tp_move(pettpmove)
	 	elseif T{"petheal", "pet_heal", "heal", "sicheal", "readyheal"}:contains(cmd) then
	 		if args[2] and logic[args[2]] and logic[args[2]] == true then
	 			heal_party = true
	 		else
	 			heal_party = false
	 		end
	 end
end)

windower.register_event("status change", function(new, old)
	if T{0,1}:contains(new) then
		curr_ws = 1
		tp_moves_count = 1
	end
end)

windower.register_event("target change", function(index)
	curr_ws = 1
	tp_moves_count = 1
	temp_moves = {}
	use_temp_moves = false
end)

windower.register_event('action', function(act)
	local player = windower.ffxi.get_player()
	local pet_mob = windower.ffxi.get_mob_by_target('pet')
	
	if     
	   true 
	   and player and player.main_job == 'BST' 
	   and pet_mob 
	   and act.actor_id == pet_mob.id 
	   and act.category == 11 
	then
--		local adjusted_abil_id = act.param + 392
--		windower.add_to_chat(5, "Pet just did action: " .. tostring(job_ability_ids[adjusted_abil_id]) .. " ; category: " .. tostring(act.category))
		if pet_tp_moves[pet_mob.name] and pet_tp_moves[pet_mob.name][tp_moves_count + 1] then
			tp_moves_count = tp_moves_count +1
		else
			tp_moves_count = 1
		end
	elseif
		true
		and player and player.main_job == 'BST'
		and act.actor_id == player.id
		and act.category == 3
	then
--		windower.add_to_chat(5, "Finished weaponskill, ID=" .. tostring(act.param))
--	 		curr_ws = curr_ws + 1
--	 		if type(weaponskill) == 'string' or curr_ws > table.length(weaponskill) then
--				curr_ws = 1
-- 		  end
	end
end)


function charges_report()
	local retVal =  false
	local player = windower.ffxi.get_player()
	local info = windower.ffxi.get_info()
	local recasts = windower.ffxi.get_ability_recasts()
	local raw_recast = ""
	
	if recasts and job_ability_names["Sic"] and recasts[job_ability_names["Sic"]] then
		raw_recast = " " .. tostring(recasts[job_ability_names["Sic"]]) .. ":"
	end
	
	if info and info.logged_in and player and report_charges and player.main_job == "BST" then
		texts.show(charges_txtbox)
		charges_txtbox.charges = tostring(get_number_of_charges())
		charges_txtbox.time_to_charge = raw_recast .. tostring(get_time_to_next_charge())
	else
		texts.hide(charges_txtbox)
	end
	
	return retVal
end

lastpet = ""
function pet_palette()
	-- Map hot keys to pet TP moves and display them onscreen
	local player = windower.ffxi.get_player()
	local pet = windower.ffxi.get_mob_by_target('pet')
	local info = windower.ffxi.get_info()
	if info and info.logged_in and player and player.main_job == "BST" and pet and pet_tp_moves_and_cost[pet.name] then
		texts.show(palette_txtbox)
		-- Bind the hotkeys
		local hotkeys={
			"a",
			"s",
			"d",
			"f",
			"g",
			"h",
			"j",
			"k",
		}
	
		if pet.name ~= lastpet then
			lastpet = pet.name
			for key, value in ipairs(hotkeys) do
				windower.send_command("unbind ^" .. value)
			end
		else
			return
		end
		local count = 1
		for move, cost in pairs(pet_tp_moves_and_cost[pet.name]) do
			if count > 8 then break end -- Can't have more than 8 pettp moves.
			palette_txtbox["pettp" .. count] = "(" .. tostring(cost) .. ")" .. move
			if bindkeys then
				windower.send_command("bind ^" .. hotkeys[count] .. " bh pettp " .. move)
			end
			count = count + 1
		end
	else
		texts.hide(palette_txtbox)
	end
end

function do_pet_tp_move(pettpmove)
	local pet = windower.ffx.get_mob_by_target('pet')
	
	if pet and pet.status == 1 then
		windower.send_command('input /pet "' .. pettpmove .. '" <me>')
	end
end

windower.register_event('job change', function(main_job_id, main_job_level, sub_job_id, sub_job_level)
	ready_recast = set_ready_recast()
end)

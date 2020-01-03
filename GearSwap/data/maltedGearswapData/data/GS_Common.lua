include('organizer-lib')
include('gearswap_resources.lua')
monster_families = include("monster_families.lua")
-- Call GetTrustGearSets() somewhere in your get_sets() function to define these.
include('Trusts.lua')
include(player.name .. '_' .. windower.ffxi.get_player().main_job .. '_SETS.lua')
include(player.main_job .. '_job_specific_rules.lua')
include('spell_specific_rules.lua')
include('jobability_specific_rules.lua')
-- Edit the below file for the obi's you have
--include("obis.lua")
include('obi_specific_rules.lua')
include('ninja_toools.lua')
include('pretarget_specific_rules.lua')
include('midcast_OBI_specific.lua')
include('create_shortcuts.lua')
include('error_checks.lua')
include('job_change.lua')
include('avatar_spells.lua')
include('special_disp.lua')
include('gearcollector.lua')
-- Woodworking crafting gear
if sets then
	--sets['Crafting'] = include('crafting.lua')
end

lock_in_precast = true -- Whether or not to lock gear when precasting. false equips in precast gear.
special_disp = false
ws_prep = true -- set from self command.  Is reset to true once a ws is used
switch_weapons = false -- Weather or not gearswap will switchout weapons (main, sub)

-- Valid states are defined in gearswap_resources
-- Note, some of these states are not valid for some jobs
battle_state = 'NORMAL'

-- Are we in precast, midcast, etc...
activity="init"

-- The weapon to quip
weapon = get_default_weapon()

-- Default hotkey(s)
send_command('bind ^g gear')
add_to_chat(5,"GS: Bound keys")
add_to_chat(5,"GS: ctrl-g : gear")

-- This one is in there especially for brd.
function pretarget(spell)
	pretarget_MA_specific(spell)
	pretarget_JA_specific(spell)
	pretarget_WS_specific(spell)
	pretarget_corsair_specific(spell)
	pretarget_pet_specific(spell)	
	
	-- For geo indi-spells
	if spell.name:startswith('Indi') 
	   and (not buffactive['Entrust']) 
	   and spell.target.raw ~= '<me>'
	then
	   change_target('<me>')
	end
end

function precast(spell)
	if      (not spell.prefix == '/item')
	    and (not T{"Maltha", "Maltana"}:contains(player.name)) 
	    and spell.en ~= "Deploy" 
	    and (midaction() or pet_midaction()) then
		add_to_chat(5, "GS: Busy")
		cancel_spell()
		return
	end
	
	-- Put together the precast set for the spell
	local precast_set = {}
	activity = "precast"
	if cast_error_checks(spell) then
		return
	end

	if spell.en ~= nil and spell.en ~= "" then
		-- Make sure you have your weapons on
		precast_set = set_combine(precast_set, sets.weapons[weapon])
		if T{'Animikii Bullet', 'Omphalos Bullet'}:contains(player.equipment.ammo) and T{"/range", "/weaponskill"}:contains(spell.prefix) then
			cancel_spell()
			send_command("input /equip ammo")
			add_to_chat(2, 'Animikii Bullet or Omphalos Bullet about to be fired.  Did you run out of ammo?')
			return
		end
		
		-- For using Crooked Cards
		local job_ability_recasts = windower.ffxi.get_ability_recasts()
		if spell.type == 'CorsairRoll'
			 and job_ability_recasts[96] == 0 
			 and spell.en ~= "Companion's Roll"
		then
			cancel_spell()
			send_command('input /ja "Crooked Cards" <me> ; wait 1.5 ; input /ja "' .. spell.en .. '" ' .. spell.target.raw)	
		end
		
		--print_set(sets.weapons[weapon])
		if
				command_prefix_key[spell.prefix] and
				sets[command_prefix_key[spell.prefix]] and
			  sets[command_prefix_key[spell.prefix]][spell.en] ~= nil then
			precast_set = build_baseset_sets('precast',sets[command_prefix_key[spell.prefix]][spell.en])
		else 
			windower.add_to_chat(2, "Precast: sets[" ..command_prefix_key[spell.prefix] .. "]['" .. spell.en .. "'] is nil")
		end
	elseif spell.prefix == "/range" then
		local ra = nil
		if sets["ra"] then ra = "ra" end
		if sets["RA"] then ra = "RA" end
		if sets["Ra"] then ra = "Ra" end
		
		if ra then
			precast_set = build_baseset_sets('precast', sets[ra])
		end
		
		-- Check for bullets
		local am = nil
		if misc and misc["ammo_s"] and misc.ammo_s["ra"] then am ="ra" end
		if misc and misc["ammo_s"] and misc.ammo_s["Ra"] then am ="Ra" end
		if misc and misc["ammo_s"] and misc.ammo_s["RA"] then am ="RA" end
		if misc and am and player.equipment.ammo ~= misc.ammo_s[am] then
			precast_set = set_combine(precast_set,S{ammo=misc.ammo_s[am]})
		end
		--add_to_chat(5, "Shooting with " .. player.equipment.ammo)
	end
	
	-- ToDo:  Handle pdt in pdt/mdt/etc sets
	if lock_in_precast and T{'BREATH', 'DT', 'PDT', 'MDT', 'HPDT', 'HMDT','ACCPDT', 'PDTACC'}:contains(battle_state) == true and
			player and player["status"] and
			sets[player.status] and sets[player.status][battle_state] and
	   sets[player.status][battle_state].PDT then		
		precast_set = set_combine(precast_set, build_baseset_sets(nil,sets[player.status][battle_state].PDT) ,sets.weapons[weapon])
--		windower.add_to_chat(2, 'Keeping PDT precast')
	elseif battle_state == 'TWILIGHT' and
	  sets[player.status][battle_state] then
		precast_set = set_combine(precast_set, build_baseset_sets(nil,sets[player.status][battle_state]),sets.weapons[weapon])
		--windower.add_to_chat(2, 'Keeping TWILIGHT')
	elseif battle_state == 'ACC' 
		-- Keep on acc gear for ws's if in acc mode
				 and sets[spell] and sets[spell][battle_state]
				 and spell.prefix == '/weaponskill' then
		precast_set = set_combine(precast_set, build_baseset_sets(nil,sets[spell][battle_state]),sets.weapons[weapon])
	end

	-- TODO: Accomodate for range
--	if spell.en ~= nil and spell.en ~= "" then
--		precast_set=precast_job_specific(spell,precast_set)
--		precast_set=precast_MA_specific(spell,precast_set)
--		precast_set=precast_JA_specific(spell,precast_set)
--		precast_set=WS_specific_obi(spell,precast_set)
--		precast_set=MA_specific_obi(spell,precast_set)
--		precast_set=JA_specific_obi(spell,precast_set)
--	end
	
	if spell.prefix ~= "/range" then precast_set = lockRange(precast_set) end
	
	-- Special dispensation for atonement
	if special_disp and special_disp_spells:contains(spell.en)
		 and command_prefix_key[spell.prefix]
		 and sets[command_prefix_key[spell.prefix]]
		 and sets[command_prefix_key[spell.prefix]][spell.en] ~= nil 
	then
		precast_set = build_baseset_sets('precast',sets[command_prefix_key[spell.prefix]][spell.en])
	end
	
	-- Kluge for bst
	if spell.prefix == '/jobability' and spell.en == 'Charm' then
		precast_set = set_combine(precast_set, sets.weapons['charm axe'])
	end
	
	final_equip(precast_set,spell)
end

function midcast(spell)
	if (not T{"Maltha", "Maltana"}:contains(player.name)) and spell.en ~= "Deploy" and pet_midaction() then
		add_to_chat(5, "GS: Busy")
		return
	end
	
	--add_to_chat(5, "spell.type=".. spell.type .. " ; spell.skill=" .. spell.skill)

	-- Put together the precast set for the spell
	local midcast_set = {}
	
	activity = "midcast"
	if cast_error_checks(spell) then
		return
	end
--	add_to_chat(5, spell.prefix .. ":" .. spell.en)
	if spell.en ~= nil and spell.en ~= "" then
		-- Make sure you have your weapons on
		midcast_set = set_combine(midcast_set, sets.weapons[weapon])
		if
			command_prefix_key[spell.prefix] and
			sets[command_prefix_key[spell.prefix]] and
			sets[command_prefix_key[spell.prefix]][spell.en] ~= nil then
			-------
			midcast_set = build_baseset_sets('midcast',sets[command_prefix_key[spell.prefix]][spell.en])
		  --add_to_chat(5, spell.en)
		else
			windower.add_to_chat(2, "Midcast: sets[" ..command_prefix_key[spell.prefix] .. "]['" .. spell.en .. "'] is nil")
		end
	elseif spell.prefix == "/range" then
		local ra = nil
		if sets["ra"] then ra = "ra" end
		if sets["RA"] then ra = "RA" end
		if sets["Ra"] then ra = "Ra" end
		
		if ra then
			midcast_set = build_baseset_sets('midcast', sets[ra])
			if battle_state == 'RACC' then
				midcast_set = build_baseset_sets('midcast', sets.Engaged.RACC)
			end
		end
	end
	
	-- Debug stuff
	--add_to_chat(2, 'Midcast battle_state:' .. battle_state)

	-- ToDo:  Handle pdt in pdt/mdt/etc sets
	if T{'BREATH', 'DT', 'PDT', 'MDT', 'HPDT', 'HMDT', "ACCPDT", "PDTACC"}:contains(battle_state) == true and
	   player and player.status and sets[player.status] and battle_state and
	   sets[player.status][battle_state] and sets[player.status][battle_state].PDT then		
		midcast_set = set_combine(midcast_set, build_baseset_sets(nil,sets[player.status][battle_state].PDT),sets.weapons[weapon])
--		windower.add_to_chat(2, 'Keeping PDT midcast')
	elseif battle_state == 'TWILIGHT' and
	  sets[player.status][battle_state] then
		midcast_set = set_combine(midcast_set, build_baseset_sets(nil,sets[player.status][battle_state]),sets.weapons[weapon])
		--windower.add_to_chat(2, 'Keeping TWILIGHT')
	elseif battle_state == 'ACC' 
		-- Keep on acc gear for ws's if in acc mode
				 and sets[spell] and sets[spell][battle_state]
				 and spell.prefix == '/weaponskill' then
		midcast_set = set_combine(midcast_set, build_baseset_sets(nil,sets[spell][battle_state]),sets.weapons[weapon])
	end
	
	if spell.en ~= nil and spell.en ~= "" then
		--midcast_set=midcast_job_specific(spell,midcast_set)
		--midcast_set=midcast_MA_specific(spell,midcast_set)
		--midcast_set=midcast_JA_specific(spell,midcast_set)
		midcast_set=WS_specific_obi(spell,midcast_set)
		midcast_set=MA_specific_obi(spell,midcast_set)
	end
	
	midcast_set = lockRange(midcast_set)
	
	-- Special dispensation for certain ws's, JA's, or spells
	if special_disp and special_disp_spells:contains(spell.en)
		 and command_prefix_key[spell.prefix]
		 and sets[command_prefix_key[spell.prefix]]
		 and sets[command_prefix_key[spell.prefix]][spell.en] ~= nil 
	then
		midcast_set = build_baseset_sets('midcast',sets[command_prefix_key[spell.prefix]][spell.en])
		midcast_set=WS_specific_obi(spell,midcast_set)
		midcast_set=MA_specific_obi(spell,midcast_set)
	end
	
	-- For pld, equip spell interuption -rate gear
	if T{'PLD'}:contains(player.main_job) 
	   and sets['spell interruption rate down'] 
	   and command_prefix_key[spell.prefix] == 'MA'
	then
	   midcast_set = set_combine(midcast_set, sets['spell interruption rate down'])
	end

-- Whether or no to wear Ferine Cassabet +2
	local tmpTarget = windower.ffxi.get_mob_by_target()
	if player.main_job == 'BST' 
	   and tmpTarget and tmpTarget.is_npc and tmpTarget.valid_target
	   and spell.prefix == "/pet" 
	   and spell["type"]   == "Monster" 
	 	 and can_pet_intimidate(tmpTarget) 
	 	 and sets.correlation
	 	 and magical_pet_tp and magical_pet_tp:contains(spell.en) == false
	then
  	midcast_set = set_combine(midcast_set, sets.correlation)
  	add_to_chat(5, "(Gearswap) Monster Correlation")
  	--print_set(midcast_set)
	end

	if player.main_job == 'BST' 
	   and tmpTarget and tmpTarget.is_npc and tmpTarget.valid_target
	   and spell.prefix == "/pet" 
	   and spell["type"]   == "Monster" 
		 and pet and pet.tp and pet.tp < 2700 and sets['pet tp bonus']
	then
		midcast_set = set_combine(midcast_set, sets['pet tp bonus'])
	end

	if spell.prefix == '/weaponskill' then
		if spell.en == 'Cloudsplitter' then
			if T{"BST","WAR"}:contains(player.main_job) then
				if player.tp >= 3000 then
					midcast_set = set_combine(midcast_set, T{right_ear="Crematio Earring"})
				end
			end			
		end
	end
	
	-- If climactic floush is active during weaponskill, equip gear that enhances
	-- crit hit damage
	if spell.prefix == '/weaponskill'
	   and player.main_job == 'DNC'
	   and buffactive['Climactic Flourish']
	   and sets['crit hit damage']
	then
		midcast_set = set_combine(midcast_set, sets['crit hit damage'])
	end

	final_equip(midcast_set,spell)
end

function aftercast_common(spell)
	if pet_midcast() then
		add_to_chat(5, "GS: Pet busy")
		return
	end
	
	local aftercast_set = {}
	
	if activity ~= "petaftercast" then
		activity = "aftercast"
	end

	-- Get Idle, Engaged, Resting set based on battle state(NORMAL, PDT, etc)
	if T{'Idle', 'Engaged', 'Resting'}:contains(player.status) then
		-- Special rule for smn's
		 -- Kludge for summoning.  If the spell completes then the avatar is out
		 local avatar_out = pet and pet.isvalid
		 
		 if spell
		    and (spell.skill == "Summoning Magic" or spell.skill == 38)
		    and (spell.interrupted == false or spell.interrupted == nil)
		 then
		 	avatar_out = true
		 end
		 
		 if spell and spell.en == "Release"
		    and (spell.interrupted == false or spell.interrupted == nil)
		 then
		 	avatar_out = false
		end

		-- Special rule for summoner
		if player.main_job == 'SMN' then
			if not avatar_out then
--add_to_chat(5, "Bolelabunga")
				weapon = "Bolelabunga"
			elseif (pet and pet.isvalid) or avatar_out then
--add_to_chat(5, "Gridarvor")
				weapon  = "Gridarvor"
				--status_change_set = set_combine(status_change_set, sets.weapons.Gridarvor)
			else
--add_to_chat(5, "Bolelabunga")
				weapon = "Bolelabunga"
				--status_change_set = set_combine(status_change_set, sets.weapons.Bolelabunga)
			end
		end
--		add_to_chat(5, tostring(sets.weapons[weapon]))
		-- Add our weapon(s)
		aftercast_set = set_combine(aftercast_set ,sets.weapons[weapon])
		if pet.isvalid and 
		   sets[player.status] and sets[player.status][battle_state] and sets[player.status][battle_state]['pet'] then
			aftercast_set = set_combine(aftercast_set ,build_baseset_sets(nil,sets[player.status][battle_state]))
--			add_to_chat(2, "Building with: sets[" .. player.status .. "][" .. battle_state .. "].pet")
			if table.length(aftercast_set) == 0 then
				windower.add_to_chat(3, 'aftercast_common (' .. tostring(debug.getinfo(1).currentline) .. '): suspiciously empty set returned in activity: ' .. activity  )
			end
		else
			aftercast_set = set_combine(aftercast_set ,build_baseset_sets(nil,sets[player.status][battle_state]))
--			add_to_chat(2, "Building with: sets[" .. player.status .. "][" .. battle_state.. "]")
			if table.length(aftercast_set) == 0 then
				windower.add_to_chat(3, 'aftercast_common (' .. tostring(debug.getinfo(1).currentline) .. '): suspiciously empty set returned in activity: ' .. activity  )
			end
		end
--print_set(aftercast_set)
		
		-- If pet is out then if the set sets.Status.AVATAR exists then equip it
		if player.main_job == 'SMN' 
--			 and ((pet and pet.isvalid) or avatar_out)
       and avatar_out
			 and sets and sets[player.status] and sets[player.status]['AVATAR'] 
			 and ((spell and spell.en ~= "Release" and spell.interrupted ~= true) or (not spell))
		then
			local avatar_state
			
			if avatar_out then
				avatar_state = "Idle"
			elseif pet and pet.status then
				avatar_state = pet.status
			end

		 	if avatar_state then
		 		aftercast_set = set_combine(aftercast_set, sets[player.status]['AVATAR'][avatar_state])
			else
				add_to_chat(5, "Gearswap: Avatar state not set: Line 269")
			end
			-- Handle gear to set based on avatar and day
		end
	
--	local temp = ""
--	local comma = ""
--	for tmpbuff, isactive in pairs(buffactive) do
--		temp = temp .. comma .. tmpbuff .. "=" .. tostring(isactive)
--		comma = ", "
--	end
--	add_to_chat(5, temp)
		-- Any gear that we have to keep on if we have a certain status effect on?
		-- sets['buff active']
		if player.status == 'Engaged' then
			aftercast_set = set_combine(aftercast_set ,equip_buffactive())
		end
	end

	-- Debug show avatar and day element
	local avatar_element = pet.element or "nil"
	local day_element = world.day_element or "nil"

--	add_to_chat(5, "avatar_element = " .. avatar_element .. " : day_element = " .. day_element)
	return aftercast_set
end

function equip_buffactive()
	local buffactive_set = T{}
	local tempbuffactive = sets['buff active']
	
	if sets['buff active'] then
		if sets['buff active'].battle_state then
			tempbuffactive = sets['buff active'].battle_state
		end
		for buff,set in pairs(tempbuffactive) do
			if type(set) == 'table' and buffactive[string.lower(buff)] then
				if not set.do_not_include then
					buffactive_set = set_combine(buffactive_set,set)					
				end
			elseif type(set) == 'string' then
				add_to_chat(5,"aftercast_common(): sets['buff active']['" ..buff.. "'] is a string and not a table.  It says: " ..set)
			end
		end			
	end

	return buffactive_set	
end

function pet_midcast(spell)
	local pet_midcast_set = {}	
	activity = 'pet_midcast'

	if spell and spell.en and sets.PET and sets.PET[spell.en] then
		if sets.PET[spell.en].pet then
			pet_midcast_set = set_combine(pet_midcast_set,
	--		                              sets.weapons[weapon], 
			                              build_baseset_sets(nil,sets.PET[spell.en].pet))
		elseif sets.PET[spell.en].pet_midcast then
			pet_midcast_set = set_combine(pet_midcast_set,
	--		                              sets.weapons[weapon], 
			                              build_baseset_sets(nil,sets.PET[spell.en].pet_midcast))
	  else 
			pet_midcast_set = set_combine(pet_midcast_set,
	--		                              sets.weapons[weapon], 
			                              build_baseset_sets(nil,sets.PET[spell.en]))
		end
	end
	
	final_equip(pet_midcast_set)
--	if player.main_job == 'BST' then
		-- If idle_in is not set put weapons in the set
--		if idle_in then
--			pet_midcast_set = set_combine(pet_midcast_set, sets.weapons['physical_ready_weapons'])
--		else
--			pet_midcast_set = set_combine(pet_midcast_set, sets.weapons[weapon])
--		end
		
--		if pet and pet.tp and sets['pet tp bonus'] then
--			pet_midcast_set = set_combine(midcast_set, sets['pet tp bonus'])
--		end
--	elseif spell and player.main_job == "PUP" then
--		print_set(pet_midcast_set)
--		equip(pet_midcast_set) -- kludge
--	elseif spell then 
--		final_equip(pet_midcast_set) 
--	elseif player.main_job == pup then
--		equip(sets["PET"]["Physical Weaponskills"])
--	end
	
end

function pet_aftercast(spell)
	aftercast_set = {}
	activity="pet_aftercast"
	
	aftercast_set=aftercast_common(spell)
	aftercast_set=set_combine(aftercast_set,aftercast_job_specific(spell,aftercast_set))
	if capacity_points then
		aftercast_set = set_combine(aftercast_set, capacity_points_set)
	end
	
	if spell then
		send_command("input /p PET: " .. spell.en)
	end

	final_equip(set_combine(aftercast_set, master_or_pet_status_change()),spell)
	--add_to_chat(5, "GS: Pet Aftercast")
end

function aftercast(spell)
	-- Kludge -- Don't execute aftercast if monster is doing a tp move
	if spell and player.main_job == 'BST' 
		 and spell.prefix == "/pet" 
		 and spell["type"]   == "Monster" 
	then
		return
	end

	if spell then
		if command_prefix_key[spell.prefix] == 'WS' then
			--send_command('input /p ' .. spell.en)
		end
	end

	aftercast_set = {}
	activity="aftercast"
	
	aftercast_set=aftercast_common(spell)
	aftercast_set=set_combine(aftercast_set,aftercast_job_specific(spell,aftercast_set))
	
	if capacity_points then
		aftercast_set = set_combine(aftercast_set, capacity_points_set)
	end

	if spell and player.main_job == 'BST' 
	   and spell.prefix == "/pet" 
	   and spell["type"]   == "Monster" 
	 	 and activity == "petaftercast"  
	 then
		-- Keep desultor tassets on till pet finishes tp move
		aftercast_set = set_combine(aftercast_set, build_baseset_sets(nil,sets.PET[spell.en]),sets.weapons[weapon])
	-- Whether or no to wear Ferine Cassabet +2
		local tmpTarget = windower.ffxi.get_mob_by_target()
		if spell and player.main_job == 'BST' 
		   and tmpTarget and tmpTarget.is_npc and tmpTarget.valid_target
		   and spell.prefix == "/pet" 
		   and spell["type"]   == "Monster" 
		 	 and can_pet_intimidate(tmpTarget) 
		 	 and sets.correlation
		then
	  	aftercast_set = set_combine(aftercast_set, sets.correlation)
	  	--print_set(midcast_set)
		end
	end
	
	-- Equip the aftercast set if the pet isn't doing a spell.  Else, the aftercast set will be equipped in pet_aftercast
	if spell and not (
			pet.isvalid 
			and avatar_spells[pet.name]
			and avatar_spells[pet.name][spell.en]
		)
	then
		final_equip(set_combine(aftercast_set,master_or_pet_status_change()),spell)
	elseif not spell then
		final_equip(set_combine(aftercast_set,master_or_pet_status_change()),spell)
	end
	--add_to_chat(5, "GS: Aftercast")
	-- Equip your zone gear
	equip_zone_gear()
end

function pet_change(pet,gain)
	--add_to_chat(5, "pet_change: " .. pet.name .. " - " .. tostring(gain))
end

function pet_status_change(new,old)
	--add_to_chat(5, "pet_status_change: new: " .. new .. " , old: " .. old)
	local equip_set = T{}
	if player.main_job == 'SMN' then
		if sets[player.status]
			 and sets[player.status]
			 and sets[player.status]["AVATAR"]
			 and sets[player.status]["AVATAR"][new]
		then
			--final_equip(sets[player.status]["AVATAR"][new])
			equip_set = sets[player.status]["AVATAR"][new]
		else
			--final_equip(sets[player.status])
			equip_set = sets[player.status]
		end
	elseif player.main_job == 'BST' then
		if sets[player.status] and sets[player.status]["pet_" .. new] then
			--final_equip(sets[player.status]["pet_" .. new])
			equip_set = sets[player.status]["pet_" .. new]
		end
	elseif player.main_job == 'PUP' then
		if sets[player.status] and sets[player.status]["pet_" .. new] then
			--final_equip(sets[player.status]["pet_" .. new])
			equip_set = sets[player.status]["pet_" .. new]
		end
	else
	
	end
	
	final_equip(set_combine(equip_set,master_or_pet_status_change(nil, new)))
end

function status_change(new,old)
	local status_change_set = T{}
	activity = "status change: " .. old .. "->" .. new
	if T{'Idle', 'Engaged', 'Resting'}:contains(new) then
		-- Special rule for summoner
		if player.main_job == 'SMN' then
			if pet and pet.isvalid then
				weapon  = "Gridarvor"
				--status_change_set = set_combine(status_change_set, sets.weapons.Gridarvor)
			else
				weapon = "Bolelabunga"
				--status_change_set = set_combine(status_change_set, sets.weapons.Bolelabunga)
			end
		end

		status_change_set = aftercast_common()
		
		--final_equip(status_change_set)
		final_equip(set_combine(status_change_set,master_or_pet_status_change(new,nil)))
	end
end


function master_or_pet_status_change(master_status,pet_status)
	local ret_set = T{}
	master_status = master_status or player.status
	pet_status = pet_status or pet.status

	if player.main_job == 'BST' then
		-- Change to movement speed if pet and master are idle
		-- And regen gear.
		-- And if idle_in is active and not glyph, idle in regen axe
		if master_status == 'Idle' 
		   and (pet_status == 'Idle' or pet_status == nil)
		   and sets.master_pet_idle
		then
			ret_set = sets.master_pet_idle
			if idle_in 
			   and idle_in ~= 'glyph'
			   and T{'NIN','DNC'}:contains(player.main_job)
			   and sets.regen_axe
			then
				ret_set = set_combine(ret_set,sets.regen_axe)
			end
		end
	elseif player.main_job == 'PUP' then
		if master_status == 'Idle' 
		   and (pet_status == 'Idle' or pet_status == nil)
		   and sets.master_pet_idle
		then
			ret_set = sets.master_pet_idle
		end
	end

	return ret_set
end

previous_weapon = nil
function buff_change(name,gain)
	if string.lower(name) == 'sleep' then
		if gain == true then
			equip(T{neck='Opo-opo Necklace'})
		else
			send_command('gear')
		end 
	elseif string.lower(name) == 'reive mark' then
		if gain == true then
			previous_weapon = weapon
			if sets["weapons"] and sets.weapons["homestead"] then
				weapon = "homestead"
				-- Wait a sec!  Are we dual wielding?
				if T{"NIN", "DNC", "THF"}:contains(player.main_job) ~= true and T{"NIN", "DNC"}:contains(player.sub_job) ~= true and
				   sets.weapons["homestead single wield"] then
					weapon = "homestead single wield"
				end
				gear_command()
			end
		else
			 if previous_weapon then
			 	  weapon = previous_weapon
			 	  gear_command()
			end
		end
	end
	
	if player.status == 'Engaged' then
		final_equip(set_combine(aftercast_common(),equip_buffactive()))	
	end
end

function final_equip(myset,spell)
	-- One place for the equip call
	local finalset = myset or T{}
	local removeKeys = {}
	local temp_weapons = T{}
	
	--add_to_chat(5, "Here: " .. activity)
	--print_set(myset)
	
	if myset then
		if switch_weapons then
			if spell and spell.prefix and
				 command_prefix_key[spell.prefix] and
				 sets[command_prefix_key[spell.prefix]] and
				 sets[command_prefix_key[spell.prefix]][spell.en] ~= nil
			then
				if activity == 'precast' and sets[command_prefix_key[spell.prefix]][spell.en].precast then
					temp_weapons = T{
						main=sets[command_prefix_key[spell.prefix]][spell.en].precast.main,
						sub =sets[command_prefix_key[spell.prefix]][spell.en].precast.sub,
					}
				elseif activity == 'midcast' and sets[command_prefix_key[spell.prefix]][spell.en].midcast then
					temp_weapons = T{
						main=sets[command_prefix_key[spell.prefix]][spell.en].midcast.main,
						sub =sets[command_prefix_key[spell.prefix]][spell.en].midcast.sub,
					}
				elseif activity == 'pet_midcast' and sets[command_prefix_key[spell.prefix]][spell.en].pet_midcast then
					temp_weapons = T{
						main=sets[command_prefix_key[spell.prefix]][spell.en].pet_midcast.main,
						sub =sets[command_prefix_key[spell.prefix]][spell.en].pet_midcast.sub,
					}
				elseif activity == 'aftercast' 
				       and spell.prefix == "/pet" 
						   and spell["type"]   == "Monster"
				then
					temp_weapons = T{
						main=sets[command_prefix_key[spell.prefix]][spell.en].pet_midcast.main,
						sub =sets[command_prefix_key[spell.prefix]][spell.en].pet_midcast.sub,
					}
				elseif activity == 'pet_aftercast' then
					temp_weapons = set_combine(myset, sets['weapons'][weapon])
				else
					temp_weapons = set_combine(myset, sets['weapons'][weapon])
				end
			end
		else
			temp_weapons = set_combine(myset, sets['weapons'][weapon])
		end
		finalset = set_combine(finalset, temp_weapons)
	end
	
	
	
--	if myset ~= nil then
	-- Are we farming capacity points?
	-- Whether or not to idle in the glyph axe
--		if player.main_job == 'BST'
--		   and pet.isvalid
--		   and T{'DNC', 'NIN'}:contains(player.sub_job)
--		   and  T{'aftercast', 'petaftercast'}:contains(activity)
--		then
			--if spell then
				--add_to_chat(5, "GS: final_equip, activity=" .. activity .. ",spell.type=" ..spell["type"])
--			end
--			if idle_in == "glyph" and sets.glyph 
--			   and (T{"aftercast", "petaftercast"}:contains(activity) 
			   --or spell==nil
--			   )
--			then
--				finalset = set_combine(finalset, sets.glyph)
--			elseif T{"pdt", "petpdt", "pet_pdt"}:contains(idle_in) and sets.weapons.petpdt 
--			       and (T{"aftercast", "petaftercast"}:contains(activity) 
			       -- or spell==nil
--			       )
--			then
--				regen_axe = master_or_pet_status_change()
--				regen_axe = regen_axe["sub"]
--				if regen_axe then
--					regen_axe = T{sub=regen_axe}
--				else
--					regen_axe = {}
--				end
--				finalset = set_combine(finalset, sets.weapons.petpdt)
--			elseif idle_in == "accuracy" then
--				finalset = set_combine(finalset, sets.weapons.petacc)
--			end
--		end
	
	
		-- Kluge for bst.  For some reason, it's not equipping our axes during precast and midcast
--		if T{"pretarget", "precast", "midcast"}:contains(activity) 
--		   and spell
--			 and player.main_job == 'BST'
--		   and spell.prefix == "/pet" 
--		   and spell["type"]   == "Monster"
--		then
--		  add_to_chat(2, activity)
--		  print_set(finalset)
--			finalset = set_combine(finalset, sets.weapons[weapon])
			-- If we're using idle_in, we're going to loose our tp anyway.  Equip the Arktoi for attack/acc
--			if idle_in and activity == "midcast" and T{"NIN", "DNC"}:contains(player.main_job) then
--				if sets.PET[spell.en] and sets.PET[spell.en].sub then
--					finalset = set_combine(finalset, T{sub=sets.PET[spell.en].sub})
--				else
--					finalset = set_combine(finalset, T{sub="Arktoi"})
--				end
--			end
--		end

		-- For redmage ja's/casting precast/midcast
--		if player.main_job == 'RDM' 
--		   and T{"precast","midcast"}:contains(activity) 
--		   and weapon ~= "staff"
--		then
--			-- Keep the current weapon on and don't use what's in the spell/ja description
--			finalset = set_combine(finalset, sets.weapons[weapon])
--		end

		-- Are we red mage and casting an enhancing spell on someone else?
--		if activity == "midcast"
--		   and player.main_job == 'RDM' 
--		   and spell["skill"] == "Enhancing Magic" 
--		   and spell.target.name ~= player.name
--		   and sets.af
--		then
--		 	finalset = set_combine(finalset, sets.af)
--		end
		
		-- Kludge again for bst spur
--		if spell and spell.name == "Spur" and idle_in == false then
--			finalset = set_combine(finalset, sets.weapons[weapon])
---		end
		
		equip(finalset)
--		print_set(finalset)
--		tmpactivity = activity or "no activity"
--		add_to_chat(5, "GS final_equip " .. tmpactivity)
--	else
		--add_to_chat(5, "Gearswap: final_equip: I'm being told to equip a nil set")
	--end
end


function gear_collector()
	-- Collects all your gear listed in sets[] and tells you what's missing.
	-- Also puts consumables in your case
	
end

function gear_command()
	local error = false
	
	if T{"Event", "Dead"}:contains(player.status) then return end
	if error or sets == nil then
		error = true
		add_to_chat(2, "gear_command(): sets is nil")
	end
	
	if error or player == nil then
		error = true
		add_to_chat(2, "gear_command(): player is nil")
	end
	
	if error or player.status == nil then
		error = true
		add_to_chat(2, "gear_command(): player.status is nil")
	end
	
	if error or battle_state == nil then
		error = true
		add_to_chat(2, "gear_command(): battle_state is nil")
	end
	
	if error or sets[player.status] == nil then
		error = true
		add_to_chat(2, "gear_command(): sets['" .. player.status .. "'] is nil")
	end

	if error or sets[player.status][battle_state] == nil then
		error = true
		add_to_chat(2, "gear_command(): sets['" .. player.status .. "']['" .. battle_state .. "'] is nil")
	end
	
	if error or weapon == nil then
		error = true
		add_to_chat(2, "gear_command(): weapon is nil")
	end
	
	if error or sets.weapons == nil then
		error = true
		add_to_chat(2, "gear_command(): sets.weapons is nil")
	end
	
	if error or sets.weapons[weapon] == nil then
		error = true
		add_to_chat(2, "gear_command(): sets.weapons[weapon] is nil")
	end
	if error == false then
		--final_equip(set_combine(build_baseset_sets(nil,sets[player.status][battle_state]),sets.weapons[weapon]))
		--aftercast_common(T{})
		aftercast()
	end
end

capacity_points = false
function self_command(strarg)
	local args = {}
	local cmd = nil
	
	-- The arguments come as a single string.  Split it up into the args table
	for arg in string.gmatch(strarg, "%S+") do
		args[#args+1] = arg
	end
	
	if table.length(args) > 0 then
		cmd = string.lower(args[1])
		
		if cmd == 'weapon' and table.length(args) > 1 then
			local weapon_name = ''
			local space = ''
			for count=2,table.length(args) do
				weapon_name = weapon_name .. space .. args[count]
				space = ' '
			end
			if table.containskey(sets.weapons, weapon_name) then
				weapon = weapon_name
				equip(sets.weapons[weapon])
				windower.add_to_chat(2, 'Switched weapon to ' .. weapon)
				autoset_beastmaster_helper(weapon)
			else
				windower.add_to_chat(3, weapon_name .. ' is an invalid value for weapon')
			end
		elseif T{'battle_state','battle_mode','mode', 'battlestate'}:contains(cmd) and table.length(args) > 1 then
			local temp_battle_state = string.upper(args[2])
			if battle_states:contains(temp_battle_state) then
				battle_state = temp_battle_state
				activity = "command: battle_state"
				if battle_state_error_checks() then
					add_to_chat(5, "Battle state error check returned an error")
					return
				end
				--final_equip(build_baseset_sets(nil,sets[player.status][battle_state]),sets.weapons[weapon])
				local temp = set_combine(build_baseset_sets(nil,sets[player.status][battle_state]),sets.weapons[weapon])
				temp = set_combine(temp, master_or_pet_status_change())

				final_equip(temp)
				windower.add_to_chat(2, 'Switched battle state to ' .. battle_state)
			else
				windower.add_to_chat(3, temp_battle_state .. ' is an invalid value for battle_state')
			end
		elseif T{'no_ws_prep', 'nowsprep', 'noprep', 'no_prep'}:contains(cmd) then
			ws_prep = false
			add_to_chat(5, "ws_prep " .. tostring(ws_prep))
		elseif T{'ws_prep', 'wsprep', 'prep'}:contains(cmd) then
			if args[2] then
				if logic[args[2]] then
					ws_prep = true
				else
					ws_prep = false
				end
			else
				ws_prep = true
			end
			add_to_chat(5, "ws_prep " .. tostring(ws_prep))
		elseif T{'equip','gear'}:contains(cmd) then
			-- Command format:
			-- gs myequip ([precast|midcast|aftercast]) {setname}
			-- If no set passes then equip equip the set for the correct state
			if not args[2] then
				gear_command()
			else
				local set_name_start_no = 2
				local cast_progress = nil
				local my_set_name = ''
				-- Any precast, midcast, aftercast specified?
				if T{'precast', 'midcast', 'aftercast'}:contains(args[2]) then
					set_name_start_no = 3
					cast_progress = args[2]
					-- Make sure the set name was specified
					if table.length(args) == 2 then
						add_to_chat(2, 'No set name specified')
						return
					end
				end
				
				-- Put together the set name
				local space = ''
				for count=set_name_start_no, table.length(args) do
					my_set_name = space .. my_set_name .. args(count)
				end
				final_equip(build_baseset_sets(cast_progress,my_set_name))
			end
		elseif T{'gc','gearcollector','gearup','collect'}:contains(cmd) then
			-- TODO: Add options to collect based on set
			gearcollector()
		elseif T{'engaged','ENGAGED'}:contains(cmd) then
			
		elseif T{'idle','IDLE'}:contains(cmd) then
			
		elseif T{"capacity", "capacity_points", "cp"}:contains(cmd) then
			if args[2] and args[2] == 'true' then
				capacity_points = true
				add_to_chat("Gear Swap: Capacity points gear enabled")
			else
				capacity_points = false
				add_to_chat("Gear Swap: Capacity points gear disabled")
			end
			--send_command('gear')
		elseif cmd == 'update' then
			final_equip(aftercast_common())
		elseif T{'glyph', 'glyphaxe' , 'glyph_axe', 'idle_in_glyph', 'idleinglyph', "idle_in", "idlein", "idle",}:contains(cmd) then
			if args[2] then
				if T{'true', 'yes', 'on', "glyph"}:contains(args[2]) then
					idle_in = "glyph"
				elseif T{"pdt", "petpdt", "pet_pdt"}:contains(args[2]) then
					idle_in = "pet_pdt"
				elseif T{"attack", "accuracy", "petattack", "petaccuracy", "acc", "att"}:contains(args[2]) then
					idle_in = "accuracy"
				else
					idle_in = false
				end
			else
				if idle_in then
					idle_in = false
				else
					idle_in = "glyph"
				end
			end
			activity = "aftercast"
			final_equip(aftercast_common())
			local temp = idle_in or "none"
			windower.add_to_chat(5, "(Gearswap) Offhand idle in " .. tostring(temp))
		elseif T{"special_disp", "specialdisp", "sd"}:contains(cmd) then
			if args[2] then
				if args[2] == "true" then
					special_disp = true
				else
					special_disp = false
				end
			else
				if special_disp then
					special_disp = false
				else
					special_disp = true
				end
			end
			windower.add_to_chat(5, "GS: special_disp = " .. tostring(special_disp))
		elseif T{"switchweapons", "switch weapons", "switch_weapons", "swapweapons", "swap weapons", "swap_weapons","swapweapon", "swap weapon", "swap_weapon",}:contains(cmd) then
			if args[2] then
				switch_weapons = logic[args[2]]
			else
				if switch_weapons then
					switch_weapons = false
				else
					switch_weapons = true
				end	
			end
			local temp = "Weapons will "
			if switch_weapons then
				temp = temp .. "be switched out."
			else
				temp = temp .. "not be switched out."
			end
			add_to_chat(5,"GS: " .. temp)
		else
			windower.add_to_chat(3, 'Invalid command: ' .. cmd)	
		end
	else
		windower.add_to_chat(3,	'No command passed')	
	end
end

--[[
function buff_change(name,gain,buff_table)
	if gain then
		add_to_chat(5, "GS: Gained " .. name .. ".")
	end
end
]]

function equip_zone_gear()
	if sets.zone_gear and sets.zone_gear[world.area] then
		equip(sets.zone_gear[world.area])
		--print("Equipped zone gear.")
	end
end

function zone_change()
	-- Wait a little bit then equip the zone's gear
	--print("Zoned to " .. world.area)
	coroutine.schedule(
				function()
					--gear_command()
				 	--equip_zone_gear()
				 	windower.send_command('gs c gear')
				 	--add_to_chat(5, "Don't forget to hit ctrl-g if your gear doesn't set")
				end, 15)
end

windower.register_event('zone change', function()
	--if zone_change and zone_gear and zone_gear[world.area] then
		zone_change()
	--end
end)

if not zone_gear then
	zone_gear = {}
end


get_sets()

if sets then
	if not sets['zone gear'] then
		sets['zone_gear'] = {}
	end
		
	sets.zone_gear['Western Adoulin'] = {
		body = "Councilor's Garb"
	}
	sets.zone_gear['Eastern Adoulin'] = {
		body = "Councilor's Garb"
	}
end

function autoset_beastmaster_helper(weapon)
	local set_ready = "bh ready 10"
	local set_amws = "bh amws Primal Rend"
	local set_dws = "bh dws Calamity"
	
	if player.main_job ~= 'BST' then return end
	
	-- For handling Guttler and Aymur and Farsha weapons
	if string.contains(string.lower(weapon), "guttler") 
		 or string.contains(string.lower(weapon), "aymur") 
		 or string.contains(string.lower(weapon), "farsha")
	then
		if string.contains(string.lower(weapon), "guttler") then
			set_amws = 'bh amws Onslaught' 
			set_dws = 'bh dws Onslaught'      
		elseif string.contains(string.lower(weapon), "aymur") then
			set_amws = 'bh amws "Primal Rend"' 
			set_dws = 'bh dws Calamity'      
		elseif string.contains(string.lower(weapon), "farsha") then
			set_amws = 'bh amws Cloudsplitter' 
			set_dws = 'bh dws Calamity'      
		end
		
		if T{"NIN", "DNC"}:contains(player.sub_job) then
			if string.contains(string.lower(weapon), "charmer's merlin") 
				 or T{"guttler","aymur","farsha"}:contains(string.lower(weapon))
			then
				set_ready = "bh ready 10"
			else
				set_ready = "bh ready 15"
			end
		else
			set_ready = "bh ready 15"
		end

	end
		
		send_command(set_ready)			
		send_command(set_amws)			
		send_command(set_dws)			
end
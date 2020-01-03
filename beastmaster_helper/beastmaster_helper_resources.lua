function set_ready_recast()
	local player = windower.ffxi.get_player()
	if player and player.main_job == 'BST' and T{"DNC","NIN"}:contains(player.sub_job) then
		return 10
	else
		return 15
	end
end

require("pet_ready_functions")

-- ( ) means to do the enclosing moves, till the next target
ibukis_default_move = "Molting Plumage"
pet_tp_moves = {
	["AttentiveIbuki"]  = {ibukis_next_move },
	["SwoopingZhivago"] = {ibukis_next_move},
	["WarlikePatrick"]  = {"Blockhead", "Tail Blow", "Brain Crush", "Tail Blow"   },
--	["WarlikePatrick"]  = {"Fireball"   },
	["BrainyWaluis"]    = {'Queasyshroom'},
	["DroopyDortwin"]   = {dortwinsnextmove },
	["PonderingPeter"]  = {dortwinsnextmove },
	["CaringKiyomaro"]  =  {"Zealous Snort", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge",},
--	["VivaciousVickie"]  = {"Zealous Snort", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge",},
	["VivaciousVickie"]  = {"Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge", "Sweeping Gouge",},
	["AmiableRoche"]    = {"Recoil Dive"},
	["HurlerPercival"]  = {"Rhino Guard", "Power Attack", "Power Attack", "Power Attack"},
	["GenerousArthur"]  = {"Corrosive Ooze"},
	["ThreestarLynn"]   = {"Noisome Powder", "Sudden Lunge", "Sudden Lunge"},
	["BlackbeardRandy"] = {"Razor Fang"},
	["RedolentCandi"]   = {"Tickling Tendrils"},
	["AlluringHoney"]   = {"Tickling Tendrils"},
	["ScissorlegXerin"] = {"Tegmina Buffet"},
	["BouncingBertha"]  = {"Sensilla Blades", "Tegmina Buffet",},
	["RhymingShizuna"]  = {"Sheep Charge", "Lamb Chop"},
	["FluffyBredo"]     = {"Pestilent Plume", "Foul Waters"},
	["FleetReinhard"]   = {"Scythe Tail", "Ripper Fang", "Ripper Fang", "Ripper Fang"},
	["MosquitoFamilia"] = {"Infected Leech",},
	["Left-HandedYoko"] = {"Infected Leech",},
	["SubmergedIyo"]    = {"Beak Lunge",},
}							

vw_ws = {
	'Raging Axe',
	'Smash Axe',
	'Gale Axe',
	'Avalanche Axe',
	'Spinning Axe',
	'Rampage',
	'Calamity',
	'Mistral Axe',
	'Decimation',
	"Bora Axe"
}

function needs_healing() 
	local palyer = windower.ffxi.get_player()
	if player and player.vitals and player.vitals.hpp <= 75 then
		return true
	else
		return false
	end
end

function needs_tp()
	local player = windower.ffxi.get_player()
	if player and player.vitals.tp <= 500 then
		return true
	else
		return false
	end
end

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false,
	['on'] = true,
	['off'] = false,
	['enabled'] = true,
	['disabled'] = false
}

pet_tp_moves_and_cost = {
['AttentiveIbuki'] = {
	["Molting Plumage"] = 1,
	["Swooping Frenzy"] = 2,
	["Pentapeck"]       = 3,},
["SwoopingZhivago"]= {
	["Molting Plumage"] = 1,
	["Swooping Frenzy"] = 2,
	["Pentapeck"]       = 3,},
['WarlikePatrick'] = {
	["Blockhead"]        = 1,
	["Secretion"]        = 1,
	["Fireball"]        = 1,
	["Tail Blow"]       = 1,
	["Brain Crush"]     = 1,
	["Infrasonics"]     = 2},
['BrainyWaluis'] = {
	['FrogKick']   = 1,
	['Spore']      = 1,
	['Queasyshroom']= 2,
	['Numbshroom'] = 2,
	['Shakeshroom']= 2,
	['Silence Gas']= 3,
	['Dark Spore']= 3},
["DroopyDortwin"] = {
	["Whirl Claws"] = 1,
	["Dustcloud"]   = 1,
	["Foot Kick"]   = 1,
	["Wild Carrot"] = 2},
["PonderingPeter"] = {
	["Whirl Claws"] = 1,
	["Dustcloud"]   = 1,
	["Foot Kick"]   = 1,
	["Wild Carrot"] = 2},
["CaringKiyomaro"] = {
	["Sweeping Gouge"] = 1,
	["Zealous Snort"]  = 3},
["VivaciousVickie"] = {
	["Sweeping Gouge"] = 1,
	["Zealous Snort"]  = 3},
["AmiableRoche"] = {
	["Intimidate"]  = 2,
	["Recoil Dive"] = 1,
	["Water Wall"]  = 3},
["HurlerPercival"]= {
	["Power Attack"]    = 1,
	["High-Freq Field"] = 2,
	["Rhino Attack"]    = 1,
	["Rhino Guard"]     = 2,
	["Spoil"]           = 1,},
["GenerousArthur"] = {
	["Purulent Ooze"]   = 2,
	["Corrosive Ooze"]  =3},
["ThreestarLynn"] = {
	["Sudden Lunge"]   = 1,
	["Spiral Spin"]   = 1,
	["Noisome Powder"]  =2},
["BlackbeardRandy"] = {
	["Roar"] = 2,
	["Razor Fang"] = 1,
	["Claw Cyclone"] = 1
},
["RedolentCandi"] = {
	["Tickling Tendrils"] = 1,
	["Stink Bomb"] = 2,
	["Nectarous Deluge"] = 2,
	["Nepenthic Plunge"] = 2,
},
["AlluringHoney"] = {
	["Tickling Tendrils"] = 1,
	["Stink Bomb"] = 2,
	["Nectarous Deluge"] = 2,
	["Nepenthic Plunge"] = 2,
},
["ScissorlegXerin"] = {
	["Sensilla Blades"] = 1,
	["Tegmina Buffet"] = 2,
},
["BouncingBertha"] = {
	["Sensilla Blades"] = 1,
	["Tegmina Buffet"] = 2,
},
["RhymingShizuna"] = {
	["Lamb Chop"] = 1,
	["Rage"] = 2,
	["Sheep Charge"] = 1,
	["Sheep Song"] = 2,
},
["FluffyBredo"] = {
	["Foul Waters"] = 2,
	["Pestilent Plume"] = 2,
},
["FleetReinhard"] = {
	["Scythe Tail"] = 1,
	["Ripper Fang"] = 1,
	["Chomp Rush"] = 3,
},
["MosquitoFamilia"] = {
	["Infected Leech"] = 1,
	["Gloom Spray"] = 2,
},
["Left-HandedYoko"] = {
	["Infected Leech"] = 1,
	["Gloom Spray"] = 2,
},
["SubmergedIyo"] = {
	["Wing Slap"] = 2,
	["Beak Lunge"] = 1,
},
}							

function canDoAbilities()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {2,10,16,19,28,14,17,261}
	
	for key, id in pairs(blocking) do
		if table.contains(player.buffs, id) == true then
			retVal = false
		end
	end
	
	return retVal
end

function get_equipped()
	local my_inventory = windower.ffxi.get_items(0)
	local my_equipped = {}
	
	
	if my_inventory then
		for item_index, item_info in pairs(my_inventory) do
			if item_info.status == 5 then
				my_equipped[string.lower(string.gsub(slots[item_info.slot].english, " ", "_"))] = item_info.id
			end
		end
	end
	
	return my_equipped
end

function canDoSpells()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {6,29,7,2,19,14,17,10,262}

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

beast_strength = {
	["Amorphs"]="Birds",
	["Aquans"]="Amorphs",
	["Birds"]="Aquans",
	["Beasts"]="Lizards",
	["Lizards"]="Vermin",
	["Vermin"]="Plantoids",
	["Plantoids"]="Beasts",	
	["Demons"]="Dragons",
	["Dragons"]="Demons",
}

function check_beast_chart()
	local retVal = ""
	local errmsg = ""
	local pet    = windower.ffxi.get_mob_by_target("pet")
	local target = windower.ffxi.get_mob_by_target("t")
	
	if not pet then
		errmsg = errmsg .. "pet is not defined.  "
	elseif not target then
		errmsg = errmsg .. "target is not defined.  "
	elseif not beast_strength then
		errmsg = errmsg .. "beast_strength is not defined.  "
	elseif not monster_families then
		errmsg = errmsg .. "monster_families is not defined.  "
	elseif not monster_families[pet.name]  then
		errmsg = errmsg .. "monster_families[pet.name] : monster_families[" .. pet.name .. "] is not defined"
	elseif not beast_strength[monster_families[pet.name]] then
		errmsg = errmsg .. 
		         "beast_strength[monster_families[pet.name]] : pet.name = " .. pet.name ..
		         "monster_families[pet.name] = " .. monster_families[pet.name]
	end
	
	if errmsg == "" then
		-- windower.add_to_chat(5, "Pet intimidates = " .. beast_strength[monster_families[pet.name]])
		-- windower.add_to_chat(5, "Target family is = " .. monster_families[target.name])
		if can_pet_intimidate(target) then
			windower.add_to_chat(5, "(beastmaster_helper): " .. 
															pet.name .. 
			                        "(" .. monster_families[pet.name] .. ") intimidates " .. 
			                        target.name ..
			                        "(" .. monster_families[target.name] .. ")")
		else
			windower.add_to_chat(5, "(beastmaster_helper): " 
			                        .. pet.name .. "(" .. monster_families[pet.name] 
			                        .. ") does not intimidate " 
			                        .. target.name 
			                        .."(" .. monster_families[target.name] .. ")"
			                    )
		end
	else
		windower.add_to_chat(5, "(beastmaster_helper): check_beast_chart() error: " .. errmsg)
	end
	
	return retVal
end

function can_pet_intimidate(target)
	local retVal = false
	local pet = windower.ffxi.get_mob_by_target("pet")
	
	--windower.add_to_chat(5,pet_families[pet.name] .. "~" ..monster_families[target.name])
	
	if target and pet
	   and type(target) == 'table'
	   and target.name
	   and monster_families[pet.name]
	   and monster_families[target.name]
		 and beast_strength[monster_families[pet.name]] == monster_families[target.name]
	then
		retVal = true
	end
	
	return retVal
end



tp_moves_count = 1
temp_moves = {}
use_temp_moves = false
function get_pet_tp_move(pet_mob)
	local retVal = nil
	if pet_mob then
		local tp_moves = pet_tp_moves[pet_mob.name]
		if tp_moves then
			if type(tp_moves[tp_moves_count]) == 'function' then
				retVal = (tp_moves[tp_moves_count])()
			else
				retVal = tp_moves[tp_moves_count]
			end
		end
	end
--	windower.add_to_chat(5, "Retval is of type: " .. type(retVal))
	return retVal
end

function get_number_of_charges()
	-- There's a bug in gearswap where the tp delay isn't applied when the proper gear is engaged
	-- So we lower (make it more time) the charge time by 10
	local retVal = -1
	local recasts = windower.ffxi.get_ability_recasts()
	if recasts and job_ability_names["Sic"] and recasts[job_ability_names["Sic"]] then
		if recasts[job_ability_names["Sic"]] == 0 then
			retVal = 3
		elseif recasts[job_ability_names["Sic"]] <= ready_recast then
			retVal = 2
		elseif recasts[job_ability_names["Sic"]] <= (ready_recast * 2) then
			retVal = 1
		else
			retVal = 0	
		end
	end

	return retVal
end

function get_time_to_next_charge()
	local retVal = -1
	
	local recasts = windower.ffxi.get_ability_recasts()
	
	if recasts and job_ability_names["Sic"] and recasts[job_ability_names["Sic"]] then
		if recasts[job_ability_names["Sic"]] > 0 then
			retVal = (recasts[job_ability_names["Sic"]] % ready_recast)
		else
			retVal = 0
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

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false,
	['on'] = true,
	['off'] = false,
	['y'] = true,
	['n'] = false,
}

ul_blue_spells = {
"Thunderbolt",
"Harden Shell",
"Absolute Terror",
"Gates of Hades",
"Tourbillion",
"Pyric Bulwark",
"Bilgestorm",
"Bloodrake",
"Droning Whirlwind",
"Carcharian Verve",
"Blistering Roar",
"Crashing Thunder",
"Polar Roar",
"Mighty Guard",
"Cruel Joke",
"Cesspool",
"Tearing Gust",
}

valid_keys = {main,sub,range,ammo,head,neck,left_ear,right_ear,body,hands,left_ring,right_ring,back,waist,legs,feet}
battle_states = T{"NORMAL", "ACC", "PDT", "MDT", "HPDT", "HMDT", "DT", "TWILIGHT", 'COUNTER', 'REFRESH', 'REGEN',"TH8","TH",
                  "PET", "PETPDT", "MASTERMDT", "PETMDT", "PETEVA", "PETEVASION", "HYBRIDMASTERPETPDT", "MASTERACC", 
                  "PETPDTMASTERPDT", "MASTERPDTPETPDT",
                  "PETACC", "PETACCMASTERACC", "MASTERACCPETACC", 
                  "PETHASTE", "PETDA","PETPDTMASTERACC",
                  "PETMAB", "PETTANK",
                  "RACC", "RATT", "STP", "DW", "DA", "LEARNING", "ENMITY", "ACCPDT", "ACCMDT", "PDTACC", "MDTACC",
                  "EVASION",
                  "DEATH",
                  "RESISTSTUN",
                  "CRIT","CRITHITRATE","CRITHITDAMAGE"
                 }
                 
-- Define battle states as macros
for key, state in pairs(battle_states) do
	send_command('alias ' .. string.lower(state) .. ' lua c gs c mode ' .. string.lower(state))
end

capacity_points_set = {back="Mecistopins mantle"}

macro_book = T{
	['WAR']=1,
	['MNK']=2,
	['WHM']=3,
	['BLM']=4,
	['RDM']=5,
	['THF']=6,
	['PLD']=7,
	['DRK']=8,
	['BST']=9,
	['BRD']=10,
	['RNG']=11,
	['SAM']=15,
	['NIN']=13,
	['DRG']=14,
	['SMN']=12,
	['BLU']=16,
	['COR']=17,
	['PUP']=18,
	['DNC']=19,
	['SCH']=20,
	['GEO']=20,
	['RUN']=20,
	['MON']=20
}
macro_set = T{
	['WAR']=1,
	['MNK']=1,
	['WHM']=1,
	['BLM']=1,
	['RDM']=1,
	['THF']=1,
	['PLD']=1,
	['DRK']=1,
	['BST']=1,
	['BRD']=1,
	['RNG']=1,
	['SAM']=1,
	['NIN']=1,
	['DRG']=1,
	['SMN']=1,
	['BLU']=1,
	['COR']=1,
	['PUP']=1,
	['DNC']=1,
	['SCH']=1,
	['GEO']=10,
	['RUN']=8,
	['MON']=5
}

send_command('input /macro book ' .. macro_book[player.main_job] .. ' ; ' ..
             'wait 1 ; ' ..
             'input /macro set '  .. macro_set[player.main_job])

command_prefix_key = {
	['/magic']='MA',
	['/song']='MA',
	['/ninjutsu']='MA',
	['/jobability']='JA',
	['/weaponskill']='WS',
	['/range']='RA',
	['/trust']='MA',
	['/pet']='PET',
  ['/item']='ITEM'
}

	default_weapons = T{
		['Default'] = T{
			['WAR']='great axe',
			['MNK']='spharai',
			['WHM']='staff',
			['BLM']='staff',
			['RDM']='swords',
			['THF']='dagger',
			['PLD']='aegis',
			['DRK']='scythe',
			['BST']='axes',
			['BRD']='dagger',
			['RNG']='gun',
			['SAM']='great katana',
			['NIN']='katanas',
			['DRG']='polearm',
			['SMN']='staff',
			['BLU']='swords',
			['COR']='sword',
			['PUP']='h2h',
			['DNC']='dagger',
			['SCH']='staff',
			['GEO']='staff',
			['RUN']='great sword',
			['MON']=''
		},
		['Malthar'] = T{
		
		},
		['Maltha'] = T{
		
		}
	}

buffing_songs = T{
	"Army's Paeon",
	"Army's Paeon II",
	"Army's Paeon III",
	"Army's Paeon IV",
	"Army's Paeon V",
	"Army's Paeon VI",
	"Mage's Ballad",
	"Mage's Ballad II",
	"Mage's Ballad III",
	"Knight's Minne",
	"Knight's Minne II",
	"Knight's Minne III",
	"Knight's Minne IV",
	"Knight's Minne V",
	"Valor Minuet",
	"Valor Minuet II",
	"Valor Minuet III",
	"Valor Minuet IV",
	"Valor Minuet V",
	"Sword Madrigal",
	"Blade Madrigal",
	"Hunter's Prelude",
	"Archer's Prelude",
	"Sheepfoe Mambo",
	"Dragonfoe Mambo",
	"Fowl Aubade",
	"Herb Pastoral",
	"Shining Fantasia",
	"Scop's Operetta",
	"Puppet Operetta",
	"Gold Capriccio",
	"Wardng Round",
	"Goblin Gavotte",
	"Advancing March",
	"Victory March",
	"Sinewy Etude",
	"Dextrous Etude",
	"Vivacious Etude",
	"Quick Etude",
	"Learned Etude",
	"Spirited Etude",
	"Enchanting Etude",
	"Herculean Etude",
	"Uncanny Etude",
	"Vital Etude",
	"Swift Etude",
	"Sage Etude",
	"Logical Etude",
	"Bewitching Etude",
	"Fire Carol",
	"Ice Carol",
	"Wind Carol",
	"Earth Carol",
	"Lightning Carol",
	"Water Carol",
	"Light Carol",
	"Dark Carol",
	"Fire Carol II",
	"Ice Carol II",
	"Wind Carol II",
	"Earth Carol II",
	"Lightning Carol II",
	"Water Carol II",
	"Light Carol II",
	"Dark Carol II",
	"Goddess's Humnus",
	"Chocobo Mazurka",
	"Raptor Mazurka",
	"Sentinel's Scherzo"
}

weaponskills = {
['H2H']={'Combo', 'Shoulder Tackle', 'One Inch Punch', 'Backhand Blow', 'Raging Fists',
         'Spinning Attack', 'Howling Fist', 'Dragon Kick', 'Asuran Fists', "Ascetic's Fury",
         "Tornado Kick", "Victory Smite", "Shijin Spiral", "Final Heaven"}
}

pet_moves = T{
"Foot Kick",
"Dust Cloud",
"Whirl Claws",
"Head Butt",
"Dream Flower",
"Wild Oats",
"Leaf Dagger",
"Scream",
"Roar",
"Razor Fang",
"Claw Cyclone",
"Tail Blow",
"Fireball",
"Blockhead",
"Brain Crush",
"Infrasonics",
"Secretion",
"Lamb Chop",
"Rage",
"Sheep Charge",
"Sheep Song",
"Bubble Shower",
"Bubble Curtain",
"Big Scissors",
"Scissor Guard",
"Metallic Body",
"Needleshot",
"1000 Needles",
"Frogkick",
"Spore",
"Queasyshroom",
"Numbshroom",
"Shakeshroom",
"Silence Gas",
"Dark Spore",
"Power Attack",
"Hi-Freq Field",
"Rhino Attack",
"Rhino Guard",
"Spoil",
"Cursed Sphere",
"Venom",
"Sandblast",
"Sandpit",
"Venom Spray",
"Mandibular Bite",
"Soporific",
"Gloeosuccus",
"Palsy Pollen",
"Geist Wall",
"Numbing Noise",
"Nimble Snap",
"Cyclotail",
"Toxic Spit",
"Double Claw",
"Grapple",
"Spinning Top",
"Filamented Hold",
"Chaotic Eye",
"Blaster",
"Suction",
"Drainkiss",
"Snow Cloud",
"Wild Carrot",
"Sudden Lunge",
"Spiral Spin",
"Noisome Powder",
"Acid Mist",
"TP Drainkiss",
"Scythe Tail",
"Ripper Fang",
"Chomp Rush",
"Charged Whisker",
"Purulent Ooze",
"Corrosive Ooze",
"Back Heel",
"Jettatura",
"Choke Breath",
"Fantod",
"Tortoise Stomp",
"Harden Shell",
"Aqua Breath",
"Wing Slap",
"Beak Lunge",
"Intimidate",
"Recoil Dive",
"Water Wall",
"Sensilla Blades",
"Tegmina Buffet",
"Molting Plumage",
"Swooping Frenzy",
"Sweeping Gouge",
"Zealous Snort",
"Pentapeck",
}

precast='precast'
midcast='midcast'
aftercast='aftercast'
weapon='weapon'

-- Check to see if the set passed has at least one valid keys
function hasValidSetKey(set)
	local retVal = false
	
	for key,value in pairs(valid_keys) do
		if table.contains(set,key) then
			retVal = true
			break
		end
	end

	return retVal
end

function isValidKey(key)
	if table.contains(valid_keys, key) then
		return true
	else
		return false
	end
end

function build_settype_sets(set_type,set)
	--add_to_chat(2, "BEGIN:           build_baseset_sets:        BEGIN")
	-- Put's together the set_types(precast|midcast|aftercast)
	local retVal = {}

	-- Verify that nil or the correct set_type was passed
	if set_type == nil or T{'precast', 'midcast', 'aftercast'}:contains(set_type) == false then
		-- Invalid set_type
		add_to_chat(4, 'build_baseset_sets: invalid set_type')
		return retVal
	end

	if type(set) ~= 'table' or
	   (set['baseset'] and type(set['baseset']) ~= 'table') or 
	   (set[set_type]  and type(set[set_type]) ~= 'table') then
	   	local tmp_set_type = type(set)
	   	local tmp_set_type_type = type(set[set_type])
		add_to_chat(4,'Oops! set, baseset, or ' .. tmp_set_type .. ' is not a table.  It says, set="' .. 
		tmp_set_type_type .. '" and set[set_type]="' .. tmp_set_type_type .. '".  Check your set definitions for your spell.')
		return retVal
	end

	if set[set_type] then
		-- Error check: set[set_type] cannot have precast,midcast,aftercast,or basesets in it.
		local st_has_tables = false
		for key, value in pairs(set[set_type]) do
			if T{'precast','midcast','aftercast','baseset'}:contains(key) then
				st_has_tables = true
				add_to_chat(2, "Error set['" ..set_type.. "'] contains a precast|midcast|aftercast|baseset table.")
			end
		end
		
		if st_has_tables then
			return T{error="Non string types found in table."}
		end
		
		-- Default retVal is set.settype
		retVal = set[set_type]
		
		--add_to_chat(2, "build_settype_sets: Found set['" .. set_type .. "'] and it contains:")
		--print_set(set[set_type])
		-- look through baseset and basesets for set_type
		if set['basesets'] then
			for key, basesets_set in ipairs(set['basesets']) do
				retVal = set_combine(build_settype_sets(set_type,basesets_set),retVal)
			end			
		end
		
		
		if set['baseset'] then
			--add_to_chat(2,"Looking throgh basesets.  Baseset contains:")
			--print_set(set.baseset)
			retVal = set_combine(build_settype_sets(set_type,set.baseset),retVal)
		end
	else
		-- Couldn't find set_type
		
		-- Check basesets
		if set['basesets'] then
			for key, basesets_set in ipairs(set['basesets']) do
				retVal = set_combine(build_settype_sets(set_type,basesets_set),retVal)
			end			
		end
		
		-- Check baseset
		if set['baseset'] then
			retVal = set_combine(build_settype_sets(set_type,set.baseset), retVal)
		end
	end

	return retVal	
end

-- set_type is precast, midcast, or after cast
-- If set_type is nil, then merge the values in set
function build_baseset_sets(set_type,set)
	local retSet = T{}
	local set_type_set = T{}
	
	
	-- Return retSet if passed a nil set
	if set == nil then
		windower.add_to_chat(3, 'build_baseset_sets (' .. tostring(debug.getinfo(1).currentline) .. '): set is nil in activity: ' .. activity  )
		return T{}
	end
	
	-- Verify that nil or the correct set_type was passed
	if set_type ~= nil and T{'precast', 'midcast', 'aftercast'}:contains(set_type) == nil then
		-- Invalid set_type
		windower.add_to_chat(4, 'build_baseset_sets (' .. tostring(debug.getinfo(1).currentline) .. '): invalid set_type')
		return set
	end
	
	if type(set) ~= 'table' then
		add_to_chat(4,'Oops! set is of type ' .. type(set) .. ' and not a table.  It says, "' .. set .. '".  Check your set definitions for your spell.')
		return T{}
	end
	
	if set['basesets'] and type(set.basesets) ~= 'table' then
		add_to_chat(4, 'Oops!  set.basesets is not a table.  It is of type ' .. type(set.basesets))
		return T{}
	end

	-- Should we build the set_type?
	-- Only the first iteration calls this.  The following iterations will pass nil ass the set_type
	if set_type then
		--add_to_chat(2,'Using this set to start')
		--print_set(set)
		set_type_set = build_settype_sets(set_type,set)
		--add_to_chat(2,'build_baseset_sets: set_type_set is of type: ' .. type(set_type_set))
		--if set_type_set then
			--add_to_chat(2, "set_type_set is:")
			--print_set(set_type_set)
		--end
	end
	
	-- The default retSet is the set passed
	retSet = set

	-- Now that we potentially built the set_type, let's build the set and and it's basesets
	
	-- Any basesets or basesets?  baseset will take precedence over any basesets
	-- Basesets are a numerated array
	if set['basesets'] then
		for key, basesets_set in ipairs(set['basesets']) do
			if basesets_set == nil then
				windower.add_to_chat(3, 'build_baseset_sets (' .. tostring(debug.getinfo(1).currentline) .. '): Found a nil set in basesets in activity: ' .. activity  )
				return T{}
			end
			-- Iterative call with set_type as nil
			retSet = set_combine(build_baseset_sets(nil,basesets_set),retSet)
		end
	end
	
	if set['baseset'] then
		-- Iterative call with set_type as nil
		retSet = set_combine(build_baseset_sets(nil,set.baseset),retSet)
	end
	
	-- Now combine the set_type and set
	retSet = set_combine(retSet, set_type_set)

	return retSet
end

function merge_tables(tab1,tab2)
	-- Merge tab 2 into tab1.
	local retVal = tab1
	
	if type(tab1) ~= 'table' and type(tab2) ~= 'table' then
		add_to_chat(2,'merge_tables: Both arguments have to be tables')
		return nil
	end
	
	for key,value in pairs(tab2) do
		retVal[key] = value
	end
	
	return retVal
end

function get_default_weapon()
	local retVal
	
	retVal = default_weapons['Default']
	
	if default_weapons:contains(player.name) then
		retVal = merge_tables(retVal,default_weapons[player.name][player.main_job])
	else
		retVal = default_weapons['Default'][player.main_job]
	end
	
	return retVal
end	

local step_level = {[381]=1,[382]=2,[383]=3,[384]=4,[385]=5,[588]=6}
function count_finishing_moves()
	local player = windower.ffxi.get_player()
	local moveCount = 0
	
	for key, value in pairs(player.buffs) do
		if T{381,382,383,384,385,588}:contains(value) then
			moveCount = step_level[value]
			break
		end
	end
	

	return moveCount	
end

function canPresto()
	local retVal = false
	local ability_recasts = windower.ffxi.get_ability_recasts()
	
	if ability_recasts[236] == 0 then
		retVal = true
	end
	
	return retVal
end

function can_jig()
	local retVal = false
	local ability_recasts = windower.ffxi.get_ability_recasts()
	
	if ability_recasts[218] == 0 then
		retVal = true
	end
	
	return retVal
end

-- If engaged and the chosen weapon has something set in the range slot, then
-- Keep that weapon in the range slot and prevent anythnig from overwriting it.
function lockRange(set)
	local retSet = set
	
	if player.status == 1 then
		-- Main and sub will be locked by default.
		-- Check range to see if it needs to be locked
		retSet = set_combine(retSet, T{set.weapons[weapon].main, set.weapons[weapon].sub})
		if set.weapons[weapon].range and set.weapons[weapon] ~= "" then
			retSet = set_combine(retSet, T{set.weapons[weapon].range})
		end
		
	end
	
	return retSet
end

beast_strength = {
	["Amorphs"]="Birds",
	["Aquans"]="Amorphs",
	["Birds"]="Aquans",
	["Beasts"]="Lizards",
	["Lizards"]="Vermin",
	["Vermin"]="Plantoids",
	["Plantoids"]="Beasts",	
}

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

function get_equipment()
	-- Returns a set with the currently equipped gear
	return {
		main			=player.equpment.main,
		sub				=player.equpment.sub,
		range			=player.equpment.range,
		ammo			=player.equpment.ammo,
		head			=player.equpment.head,
		neck			=player.equpment.neck,
		left_ear	=player.equpment.left_ear,
		right_ear	=player.equpment.right_ear,
		body			=player.equpment.body,
		hands			=player.equpment.hands,
		left_ring	=player.equpment.left_ring,
		right_ring=player.equpment.right_ring,
		back			=player.equpment.back,
		waist			=player.equpment.waist,
		legs			=player.equpment.legs,
		feet			=player.equpment.feet,
	}
end
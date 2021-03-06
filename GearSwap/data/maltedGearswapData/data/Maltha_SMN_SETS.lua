function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')

	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets["weapons"]["Gridarvor"] = {
		main="Gridarvor",
		sub="Vox grip",
		ammo="Seraphicaller",
	}
	
	sets["weapons"]["Bolelabunga"] = {
		main="Bolelabunga",
		sub="Genbu's Shield",
    ammo="Seraphicaller",
	}

	sets.weapons["staff"]  = sets.weapons.Gridarvor
		
	sets['Idle'] = {
    head="Con. Horn +1",
    body="Hagondes Coat +1",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Caller's Pendant",
    waist="Fucho-no-Obi",
    left_ear="Handler's Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
	}
	
	sets['Engaged'] = {
    head="Con. Horn +1",
    body="Hagondes Coat +1",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Caller's Pendant",
    waist="Fucho-no-Obi",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
	}
	
	sets.Idle['AVATAR'] = {
    ammo="Seraphicaller",
    head="Convoker's Horn +1",
    body="Glyphic Doublet +1",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes sabots",
    neck="Caller's Pendant",
    waist="Moepapa Stone",
    left_ear="Handler's Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring="Evoker's ring",
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
	}
	
	sets.Idle.AVATAR["Idle"] = {
    head="Convoker's Horn +1",
    body="Glyphic Doublet +1",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes sabots",
    neck="Caller's Pendant",
    waist="Moepapa Stone",
    left_ear="Handler's Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring="Evoker's ring",
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
    ["Avatars"] = {
    	["Diabolos"] = {
    		waist="Diabolos's Rope",
    	}
    }
	}
	
	sets.Idle.AVATAR["Engaged"] = {
    head="Convoker's Horn +1",
    body="Glyphic Doublet +1",
    hands="Serpentes Cuffs",
    legs="Convoker's spats +1",
    feet="Serpentes sabots",
    neck="Caller's Pendant",
    waist="Moepapa Stone",
    left_ear="Rimeice Earring",
    right_ear="Rimeice Earring",
    left_ring="Evoker's ring",
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
    back="Repulse Mantle",
    ["Avatars"] = {
    	["Diabolos"] = {
    		waist="Diabolos's Rope",
    	}
    }
	}
	
	
	sets.Engaged['AVATAR'] = {
    head="Convoker's Horn +1",
    body="Glyphic Doublet +1",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes sabots",
    neck="Caller's Pendant",
    waist="Moepapa Stone",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
	}
	
	sets.Engaged.AVATAR["Idle"] = sets.Idle.AVATAR.Idle
	
	sets.Engaged.AVATAR["Engaged"] = {
		baseset=sets.Engaged.AVATAR,
    head="Caller's Horn +2",
    body="Glyphic Doublet +1",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Assid. Pants +1",
    feet="Con. Pigaches +1",
    neck="Caller's Pendant",
    waist="Moepapa Stone",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    left_ring="Rajas Ring",
    right_ring="Woltaris Ring",
    back="Samanisi Cape",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting

	sets.Idle['PET'] = {
	
	}
	
	sets.Engaged['PET'] = {
	
	}
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
		PDT={
		
		}
		
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.PDT,
	}
	
	sets.Idle['MDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['MDT'] = {
		baseset=tempEngagedset,
	}
	
	sets.Idle['HMDT'] = {
		baseset=sets.Idle.MDT,
		PDT={
		
		}
		
		
	}
	
	sets.Engaged['HMDT'] = {
		baseset=sets.Engaged.MDT,
	}
	
	-- Depending on day and avatar out, this gear is equipped when idle or engaged
	sets['avatar_day'] = {
		hands="Caller's bracers +1",
	}
	
	sets['summoning'] = {
    main="Soulscourge",
    sub="Vox Grip",
    ammo="Seraphicaller",
    head="Con. Horn +1",
    body="Call. Doublet +2",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
		left_ring="Evoker's Ring",
    legs="Mdk. Shalwar +1",
    neck="Caller's Pendant",
		left_ring="evoker's ring",
    right_ring="Globidonta Ring",
    back="Conveyance Cape",
	}
	
	sets['blood boon'] = {
			left_ear="Gifted earring",
			waist="Diabolos's Rope"
	}
	
	sets['bp damage'] = {
		body="Convoker's doublet +1",
--		body="Caller's doublet +2",
		legs="Ngen seraweels",
		feet="Convoker's pigaches +1"
	}
	
	sets['avatar mab'] = {
		main="Frazil Staff",
    head={ name="Glyphic Horn", augments={'Enhances "Astral Flow" effect',}},
		neck="Eidolon Pendant +1",
    hands="Nares Cuffs",
    waist="Caller's Sash",
    back="Tiresias' Cape",
	}
	
	sets['avatar attack'] = {
		feet="Glyphic Pigaches +1"
	}
	
	sets['avatar acc'] = {
		hands="Glyphic bracers",
		back="Samanisi cape",
		legs="Convoker's spats +1",
	}
	
	sets['avatar macc'] = {
		main="Frazil Staff",
		back="Samanisi cape",
		legs="Glyphic spats",
		feet="Caller's pigaches +1",
	}
	
	sets['avatar tp-bonus'] = {
		legs = "Caller's Spats +2"
	}
	
	sets['bp abil delay'] = {
		precast={
	    head="Con. Horn +1",
	    body="Glyphic Doublet +1",
	    hands="Con. Bracers +1",
	    legs="Glyphic Spats",
	    feet="Glyphic Pigaches +1",
	    back="Samanisi Cape",
	   }
	}
	
	sets['bp common'] = {
		basesets = {sets['bp abil delay'],},
		sets['summoning'],
	}
	
	sets['bp magical'] = {
		precast={
	    head="Con. Horn +1",
	    body="Glyphic Doublet +1",
	    hands="Con. Bracers +1",
	    legs="Glyphic Spats",
	    feet="Glyphic Pigaches +1",
	    back="Samanisi Cape",
			left_ear="Gifted earring",
			waist="Diabolos's Rope"
	  },
    main="Frazil Staff",
    sub="Vox Grip",
    ammo="Seraphicaller",
    head={ name="Glyphic Horn", augments={'Enhances "Astral Flow" effect',}},
--    body="Con. Doublet +1",
		body="Shomonjijoe",
    hands="Nares Cuffs",
    legs={ name="Helios Spats", augments={'Pet: Mag. Acc.+22','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
--    legs="Ngen Seraweels",
    feet="Con. Pigaches +1",
--    neck="Caller's Pendant",
		neck="Eidolon Pendant +1",
    waist="Caller's Sash",
    left_ring="Evoker's Ring",
    right_ring="Globidonta Ring",
    back="Tiresias' Cape",
	}

	sets['bp physical'] = {
		precast={
	    head="Con. Horn +1",
	    body="Glyphic Doublet +1",
	    hands="Con. Bracers +1",
	    legs="Glyphic Spats",
	    feet="Glyphic Pigaches +1",
	    back="Samanisi Cape",
			left_ear="Gifted earring",
			waist="Diabolos's Rope"
	  },
    main="Gridarvor",
    sub="Vox Grip",
    ammo="Seraphicaller",
    head="Caller's Horn +2",
    body="Con. Doublet +1",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Helios Spats", augments={'Pet: Mag. Acc.+22','Pet: "Dbl. Atk."+8','Blood Pact Dmg.+7',}},
--    legs="Ngen Seraweels",
    feet="Con. Pigaches +1",
    neck="Caller's Pendant",
    left_ring="Evoker's Ring",
    right_ring="Globidonta Ring",
    back="Conveyance Cape",
	}
	
	sets['bp buff'] = {
 		precast={
	    head="Con. Horn +1",
	    body="Glyphic Doublet +1",
	    hands="Con. Bracers +1",
	    legs="Glyphic Spats",
	    feet="Glyphic Pigaches +1",
	    back="Samanisi Cape",
			left_ear="Gifted earring",
			waist="Diabolos's Rope"
	  },
   main="Soulscourge",
    sub="Vox Grip",
    ammo="Seraphicaller",
    head="Con. Horn +1",
    body="Call. Doublet +2",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs="Caller's Spats +2",
    neck="Caller's Pendant",
    left_ring="Evoker's Ring",
    right_ring="Globidonta Ring",
    back="Conveyance Cape",
	}
	
	sets['bp debuff'] = {
		precast={
	    head="Con. Horn +1",
	    body="Glyphic Doublet +1",
	    hands="Con. Bracers +1",
	    legs="Glyphic Spats",
	    feet="Glyphic Pigaches +1",
	    back="Samanisi Cape",
			left_ear="Gifted earring",
			waist="Diabolos's Rope"
	  },
    main="Frazil Staff",
    sub="Vox Grip",
    ammo="Seraphicaller",
    head="Con. Horn +1",
    body="Call. Doublet +2",
    hands={ name="Glyphic Bracers", augments={'Inc. Sp. "Blood Pact" magic burst dmg.',}},
    legs={ name="Glyphic Spats", augments={'Increases Sp. "Blood Pact" accuracy',}},
    feet="Caller's Pgch. +1",
    neck="Caller's Pendant",
    left_ring="Evoker's Ring",
    right_ring="Globidonta Ring",
    back="Samanisi Cape",
	}
	
	sets['fast cast'] = {
		precast={
	    head="Nahtirah Hat",
	    body={ name="Dalmatica", augments={'Occ. quickens spellcasting +1%','"Fast Cast"+4','Mag. Acc.+5',}},
	    hands="Magavan Mitts",
	    legs="Orvail Pants",
	    feet="Chelona Boots",
	    waist="Witful Belt",
	    left_ear="Loquac. Earring",
	    right_ring="Prolix Ring",
	    back="Swith Cape",
		}
	}
	
	sets["wsd"] = {
	
	}
	
	sets["wsa"] = {
	
	}
	
	sets["ws common"] = {
	
	}
	
	sets['WS'] = {}
	
	-- mnd/str
	sets.WS["Retribution"] = {
    head="Sukeroku Hachi.",
    body="Hagondes Coat +1",
    hands="Yaoyotl Gloves",
    legs="Assid. Pants +1",
    feet="Umbani Boots",
    neck="Asperity Necklace",
    waist="Windbuffet Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    back="Refraction Cape",
	}

	sets.WS["Spirit Taker"] = {
    head="Sukeroku Hachi.",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','Pet: Accuracy+24 Pet: Rng. Acc.+24',}},
    hands="Yaoyotl Gloves",
    legs="Assid. Pants +1",
    feet="Umbani Boots",
    neck="Asperity Necklace",
    waist="Windbuffet Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Solemn Ring",
    back="Refraction Cape",
	}
	
	sets.WS["Garland of Bliss"] = {
    head="Nahtirah Hat",
    body={ name="Bokwus Robe", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
    hands="Yaoyotl Gloves",
    legs="Assid. Pants +1",
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Friomisi Earring",
    right_ear="Novio Earring",
    back="Refraction Cape",
	}
	
	-- Magic
	sets['MA'] = {}

	sets["summoning_common"] = {
		basesets={sets["fast cast"], sets.summoning,},
	}


	sets["spirit_common"] = {
		baseset = sets["summoning_common"],
		legs="Glyphic Spats",
	}
	
	sets.MA["Fire Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Ice Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Ice Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Air Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Earth Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Water Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Light Spirit"] = {
		baseset = sets.spirit_common,
	}

	sets.MA["Dark Spirit"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Carbuncle"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Fenrir"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Ifrit"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Titan"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Leviathan"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Garuda"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Shiva"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Ramuh"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Diabolos"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Odin"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Alexander"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Cait Sith"] = {
		baseset = sets["summoning_common"],
	}

	sets.MA["Atomos"] = {
		baseset = sets["summoning_common"],
	}
	
	sets["twilight"] = {
		back="Twilight Cloak",
	}
	
	sets["mnd"] = {
    sub="Achaq Grip",
    head="Nahtirah Hat",
    neck="Promise Badge",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','Pet: Accuracy+24 Pet: Rng. Acc.+24',}},
    hands="Yaoyotl Gloves",
    legs="Assid. Pants +1",
    feet="Manabyss Pigaches",
    waist="Demonry Sash",
    left_ear="Lifestorm Earring",
    left_ring="Solemn Ring",
    right_ring="Perception Ring",
    back="Refraction Cape",
	}
	
	sets["cure potency"] = {
    main="Chatoyant Staff",
    body={ name="Facio Bliaut", augments={'Spell interruption rate down -1%','"Cure" potency +11%','Enmity-1',}},
    hands="Serpentes Cuffs",
    legs="Nares Trews",
    feet="Serpentes Sabots",
	}
	
	sets["healing"] = {
		basesets={sets["cure potency"]},
		sub="Curatio grip",
		neck="Inquisitor's chain",
	}
	
	sets["cure casting time"] =  {
		basesets={sets["fast cast"]}
	}
	
	sets["cure"] = {
		basesets={sets["cure casting time"], sets.mnd, sets.healing},
	}
	
	sets["enhancing"] = {
		precast={waist="Siegel Sash"},
		sub="Fulcio grip",
		neck="Enhancing torque",
		hands="Ayao's gages",
	}
	
	sets["enfeebling"] = {
		sub="Mephitis grip",
		hands="Ayao's gages",
	}
	
	sets["macc"] = {
    main="Lehbrailg +2",
    sub="Mephitis Grip",
    head="Nahtirah Hat",
    body="Nares Saio",
    hands="Lurid Mitts",
    legs="Bokwus Slops",
    feet="Artsieq Boots",
    neck="Eddy Necklace",
    waist="Demonry Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    right_ring="Perception Ring",
    back="Refraction Cape",
	}
	
	sets["dark magic"] = {
	
	}
	
	sets["mab"] = {
		-- TODO: Set rules for Twilight Cape
    main="Lehbrailg +2",
    sub="Elder's Grip",
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','Pet: Accuracy+24 Pet: Rng. Acc.+24',}},
    hands="Otomi Gloves",
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Acumen Ring",
    back="Searing Cape",
	}
	
	sets["mdmg"] = {
	
	}
	
	-- Kludge -- Add all rdm sub spells and assign the cast cast set to them
	local rdm_spells = {
		"Cure", "Cure II", "Cure III", "Cure IV",
		"Raise",
		"Protect", "Protect II", "Protect III", "Shell", "Shell II", "Shell III",
		"Blink", "Stoneskin", "Aquaveil", "Phalanx", "Haste",
		"Barfire", "Barblizzard", "Baraero", "Barstone", "Barthunder", "Barwater",
		"Barsleep", "Barpoison", "Barparalyze", "Barblind", "Barsilence", "Barpetrify", "Barvirus",
		"Enfire", "Enblizzard", "Enaero", "Enstone", "Enthunder", "Enwater",
		"Refresh",
		"Invisible", "Sneak", "Deodorize",
		"Dia", "Dia II", "Diaga",
		"Slow", "Paralyze", "Silence",
		"Fire", 
		"Blizzard", 
		"Aero", "Aero II",
		"Stone", "Stone II",
		"Thunder",
		"Water", "Water II",
		"Ice SPikes",
		"Poison", "Poison II",
		"Sleep", "Sleep II",
		"Blind", "Bind", "Dispel", "Gravity",
		"Bio", "Bio II"
	}
	
	for _, tmpspell in pairs(rdm_spells) do
		if string.startswith(tmpspell, "Cure") then
			sets.MA[tmpspell] = {basesets={sets.cure}}
		elseif T{"Protect", "Shell", "Blink", "Aquaveil", "Phalanx", "Blink",
		         "Enfire", "Enstone", "Enwater", "Enwind", "Enblizzard", "Enthunder", 
		         "Barfire", "Barstone", "Barwater", "Baraero", "Barblizzard", "Barthunder", 
		         "Barsleep", "Barpoison", "Barparalyze", "Barblind", "Barsilence", "Barpetrify", "Barvirus", "Ice Spikes"
		        }:contains(tmpspell)
		then
			sets.MA[tmpspell] = {basesets={sets["fast cast"], sets.enhancing}}
		elseif T{"Slow", "Paralyze", "Silence",
		         "Poison", "Poison II",
						 "Sleep", "Sleep II",
						 "Blind", "Bind", "Dispel", "Gravity",
						}:contains(tmpspell) 
		then
			sets.MA[tmpspell] = {basesets={sets["fast cast"], sets.enfeebling, sets.macc}}
		elseif T{"Fire",    "Stone",    "Water",    "Aero",    "Blizzard", "Thunder",
		         "Fire II", "Stone II", "Water II", "Aero II",
		        }:contains(tmpspell)
		then
			sets.MA[tmpspell] = {basesets={sets["fast cast"], sets.macc, sets.mab},feet="Uk'uxkaj Boots"}
		elseif tmpspell == "Stoneskin" then
			sets.MA[tmpspell] = {basesets={sets["fast cast"], sets.enhacing, sets.mnd},{waist="Siegel Sash"}}
		else
			sets.MA[tmpspell] = {basesets={sets["fast cast"]}}
		end
	end

	-- For impact
	sets.MA["Impact"] = {
		basesets={
			sets["fast cast"],
			sets.macc, sets.mab,
			{precast={head="", body="Twilight Cloak"}, head="", body="Twilight Cloak"}
		}
	}

	sets["JA"] = {}
	
	sets.JA["Astral Flow"] = {
		head="Glyphic horn"
	}
	
	sets.JA["Elemental Siphon"] = {
		baseset=sets.summoning,
		feet="Caller's pigaches +1"
	}

	sets.JA["Mana Cede"] = {
		hands="Caller's Bracers +1"
	}

	sets.JA["Astral Conduit"] = {
	
	}

	sets.JA["Apogee"] = {
	
	}
	
	sets["PET"] = {}
	
	sets.PET["Assault"] = {
	
	}

	sets.PET["Retreat"] = {
	
	}

	sets.PET["Release"] = {
	
	}

	sets.PET["Avatar's Favor"] = {
		head="Caller's horn +2"
	}
	
	-- Bloodpacts
	sets.PET["Inferno"] = {
		baseset=sets["bp magical"]
	}
	sets.PET["Punch"] = {
		baseset=sets["bp physical"]
	}


	sets.PET["Fire II"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Burning Strike"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Double Punch"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Fire IV"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Flaming Crush"] = {
		baseset=sets["bp magical"],
		right_ring="Fervor Ring",
	}

	sets.PET["Meteor Strike"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Conflag Strike"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Crimson Howl"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Inferno Howl"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Earthen Fury"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Rock Throw"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Stone II"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Rock Buster"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Megalith Throw"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Stone IV"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Mountain Buster"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Geocrush"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Crag Throw"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Earthen Ward"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Earthen Armor"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Tidal Wave"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Barracuda Dive"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Water II"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Tail Whip"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Water IV"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Spinning Dive"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Grand Fall"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Spring Water"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Slowga"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Tidal Roar"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Soothing Current"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Aerial Blast"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Claw"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Aero II"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Aero IV"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Predator Claws"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Wind Blade"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Whispering Wind"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Hastega"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Aerial Armor"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Fleet Wind"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Hastega II"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Diamond Dust"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Axe Kick"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Blizzard II"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Double Slap"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Blizzard IV"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Rush"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Heavenly Strike"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Frost Armor"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Sleepga"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Diamond Storm"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Crystal Blessing"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Judgment Bolt"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Shock Strike"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Thunder II"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Thunderspark"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Thunder IV"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Chaotic Strike"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Thunderstorm"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Volt Strike"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Rolling Thunder"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Lightning Armor"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Shock Squall"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Ruinous Omen"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Camisado"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Nether Blast"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Night Terror"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Somnolence"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Nightmare"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Ultimate Terror"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Noctoshield"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Dream Shroud"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Pavor Nocturnus"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Altana's Favor"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Regal Scratch"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Level ? Holy"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Mewing Lullaby"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Eerie Eye"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Raise II"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Reraise II"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Searing Light"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Poison Nails"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Meteorite"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Holy Mist"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Healing Ruby"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Shining Ruby"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Glittering Ruby"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Healing Ruby"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Soothing Ruby"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Pacifying Ruby"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Howling Moon"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Moonlit Charge"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Cresent Fang"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Eclipse Bite"] = {
		baseset=sets["bp physical"]
	}

	sets.PET["Lunar Bay"] = {
		baseset=sets["bp magical"]
	}

	sets.PET["Lunar Cry"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Lunar Roar"] = {
		baseset=sets["bp debuff"]
	}

	sets.PET["Ecliptic Growl"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Ecliptic Howl"] = {
		baseset=sets["bp buff"]
	}

	sets.PET["Heavenward Howl"] = {
		baseset=sets["bp buff"]
	}


	sets.PET["Impact"] = {
		baseset=sets["bp magical"]
	}


	-- RDM sub
	sets.JA["Convert"] = {
	
	}

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
	sets['buff active']['Astral Flow']= {
		head="Glyphic horn"
	}
	
	sets['buff active']["Avatar's Favor"] = {
		head="Caller's horn +2"
	}
end
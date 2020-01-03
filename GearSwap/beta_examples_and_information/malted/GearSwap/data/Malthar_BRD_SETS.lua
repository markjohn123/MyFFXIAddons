function get_sets()
	local baseset = 'baseset'
	local pdt     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'

	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')

	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets.weapons["dagger"]  = {
		main="Mandau", 
		sub="Genbu's shield", 
		range='Gjallarhorn'
	}
	
	sets.weapons["staff"] = {
		main="Terra's Staff",
		sub="Mephistis Grip",
		range='Gjallarhorn'
	}
	
	sets.weapons['pdtstaff'] = sets.weapons.staff
	
	sets['Idle'] = {
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body={ name="Bokwus Robe", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
    hands="Serpentes Cuffs",
    legs="Nares Trews",
    feet="Aoidos' Cothrn. +2",
    neck="Twilight Torque",
    waist="Demonry Sash",
    left_ear="Loquac. Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    back="Repulse Mantle",
	}

	sets['Engaged'] = {
    head="Nahtirah Hat",
    body="Brioso Just.",
    legs="Byakko's Haidate",
    feet="Wrathwing Nails",
    neck="Asperity Necklace",
    waist="Phasmida Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="K'ayres Ring",
    back="Repulse Mantle",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
		baseset=sets.weapons.pdtstaff,
		head="Nahtirah Hat",
		neck="Twilight Torque",
		left_ear="Loquac. Earring",
		right_ear="Moonshade Earring",
		body="Bokwus Roobe",
		hands="Bokwus Gloves",
		left_ring="Dark Ring",
		right_ring="Dark Ring",
		back="Repulse Mantle",
		waist="Demonry Sash",
    legs="Nares Trews",
    feet="Aoidos' Cothrn. +2",
	}
	sets.Engaged['PDT'] = sets.Idle.PDT

	sets.Idle['HPDT'] = sets.Idle.PDT
	
	sets.Engaged['HPDT'] = sets.Idle.PDT
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = sets.Idle.PDT
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Idle.PDT
	
	sets['mnd'] = {
    head="Nahtirah Hat",
    feet="Suzaku's Sune-Ate",
    neck="Promise Badge",
    waist="Demonry Sash",
    left_ring="Solemn Ring",
    right_ring="Sirona's Ring",
	}
	
	sets['WS'] = {}
	
	sets['JA'] = {}
	
	sets.JA['Soul Voice'] = {
		legs="Brd. Cannions +2"
	}
	
	sets.JA['Nightingale'] = {
		legs="Brd. Slippers +2"
	}

	sets.JA['Troubadour'] = {
		body="Bihu Justaucorps"
	}
	
	sets.JA['Pianissimo'] = {
	
	}

	sets.JA['Tenuto'] = {
	
	}

	sets.JA['Marcato'] = {
	
	}

	sets.JA['Clarion Call'] = {
	
	}

	-- White Mage sub

	sets.JA['Divine Seal'] = {
	
	}
	-- Dancer sub
	
	sets.dancer = {
	}
	
	sets.JA['Drain Samba'] = {
		baseset=sets.dancer
	}

	sets.JA['Drain Samba II'] = {
		baseset=sets.dancer
	}

	sets.JA['Aspir Samba'] = {
		baseset=sets.dancer
	}

	sets['waltz'] = {
		baseset=sets.dancer
	}

	sets.JA['Curing Waltz'] = {
		baseset=sets.waltz
	}

	sets.JA['Curing Waltz II'] = {
		baseset=sets.waltz
	}

	sets.JA['Curing Waltz III'] = {
		baseset=sets.waltz
	}

	sets.JA['Healing Waltz'] = {
		baseset=sets.dancer
	}

	sets.JA['Divine Waltz'] = {
		baseset=sets.waltz
	}

	sets.JA['Spectral Jig'] = {
		baseset=sets.dancer
	}

	sets['steps'] = {
		baseset=sets.dancer,
		right_ear="Choleria Earring"
	}

	sets.JA['Quickstep'] = {
		baseset=sets.steps
	}

	sets.JA['Box Step'] = {
		baseset=sets.steps
	}

	sets.JA['Stutter Step'] = {
		baseset=sets.steps
	}
	
	sets['flourishes'] = {
		baseset=sets.dancer
	}
	
	sets.JA['Animated Flourish'] = {
		baseset=sets.flourishes
	}
	
	sets.JA['Violent Flourish'] = {
		baseset=sets.flourishes
	}
	
	sets.JA['Reverse Flourish'] = {
		baseset=sets.flourishes
	}
	
	-- Magic
	sets['fast cast'] = {
		precast={
	    head="Nahtirah Hat",
	    body={ name="Dalmatica", augments={'Occ. quickens spellcasting +1%','"Fast Cast"+4','Mag. Acc.+5',}},
	    hands="Gendewitha Gages",
	    left_ring="Prolix Ring",
	    legs="Orvail Pants",
	    feet="Chelona Boots",
	    waist="Witful Belt",
	    left_ear="Loquac. Earring",
	    back="Swith Cape"
	   }
	}

	sets['macc'] = {
    main="Mandau",
    head="Nahtirah Hat",
    body="Brioso Just.",
    hands="Magavan Mitts",
    legs="Aoidos' Rhing. +2",
    feet="Artsieq Boots",
    neck="Stoicheion Medal",
    waist="Demonry Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    right_ring="Omega Ring",
    back="Refraction Cape",
	}

	sets['song fast cast'] = {
		baseset=sets["fast cast"],
		precast={
			head="Aoidos' Calot +2",
			body="Sha'ir manteel"
		}
	}

	sets['song cast'] = {
		baseset=sets['song fast cast'],
		range="Gjallarhorn",
    head="Aoidos' Calot +2",
    body="Aoidos' Hngrln. +2",
    hands="Ad. Mnchtte. +2",
    legs="Mdk. Shalwar +1",
    feet="Brioso Slippers +1",
    neck="Aoidos' Matinee",
    waist="Aristo Belt",
    left_ear="Loquac. Earring",
    right_ear="Aoidos' Earring",
    left_ring="Nereid Ring",
    right_ring="Nereid Ring",
    back="Jester's Cape +1",
	}

	sets['song duration'] = {
		baseset=sets['song cast'],
		main="Legato Dagger",
		sub="Genbu's Shield",
		neck="Aoidos' Matinee",
		legs="Mdk. Shalwar +1",
		feet="Brioso Slippers +1"
	}
	
	sets['buff cast'] = {
		baseset=sets['song duration'],
	}
	
	sets['debuff cast'] = {
		baseset = sets['song cast'],
		main="Mandau",
		sub="Genbu's Shield",
    head="Nahtirah Hat",
    body="Brioso Just.",
    hands="Magavan Mitts",
    legs="Aoidos' Rhing. +2",
    feet="Artsieq Boots",
    neck="Stoicheion Medal",
    waist="Demonry Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    right_ring="Omega Ring",
    back="Refraction Cape",
	}
	
	sets['MA'] = {}

	sets['requiem'] = {
		baseset=sets['debuff cast']
	}
	sets.MA['Foe Requiem'] = sets.requiem
	sets.MA['Foe Requiem II'] = sets.requiem
	sets.MA['Foe Requiem III'] = sets.requiem
	sets.MA['Foe Requiem IV'] = sets.requiem
	sets.MA['Foe Requiem V'] = sets.requiem
	sets.MA['Foe Requiem VI'] = sets.requiem
	sets.MA['Foe Requiem VII'] = sets.requiem
	
	sets['lullaby'] = {
		baseset=sets['debuff cast']
	}
	sets.MA['Foe Lullaby'] = sets.lullaby
	sets.MA['Foe Lullaby II'] = sets.lullaby
	sets.MA['Horde Lullaby'] = sets.lullaby
	sets.MA['Horde Lullaby II'] = sets.lullaby
	
	sets['paeon'] = {
		precast=sets['fast cast'],
		range="Daurdabla",
    head="Nahtirah Hat",
    body={ name="Dalmatica", augments={'Occ. quickens spellcasting +1%','"Fast Cast"+4','Mag. Acc.+5',}},
    hands="Magavan Mitts",
    legs="Orvail Pants",
    feet="Chelona Boots",
    neck="Twilight Torque",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    right_ear="Aoidos' Earring",
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    back="Swith Cape",
	}
	sets.MA["Army's Paeon"] = sets.paeon
	sets.MA["Army's Paeon II"] = sets['fast cast']
	sets.MA["Army's Paeon III"] = sets['fast cast']
	sets.MA["Army's Paeon IV"] = sets['fast cast']
	sets.MA["Army's Paeon V"] = sets['fast cast']
	sets.MA["Army's Paeon VI"] = sets['fast cast']
	
	
	sets['ballad'] = {
		baseset=sets['buff cast'],
		legs="Aoidos' Rhing. +2"
	}
	sets.MA["Mage's Ballad"] = sets['ballad']
	sets.MA["Mage's Ballad II"] = sets['ballad']
	sets.MA["Mage's Ballad III"] = sets['ballad']
	
	sets['minne'] = {
		baseset=sets['buff cast'],
	}
	sets.MA["Knight's Minne"] = sets.minne
	sets.MA["Knight's Minne II"] = sets.minne
	sets.MA["Knight's Minne III"] = sets.minne
	sets.MA["Knight's Minne IV"] = sets.minne
	sets.MA["Knight's Minne V"] = sets.minne
	
	sets['minuet'] = {
		baseset=sets['buff cast'],
		body="Aoidos' Hngrln. +2"
	}
	sets.MA["Valor Minuet"] = sets['minuet']
	sets.MA["Valor Minuet II"] = sets['minuet']
	sets.MA["Valor Minuet III"] = sets['minuet']
	sets.MA["Valor Minuet IV"] = sets['minuet']
	sets.MA["Valor Minuet V"] = sets['minuet']
	
	sets['madrigal'] = {
		baseset=sets['buff cast'],
		head="Aoidos' Calot +2"
	}
	sets.MA["Sword Madrigal"] = sets.madrigal
	sets.MA["Blade Madrigal"] = sets.madrigal
	
	sets['prelude'] = {
		baseset=sets['buff cast']
	}
	sets.MA["Hunter's Prelude"] = sets.prelude
	sets.MA["Archer's Prelude"] = sets.prelude

	sets['mambo'] = {
		baseset=sets['buff cast']
	}
	sets.MA["Sheepfoe Mambo"] = sets.mambo
	sets.MA["Dragonfoe Mambo"] = sets.mambo
	
	sets['debuff resistance'] = {
		baseset=sets['buff cast']
	}
	sets.MA["Fowl Aubade"] = sets['debuff resistance']
	sets.MA["Herb Pastoral"] = sets['debuff resistance']
	sets.MA["Shining Fantasia"] = sets['debuff resistance']
	sets.MA["Scop's Operetta"] = sets['debuff resistance']
	sets.MA["Puppet's Operetta"] = sets['debuff resistance']
	sets.MA["Gold Capriccio"] = sets['debuff resistance']
	sets.MA["Warding Round"] = sets['debuff resistance']
	sets.MA["Goblin Gavotte"] = sets['debuff resistance']
	
	sets['march'] = {
		baseset=sets['buff cast'],
		legs="Ad. Mnchtte. +2"
	}
	sets.MA["Advancing March"] = sets.march
	sets.MA["Victory March"] = sets.march
	
	sets['elegy'] = {
		baseset=sets['debuff cast']	
	}
	sets.MA["Battlefield Elegy"] = sets.elegy
	sets.MA["Carnage Elegy"] = sets.elegy
	
	sets['etude'] = {
		baseset=sets['buff cast']	
	}
	sets.MA["Sinewy Etude"] = sets.etude
	sets.MA["Dextrous Etude"] = sets.etude
	sets.MA["Vivacious Etude"] = sets.etude
	sets.MA["Quick Etude"] = sets.etude
	sets.MA["Learned Etude"] = sets.etude
	sets.MA["Spirited Etude"] = sets.etude
	sets.MA["Enchanting Etude"] = sets.etude
	sets.MA["Herculean Etude"] = sets.etude
	sets.MA["Uncanny Etude"] = sets.etude
	sets.MA["Vital Etude"] = sets.etude
	sets.MA["Swift Etude"] = sets.etude
	sets.MA["Sage Etude"] = sets.etude
	sets.MA["Logical Etude"] = sets.etude
	sets.MA["Bewitching Etude"] = sets.etude
		
	sets['carol'] = {
		baseset=sets['buff cast']	
	}
	sets.MA["Fire Carol"] = sets.carol
	sets.MA["Ice Carol"] = sets.carol
	sets.MA["Wind Carol"] = sets.carol
	sets.MA["Earth Carol"] = sets.carol
	sets.MA["Lightning Carol"] = sets.carol
	sets.MA["Water Carol"] = sets.carol
	sets.MA["Light Carol"] = sets.carol
	sets.MA["Dark Carol"] = sets.carol
	sets.MA["Fire Carol II"] = sets.carol
	sets.MA["Ice Carol II"] = sets.carol
	sets.MA["Wind Carol II"] = sets.carol
	sets.MA["Earth Carol II"] = sets.carol
	sets.MA["Lightning Carol II"] = sets.carol
	sets.MA["Water Carol II"] = sets.carol
	sets.MA["Light Carol II"] = sets.carol
	sets.MA["Dark Carol II"] = sets.carol
	
	sets['threnody'] = {
		baseset=sets['debuff cast']	
	}
	sets.MA["Fire Threnody"] = sets.threnody
	sets.MA["Ice Threnody"] = sets.threnody
	sets.MA["Wind Threnody"] = sets.threnody
	sets.MA["Earth Threnody"] = sets.threnody
	sets.MA["Lightning Threnody"] = sets.threnody
	sets.MA["Water Threnody"] = sets.threnody
	sets.MA["Light Threnody"] = sets.threnody
	sets.MA["Dark Threnody"] = sets.threnody
	
	sets.MA["Magic Finale"] = sets['debuff cast']
	
	sets.MA["Goddess's Hymnus"] = sets['buff cast']	
	
	sets.MA["Raptor Mazurka"] = sets['buff cast']	
	sets.MA["Chocobo Mazurka"] = sets['buff cast']	

	sets.MA["Sentinel's Scherzo"] = sets['buff cast']	

	sets.MA["Pinning Nocturne"] = sets['debuff cast']

	-- White Mage Sub
	sets.MA['Cure'] = {
		precast=sets['fast cast'],
		baseset=sets.mnd,
		main="Chatoyant Staff",
		neck="Phalaina Locket",
		hands="Bokwus Gloves",
		lring="Sirona's Ring",
		legs="Nares Trews"
	}
	sets.MA['Cure II'] = sets.MA.Cure
	sets.MA['Cure III'] = sets.MA.Cure
	sets.MA['Cure IV'] = sets.MA.Cure
	sets.MA['Curage'] = sets.MA.Cure
	sets.MA['Curaga II'] = sets.MA.Cure
	
	sets.MA['Raise'] = sets['fast cast']
	
	sets.MA['Poisona'] = sets['fast cast']
	sets.MA['Paralina'] = sets['fast cast']
	sets.MA['Blindna'] = sets['fast cast']
	sets.MA['Silena'] = sets['fast cast']
	sets.MA['Stona'] = sets['fast cast']
	sets.MA['Viruna'] = sets['fast cast']
	sets.MA['Cursna'] = sets['fast cast']

	sets.MA['Dia'] = sets['fast cast']
	sets.MA['Dia II'] = sets['fast cast']
	sets.MA['Diaga'] = sets['fast cast']

	sets.MA['Banish'] = sets['fast cast']
	sets.MA['Banish II'] = sets['fast cast']
	sets.MA['Banishga'] = sets['fast cast']
	sets.MA['Banishga II'] = sets['fast cast']

	sets.MA['Protect'] = sets['fast cast']
	sets.MA['Protect II'] = sets['fast cast']
	sets.MA['Protect III'] = sets['fast cast']
	sets.MA['Shell'] = sets['fast cast']
	sets.MA['Shell II'] = sets['fast cast']
	sets.MA['Protectra III'] = sets['fast cast']
	sets.MA['Shellra II'] = sets['fast cast']
	sets.MA['Blink'] = sets['fast cast']
	sets.MA['Stoneskin'] = sets['fast cast']
	sets.MA['Aquaveil'] = sets['fast cast']

	sets.MA['Slow'] = {
		precast=sets['fast cast'],
		baseset=sets.mac
	}

	sets.MA['Haste'] = sets['fast cast']

	sets.MA['Paralyze'] = {
		precast=sets['fast cast'],
		baseset=macc
	}
	sets.MA['Silence'] = {
		precast=sets['fast cast'],
		baseset=macc
	}

	sets.MA['Barfira'] = sets['fast cast']
	sets.MA['Barblizzara'] = sets['fast cast']
	sets.MA['Baraera'] = sets['fast cast']
	sets.MA['Barstonra'] = sets['fast cast']
	sets.MA['Barthundra'] = sets['fast cast']
	sets.MA['Barwatera'] = sets['fast cast']
	sets.MA['Barsleepra'] = sets['fast cast']
	sets.MA['Barpoisonra'] = sets['fast cast']
	sets.MA['Barparalyzra'] = sets['fast cast']
	sets.MA['Barblindra'] = sets['fast cast']
	sets.MA['Barsilencera'] = sets['fast cast']
	sets.MA['Barpetra'] = sets['fast cast']
	sets.MA['Barvira'] = sets['fast cast']

	sets.MA['Cura'] = sets.MA.Cure
	
	sets.MA['Regen'] = sets['fast cast']

	sets.MA['Repose'] = {
		precast=sets['fast cast'],
		baseset=sets.macc
	}

	sets.MA['Flash'] = {
		precast=sets['fast cast'],
		baseset=sets.macc
	}

	sets.MA['Teleport-Holla'] = sets['fast cast']
	sets.MA['Teleport-Mea'] = sets['fast cast']
	sets.MA['Teleport-Dem'] = sets['fast cast']


	sets.MA['Regen II'] = sets['fast cast']

	sets.MA['Reraise'] = sets['fast cast']

	sets.MA['Invisible'] = sets['fast cast']
	sets.MA['Sneak'] = sets['fast cast']
	sets.MA['Deodorize'] = sets['fast cast']

	sets.MA['Erase'] = sets['fast cast']

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
	sets['buff active']['Cover'] = {
				body="Cab. Surcoat +1",		
	}
end
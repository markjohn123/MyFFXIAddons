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
	
	sets.weapons["club"]  = {
		main="Nehushtan", 
		sub="Genbu's shield", 
	}
	
	sets.weapons["staff"] = {
		main="Ungeri Staff",
		sub="Mephistis Grip",
	}
	
	sets.weapons['pdtstaff'] = sets.weapons.staff
	
	sets['Idle'] = {
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Orison Bliaud +2",
    hands="Patrician's Cuffs",
    legs="Nares Trews",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Orison Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    back="Repulse Mantle",
	}

	sets['Engaged'] = {
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Orison Bliaud +2",
    hands="Patrician's Cuffs",
    legs="Nares Trews",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Orison Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    back="Repulse Mantle",
	}
	
	sets['Resting']   = {
    main="Chatoyant Staff",
    sub="Mephitis Grip",
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Orison Bliaud +2",
    hands="Patrician's Cuffs",
    legs="Nares Trews",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Orison Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    back="Repulse Mantle",
	}

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
	}
	sets.Engaged['PDT'] = sets.Idle.PDT

	sets.Idle['HPDT'] = sets.Idle.PDT
	
	sets.Engaged['HPDT'] = sets.Idle.PDT
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = sets.Idle.PDT
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Idle.PDT
	
	sets['mnd'] = {
	}
	
	sets['WS'] = {}
	
	sets['JA'] = {}
	
	sets.JA['Benediction'] = {
	
	}
	
	sets.JA['Divine Seal'] = {
	
	}

	sets.JA['Afflatus Solace'] = {
	
	}
	
	sets.JA['Afflatus Misery'] = {
	
	}
	
	sets.JA['Divine Caress'] = {
	
	}
	
	sets.JA['Sacrosanctity'] = {
	
	}

	sets.JA['Asylum'] = {
	
	}

	-- Red Mage sub
	sets.JA['Convert'] = {
	
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
    ammo="Incantor Stone",
    head="Nahtirah Hat",
    body={ name="Dalmatica", augments={'Occ. quickens spellcasting +1%','"Fast Cast"+4','Mag. Acc.+5',}},
    hands="Repartie Gloves",
    legs="Orvail Pants",
    feet="Chelona Boots",
    neck="Orison Locket",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    right_ring="Prolix Ring",
    back="Swith Cape",
	   }
	}

	sets['macc'] = {
	}

	sets['enhancing'] = {
	
	}
	
	sets['MA'] = {}
	
	sets['cure fast cast'] = {
		baseset={sets['fast cast']},
		legs="Orison pantaloons +2"
	}

	sets['cure'] = {
		basesets={sets['cure fast cast'], sets.mnd},
    main="Chatoyant Staff",
    sub="Curatio Grip",
    head="Orison Cap +2",
    body="Orison Bliaud +2",
    hands="Serpentes Cuffs",
    legs="Nares Trews",
    feet="Serpentes Sabots",
    left_ear="Orison Earring",
    left_ring="Sirona's Ring",
    back="Orison Cape",
	}
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
	
	sets["remove debuffs"] = {
		baseset=sets['fast cast']
		legs="Orison pantaloons +2"
	}
	
	sets.MA['Poisona'] = sets["remove debuffs"]
	sets.MA['Paralina'] = sets["remove debuffs"]
	sets.MA['Blindna'] = sets["remove debuffs"]
	sets.MA['Silena'] = sets["remove debuffs"]
	sets.MA['Stona'] = sets["remove debuffs"]
	sets.MA['Viruna'] = sets["remove debuffs"]
	sets.MA['Cursna'] = sets["remove debuffs"]

	sets.MA['Dia'] = sets['fast cast']
	sets.MA['Dia II'] = sets['fast cast']
	sets.MA['Diaga'] = sets['fast cast']

	sets['banish'] = {
		hands="Cleric's mitts"
	}

	sets.MA['Banish'] = {
		basesets={sets['fast cast'], sets.banish}
	}
	sets.MA['Banish II'] = sets.MA.Banish
	sets.MA['Banishga'] = sets.MA.Banish
	sets.MA['Banishga II'] = sets.MA.Banish

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
	
	sets.MA['Regen'] = {
		baseset=sets['fast cast'],
		body="Cleric's Briault",
		hands="Orison Mitts +2"
	}

	sets.MA['Regen II'] = sets.MA.Regen
	sets.MA['Regen III'] = sets.MA.Regen
	sets.MA['Regen IV'] = sets.MA.Regen

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
	
	sets.MA['Auspice'] = {
		baseset=sets['fast cast'],
		feet="Orison duckbills +1"
	}

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
	sets['buff active']['Divine Seal'] = {
		head="Orison Cap +2"
	}
	
	sets['buff active']['Afflatus Solace'] = {
		body='Orison Bliaud +2'
	}
	
	sets['buff active']['Divine Caress'] = {
		hands="Orison Mitts +2"
	}
	
end
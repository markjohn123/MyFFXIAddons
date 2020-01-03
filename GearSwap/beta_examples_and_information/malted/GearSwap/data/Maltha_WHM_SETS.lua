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
		main="Bolelabunga", 
		sub="Genbu's shield", 
	}
	
	sets.weapons["staff"] = {
		main="Ungeri Staff",
		sub="Mephitis Grip",
	}
	
	sets.weapons['pdtstaff'] = sets.weapons.staff
	
	sets['Idle'] = {
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Orison Bliaud +2",
    hands="Patrician's Cuffs",
    legs="Assiduity Pants +1",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Orison Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    right_ring="Woltaris Ring",
    back="Repulse Mantle",
	}

	sets['Engaged'] = {
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Orison Bliaud +2",
    hands="Patrician's Cuffs",
    legs="Assiduity Pants +1",
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
    head="Nahtirah Hat",
    body={ name="Bokwus Robe", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
    hands={ name="Gendewitha Gages", augments={'Phys. dmg. taken -1%','Song spellcasting time -2%',}},
    legs="Orsn. Pantaln. +2",
    feet="Chelona Boots",
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
    hands="Gendewitha Gages",
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
		main="Ababinili",
		neck="Enhancing torque",
		hands="Ayao's gages",
		waist="Siegel Sash",
		feet="Orison duckbills +1"
	}
	
	sets['enfeebling'] = {
	
	}
	
	
	sets['MA'] = {}
	
	sets['cure fast cast'] = {
		baseset={sets['fast cast']},
		legs="Orison pantaloons +2"
	}

	sets['cure'] = {
		basesets={sets['cure fast cast'], sets.mnd},
    main="Ababinili",
    sub="Curatio Grip",
    head="Orison Cap +2",
    body="Orison Bliaud +2",
    hands="Telchine Gloves",
    legs="Nares Trews",
    feet="Orison duckbills +1",
    left_ear="Orison Earring",
    left_ring="Sirona's Ring",
    back="Orison Cape",
	}

	sets.MA['Cure'] = sets.cure
	sets.MA['Cure II'] = sets.cure
	sets.MA['Cure III'] = sets.cure
	sets.MA['Cure IV'] = sets.cure
	sets.MA['Cure V'] = sets.cure
	sets.MA['Cure VI'] = sets.cure
	sets.MA['Curaga'] = sets.cure
	sets.MA['Curaga II'] = sets.cure
	sets.MA['Curaga III'] = sets.cure
	sets.MA['Curaga IV'] = sets.cure
	sets.MA['Curaga V'] = sets.cure
	sets.MA['Curaga VI'] = sets.cure
	
	sets.MA['Raise'] = sets['fast cast']
	sets.MA['Raise II'] = sets['fast cast']
	sets.MA['Raise III'] = sets['fast cast']
	sets.MA['Arise'] = sets['fast cast']
	
	sets["remove debuffs"] = {
		baseset=sets['fast cast'],
		legs="Orison pantaloons +2",
		back="Mending Cape"
	}
	
	sets.MA['Poisona'] = sets["remove debuffs"]
	sets.MA['Paralyna'] = sets["remove debuffs"]
	sets.MA['Blindna'] = sets["remove debuffs"]
	sets.MA['Silena'] = sets["remove debuffs"]
	sets.MA['Stona'] = sets["remove debuffs"]
	sets.MA['Viruna'] = sets["remove debuffs"]
	sets.MA['Cursna'] = sets["remove debuffs"]
	sets.MA['Sacrifice'] = sets["remove debuffs"]
	sets.MA['Esuna'] = sets["remove debuffs"]

	sets.MA['Dia'] = sets['fast cast']
	sets.MA['Dia II'] = sets['fast cast']
	sets.MA['Diaga'] = sets['fast cast']
	
	sets.MA['Holy'] = sets['fast cast']
	sets.MA['Holy II'] = sets['fast cast']
	sets.MA['Holy III'] = sets['fast cast']


	sets['banish'] = {
		hands="Cleric's mitts"
	}

	sets.MA['Banish'] = {
		basesets={sets['fast cast'], sets.banish}
	}
	sets.MA['Banish II'] = sets.MA.Banish
	sets.MA['Banish III'] = sets.MA.Banish
	sets.MA['Banishga'] = sets.MA.Banish
	sets.MA['Banishga II'] = sets.MA.Banish

	sets["protect"] = {
		basesets={sets['fast cast'], sets.enhancing}
	}
	
	
	sets.MA['Protect'] = sets.protect
	sets.MA['Protect II'] = sets.protect
	sets.MA['Protect III'] = sets.protect
	sets.MA['Protect IV'] = sets.protect
	sets.MA['Protect V'] = sets.protect
	sets.MA['Shell'] = sets.protect
	sets.MA['Shell II'] = sets.protect
	sets.MA['Shell III'] = sets.protect
	sets.MA['Shell IV'] = sets.protect
	sets.MA['Shell V'] = sets.protect
	sets.MA['Protectra'] = sets.protect
	sets.MA['Protectra II'] = sets.protect
	sets.MA['Protectra III'] = sets.protect
	sets.MA['Protectra IV'] = sets.protect
	sets.MA['Protectra V'] = sets.protect
	sets.MA['Shellra'] = sets.protect
	sets.MA['Shellra II'] = sets.protect
	sets.MA['Shellra III'] = sets.protect
	sets.MA['Shellra IV'] = sets.protect
	sets.MA['Shellra V'] = sets.protect
	sets.MA['Blink'] = {
		basesets={sets['fast cast'],sets.enhancing}
	}
	sets.MA['Stoneskin'] = {
		basesets={sets['fast cast'], sets.enhancing, sets.mnd},
		waist="Siegel Sash"
	}
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

	sets['bar'] = {
--		basesets={sets['fast cast']},
		precast={"Siegel sash"},
		legs="Cleric's pantaloons",
	}
	
	sets.MA['Barfira'] = sets.bar
	sets.MA['Barblizzara'] = sets.bar
	sets.MA['Baraera'] = sets.bar
	sets.MA['Barstonra'] = sets.bar
	sets.MA['Barthundra'] = sets.bar
	sets.MA['Barwatera'] = sets.bar
	sets.MA['Barsleepra'] = sets.bar
	sets.MA['Barpoisonra'] = sets.bar
	sets.MA['Barparalyzra'] = sets.bar
	sets.MA['Barblindra'] = sets.bar
	sets.MA['Barsilencera'] = sets.bar
	sets.MA['Barpetra'] = sets.bar
	sets.MA['Barvira'] = sets.bar

	sets.MA['Cura'] = sets.cure
	
	sets.MA['Regen'] = {
		baseset=sets['fast cast'],
		main="Bolelabunga",
		sub="Chanter's Shield",
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
	sets.MA['Reraise II'] = sets['fast cast']
	sets.MA['Reraise III'] = sets['fast cast']

	sets.MA['Invisible'] = sets['fast cast']
	sets.MA['Sneak'] = sets['fast cast']
	sets.MA['Deodorize'] = sets['fast cast']

	sets.MA['Erase'] = sets['fast cast']
	
	sets.MA['Auspice'] = {
		baseset=sets['fast cast'],
		feet="Orison duckbills +1"
	}

	-- Red Mage Sub
	sets.MA['Phalanx'] = {
		baseset=sets.enhancing
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
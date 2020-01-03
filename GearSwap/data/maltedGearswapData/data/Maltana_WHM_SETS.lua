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
		sub="Killer Targe", 
	}
	
	sets.weapons["staff"] = sets.weapons["club"]
	
	sets.weapons['pdtstaff'] = sets.weapons.staff
	
	sets['Idle'] = {
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Gendewitha bliaut +1",
--    hands="Patrician's Cuffs",
    legs="Assiduity pants",
    feet="Herald's Gaiters",
    neck="Twilight Torque",
--    waist="Fucho-no-Obi",
--    left_ear="Orison Earring",
 --   right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring="Dark Ring",
    right_ring="Renaye Ring",
    back="Repulse Mantle",
	}

	sets['Engaged'] = {
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
    body="Gendewitha bliaut +1",
--    hands="Patrician's Cuffs",
--    legs="Nares Trews",
--    feet="Serpentes Sabots",
    neck="Twilight Torque",
--    waist="Fucho-no-Obi",
--    left_ear="Orison Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring="Dark Ring",
    right_ring="Dark Ring",
    back="Repulse Mantle",
	}
	
	sets['Resting']   = {
--    main="Chatoyant Staff",
--    sub="Mephitis Grip",
    ammo="Clarus Stone",
    head={ name="Wivre Hairpin", augments={'"Refresh"+1','Water resistance+6',}},
--    body="Orison Bliaud +2",
--    hands="Patrician's Cuffs",
--    legs="Nares Trews",
--    feet="Serpentes Sabots",
    neck="Twilight Torque",
--    waist="Fucho-no-Obi",
--    left_ear="Orison Earring",
    right_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    left_ring="Dark Ring",
    right_ring="Dark Ring",
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
		main="Ababinili +1",
    head="Nahtirah Hat",
--    body={ name="Bokwus Robe", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
 --   hands={ name="Gendewitha Gages", augments={'Phys. dmg. taken -1%','Song spellcasting time -2%',}},
    legs="Orsn. Pantaln. +2",
--    feet="Chelona Boots",
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
--		right_ear="Choleria Earring"
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
--    ammo="Incantor Stone",
    head="Nahtirah Hat",
--    body="Dalmatica",
 --   hands="Gendewitha Gages",
--    legs="Orvail Pants",
--    feet="Chelona Boots",
--    neck="Orison Locket",
    waist="Witful Belt",
    right_ear="Loquac. Earring",
    right_ring="Prolix Ring",
    back="Swith Cape",
	 }
	}

	sets['macc'] = {
    main="Ababinili +1",
    sub="Mephitis Grip",
    head="Nahtirah Hat",
--    hands="Ayao's Gages",
 --   legs="Orvail Pants",
--    feet="Artsieq Boots",
--    neck="Eddy Necklace",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
 --   left_ring="Globidonta Ring",
    right_ring="Perception Ring",
    back="Refraction Cape",
	}

	sets['enhancing'] = {
		main="Ababinili +1",
--		neck="Enhancing torque",
		hands="Dynasty Mitts",
		waist="Siegel Sash",
--		feet="Orison duckbills +1"
	}
	
	sets['enfeebling'] = {
		hands="Lurid mitts",
		sub="Mephitis Grip",

	}
	
	
	sets['MA'] = {}
	
	sets['cure fast cast'] = {
		baseset={sets['fast cast']},
--		legs="Orison pantaloons +2"
	}

	sets['cure'] = {
		precast={right_ear="Nourishing Earring",},
		basesets={sets['cure fast cast'], sets.mnd},
    main="Ababinili +1",
--    sub="Curatio Grip",
--    head="Orison Cap +2",
--    body="Orison Bliaud +2",
--    hands="Serpentes Cuffs",
--    legs="Nares Trews",
--    feet="Serpentes Sabots",
--    left_ear="Orison Earring",
    right_ear="Nourishing Earring",
    left_ring="Sirona's Ring",
 --   back="Orison Cape",
--    neck="Inquisitor's Chain",
	}

	sets.MA['Cure'] = sets.cure
	sets.MA['Cure II'] = sets.MA.Cure
	sets.MA['Cure III'] = sets.MA.Cure
	sets.MA['Cure IV'] = sets.MA.Cure
	sets.MA['Cure V'] = sets.MA.Cure
	sets.MA['Cure VI'] = sets.MA.Cure
	sets.MA['Curaga'] = sets.MA.Cure
	sets.MA['Curaga II'] = sets.MA.Cure
	sets.MA['Curaga III'] = sets.MA.Cure
	sets.MA['Curaga IV'] = sets.MA.Cure
	sets.MA['Curaga V'] = sets.MA.Cure
	
	sets.MA['Raise'] = sets['fast cast']
	sets.MA['Raise II'] = sets['fast cast']
	sets.MA['Raise III'] = sets['fast cast']
	sets.MA['Arise'] = sets['fast cast']
	
	sets["remove debuffs"] = {
		baseset=sets['fast cast'],
--		legs="Orison pantaloons +2",
--		back="Mending Cape"
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
--		hands="Cleric's mitts"
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
	sets.MA['Refresh'] = sets['fast cast']
	
	sets.MA['Paralyze'] = {
		precast=sets['fast cast'],
		baseset=macc
	}
	sets.MA['Silence'] = {
		precast=sets['fast cast'],
		baseset=macc
	}

	sets.MA['Blind'] = {
		precast=sets['fast cast'],
		baseset=macc
	}

	sets['bar'] = {
--		basesets={sets['fast cast']},
		precast={"Siegel sash"},
--		legs="Cleric's pantaloons",
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

	sets.MA['Cura'] = sets.MA.Cure
	
	sets.MA['Regen'] = {
		baseset=sets['fast cast'],
		main="Bolelabunga",
--		body="Cleric's Briault",
--		hands="Orison Mitts +2"
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
--		feet="Orison duckbills +1"
	}

	-- Red Mage Sub
	sets.MA['Phalanx'] = {
		baseset=sets.enhancing
	}
	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
	sets['buff active']['Divine Seal'] = {
--		head="Orison Cap +2"
	}
	
	sets['buff active']['Afflatus Solace'] = {
--		body='Orison Bliaud +2'
	}
	
	sets['buff active']['Divine Caress'] = {
--		hands="Orison Mitts +2"
	}
	
end
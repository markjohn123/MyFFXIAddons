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
	
	
	sets['Idle'] = {
	}

	sets['Engaged'] = {
	}
	
	sets['Resting']   = sets.Idle

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
    feet="Suzaku's Sune-Ate",
    neck="Promise Badge",
    waist="Demonry Sash",
    left_ring="Solemn Ring",
    right_ring="Sirona's Ring",
	}
	
	sets['WS'] = {}
	
	sets['JA'] = {}
	

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
	    body="Dalmatica",
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
	
end
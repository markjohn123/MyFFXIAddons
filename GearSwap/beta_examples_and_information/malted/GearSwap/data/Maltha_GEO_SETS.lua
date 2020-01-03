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
	
	sets.weapons["staff"]  = {
		main="Terra's Staff", 
		sub="Mephitis Grip", 
		range='Dunna'
	}
	
	sets.weapons["club"] = {
		main="Cagliostro's Rod", 
		sub="Genbu's Shield", 
		range='Dunna'
	}
	
	sets['Idle'] = {
    main="Eminent Wand",
    range="Dunna",
    head="Nahtirah Hat",
    body="Geomancy Tunic",
    hands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}},
    legs={ name="Bagua Pants", augments={'Enhances "Mending Halation" effect',}},
    feet={ name="Bagua Sandals", augments={'Enhances "Radial Arcana" effect',}},
    neck="Quanpur Necklace",
    left_ear="Bladeborn Earring",
    right_ear="Pixie Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%',}},
    right_ring={ name="Dark Ring", augments={'Breath dmg. taken -3%',}},
    back="Repulse Mantle",
	}

	sets['Engaged'] = {
    main="Eminent Wand",
    range="Dunna",
    head="Nahtirah Hat",
    body={ name="Bagua Tunic", augments={'Enhances "Bolster" effect',}},
    hands="Espial Bracers",
    legs={ name="Bagua Pants", augments={'Enhances "Mending Halation" effect',}},
    feet={ name="Bagua Sandals", augments={'Enhances "Radial Arcana" effect',}},
    neck="Quanpur Necklace",
    left_ear="Bladeborn Earring",
    right_ear="Pixie Earring",
    left_ring="Keen Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%',}},
    back="Tuilha Cape",
	}
	
	sets['Resting']   = {
		baseset=idle,
		ammo="Clarus Stone",
		main="Chatoyant Staff",
		hands="Nares Cuffs"
	}

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
		main="Terra's Staff",
		sub="Mephitis Grip",
		range="Dunna",
		neck="Twilight Torque",
		body="Hagondes Coat",
		hands="Hagondes Cuffs",
		left_ring="Dark Ring",
		right_ring="Dark Ring",
		back="Umbra Cape",
		waist="Slipor Sash",
		feet="Umbani Boots"
	}
	sets.Engaged['PDT'] = sets.Idle.PDT

	sets.Idle['HPDT'] = sets.Idle.PDT
	
	sets.Engaged['HPDT'] = sets.Idle.PDT
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = sets.Idle.PDT
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Idle.PDT
	
	sets['macc'] = {
    main="Ngqoqwanb",
    sub="Mephitis Grip",
    range="Dunna",
    body="Nares Saio",
    hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -2%','Pet: Accuracy+16 Pet: Rng. Acc.+16',}},
    legs={ name="Bokwus Slops", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
    feet={ name="Bokwus boots", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
    neck="Eddy Necklace",
    waist="Demonry Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Strendu Ring",
    right_ring="Perception Ring",
    back="Ogapepo Cape",
	}
	
	sets['mab'] = {
		baseset=macc,
    main="Ngqoqwanb",
    sub="Elder's Grip",
    ammo="Dosis Tathlum",
    head="Buremte Hat",
    body={ name="Bokwus Robe", augments={'"Mag.Atk.Bns."+13','INT+10','MND+10',}},
    hands="Yaoyotl Gloves",
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Mizu. Kubikazari",
    waist="Sekhmet corset",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Strendu Ring",
    right_ring="Acumen Ring",
    back="Toro Cape",
	}
	
	sets['darkmagic'] = {
		neck="Dark Torque",
		body="Geomancy Tunic",
		--right_ring="Archon Ring"
	}
	
	sets['mnd'] = {
    head="Geomancy Galero +1",
    body={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Fast Cast"+4',}},
    hands={ name="Hagondes Cuffs", augments={'Phys. dmg. taken -2%','Pet: Accuracy+16 Pet: Rng. Acc.+16',}},
    legs="Hagondes Pants +1",
    feet="Umbani Boots",
    neck="Promise Badge",
    waist="Penitent's Rope",
    left_ear="Lifestorm Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Refraction Cape",
	}
	
	sets['Geomancy'] = {
		range="Dunna",
		body="Bagua tunic",
		hands="Geo. Mitaines",
		legs="Bagua pants",
		back="Lifestream cape"
	}
	
	sets['attack'] = {
	
	}
	
	sets['da'] = {
	}
	
	
	
	sets['WS'] = {}
	-- Club
	sets.WS['Shining Strike'] = sets.mab
	sets.WS['Seraph Strike'] = sets.mab
	sets.WS['Brainshaker'] = sets.da
	sets.WS['Starlight'] = {}
	sets.WS['Moonlight'] = {}
	sets.WS['Skullbreaker'] = sets.da
	sets.WS['True Strike'] = sets.da
	sets.WS['Judgement'] = sets.da
	sets.WS['Hexa Strike'] = {
    head="Geomancy Galero +1",
    body={ name="Hagondes Coat", augments={'Phys. dmg. taken -3%','"Fast Cast"+4',}},
    hands="Yaoyotl Gloves",
    legs="Geomancy Pants",
    feet="Serpentes Sabots",
    neck="Asperity Necklace",
    waist="Windbuffet belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Pyrosoul Ring",
    back="Refraction Cape",
	}
	sets.WS['Black Halo'] = sets.da
	sets.WS['Flash Nova'] = sets.mab
	
	-- Staff
	sets.WS['Heavy Swing'] = sets.da
	sets.WS['Rock Crusher'] = sets.mab
	sets.WS['Earth Crusher'] = sets.mab
	sets.WS['Starbust'] = sets.mab
	sets.WS['Sunburst'] = sets.mab
	sets.WS['Shell Crusher'] = sets.da
	sets.WS['Full Swing'] = sets.da
	sets.WS['Spirit Taker'] = sets.da
	sets.WS['Retribution'] = sets.da
	sets.WS['Cataclysm'] = sets.da
	
	sets['JA'] = {}
	
	sets.JA['Bolster'] = {
		body="Bagua tunic"
	}
	sets.JA['Full Circle'] = {
		hands="Bagua mitaines"
	}
	sets.JA['Lasting Emanation'] = {}
	sets.JA['Ecliptic Attrition'] = {}
	sets.JA['Collimated Fervor'] = {}
	sets.JA['Life Cycle'] = {body="Geomancy Tunic"}
	sets.JA['Blaze of Glory'] = {}
	sets.JA['Dematerialize'] = {}
	sets.JA['Theurgic Focus'] = {}
	sets.JA['Concentric Pulse'] = {}
	sets.JA['Radial Arcana'] = {}
	sets.JA['Widened Compas'] = {}
	
	-- Red Mage sub
	sets.JA['Convert'] = {}
	
	
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
		right_ear="Choreia Earring"
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
    head="Nares Cap",
    body="Anhur Robe",
    hands="Gendewitha Gages",
    left_ring="Prolix Ring",
    legs="Geomancy Pants",
    waist="Witful Belt",
    left_ear="Loquac. Earring",
    back="Lifestream Cape",
	}

	sets['elemental'] = {
		baseset=sets.mab,
		precast=sets['fast cast']
	}

	sets['MA'] = {}

	sets.MA['Impact'] = {
		baseset=sets['elemental'],
		precast={
			head="",
			body="Twilight Cloak"
		
		},
		head="",
		body="Twilight Cloak"
	}


	sets.MA['Fire']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Fire II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Fire III']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Fire IV']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Blizzard']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Blizzard II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Blizzard III']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Blizzard IV']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Aero']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Aero II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Aero III']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Aero IV']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Stone']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Stone II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Stone III']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Stone IV']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Thunder']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Thunder II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Thunder III']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Thunder IV']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Water']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Water II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Water III']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Water IV']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Fira']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Fira II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Blizzara']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Blizzara II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Aerora']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Aerora II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Stonera']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Stonera II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Thundara']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Thundara II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Watera']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Watera II']  = {
		 baseset=sets['elemental']
	}

	sets.MA['Sleep'] = sets.macc
	sets.MA['Sleep II'] = sets.macc
	sets.MA['Drain'] = sets.macc
	sets.MA['Aspir'] = sets.macc
	sets.MA['Aspir II'] = sets.macc
	
	sets.MA['Indi-Regen'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Haste'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Haste'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Poison'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Refresh'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-STR'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-DEX'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-VIT'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-AGI'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}
	
	sets.MA['Indi-INT'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-MND'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-CHR'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Fury'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Barrier'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Acumen'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Fend'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Precision'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Voidance'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Focus'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Attunement'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Wilt'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Frailty'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Fade'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Malaise'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Slip'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Torpor'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Vex'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Languor'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Slow'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Paralysis'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Indi-Gravity'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}


	sets.MA['Geo-Regen'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Poison'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Refresh'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-STR'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-DEX'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-VIT'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-AGI'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-MND'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-CHR'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Fury'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Barrier'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Acumen'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Fend'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Precision'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Voidance'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Focus'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Attunement'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Wilt'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Frailty'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Fade'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Malaise'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Slip'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Torpor'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Vex'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Languor'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Slow'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Paralysis'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	sets.MA['Geo-Gravity'] = {
		precast=sets['fast cast'],
		baseset=sets.Geomancy
	}

	-- Red Mage Sub
	sets.MA['Cure'] = {
		precast=sets['fast cast'],
		baseset=sets.mnd,
		main="Tamaxchi",
		sub="Genbu's Shield",
		neck="Phalaina Locket",
		hands="Bokwus Gloves",
		lring="Sirona's Ring",
		legs="Nares Trews"
	}
	sets.MA['Cure II'] = sets.MA.Cure
	sets.MA['Cure III'] = sets.MA.Cure
	sets.MA['Cure IV'] = sets.MA.Cure

	sets['enfeebling'] = {
		precast=sets["fast cast"],
		baseset=sets.macc,
		back="Lifestream cape"
	}
	
	sets.MA['Protect'] = sets['fast cast']
	sets.MA['Protect II'] = sets['fast cast']
	sets.MA['Protect III'] = sets['fast cast']
	sets.MA['Shell'] = sets['fast cast']
	sets.MA['Shell II'] = sets['fast cast']
	sets.MA['Blink'] = sets['fast cast']
	sets.MA['Stoneskin'] = {
		precast=sets['fast cast'],
		baseset=sets['mnd'],
		head="Umuthi Hat",
		waist="Siegel sash"
	}
	sets.MA['Aquaveil'] = sets['fast cast']
	sets.MA['Phalanx'] = sets['fast cast']
	sets.MA['Haste'] = sets['fast cast']
	sets.MA['Barfire'] = sets['fast cast']
	sets.MA['Barblizzard'] = sets['fast cast']
	sets.MA['Baraero'] = sets['fast cast']
	sets.MA['Barstone'] = sets['fast cast']
	sets.MA['Barthunder'] = sets['fast cast']
	sets.MA['Barwater'] = sets['fast cast']
	sets.MA['Barsleep'] = sets['fast cast']
	sets.MA['Barpoison'] = sets['fast cast']
	sets.MA['Barparalyze'] = sets['fast cast']
	sets.MA['Barblind'] = sets['fast cast']
	sets.MA['Barsilence'] = sets['fast cast']
	sets.MA['Barpetrify'] = sets['fast cast']
	sets.MA['Barvirus'] = sets['fast cast']
	sets.MA['Enfire'] = sets['fast cast']
	sets.MA['Enaero'] = sets['fast cast']
	sets.MA['Enblizzard'] = sets['fast cast']
	sets.MA['Enstone'] = sets['fast cast']
	sets.MA['Enthunder'] = sets['fast cast']
	sets.MA['Enwater'] = sets['fast cast']
	sets.MA['Regen'] = sets['fast cast']
	sets.MA['Refresh'] = sets['fast cast']
	sets.MA['Invisible'] = sets['fast cast']
	sets.MA['Sneak'] = sets['fast cast']
	sets.MA['Deodorize'] = sets['fast cast']
	sets.MA['Dia'] = sets['fast cast']
	sets.MA['Dia II'] = sets['fast cast']
	sets.MA['Diaga'] = sets['fast cast']
	sets.MA['Slow'] = sets.enfeebling
	sets.MA['Paralyze'] = sets.enfeebling
	sets.MA['Silence'] = sets.enfeebling
	sets.MA['Blaze Spikes'] = sets['fast cast']
	sets.MA['Ice Spikes'] = sets['fast cast']
	sets.MA['Poison'] = sets.enfeebling
	sets.MA['Poison II'] = sets.enfeebling
	sets.MA['Blind'] = sets.enfeebling
	sets.MA['Bind'] = sets.enfeebling
	sets.MA['Dispel'] = sets.enfeebling
	sets.MA['Gravity'] = sets.enfeebling
	sets.MA['Bio'] = sets['fast cast']
	sets.MA['Bio II'] = sets['fast cast']


	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
end
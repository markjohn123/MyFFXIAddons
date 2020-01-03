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
	
	sets.weapons["spharai"]  = {
		main="Spharai"
	}
	
	sets.weapons['h2h'] = sets.weapons.spharai
	

	sets.weapons["club"] = {
		main="Mondaha cudgel"
	}
	
	sets.weapons["staff"] = {
		main="Eminent Staff", sub="Pole Grip"
	}

	sets['Idle'] = {
    ammo="Bibiki Seashell",
    head="Ocelomeh headpiece",
    neck="Twilight Torque",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    body="Hes. Cyclas",
    hands="Otronif gloves +1",
    left_ring={ name="Dark Ring"},
    right_ring={ name="Dark Ring"},
    back="Repulse Mantle",
    waist="black Belt",
    legs="Quiahuiz Trousers",
    feet="Hermes' Sandals",
	}
	
	sets['Engaged'] = {
    ammo="Honed Tathlum",
    head="Felistris mask",
    neck="Asperity Necklace",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    body="Qaaxo Harness",
    hands="Otronif gloves +1",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
    waist="Windbuffet belt +1",
    legs="Hes. Hose +1",
    feet="Otronif boots +1",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['ACC'] = sets.Idle
	sets.Engaged['ACC'] = {
    ammo="Honed Tathlum",
    head="Felistris Mask",
    body={ name="Otro. Harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Hes. Hose +1", augments={'Enhances "Hundred Fists" effect',}},
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -2%',}},
    neck="Asperity Necklace",
    waist="Windbuffet belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
			ammo="Honed Tathlum",
			head="Otronif Mask +1",
			neck="Twilight Torque",
			left_ear="Steelflash Earring",
			right_ear="Bladeborn Earring",
			body="Otronif Harness +1",
			hands="Otronif gloves +1",
			left_ring="Dark Ring",
			right_ring="Dark Ring",
			back="Repulse Mantle",
			waist="black Belt",
			legs="Quiahuiz Trousers",
			feet="Otronif boots +1"
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
    ammo="Honed Tathlum",
    head="Felistris Mask",
    body={ name="Otronif harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -2%',}},
    neck="Twilight Torque",
    waist="Black Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}},
    back="Repulse Mantle",
			PDT={
				head="Felistris Mask",
				body="Otronif Harness +1",
				hands="Otronif gloves +1",
				legs="Otronif Brais +1",
				feet="Otronif boots +1"
		}		
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
		PDT={
		
		}
		
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.HPDT,
		PDT={
		
		}
		
	}
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = sets.Engaged.PDT
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Engaged.PDT

	sets.Idle['COUNTER'] = sets.Idle
	
	sets.Engaged['COUNTER'] = {
		head="Felistris Mask",
		neck="Asperity Necklace",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		body="Qaaxo Harness",
		hands="Otronif gloves +1",
		left_ring="Rajas Ring",
		right_ring="Epona's Ring",
		back="Misuuchi Kappa",
		waist="Windbuffet belt +1",
		legs="Anch. Hose +1",
		feet="Hes. Gaiters +1"
	}
	
	-- Monk can't wear twilight
	sets.Idle['TWILIGHT'] = nil
	
	sets.Engaged['TWILIGHT'] = nil
	
	sets['dex'] = {
		ammo="Demonry core",
		head="Felistris Mask",
		left_ear="Hollow Earring",
		right_ear="Pixie Earring",
		body="Qaaxo Harness",
		hands="Otronif gloves +1",
		left_ring="Rajas Ring",
		right_ring="Thundersoul Ring",
		back="Nifty Mantle",
		waist="Wanion Belt",
		feet="Otronif boots +1"
	}
	
	sets['mnd'] = {
		head="Felistris Mask",
		neck="Promise Badge",
		left_ear="Lifestorm Earring",
		body="Qaaxo Harness",
		left_ring="Aquasoul Ring",
		right_ring="Aquasoul Ring",
		waist="Crudelis Belt",
		legs="Anch. Hose +1",
		feet="Otronif boots +1"
	}
	
	sets['hp'] = {
		head="Felistris Mask",
		neck="Inq. Bead Necklace",
		hands="Otronif gloves +1",
		left_ring="K'ayres Ring",
		right_ring="Bomb Queen Ring",
		back="Trepidity Mantle",
		legs="Nahtirah Trousers",
		feet="Otronif boots +1"
	}
	
	sets['vit'] = {
		ammo="Bibiki Seashell",
		body="Qaaxo harness",
		hands="Otronif gloves +1",
		left_ring="terrasoul ring",
		legs="Anch. Hose +1",
		feet="Otronif boots +1"
	}
	
	sets['str'] = {
		ammo="Thew Bomblet",
		head="Felistris Mask",
		body="Qaaxo Harness",
		left_ring="Pyrosoul Ring",
		right_ring="Pyrosoul Ring",
		back="Nifty Mantle",
		waist="Black belt",
		legs="Anch. Hose +1",
	}
	
	sets['da'] = {
		head="Felistris Mask",
		neck="Asperity Necklace",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		body="Qaaxo Harness",
		hands="Onimusha-no-kote",
		right_ring="Epona's Ring",
		back="Atheling Mantle",
		waist="Windbuffet belt +1",
		feet="Otronif boots +1"
	}
	
	sets['att'] = {
		ammo="Thew Bomblet",
		neck="Asperity Necklace",
		left_ring="Mars's Ring",
		back="Atheling Mantle",
		feet="Otronif boots +1"
	}
	
	sets['mele_stp'] = nil
	
	sets['subtle_blow'] = nil
	
	sets['mab'] = { }
	
	sets['WS'] = {}
	sets.WS['Combo'] = {
		baseset=sets.da
	}
	
	sets.WS['Shoulder Tackle'] = {
		baseset=sets.da,
	}
	
	sets.WS['One Inch Punch'] = {
		baseset=sets.da,
	}
	
	sets.WS['Backhand Blow'] = {
		baseset=sets.da,
	}
	
	sets.WS['Raging Fists'] = {
		baseset=sets.da,
	}
	
	sets.WS['Spinning Attack'] = {
		baseset=sets.da,
	}
	
	sets.WS['Howling Fist'] = {
		baseset=sets.da,
	}
	
	sets.WS['Dragon Kick'] = {
		baseset=sets.da,
	}
	
	sets.WS['Asuran Fists'] = {
    ammo="Thew Bomblet",
    head="Felistris Mask",
    body="Anch. Cyclas +1",
    hands="Onimusha-no-Kote",
    legs="Anch. Hose +1",
    feet={ name="Hes. Gaiters +1", augments={'Enhances "Mantra" effect',}},
    neck="Asperity Necklace",
    waist="Black Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back="Atheling Mantle",
	}
	
	sets.WS["Ascetic's Fury"] = {
		baseset=sets.da,
	}
	
	sets.WS['Tornado Kick'] = {
		baseset=sets.da,
	}
	
	sets.WS['Victory Smite'] = {
		baseset=sets.da,
		ammo="Honed Tathlum",
		neck="Asperity Necklace",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		body="Anchorite's Cyclas +1",
		left_ring="Pyrosoul Ring",
		right_ring="Epona's ring",
		back="Atheling Mantle",
		waist="Windbuffet belt +1",
		legs="Hes. Hose +1",
		feet="Hes. Gaiters +1"
	}
	
	sets.WS['Shijin Spiral'] = {
		baseset=sets.da,
		ammo="Honed Tathlum",
		neck="Asperity Necklace",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		right_ring="Epona's ring",
		back="Atheling Mantle",
		waist="Windbuffet belt +1"
	}
	
	sets.WS['Final Heaven'] = {
		baseset=sets.da,
		neck="Light Gorget",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		right_ring="Epona's ring",
		back="Atheling Mantle",
		waist="Light belt"
	}
	
	sets.WS['Shining Strike'] = {
		baseset=sets.da,
	}
	
	sets.WS['Seraph Strike'] = {
		baseset=sets.da,
	}
	
	sets.WS['Brainshaker'] = {
		baseset=sets.da,
	}
	
	sets.WS['Starlight'] = {
		baseset=sets.da,
	}
	
	sets.WS['Moonlight'] = {
		baseset=sets.da,
	}
	
	sets.WS['Skullbreaker'] = {
		baseset=sets.da,
	}
	
	sets.WS['True Strike'] = {
		baseset=sets.da,
	}
	
	sets.WS['Judgement'] = {
		baseset=sets.da,
	}
	
	sets.WS['Black Halo'] = {
		baseset=sets.da,
	}
	
	sets.WS['Flash Nova'] = {
		baseset=sets.da,
	}
	
	sets.WS['Heavy Swing'] = {
		baseset=sets.da,
	}
	
	sets.WS['Rock Crusher'] = {
		baseset=sets.da,
	}
	
	sets.WS['Earth Crusher'] = {
		baseset=sets.da,
	}
	
	sets.WS['Starburst'] = {
		baseset=sets.da,
	}
	
	sets.WS['Sunburst'] = {
		baseset=sets.da,
	}
	
	sets.WS['Shell Crusher'] = {
		baseset=sets.da,
	}
	
	sets.WS['Full Swing'] = {
		baseset=sets.da,
	}
	
	sets.WS['Spirit Taker'] = {
		baseset=sets.da,
	}
	
	sets.WS['Retribution'] = {
		baseset=sets.da,
	}
	
	sets.WS['Cataclysm'] = {
		baseset=sets.da,
	}
	
	sets['JA'] = {}
	
	sets.JA['Hundred Fists'] = {
		legs="Hes. Hose +1"
	}

	sets.JA['Focus'] = {
		head="Temple Crown"
	}

	sets.JA['Dodge'] = {
		feet="Anch. Gaiters"
	}

	sets.JA['Chakra'] = {
		baseset=vit,
		body="Anchorite's Cyclas +1",
		hands="Hes. Gloves"
	}

	sets.JA['Boost'] = {
		hands="Anchorite's gloves"
	}

	sets.JA['Counterstance'] = {
	
	}

	sets.JA['Chi Blast'] = {
	
	}

	sets.JA['Mantra'] = {
		feet="Hes. Gaiters +1"
	}

	sets.JA['Formless Strikes'] = {
		body="Hes. Cyclas"
	}

	sets.JA['Footwork'] = {
	
	}

	sets.JA['Perfect Counter'] = {
	
	}

	sets.JA['Impetus'] = {
	
	}

	sets.JA['Inner Strength'] = {
	
	}

	-- Warrior sub
	sets.JA['Berserk'] = {
	
	}

	sets.JA['Warcry'] = {
	
	}

	sets.JA['Defender'] = {
	
	}

	sets.JA['Aggressor'] = {
	
	}

	sets.JA['Provoke'] = {
	
	}

	-- Dancer sub
	sets.JA['Drain Samba'] = {
	
	}
	
	sets.JA['Drain Samba II'] = {
	
	}
	
	sets.JA['Aspir Samba'] = {
	
	}
	
	sets.JA['Haste Samba'] = {
	
	}
	
	sets['chr'] = {
	
	}
	
	sets.JA['Curing Waltz'] = {
		baseset=sets.chr
	}
	
	sets.JA['Curing Waltz II'] = sets.JA['Curing Waltz']
	
	sets.JA['Curing Waltz III'] = sets.JA['Curing Waltz']
	
	sets.JA['Healing Waltz'] = sets.JA['Curing Waltz']
	
	sets.JA['Divine Waltz'] = sets.JA['Curing Waltz']
	
	sets.JA['Spectral Jig'] = {
	
	}
	
	sets.JA['Quickstep'] = {
	
	}
	
	sets.JA['Box Step'] = {
	
	}
	
	sets.JA['Stutter Step'] = {
	
	}
	
	sets.JA['Animated Flourish'] = {
	
	}
	
	sets.JA['Desperate Flourish'] = {
	
	}
	
	sets.JA['Violent Flourish'] = {
	
	}
	
	sets.JA['Reverse Flourish'] = {
	
	}
	
	-- Rune Fencer Sub
	sets['rune enhancement'] = {}
	
	sets.JA['Ignis'] = sets['rune enhancement']
	sets.JA['Gelus'] = sets['rune enhancement']
	sets.JA['Flabra'] = sets['rune enhancement']
	sets.JA['Tellus'] = sets['rune enhancement']
	sets.JA['Sulpor'] = sets['rune enhancement']
	sets.JA['Unda'] = sets['rune enhancement']
	sets.JA['Lux'] = sets['rune enhancement']
	sets.JA['Tenebrae'] = sets['rune enhancement']
	
	sets.JA['Swordplay'] = {}
	
	sets['ward'] = {}
	
	sets.JA['Vallation'] = sets.ward
	sets.JA['Pflug'] = sets.ward
	
	sets['effusion'] = {
		baseset=sets.mab
	}
	
	sets.JA['Swipe'] = sets.effusion
	sets.JA['Lunge'] = sets.effusion
	
	-- Ninja subjob
	
	-- sam subjob
	sets.JA['Meditate'] = {}
	
	sets.MA = {}
	
	add_trusts()
	
	sets.MA['fast cast'] = {
		ammo='Impatiens',
		head="Athos's chapeau",
		right_ear='Loquac. Earring',
		body='Qaaxo Harness',
		hands='Thaumas gloves',
		right_ring='Prolix Ring',
		waist='Black Belt'
	}
	
	sets.MA['Katon: Ichi'] = sets.MA['fast cast']
	sets.MA['Katon: Ni'] = sets.MA['fast cast']
	sets.MA['Hyoton: Ichi'] = sets.MA['fast cast']
	sets.MA['Hyoton: Ni'] = sets.MA['fast cast']
	sets.MA['Huton: Ichi'] = sets.MA['fast cast']
	sets.MA['Huton Ni'] = sets.MA['fast cast']
	sets.MA['Doton: Ichi'] = sets.MA['fast cast']
	sets.MA['Doton:: Ni'] = sets.MA['fast cast']
	sets.MA['Raiton: Ichi'] = sets.MA['fast cast']
	sets.MA['Raiton: Ni'] = sets.MA['fast cast']
	sets.MA['Suiton: Ichi'] = sets.MA['fast cast']
	sets.MA['Suiton: Ni'] = sets.MA['fast cast']
	sets.MA['Jubaku: Ichi'] = sets.MA['fast cast']
	sets.MA['Hojo: Ichi'] = sets.MA['fast cast']
	sets.MA['Hojo: Ni'] = sets.MA['fast cast']
	sets.MA['Kurayami: Ichi'] = sets.MA['fast cast']
	sets.MA['Kurayami Ni'] = sets.MA['fast cast']
	sets.MA['Dokumori: Ichi'] = sets.MA['fast cast']
	sets.MA['Tonko: Ichi'] = sets.MA['fast cast']
	sets.MA['Tonko: Ni'] = sets.MA['fast cast']
	sets.MA['Monomi: Ichi'] = sets.MA['fast cast']
	
	sets.MA['Utsusemi: Ichi'] = {
		baseset=sets.MA['fast cast'],
		neck="Magoraga beads"
	}
	
	sets.MA['Utsusemi: Ni'] = sets.MA['Utsusemi: Ichi']

	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {}
	
end
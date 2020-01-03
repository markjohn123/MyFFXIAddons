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
	
	sets.weapons["midnights"]  = {
    main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
    range="Animator P +1",
    ammo="Automat. Oil +3",
	}
	
	sets.weapons["Animator P +1"]  = {
    main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
    range="Animator P +1",
    ammo="Automat. Oil +3",
	}
	
	sets.weapons["Divinator2"]  = {
    main={ name="Midnights", augments={'Pet: Attack+25','Pet: Accuracy+25','Pet: Damage taken -3%',}},
    range="Animator P +1",
    ammo="Automat. Oil +3",
	}
	
	sets.weapons['h2h'] = sets.weapons.midnights
	
  sets.master_pet_idle = {
		feet="Hermes' Sandals",
	}
	
	sets['minus_hp'] = {
    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
    body="Carpenter's Apron",
    hands="Carpenter's Gloves",
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Rimeice Earring",
    left_ring="Mephitas's Ring",
    right_ring="Bifrost Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	sets['Idle'] = {
    head="Karagoz Capello +1",
    body="Tali'ah Manteel +1",
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets['Engaged'] = {
    head="Karagoz Capello +1",
    body="Tali'ah Manteel +1",
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['DA'] = sets.Idle
	sets.Engaged['DA'] = {
    head="Hizamaru Somen +1",
    body="Tali'ah Manteel +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+13','"Store TP"+6','AGI+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','Accuracy+8','Attack+13',}},
    feet="Tali'ah Crackows +1",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epona's Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.Idle['ACC'] = sets.Idle
	sets.Engaged['ACC'] = {
--    head={ name="Taeon Chapeau", augments={'Accuracy+22','"Triple Atk."+2','Pet: Damage taken -3%',}},
	  head="Hizamaru somen +1",
--    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Crit. hit damage +2%','AGI+7','Accuracy+14',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
--    legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Triple Atk."+1','Accuracy+10','Attack+13',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Sanctity Necklace",
    waist="Hurch'lan sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.Idle["PETMAB"] = {
		neck="Deino Collar",
    head={ name="Taeon Chapeau", augments={'Pet: "Mag.Atk.Bns."+13','"Triple Atk."+2',}},
    body={ name="Taeon Tabard", augments={'Pet: "Mag.Atk.Bns."+17','Pet: "Dbl. Atk."+1',}},
    hands={ name="Taeon Gloves", augments={'Pet: "Mag.Atk.Bns."+22',}},
    legs={ name="Herculean Trousers", augments={'Pet: "Mag.Atk.Bns."+30','Pet: "Regen"+3','Pet: DEX+14',}},
    feet={ name="Taeon Boots", augments={'Pet: "Mag.Atk.Bns."+25',}},
    waist="Incarnation Sash",
--    back="Argocham. Mantle",
	}
	
	sets.Engaged["PETMAB"] = sets.Idle["PETMAB"]

	sets.Idle["PETACC"] = {
		legs="Deino Collar",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
--		head="Karagoz capello +1",
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet:"Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Sanctity Necklace",
    waist="Incarnation sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.Engaged["PETACC"] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
--		head="Karagoz capello +1",
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet:"Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Shulmanu Collar",
    waist="Incarnation sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
    head={ name="Otronif Mask +1", augments={'Phys. dmg. taken -3%','"Mag.Def.Bns."+1',}},
    body={ name="Otro. Harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -4%','Attack+5',}},
    neck="Twilight Torque",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Rimeice Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Umbra Cape",
			PDT={
		}		
	}

	sets.Idle['PETPDT'] = {
    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet:"Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Domesticator's Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.Engaged['PETPDT'] = {
    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet:"Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Domesticator's Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
		baseset=tempEngagedset,
			PDT={
		}		
	}
	
	sets.Idle['PETDA'] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	sets.Engaged['PETDA'] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
--    legs="Tali'ah Sera. +1",
		legs="Rao haidate +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	sets.Idle['PETTANK'] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
--    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body="Rao Togi +1",
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
--    legs="Tali'ah Sera. +1",
		legs="Rao haidate +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Overbearing Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	sets.Engaged['PETTANK'] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
		body="Rao Togi +1",
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
--    legs="Tali'ah Sera. +1",
		legs="Rao haidate +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Shulmanu Collar",
    waist="Klouskap Sash",
    left_ear="Domes. Earring",
    right_ear="Rimeice Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	sets.Idle['STP'] = sets.Idle['PETDA']
	
	sets.Engaged['STP'] = {
    head="Tali'ah Turban +1",
    body="Tali'ah Manteel +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+13','"Store TP"+6','AGI+5',}},
    legs={ name="Rao Haidate +1", augments={'Pet: HP+125','Pet: Accuracy+20','Pet: Damage taken -4%',}},
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Epona's Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
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
	}
	
	-- PUP can't wear twilight
	sets.Idle['TWILIGHT'] = nil
	
	sets.Engaged['TWILIGHT'] = nil
	
	sets['dex'] = {
	}
	
	sets['mnd'] = {
	}
	
	sets['hp'] = {
	}
	
	sets['vit'] = {
	}
	
	sets['str'] = {
	}
	
	sets['da'] = {
	}
	
	sets['att'] = {
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
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
    hands="Tali'ah Gages +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+2','Crit.hit rate+4','AGI+4',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
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
	}
	
	sets.WS["Ascetic's Fury"] = {
		baseset=sets.da,
	}
	
	sets.WS['Tornado Kick'] = {
		baseset=sets.da,
	}
	
	sets.WS['Victory Smite'] = {
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
    hands="Tali'ah Gages +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+2','Crit.hit rate+4','AGI+4',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.WS['Stringing Pummel'] = {
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
    hands="Tali'ah Gages +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+2','Crit.hit rate+4','AGI+4',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	sets.WS['Shijin Spiral'] = {
    head="Hizamaru Somen +1",
--    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Crit. hit damage +2%','AGI+7','Accuracy+14',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs="Hiza. Hizayoroi +1",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Clotharius Torque",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Zilant Ring",
    right_ring="Rufescent Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
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
	

	sets.JA['Overdrive'] = {
		body="Pitre Tobe"
	}

	sets.JA['Activate'] = {
	}

	sets.JA['Repair'] = {
		right_ear="Pratik earring",
	}

	sets.JA['Role Reversal'] = {
		feet="Pitre Babouches"
	}

	sets.JA['Ventriloquy'] = {
	
	}

	sets.JA['Tactical Switch'] = {
	
	}

	sets.JA['Cooldown'] = {
	}

	sets.JA['Deus Ex Automata'] = {
	}

	sets.JA['Maintenance'] = {
	
	}

	sets.JA['Heady Artifice'] = {
	
	}
	
	sets['PET'] = {}
	
	sets.PET['Deploy'] = {}
	
	sets.PET['Deactivate'] = {}
	
	sets.PET['Retrieve'] = {}
	
	sets['maneuver'] = {
		neck="Buffoon's Collar",
		hands="Foire Dastanas +3",
		body="Kara. Farsetto +1",
		back="Visucius's mantle",
	}
	
	sets.PET['Fire Maneuver'] = sets.maneuver
	
	sets.PET['Ice Maneuver'] = sets.maneuver
	
	sets.PET['Wind Maneuver'] = sets.maneuver
	
	sets.PET['Earth Maneuver'] = sets.maneuver
	
	sets.PET['Thunder Maneuver'] = sets.maneuver
	
	sets.PET['Water Maneuver'] = sets.maneuver
	
	sets.PET['Light Maneuver'] = sets.maneuver
	
	sets.PET['Dark Maneuver'] = sets.maneuver

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
	
	-- White Mage subjob
	sets.JA['Divine Seal'] = {}

	sets.MA = {}
	
	add_trusts()
	
	sets.MA['fast cast'] = {
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
	
	
	sets["PET"]["Physical Weaponskills"] = {
    --head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    head="Karagoz capello +1",
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet:"Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Shulmanu Collar",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Dispersal Mantle",
	}
	
	sets["PET"]["Ranged Weaponskills"] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet:"Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Shulmanu Collar",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Dispersal Mantle",
	}
	
	sets["PET"]["mab"] = {
	
	}
	
	-- Physical puppet weaponskills
	sets.PET["Slapstick"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Knockout"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Magic Mortar"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Chimera Ripper"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["String Clipper"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Cannibal Blade"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Bone Crusher"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["String Shredder"] = sets["PET"]["Physical Weaponskills"]
	
	-- Ranged puppet weaponskills
	sets.PET["Arcuballista"] = sets["PET"]["Ranged Weaponskills"]
	sets.PET["Daze"] = sets["PET"]["Ranged Weaponskills"]
	sets.PET["Armor Piercer"] = sets["PET"]["Ranged Weaponskills"]
	sets.PET["Armor Shatterer"] = sets["PET"]["Ranged Weaponskills"]

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
end
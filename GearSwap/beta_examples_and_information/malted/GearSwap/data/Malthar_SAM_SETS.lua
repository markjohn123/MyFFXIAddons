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
	
	sets.weapons["amano"]  = {
		main="Amanomurakumo", sub="Bloodrain strap"
	}
	
	sets.weapons["koga"]  = {
		main="Kogarasumaru", sub="Bloodrain strap"
	}
	
	sets.weapons["great katana"] = sets.weapons["koga"]
	
	sets['Idle'] = {
    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','STR+7','Attack+4',}},
    body="Chozor. Coselete",
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
    feet="Danzo Sune-Ate",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring="Defending Ring",
    back="Repulse Mantle",
	}
	
	sets['Engaged'] = {
    ammo="Ginsen",
    head="Sakonji Kabuto +1",
    body="Kasuga Domaru +1",
    hands={ name="Acro Gauntlets", augments={'Accuracy+16 Attack+16','"Store TP"+5','HP+43',}},
    legs="Kasuga Haidate +1",
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -4%','Attack+5',}},
    neck="Ganesha's Mala",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Petrov Ring",
    right_ring="K'ayres Ring",
    back="Takaha Mantle",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Idle['ACC'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['ACC'] = {
		baseset=tempEngagedset,
    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','STR+7','Attack+4',}},
    body={ name="Xaddi Mail", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
    hands={ name="Xaddi Gauntlets", augments={'Accuracy+15','"Store TP"+3','"Dbl.Atk."+2',}},
    legs={ name="Valor. Hose", augments={'Accuracy+30','Rng.Acc.+23','Accuracy+17 Attack+17','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet="Waki. Sune-Ate +1",
    neck="Sanctity necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Mouflon Ring",
    right_ring="Patricius Ring",
    back="Takaha Mantle",
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
    head="Lithelimb Cap",
    body="Chozor. Coselete",
    hands="Umuthi Gloves",
    legs={ name="Xaddi Cuisses", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -4%','Attack+5',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring="Defending Ring",
    back="Repulse Mantle",
		PDT={
	    head="Lithelimb Cap",
    	body={ name="Xaddi Mail", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
  	  hands="Umuthi Gloves",
  	  legs={ name="Xaddi Cuisses", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
    feet={ name="Otronif Boots +1", augments={'Attack +5', 'Phys. dmg. taken -4%',}},
		}
	}
	
	sets.Idle['ACCPDT'] = {
		baseset=tempIdleset,
	}

	sets.Engaged['ACCPDT'] = {
    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','STR+7','Attack+4',}},
    body="Kasuga Domaru +1",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Valor. Hose", augments={'Accuracy+30','Rng.Acc.+23','Accuracy+17 Attack+17','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Founder's Greaves", augments={'VIT+9','Accuracy+14','"Mag.Atk.Bns."+13','Mag. Evasion+15',}},
    neck="Agitator's Collar",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+3','"Store TP"+1','Meditate eff. dur. +6',}},
    PDT={
	    head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','STR+7','Attack+4',}},
	    body="Kasuga Domaru +1",
	    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
	    legs={ name="Valor. Hose", augments={'Accuracy+30','Rng.Acc.+23','Accuracy+17 Attack+17','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
	    feet={ name="Founder's Greaves", augments={'VIT+9','Accuracy+14','"Mag.Atk.Bns."+13','Mag. Evasion+15',}},
    }
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
		PDT={
		
		}
		
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.PDT,
    head="Yaoyotl Helm",
    body="Chozor. Coselete",
    hands="Kasuga Kote +1",
    legs={ name="Xaddi Cuisses", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
    feet={ name="Amm Greaves", augments={'HP+40','VIT+7','Accuracy+12',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring="Defending Ring",
    back={ name="Takaha Mantle", augments={'STR+3','"Zanshin"+3','"Store TP"+1','Meditate eff. dur. +6',}},
		PDT={
		
		}
		
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
		PDT={
		
		}
		
		
	}
	
	sets.Idle['DT'] = {
		baseset=sets.Engaged.PDT,
	}
	
	sets.Engaged['DT'] = {
		baseset=sets.Engaged.PDT,
	}
	
	sets.Idle['TWILIGHT'] = {
		baseset=sets.Idle['PDT'],
		head='Twilight Helm',
		body='Twilight Mail',
		PDT={
			head='Twilight Helm',
			body='Twilight Mail'
		}
	}
	
	sets.Engaged['TWILIGHT'] = {
		baseset=sets.Engaged['PDT'],
		head='Twilight Helm',
		body='Twilight Mail',
		PDT={
			head='Twilight Helm',
			body='Twilight Mail'
		}	
	}
	
	sets['str'] = {
    ammo="Thew Bomblet",
    head="Wakido Kabuto +1",
    body={ name="Acro Surcoat", augments={'Accuracy+17 Attack+17','"Dbl.Atk."+3','Sklchn. dmg. +5%',}},
    hands="Wakido Kote +1",
    legs={ name="Acro Breeches", augments={'Accuracy+18 Attack+18','"Dbl.Atk."+3','Sklchn. dmg. +3%',}},
    feet={ name="Sak. Sune-Ate +1", augments={'Enhances "Meikyo Shisui" effect',}},
    neck="Justice Torque",
    waist="Wanion Belt",
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
	}
	
	sets['da'] = {
    ammo="Paeapua",
    body={ name="Acro Surcoat", augments={'Accuracy+17 Attack+17','"Dbl.Atk."+3','Sklchn. dmg. +5%',}},
    hands={ name="Xaddi Gauntlets", augments={'Accuracy+15','"Store TP"+3','"Dbl.Atk."+2',}},
    legs={ name="Acro Breeches", augments={'Accuracy+18 Attack+18','"Dbl.Atk."+3','Sklchn. dmg. +3%',}},
    feet={ name="Acro Leggings", augments={'Accuracy+18 Attack+18','"Dbl. Atk."+2','STR+7 VIT+7',}},
    neck="Ganesha's Mala",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    back="Atheling Mantle",
	}
	
	sets['wsbase'] = {
    ammo="Paeapua",
    head={ name="Valorous Mask", augments={'Accuracy+25 Attack+25','"Dbl.Atk."+2','STR+7','Attack+4',}},
    body="Uac Jerkin",
    hands="Wakido Kote +1",
    legs={ name="Valor. Hose", augments={'Accuracy+22','Sklchn.dmg.+5%','DEX+9','Attack+14',}},
    feet={ name="Acro Leggings", augments={'Accuracy+18 Attack+18','"Dbl.Atk."+2','STR+7 VIT+7',}},
    neck="Ganesha's Mala",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Rufescent Ring",
    right_ring="Apate Ring",
    back="Smertrios's Mantle",
	}
	
	sets['WS'] = {}
	
	sets.WS['Tachi: Enpi'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Hobaku'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Goten'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Kagero'] = {
		basesets={sets.wsbase},
    ammo="Erlene's Notebook",
    head="Highwing Helm",
    body="Phorcys Korazin",
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs="Limbo Trousers",
    feet={ name="Founder's Greaves", augments={'VIT+9','Accuracy+14','"Mag.Atk.Bns."+13','Mag. Evasion+15',}},
    neck="Deviant Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring={ name="Demon's Ring", augments={'"Mag.Atk.Bns."+3','Mag. crit. hit dmg. +2%','"Resist Curse"+2',}},
    back="Argocham. Mantle",
	}
	
	sets.WS['Tachi: Jinpu'] = {
		basesets={sets.wsbase},
    ammo="Erlene's Notebook",
    head="Highwing Helm",
    body="Phorcys Korazin",
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs="Limbo Trousers",
    feet={ name="Founder's Greaves", augments={'VIT+9','Accuracy+14','"Mag.Atk.Bns."+13','Mag. Evasion+15',}},
    neck="Deviant Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring={ name="Demon's Ring", augments={'"Mag.Atk.Bns."+3','Mag. crit. hit dmg. +2%','"Resist Curse"+2',}},
    back="Argocham. Mantle",
	}
	
	sets.WS['Tachi: Koki'] = {
		basesets={sets.wsbase},
    ammo="Erlene's Notebook",
    head="Highwing Helm",
    body="Phorcys Korazin",
    hands={ name="Founder's Gauntlets", augments={'STR+10','Attack+15','"Mag.Atk.Bns."+15','Phys. dmg. taken -5%',}},
    legs="Limbo Trousers",
    feet={ name="Founder's Greaves", augments={'VIT+9','Accuracy+14','"Mag.Atk.Bns."+13','Mag. Evasion+15',}},
    neck="Deviant Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring={ name="Demon's Ring", augments={'"Mag.Atk.Bns."+3','Mag. crit. hit dmg. +2%','"Resist Curse"+2',}},
    back="Argocham. Mantle",
	}
	
	sets.WS['Tachi: Yukikaze'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Gekko'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Kasha'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Kaiten'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Rana'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Ageha'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Fudo'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Tachi: Shoha'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Double Thrust'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Thunder Thrust'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Raiden Thrust'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Leg Sweep'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Penta Thrust'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Vorpal Thrust'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Impuse Drive'] = {
		basesets={sets.wsbase},
	}
	
	sets.WS['Sonic Thrust'] = {
		basesets={sets.wsbase},
    ammo="Thew Bomblet",
    head="Sukeroku Hachi.",
    body="Phorcys Korazin",
    hands="Onimusha-no-Kote",
    legs="Wakido Haidate +1",
    feet={ name="Sak. Sune-Ate +1", augments={'Enhances "Meikyo Shisui" effect',}},
    neck="Soil Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
	}
	
	sets['JA'] = {}
	
	sets.JA['Meiko Shisui'] = {
		feet="Sakonji sune-ate +1"
	}

	sets.JA['Third Eye'] = {
		legs="Sakonji haidate +1"
	}
	
	sets.JA['Shikikoyo'] = {
		legs="Sakonji haidate +1"
	}

	sets.JA['Meditate'] = {
		head="Wakido kabuto +1",
		hands="Sakonji kote +1",
		back="Takaha Mantle",
	}

	sets.JA['Warding Circle'] = {
		head="Wakido kabuto +1",
	}

	sets.JA['Blade Bash'] = {
		hands="Sakonji kote +1"
	}

	sets.JA['Hasso'] = {
		hands="Wakido kote +1",
		legs="Kasuga haidate +1"
	}

	sets.JA['Seigan'] = {
		head="Kasuga kabuto +1"
	}

	sets.JA['Sekkanoki'] = {
		hands="Kasuga kote +1"
	}

	sets.JA['Sengikori'] = {
		feet="Kasuga sune-ate +1"
	}

	sets.JA['Hamanoha'] = {
	
	}

	sets.JA['Hagakure'] = {
	
	}

	sets.JA['Konzen-ittai'] = {
	
	}

	sets.JA['Yaegasumi'] = {
	
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

	sets.JA['Haste Samba'] = {
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
	
	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
--	sets['buff active']['Hasso'] = {
--		legs="Kasuga haidate +1"
--	}
	
	sets['buff active']['Seigan'] = {
		head="Kasuga Kabuto +1"
	}
	
	sets['buff active']['Third Eye'] = {
		legs="Sakonji haidate +1"
	}
	sets['buff active']['Sekkanoki'] = {
		hands="Kasuga kote +1"
	}
	
	sets['buff active']['Sengikori'] = {
		feet="Kasuga sune-ate +1"
	}
		
	sets['ITEM'] = {}
	
	sets.ITEM['Remedy'] = {}
	sets.ITEM['Holy Water'] = {
		left_ring="Ephedra Ring",
		right_ring="Saida Ring"
	}
	
	sets['react'] = {}
	sets.react['abilities'] = {}
	sets.react['spells'] = {}
	sets.react['Death'] = {
		Head="Flawless Ribbon",
		left_ring="Shadow Ring",
		right_ring="Eihwaz Ring"
	}
	
	sets.react.spells['Death'] = sets.react.Death
	sets.react.abilities['Perdition'] = sets.react.Death
	sets.react.spells['Cursna'] = {right_ring="Saida Ring"}
end
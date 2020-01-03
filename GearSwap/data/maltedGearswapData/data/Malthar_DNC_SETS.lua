function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets.weapons["dagger"]  = {
    main={ name="Ipetam", augments={'Attack+15','"Store TP"+4','DMG:+11',}},
    sub={ name="Ipetam", augments={'Accuracy+12 Attack+12','"Dbl.Atk."+3','STR+14 VIT+14',}},
	}
	
	sets['Idle'] = {   
    ammo="Staunch Tathlum",
    head="Meghanada Visor +1",
    body="Meg. Cuirie +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
    feet="Skd. Jambeaux +1",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Repulse Mantle",
	}
	
	sets['Engaged'] = {
    ammo="Ginsen",
    head="Skormoth Mask",
    body="Macu. Casaque +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+11','"Triple Atk."+2','AGI+9','Attack+14',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','Accuracy+8','Attack+13',}},
--    feet={ name="Taeon Boots", augments={'Accuracy+22','"Dual Wield"+5',}},
		feet="Maculele Toeshoes +1",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['ACC'] = tempIdleSet
	sets.Engaged['ACC'] = tempEngagedset
	
	sets.Idle['STP'] = sets.Idle
	sets.Engaged['STP'] = {
    ammo="Ginsen",
    head={ name="Herculean Helm", augments={'Accuracy+22','"Store TP"+6',}},
    body="Macu. Casaque +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+13','"Store TP"+6','AGI+5',}},
    legs={ name="Herculean Trousers", augments={'"Store TP"+6','Accuracy+1',}},
    feet="Macu. Toeshoes +1",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+9','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
	}
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
    ammo="Staunch Tathlum",
    head="Meghanada Visor +1",
    body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','"Snapshot"+3',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
    feet="Meg. Jam. +1",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Mollusca Mantle",
		PDT={
	    head="Meghanada Visor +1",
	    body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','"Snapshot"+3',}},
	    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
	    legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
	    feet="Meg. Jam. +1",
		}		
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.PDT,
	}
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = sets.Engaged.PDT
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Engaged.PDT

	sets.Idle['COUNTER'] = sets.Idle
	
	-- Dancer can't wear twilight
	sets.Idle['TWILIGHT'] = nil
	
	sets.Engaged['TWILIGHT'] = nil
	
	sets['WS'] = {}
	
	-- Equip this set if climactic flourish is enabled during weaponskills
	sets['crit hit damage'] = {
		ammo="Charis feather",
		head="Maculele Tiara +1",
	}
	
	sets.WS['weaponskill default'] = {
    ammo="Charis Feather",
    head={ name="Lilitu Headpiece", augments={'STR+9','DEX+9','Attack+13','Weapon skill damage +2%',}},
    body={ name="Herculean Vest", augments={'Accuracy+30','Weapon skill damage +4%','DEX+4',}},
    hands="Meg. Gloves +1",
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Apate Ring",
    right_ring="Epona's Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
	
	sets.WS['mab'] = {
    ammo="Erlene's Notebook",
    head="Highwing Helm",
    body={ name="Samnuha Coat", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+11','"Dual Wield"+2',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
    legs={ name="Herculean Trousers", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','INT+9','"Mag.Atk.Bns."+10',}},
    feet="Sombra Leggings",
    neck="Deviant Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring={ name="Demon's Ring", augments={'"Mag.Atk.Bns."+3','Mag. crit. hit dmg. +2%','"Resist Curse"+2',}},
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
	
	sets.WS['Wasp Sting'] = sets.WS['weaponskill default']
	sets.WS['Viper Bite'] = sets.WS['weaponskill default']
	sets.WS['Shadowstich'] = sets.WS['weaponskill default']
	sets.WS['Gust Slash'] = sets.WS['weaponskill default']
	sets.WS['Cyclone'] = sets.WS.mab
	sets.WS['Energy Steal'] = { }
	sets.WS['Energy Drain'] = { }
	sets.WS['Dancing Edge'] = sets.WS['weaponskill default']
	sets.WS['Shark Bite'] = sets.WS['weaponskill default']
	sets.WS['Evisceration'] =  sets.WS['weaponskill default']
	sets.WS['Pyrrhic Kleos'] = {
    ammo="Charis Feather",
    head={ name="Lilitu Headpiece", augments={'STR+9','DEX+9','Attack+13','Weapon skill damage +2%',}},
    body={ name="Herculean Vest", augments={'Accuracy+30','Weapon skill damage +4%','DEX+4',}},
    hands="Meg. Gloves +1",
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Pixie Earring",
    right_ear="Ishvara Earring",
    left_ring="Rajas Ring",
    right_ring="Apate Ring",
    back={ name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
	}
	sets.WS['Aeolian Edge'] = sets.WS.mab
	sets.WS["Rudra's Storm"] =  sets.WS['weaponskill default']
	sets.WS["Exenterator"] =  sets.WS['weaponskill default']
	
		
	
	sets['JA'] = {}
	
	sets.JA['Trance'] = {
		head="Horos Tiara +1"
	}

	sets.JA['Drain Samba'] = {
		head="Maxixi tiara +1"
	}
	sets.JA['Drain Samba II'] = sets.JA['Drain Samba']
	sets.JA['Drain Samba III'] = sets.JA['Drain Samba']
	sets.JA['Aspir Samba'] = sets.JA['Drain Samba']
	sets.JA['Aspir Samba II'] = sets.JA['Drain Samba']
	sets.JA['Aspir Samba III'] = sets.JA['Drain Samba']
	sets.JA['Haste Samba'] = sets.JA['Drain Samba']

	sets['chr'] = {
	
	}
	sets.JA['Curing Waltz'] = {
    head={ name="Horos Tiara +1", augments={'Enhances "Trance" effect',}},
    body="Maxixi Casaque +1",
    hands="Meg. Gloves +1",
    legs="Feast Hose",
    feet="Maxixi Shoes",
    left_ear="Rimeice Earring",
    right_ear="Handler's Earring +1",
    left_ring="Asklepian Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back={ name="Toetapper Mantle", augments={'"Store TP"+2','"Dual Wield"+3','"Rev. Flourish"+17',}},
	}
	sets.JA['Curing Waltz II'] = sets.JA['Curing Waltz']
	sets.JA['Curing Waltz III'] = sets.JA['Curing Waltz']
	sets.JA['Curing Waltz IV'] = sets.JA['Curing Waltz']
	sets.JA['Curing Waltz V'] = sets.JA['Curing Waltz']
	sets.JA['Healing Waltz'] = sets.JA['Curing Waltz']
	sets.JA['Divine Waltz'] = sets.JA['Curing Waltz']
	sets.JA['Divine Waltz II'] = sets.JA['Curing Waltz']

	sets.JA['Spectral Jig'] = {
		legs="Horos Tights",
		feet="Maxixi Shoes"
	}
	sets.JA['Chocobo Jig'] = sets.JA['Spectral Jig']
	sets.JA['Chocobo Jig II'] = sets.JA['Spectral Jig']

	sets.JA['Quickstep'] = {
		head="Maxixi Tiara +1",
		left_ear="Choreia earring",
		hands="Maxixi Bangles +1",
		feet="Horos Toe Shoes +1"
	}	
	sets.JA['Box Step'] = sets.JA['Quickstep']	
	sets.JA['Stutter Step'] = sets.JA['Quickstep']
	sets.JA['Feather Step'] = {
		basesets={sets.JA['Quickstep']},
		feet="Maculele Toeshoes +1",
	}

	sets.JA['Animated Flourish'] = {
    ammo="Sapience Orb",
    head="Highwing Helm",
    hands="Kurys Gloves",
    waist="Sinew Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Eihwaz Ring",
    right_ring="Provocare Ring",
    back="Fravashi Mantle",
	}
	sets.JA['Desperate Flourish'] = {}
	sets.JA['Violent Flourish'] = {
		body="Horos casaque +1"
	}
	sets.JA['Reverse Flourish'] = {
		head="Maxixi Tiara +1",
		left_ear="Choreia Earring",
		hands="Maculele bangles",
		back="Toetapper Mantle",
		feet="Horos Toe Shoes +1"
	}
	sets.JA['Building Flourish'] = {}
	sets.JA['Wild Flourish'] = {}
	sets.JA['Climactic Flourish'] = {
		head="Maculele Tiara +1"
	}
	sets.JA['Striking Flourish'] = {
		body="Maculele Casaque +1"
	}
	sets.JA['Ternary Flourish'] = {}


	sets.JA['Fan Dance'] = {
		hands="Horos Bangles +1"
	}
	
	sets.JA['No Foot Rise'] = {
		body="Horos casaque +1"
	}
	
	sets.JA['Presto'] = {}
	sets.JA['Grand Pas'] = {}
	
	
	-- Warrior sub
	sets.JA['Berserk'] = {}
	sets.JA['Warcry'] = {}
	sets.JA['Defender'] = {}
	sets.JA['Aggressor'] = {}
	sets.JA['Provoke'] = {
    ammo="Sapience Orb",
    head="Highwing Helm",
    hands="Kurys Gloves",
    waist="Sinew Belt",
    left_ear="Trux Earring",
    right_ear="Cryptic Earring",
    left_ring="Eihwaz Ring",
    right_ring="Provocare Ring",
    back="Fravashi Mantle",
	}
	


	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {}
	sets['buff active']['Fan Dance'] = {
		hands="Horos Bangles +1"
	}
	
end
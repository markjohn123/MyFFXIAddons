function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets.weapons["dagger"]  = {
		main="Izhiikoh",
		sub="Atoyac",
		ammo="Honed tathlum"
	}
	
	sets.weapons["sabebus"]  = {
		main="Izhiikoh",
		sub="Sabebus",
		ammo="Jukukik Feather"
	}
	
	sets['Idle'] = {
   head="Espial Cap",
    body="Espial Gambison",
    hands="Espial Bracers",
    legs="Espial Hose",
    feet="Tandava Crackows",
    waist="Hurch'lan sash",
    left_ear="Steelflash earring",
    right_ear="Bladeborn Earring"
	}
	
	sets['Engaged'] = {
    head="Umbani cap",
    body="Espial Gambison",
    hands="Espial Bracers",
    legs="Espial Hose",
    feet="Qaaxo leggings",
    waist="Hurch'lan sash",
    left_ear="Steelflash earring",
    right_ear="Bladeborn Earring",
    left_ring="Dark Ring",
    right_ring="Dark Ring",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
			head="Iuitl Headgear",
			neck="Twilight Torque",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker earring",
			body="horos casaque +1",
			hands="Iuitl Wristbands +1",
			left_ring="Dark Ring",
			right_ring="Dark Ring",
			back="Repulse Mantle",
			waist="Flume Belt",
			legs="Iuitl Tights +1",
			feet="Iuitl Gaiters",
			PDT={
				head="Iuitl Headgear",
				body="horos casaque +1",
				hands="Iuitl Wristbands +1",
				legs="Iuitl Tights +1",
				feet="Iuitl Gaiters"
		}		
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.PDT,
			head="Felistris Mask",
			neck="Asperity Necklace",
			left_ear="Dudgeon Earring",
			right_ear="Heartseeker earring",
			body="horos casaque +1",
			hands="Iuitl Wristbands +1",
			left_ring="Dark Ring",
			right_ring="Epona's Ring",
			back="Repulse Mantle",
			waist="Flume Belt",
			legs="Iuitl Tights +1",
			feet="Horos Shoes +1",
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
	
	sets['crit hit damage'] = {
		ammo="Charis feather",
		back="Cavaros Mantle"
	}
	
	sets.WS['weaponskill default'] = {
    ammo="Charis Feather",
    head="Felistris Mask",
    body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
    hands={ name="Iuitl Wristbands +1"},
    legs="Maxixi Tights +1",
    feet={ name="Horos Shoes +1", augments={'Enhances "Closed Position" effect',}},
    neck="Asperity Necklace",
    waist="Windbuffet belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets.WS['mab'] = {
	
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
	sets.WS['Evisceration'] = {
    ammo="Charis Feather",
    head="Felistris Mask",
    body="Maxixi casaque +1",
    hands="Iuitl wristbands +1",
    legs={ name="Manibozho Brais", augments={'Attack+15','Accuracy+10','STR+10',}},
    feet="Wurrukatte Boots",
    neck="Asperity Necklace",
    waist="Windbuffet belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Rancorous Mantle",
	}
	sets.WS['Pyrrhic Kleos'] = {
    ammo="Charis Feather",
    head="Felistris Mask",
    body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
    hands="Qaaxo Mitaines",
    legs={ name="Manibozho Brais", augments={'Attack+15','Accuracy+10','STR+10',}},
    feet={ name="Horos Shoes +1", augments={'Enhances "Closed Position" effect',}},
    neck="Asperity Necklace",
    waist="Windbuffet belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Thundersoul Ring",
    back="Rancorous Mantle",
	}
	sets.WS['Aeolian Edge'] = sets.WS.mab
	sets.WS["Rudra's Storm"] = {
    ammo="Charis Feather",
    head="Felistris Mask",
    body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
    hands="Qaaxo Mitaines",
    legs={ name="Manibozho Brais", augments={'Attack+15','Accuracy+10','STR+10',}},
    feet={ name="Horos Shoes +1", augments={'Enhances "Closed Position" effect',}},
    neck="Asperity Necklace",
    waist="Windbuffet belt +1",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'Attack+4','TP Bonus +25',}},
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	sets.WS["Exenterator"] = {
    ammo="Charis Feather",
    head="Felistris Mask",
    body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
    hands={ name="Iuitl Wristbands +1"},
    legs="Nahtirah Trousers",
    feet={ name="Horos Shoes +1", augments={'Enhances "Closed Position" effect',}},
    neck="Soil Gorget",
    waist="Soil Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Stormsoul Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
		
	
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
		baseset=sets.chr,
    head={ name="Horos Tiara +1", augments={'Enhances "Trance" effect',}},
    body="Maxixi Casaque +1",
    hands="Qaaxo Mitaines",
    legs="Nahtirah Trousers",
    feet="Maxixi Shoes",
    left_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -6%',}},
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
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
		feet="Horos Shoes +1"
	}	
	sets.JA['Box Step'] = sets.JA['Quickstep']	
	sets.JA['Stutter Step'] = sets.JA['Quickstep']
	sets.JA['Feather Step'] = {
		basesets={
			sets.JA['Quickstep'],
		},
		feet="Maculele toeshoes"
	}			

	sets.JA['Animated Flourish'] = {
	
	}
	sets.JA['Desperate Flourish'] = {}
	sets.JA['Violent Flourish'] = {
		body="Horos casaque +1"
	}
	sets.JA['Reverse Flourish'] = {
		head="Maxixi Tiara +1",
		left_ear="Choreia Earring",
		hands="Charis Bangles +2",
		feet="Horos Shoes +1"
	}
	sets.JA['Building Flourish'] = {}
	sets.JA['Wild Flourish'] = {}
	sets.JA['Climactic Flourish'] = {
		head="Charis Tiara +2"
	}
	sets.JA['Striking Flourish'] = {
		body="Charis Casaque +2"
	}
	sets.JA['Ternary Flourish'] = {}


	sets.JA['Fan Dance'] = {
		hands="Horos Bangles"
	}
	
	sets.JA['No Foot Rise'] = {
		body="Horos casaque +1"
	}
	
	sets.JA['Presto'] = {}
	sets.JA['Grand Pas'] = {}
	
	
	-- Warrior sub
	sets.JA['Beserk'] = {}
	sets.JA['Warcry'] = {}
	sets.JA['Defender'] = {}
	sets.JA['Aggressor'] = {}
	sets.JA['Provoke'] = {}
	


	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {}
	
end
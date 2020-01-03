function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')
	
	-- Default battle state will be TH8
	battle_state = 'TH8'

	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets.weapons["dagger"]  = {
		main="Mandau",
		sub="Sandung",
		range="Aliyat"
	}
	
	sets['Idle'] = {
    head={ name="Iuitl Headgear", augments={'Phys. dmg. taken -4%','Rng.Acc.+10',}},
    body={ name="Manibozho Jerkin", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    hands="Plunderer's Armlets +1",
    legs="Iuitl Tights +1",
    feet="Fajin Boots",
    neck="Asperity Necklace",
    waist="Twilight Belt",
    left_ear="Dudgeon Earring",
    right_ear="Heartseeker Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets['Engaged'] = {
    head="Umbani Cap",
    body="Thaumas Coat",
    hands="Plunderer's Armlets +1",
    legs="Iuitl Tights +1",
    feet={ name="Manibozho boots", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    neck="Asperity Necklace",
    waist="Twilight Belt",
    left_ear="Dudgeon Earring",
    right_ear="Heartseeker Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged

	sets.Idle['TH8'] = {
		baseset=tempIdleset,
		hands="Plunderer's Armlets +1",
		waist="Chaac belt",
	}
	
	sets.Engaged['TH8'] = {
		baseset=tempEngagedset,
		hands="Plunderer's Armlets +1",
		waist="Chaac belt",
		feet="Raid. Poulaines +2"
	}
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
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

	sets.Idle['COUNTER'] = nil
	
	-- Thief can't wear twilight
	sets.Idle['TWILIGHT'] = nil
	
	sets.Engaged['TWILIGHT'] = nil
	
	sets['RA'] = {
    head="Umbani Cap",
    body={ name="Manibozho Jerkin", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -4%','Rng.Atk.+7',}},
    legs="Thurandaut Tights",
    feet={ name="Manibozho boots", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    neck="Arctier's Torque",
    left_ear="Clearview Earring",
    right_ear="Volley Earring",
    left_ring="Bellona's Ring",
    right_ring="Stormsoul Ring",
	}
	
	sets['dex'] = {
    head="Umbani Cap",
    body={ name="Manibozho Jerkin", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -4%','Rng.Atk.+7',}},
    legs={ name="Manibozho Brais", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    feet={ name="Manibozho boots", augments={'Evasion+15','Accuracy+10','AGI+10',}},
    left_ring="Rajas Ring",
	}
	
	sets['agi'] = {
		head="Umbani cap",
		neck="Houyi's Gorget",
		body="Manibozho Jerkin",
		hands="Iuitl Wristbands +1",
		left_ring="Stormsoul Ring",
		right_ring="Stormsoul Ring",
		legs="Nahtirah trousers",
		feet="Manibozho boots"
	}

	sets['crit hit rate'] = {
		head="Athos's Chapeau"
	}
	
	sets['crit hit damage'] = {
		back="Cavaros Mantle"
	}
	
	sets['attack'] = {
		head="Whirlpool Mask",
		right_ear="Bladeborn Earring",
		body="Manibozho Jerkin",
		hands="Manibozho Gloves",
		back="Atheling Mantle",
		legs="Manibozho Brais",
		feet="Manibozho boots"
	}
	
	sets['da'] = {
		neck="Asperity Necklace",
		left_ear="Steelflash Earring",
		right_ear="Bladeborn Earring",
		back="Atheling Mantle",
		feet="Manibozho boots"
	}
	
	sets['mab'] = {
	
	}
	
	sets['WS'] = {}

	sets.WS['default'] = {
		baseset=sets.da
	}
	
	sets.WS['Wasp Sting'] = {
	
	}
	
	sets.WS['Viper Bite'] = {
	
	}
	
	sets.WS['ShadoWStich'] = {
	
	}
	
	sets.WS['Gust Slash'] = {
		baseset=sets.mab
	}
	
	sets.WS['Cyclone'] = {
		baseset=sets.mab
	}
	
	sets.WS['Energy Steal'] = {
	
	}
	
	sets.WS['Energy Drain'] = {
	
	}
	
	sets.WS['Dancing Edge'] = {
	
	}
	
	sets.WS['Shark Bite'] = {
	
	}
	
	sets.WS['Evisceration'] = {
	
	}
	
	sets.WS['Mandalic Stab'] = {
	
	}
	
	sets.WS['Aeolian Edge'] = {
		baseset=sets.mab
	}
	
	sets.WS["Rudra's Storm"] = {
		baseset="dex"
	}
	
	sets.WS['Exenterator'] = {
		baseset="agi",
		neck="Soil Gorget",
		waist="Soil Belt"
	}
	
	sets['JA'] = {}
	
	sets.JA['Perfect Dodge'] = {
	
	}
	
	sets.JA['Flee'] = {
		feet="Rogue's poulaines"
	}
	
	sets.JA['Hide'] = {
	
	}
	
	
	sets['steal mug despoil'] = {
		head="Assassin's Bonnet",
		hands="Rog. Armlets +1",
		legs="Raid. Culottes +2",
		feet="Raid. Poulaines +2"
	}
	
	sets.JA['Steal'] = sets['steal mug despoil']
	
	sets.JA['Mug'] = sets['steal mug despoil']
	
	sets.JA['Despoil'] = sets['steal mug despoil']
	
	sets['sneak trick attack'] = {
		hands="Rog. Armlets +1"
	}
	
	sets.JA['Sneak Attack'] = {
		baseset=sets['sneak trick attack'],
		precast=sets.dex
	}
	
	sets.JA['Trick Attack'] = {
		baseset=sets['sneak trick attack'],
		precast=sets.dex
	}
	
	sets.JA['Accomplice'] = {
		head="Raid. Bonnet +2"
	}
	
	sets.JA['Collaborator'] = sets.JA['Accomplice']
	
	sets.JA['Conspirator'] = {
		body="Raider's Vest +1"
	}
	
	sets.JA["Assassin's Charge"] = {
		feet="Plun Poulaines +2"
	}
	
	sets.JA['Feint'] = {
	
	}
	
	sets.JA['Bully'] = {
	
	}
	
	sets.JA['Larceny'] = {
	
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
	
	-- Ninja subjob
	
	sets.MA = {}
	
	sets.MA['fast cast'] = {
		head="Athos's chapeau",
		right_ear='Loquac. Earring',
		body='Qaaxo Harness',
		hands='Thaumas gloves',
		right_ring='Prolix Ring',
		waist='Twilight Belt'
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
	
	sets.MA['Utsusemi: Ni'] = sets.MA['Utsusemi: ichi']

	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {}
	
end
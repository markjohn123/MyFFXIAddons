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
	
	sets.weapons["izuna"]  = {
    main={ name="Izuna", augments={'Accuracy+12','"Dbl.Atk."+4','System: 1 ID: 354 Val: 1',}},
    sub={ name="Izuna", augments={'Accuracy+14','Weaponskill Damage +2%','System: 1 ID: 354 Val: 1',}},
	}
	
	sets.weapons["kikoku"]  = {
    main="Kikoku",
    sub={ name="Izuna", augments={'Accuracy+14','Weaponskill Damage +2%','System: 1 ID: 354 Val: 1',}},
	}

	
	sets.weapons["tanking"]  = {
    main="kikoku",
    sub="Shuhansadamune",
	}
	
	sets.weapons["katanas"] = sets.weapons["kikoku"]
	
	sets.weapons["club"] = {
		main="Eosuchus club",
    sub={ name="Izuna", augments={'Accuracy+14','Weaponskill Damage +2%','System: 1 ID: 354 Val: 1',}},
	}
	
	sets.weapons["dagger"] = {
		main="Ternion dagger",
    sub={ name="Izuna", augments={'Accuracy+14','Weaponskill Damage +2%','System: 1 ID: 354 Val: 1',}},
	}
	
	sets.weapons["great katana"] = {
		main="honebami",
		sub="Bloodrain Strap",
	}
	sets.weapons["gk"] = sets.weapons["great katana"]
	
	sets.weapons["great sword"] = {
		main="",
		sub="",
	}
	sets.weapons["gs"] = sets.weapons["great sword"] 
	
	sets.weapons["katana"] = sets.weapons["katanas"]
	
	sets.weapons["polearm"] = {
		main="Pitchfork",
		sub="Bloodrain Strap",
	}
	sets.weapons["pa"] = sets.weapons["polearm"]
	
	sets.weapons["scythe"] = {
		main="Ark scythe",
		sub="Bloodrain Strap",
	}
	
	sets.weapons["staff"] = {
		main="Chatoyant Staff", 
		sub="Bloodrain Strap"
	}

	sets.weapons["sword"] = {
		main="Pukulatmuj +1",
    sub={ name="Izuna", augments={'Accuracy+14','Weaponskill Damage +2%','System: 1 ID: 354 Val: 1',}},
	}
	
	sets['Idle'] = {
    ammo="Happo Shuriken",
    head={ name="Otronif Mask +1", augments={'Phys. dmg. taken -3%','"Mag.Def.Bns."+1',}},
    body={ name="Otro. Harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
    feet="Danzo Sune-Ate",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Repulse Mantle",
	}
	
	sets['Engaged'] = {
    ammo="Happo Shuriken",
    head="Skormoth Mask",
    body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+11','"Triple Atk."+2','AGI+9','Attack+14',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','Accuracy+8','Attack+13',}},
    feet={ name="Loyalist Sabatons", augments={'STR+3','Attack+5',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
--[[
	sets.Idle['DW'] = sets.Idle
	sets.Engaged['DW'] = {
    ammo="Happo shuriken",
    head="Hattori Zukin +1",
    body={ name="Mochi. Chainmail +1", augments={'Enhances "Sange" effect',}},
    hands={ name="Taeon Gloves", augments={'Accuracy+18 Attack+18','"Dual Wield"+4',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2',}},
    feet={ name="Taeon Boots", augments={'Accuracy+22','"Dual Wield"+5',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
]]
	
--[[
	sets.Idle['EVASION'] = sets.Idle
	sets.Engaged['EVASION'] = {
    ammo="Happo shuriken",
    head={ name="Mochi. Hatsuburi +1", augments={'Increases elem. ninjutsu III damage',}},
    body={ name="Qaaxo Harness", augments={'Attack+15','Evasion+15','"Dbl.Atk."+2',}},
    hands="Hattori Tekko +1",
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Hattori Kyahan +1",
    neck="Bathy Choker",
    waist="Phasmida Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Pernicious Ring",
    right_ring="Epona's Ring",
    back="Fravashi Mantle",
	}
]]
	
	sets.Idle['ACC'] = sets.Idle
	sets.Engaged['ACC'] = {
    ammo="Happo Shuriken",
    head={ name="Taeon Chapeau", augments={'Accuracy+18','"Triple Atk."+2',}},
    body={ name="Mochi. Chainmail +1", augments={'Enhances "Sange" effect',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','"Triple Atk."+1','Accuracy+10','Attack+13',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Sanctity Necklace",
    waist="Kentarch Belt",
    left_ear="Brutal Earring",
    right_ear="Zennaroi Earring",
    left_ring="Cacoethic Ring",
    right_ring="Zilant Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
--[[
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
    ammo="Sihirik",
    head={ name="Otronif Mask +1", augments={'Phys. dmg. taken -3%','"Mag.Def.Bns."+1',}},
    body={ name="Otro. Harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
    feet="Danzo Sune-Ate",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Repulse Mantle",
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
    ammo="Sihirik",
    head={ name="Otronif Mask +1", augments={'Phys. dmg. taken -3%','"Mag.Def.Bns."+1',}},
    body={ name="Otro. Harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -4%','Attack+5',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Etiolation Earring",
    right_ear="Sanare Earring",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    back="Repulse Mantle",
			PDT={
		    head={ name="Otronif Mask +1", augments={'Phys. dmg. taken -3%','"Mag.Def.Bns."+1',}},
		    body={ name="Otro. Harness +1", augments={'Phys. dmg. taken -3%','Attack+8',}},
		    hands={ name="Otronif Gloves +1", augments={'Phys. dmg. taken -4%','Attack+7',}},
		    legs={ name="Otronif Brais +1", augments={'Phys. dmg. taken -3%','Attack+9',}},
		    feet={ name="Otronif Boots +1", augments={'Phys. dmg. taken -4%','Attack+5',}},
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

	-- Monk can't wear Twilight
	sets.Idle['Twilight'] = nil
	
	sets.Engaged['Twilight'] = nil
]]

	sets['enmity'] = {
    ammo="Aqreqaq Bomblet",
    hands="Nilas Gloves",
    left_ear="Cryptic Earring",
    right_ear="Trux Earring",
    left_ring="Provocare Ring",
    right_ring="Eihwaz Ring",
    back="Fravashi Mantle",
    feet="Mochizuki kyahan +1",
	}
	
	sets['dex'] = {
	}
	
	sets['str'] = {
	}
	
	sets['da'] = {
	}
	
	sets['att'] = {
	}
	
	sets['WS'] = {}
	
	sets['macc'] = {
    body="Mekosu. Harness",
    hands={ name="Taeon Gloves", augments={'"Mag.Atk.Bns."+20','"Counter"+2','STR+3 VIT+3',}},
    feet={ name="Taeon Boots", augments={'Accuracy+22','"Dual Wield"+5',}},
    waist="Salire Belt",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets['matt'] = {
    ammo="Seething Bomblet",
    head={ name="Mochi. Hatsuburi +1", augments={'Increases elem. ninjutsu III damage',}},
    body={ name="Samnuha Coat", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+11','"Dual Wield"+2',}},
    hands="Hattori Tekko +1",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring="Locus Ring",
    back="Argocham. Mantle",
	}
	
	sets.WS["Flash Nova"] = sets.matt
	
	sets.WS["Blade: Rin"] = {
    ammo="Aqreqaq Bomblet",
    head="Felistris Mask",
    body="Hattori Ningi +1",
    hands="Nilas Gloves",
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%'}},
    feet="Hattori Kyahan +1",
    neck="Asperity Necklace",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS["Blade: Retsu"] = {
    ammo="Jukukik Feather",
    head={ name="Lilitu Headpiece", augments={'STR+9','DEX+9','Attack+13','Weapon skill damage +2%',}},
    body="Hattori Ningi +1",
    hands="Hattori Tekko +1",
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Hattori Kyahan +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Thundersoul Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS["Blade: Teki"] = {
	
	}
	
	sets.WS["Blade: To"] = {
	
	}
	
	sets.WS["Blade: Chi"] = {
    ammo="Erlene's Notebook",
    head={ name="Mochi. Hatsuburi +1", augments={'Increases elem. ninjutsu III damage',}},
    body="Mekosu. Harness",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Mochi. Hakama +1", augments={'Enhances "Mijin Gakure" effect',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Deviant Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring={ name="Demon's Ring", augments={'"Mag.Atk.Bns."+3','Mag. crit. hit dmg. +2%','"Resist Curse"+2',}},
    back="Argocham. Mantle",
   }
	
	sets.WS["Blade: Ei"] = {
	
	}
	
	sets.WS["Blade: Jin"] = {
    ammo="Qirmiz Tathlum",
    head={ name="Taeon Chapeau", augments={'Accuracy+18','"Triple Atk."+2',}},
    body="Hattori Ningi +1",
    hands="Nilas Gloves",
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%'}},
    feet={ name="Taeon Boots", augments={'Accuracy+22','"Dual Wield"+5',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Garuda Ring",
    right_ring="Garuda Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS["Blade: Ten"] = {
    ammo="Aqreqaq Bomblet",
    head="Felistris Mask",
    body="Hattori Ningi +1",
    hands="Hattori Tekko +1",
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%'}},
    feet="Hattori Kyahan +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS["Blade: Ku"] = {
    ammo="Aqreqaq Bomblet",
    head="Felistris Mask",
    body="Hattori Ningi +1",
    hands="Hattori Tekko +1",
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Hattori Kyahan +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS["Blade: Yu"] = sets['matt']
	
	sets.WS['Blade: Hi'] = {
    ammo="Qirmiz Tathlum",
    head="Skormoth Mask",
    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Crit. hit damage +2%','AGI+7','Accuracy+14',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+11','"Triple Atk."+2','AGI+9','Attack+14',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Garuda Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS['Blade: Shun'] = {
    ammo="Ginsen",
    head="Skormoth Mask",
    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Crit. hit damage +2%','AGI+7','Accuracy+14',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+11','"Triple Atk."+2','AGI+9','Attack+14',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Garuda Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS['Blade: Metsu'] = {
    ammo="Ginsen",
    head="Skormoth Mask",
    body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','Crit. hit damage +2%','AGI+7','Accuracy+14',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+11','"Triple Atk."+2','AGI+9','Attack+14',}},
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Garuda Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS['Blade: Kamu'] = {
    ammo="Aqreqaq Bomblet",
    head="Felistris Mask",
    body="Hattori Ningi +1",
    hands={ name="Mochizuki Tekko +1", augments={'Enh. "Ninja Tool Expertise" effect',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%'}},
    feet={ name="Mochi. Kyahan +1", augments={'Reduces elem. ninjutsu III cast time',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Yokaze Mantle", augments={'STR+2','DEX+2','Sklchn.dmg.+1%','Weapon skill damage +3%',}},
	}
	
	sets.WS['Sunburst'] = {
		precast={
			head="Hakke hachimaki",
			neck="Temp. Torque",
		},
			head="Hakke hachimaki",
			neck="Temp. Torque",
	}
	
	sets['JA'] = {}
	
	sets['JA']['Mijin Gakure'] = {
		legs="Mochizuki hakama +1",
	}

	sets['JA']['Yonin'] = {
	
	}

	sets['JA']['Innin'] = {
	
	}

	sets['JA']['Futae'] = {
		hands="Hattori tekko +1",
	}

	sets['JA']['Issekigan'] = {
	
	}

	sets['JA']['Mikage'] = {
		back="Andartia's Mantle",
	}

	-- Warrior sub
	sets.JA['Berserk'] = {
		basesets={sets.enmity},
	}

	sets.JA['Warcry'] = {
		basesets={sets.enmity},
	}

	sets.JA['Defender'] = {
		basesets={sets.enmity},
	}

	sets.JA['Aggressor'] = {
		basesets={sets.enmity},
	}

	sets.JA['Provoke'] = {
		basesets={sets.enmity},
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
		baseset=sets.matt
	}
	
	sets.JA['Swipe'] = sets.effusion
	sets.JA['Lunge'] = sets.effusion
	
	-- sam subjob
	sets.JA['Meditate'] = {}
	
	sets.MA = {}
	
	add_trusts()
	
	sets['fast cast'] = {
		precast={
	    ammo="Impatiens",
	    head="Athos's Chapeau",
	    body={ name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
	    hands="Thaumas Gloves",
	    legs={ name="Taeon Tights", augments={'"Fast Cast"+5',}},
	    feet={ name="Taeon Boots", augments={'Accuracy+22','"Dual Wield"+5',}},
	    waist="Twilight Belt",
	    left_ear="Etiolation Earring",
	    right_ear="Loquac. Earring",
	    right_ring="Prolix Ring",
		}
	}
	
	sets["ninjutsu"] = {
		basesets={sets['fast cast'],},
		hands="Mochizuki tekko +1",
		feet="Mochizuki kyahan +1",
	}
	
	sets['matt_ninjutsu'] = {
		basesets={sets['matt'],sets["ninjutsu"],},
		precast={feet="Mochizuki kyahan +1",},
		hands="Hattori tekko +1"
	}
	
	sets['macc_ninjutsu'] = {
		basesets={sets['macc'],sets["ninjutsu"]},
	}
	
	
	sets.MA['Katon: Ichi'] 		= sets['matt_ninjutsu']
	sets.MA['Katon: Ni'] 			= sets['matt_ninjutsu']
	sets.MA['Katon: San'] 		= sets['matt_ninjutsu']
	sets.MA['Hyoton: Ichi'] 	= sets['matt_ninjutsu']
	sets.MA['Hyoton: Ni'] 		= sets['matt_ninjutsu']
	sets.MA['Hyoton: San'] 		= sets['matt_ninjutsu']
	sets.MA['Huton: Ichi'] 		= sets['matt_ninjutsu']
	sets.MA['Huton: Ni'] 			= sets['matt_ninjutsu']
	sets.MA['Huton: San'] 			= sets['matt_ninjutsu']
	sets.MA['Doton: Ichi'] 		= sets['matt_ninjutsu']
	sets.MA['Doton: Ni'] 		= sets['matt_ninjutsu']
	sets.MA['Doton: San'] 		= sets['matt_ninjutsu']
	sets.MA['Raiton: Ichi'] 	= sets['matt_ninjutsu']
	sets.MA['Raiton: Ni']			= sets['matt_ninjutsu']
	sets.MA['Raiton: San'] 		= sets['matt_ninjutsu']
	sets.MA['Suiton: Ichi'] 	= sets['matt_ninjutsu']
	sets.MA['Suiton: Ni']			= sets['matt_ninjutsu']
	sets.MA['Suiton: San'] 		= sets['matt_ninjutsu']
	sets.MA['Jubaku: Ichi'] 	= sets['macc_ninjutsu']
	sets.MA['Hojo: Ichi'] 		= sets['macc_ninjutsu']
	sets.MA['Hojo: Ni'] 			= sets['macc_ninjutsu']
	sets.MA['Kurayami: Ichi'] = sets['macc_ninjutsu']
	sets.MA['Kurayami: Ni'] 		= sets['macc_ninjutsu']
	sets.MA['Dokumori: Ichi'] = sets['macc_ninjutsu']
	sets.MA['Tonko: Ichi'] 		= sets["ninjutsu"]
	sets.MA['Tonko: Ni'] 			= sets["ninjutsu"]
	sets.MA['Monomi: Ichi'] 	= sets["ninjutsu"]
	sets.MA['Aisha: Ichi'] 		= sets["ninjutsu"]
	sets.MA['Myoshu: Ichi'] 	= sets["ninjutsu"]
	sets.MA['Yurin: Ichi'] 		= sets["ninjutsu"]
	sets.MA['Kakka: Ichi'] 		= sets["ninjutsu"]
	sets.MA['Migawari: Ichi'] = {
		basesets={sets["ninjutsu"]},
		body="Hattori ningi +1",
	}
	sets.MA['Gekka: Ichi'] 		= sets["ninjutsu"]
	sets.MA['Yain: Ichi']			= sets["ninjutsu"]
	
	sets.MA['Utsusemi: Ichi'] = {
		basesets={
			sets.Engaged['PDT'],
			sets["ninjutsu"],
			{precast={neck="Magoraga beads", body="Mochizuki chainmail +1"}},
		},
		back="Andartia's Mantle",
		feet="Hattori Kyahan +1",
	}
	
	sets.MA['Utsusemi: Ni'] = sets.MA['Utsusemi: Ichi']
	sets.MA['Utsusemi: San'] = sets.MA['Utsusemi: Ichi']
	
	if not sets["TOOLS"] then
		sets["TOOLS"]={}
	end
	sets["TOOLS"]["Shihei"] = {ammo="Shihei"}
	sets["TOOLS"]["Inoshishinofuda"] = {ammo="Inoshishinofuda"}
	sets["TOOLS"]["shikanofuda"] = {ammo="shikanofuda"}
	sets["TOOLS"]["chonofuda"] = {ammo="chonofuda"}

	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {}
	
	sets['buff active']['Yonin'] = {
		legs="Hattori hakama +1",
		left_ring="Pernicious ring",
	}
	
	sets['buff active']['Innin'] = {
		head="Hattori zukin +1",
	}
	
	sets['buff active']['Haste'] = {
		hands="Otronif gloves +1",
--		feet="Otronif boots +1",
	}
	
	sets['buff active']['March'] = 	sets['buff active']['Haste']
		
	sets['buff active']['Issekigan'] = {
		head="Mochizuki hatsuburi +1",
		back="Boxer's mantle",
		feet="Hattori kyahan +1",
	}
	
	sets['ITEM'] = {}
	sets.ITEM['Remedy'] = {}
	
end
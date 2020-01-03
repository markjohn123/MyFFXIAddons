function get_sets()
	local baseset = 'baseset'
	local basesets = 'basesets'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	misc = {}
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')
	
	battle_state = 'NORMAL'
	sets["misc"] = {}

	sets.misc["ammo_s"] = {
		["ra"] = {ammo="Eminent Bullet"},
		["ws"] ={ammo="Adlivun Bullet"}, 
		["ws_matt"] ={ammo="Orichalcum Bullet"}, 
		--["quickdraw"] = {ammo="Eminent Bullet"},
		["quickdraw"] = {ammo="Animikii Bullet"},
	}
	
	sets.misc["trump cards"] = {
		["ammo"]="Trump Card",
	}
	sets.misc["trump card cases"] = {
		["ammo"]="Trump Card Case"
	}
	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets.weapons["sword"]  = {
		main="Vanir Knife",
		range="Holliday",
		sub="Nusku Shield",
		ammo=sets.misc.ammo_s.ra.ammo,
	}
	
	if T{"NIN", "DNC"}:contains(player.sub_job) then
	sets.weapons["sword"]  = {
		main="Vanir Knife",
		range="Holliday",
		sub="Demersal Degen",
		ammo=sets.misc.ammo_s.ra.ammo,
	}
	
	end

	sets['Idle'] = {
		ammo=sets.misc.ammo_s.ra.ammo,
    head="Whirlpool Mask",
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands="Iuitl Wristbands +1",
    legs="Iuitl Tights +1",
    feet="Hermes' sandals",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Roller's Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    back="Repulse Mantle",
	}
	
	sets['Engaged'] = {
		ammo=sets.misc.ammo_s.ra.ammo,
    head="Meghanada Visor +1",
    body={ name="Taeon Tabard", augments={'Accuracy+24','"Dual Wield"+4','Weapon skill damage +2%',}},
    hands="Meg. Gloves +1",
    legs={ name="Taeon Tights", augments={'Accuracy+19','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Meg. Jam. +1",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged

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

	sets.Idle['ACC'] = tempIdleset

	sets.Engaged['ACC'] = {
    head="Meghanada Visor +1",
    body={ name="Taeon Tabard", augments={'Accuracy+24','"Dual Wield"+4','Weapon skill damage +2%',}},
    hands="Meg. Gloves +1",
    legs={ name="Taeon Tights", augments={'Accuracy+19','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Meg. Jam. +1",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
}

	sets['racc'] = {
    head="Meghanada Visor +1",
    body={ name="Taeon Tabard", augments={'Accuracy+24','"Dual Wield"+4','Weapon skill damage +2%',}},
    hands="Meg. Gloves +1",
    legs={ name="Taeon Tights", augments={'Rng.Acc.+19 Rng.Atk.+19','"Fast Cast"+3','STR+4 CHR+4',}},
    feet="Meg. Jam. +1",
    neck="Gaudryi Necklace",
    waist="Commodore Belt",
    left_ear="Clearview Earring",
    right_ear="Volley Earring",
    left_ring="Longshot Ring",
    right_ring="Paqichikaji Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+9','Weapon skill damage +10%',}},
	}
	
	sets['ra'] = {
		basesets=sets.racc,
		precast={
	    head="Nvrch. Tricorne +1",
	    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Rng.Atk.+7',}},
	    legs={ name="Lanun Culottes", augments={'Enhances "Snake Eye" effect',}},
	    waist="Ponente sash",
	    left_ring="Jalzahn's Ring",
	    back={ name="Gunslinger's Cape", augments={'Enmity-5','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -2',}},
    	feet="Meg. Jam. +1",
		},
		ammo=sets.misc.ammo_s.ra.ammo,
	}
	
	sets['dex'] = {
    head="Umbani Cap",
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands="Iuitl Wristbands +1",
    feet="Iuitl Gaiters +1",
    left_ring="Rajas Ring",
	}
	
	sets['agi'] = {
    head={ name="Lanun Tricorne +1", augments={'Enhances "Winning Streak" effect',}},
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Rng.Atk.+7',}},
    legs="Nahtirah Trousers",
    feet={ name="Iuitl Gaiters +1", augments={'Phys. dmg. taken -3%','Accuracy+5',}},
    neck="Arctier's Torque",
    waist="Ponente Sash",
    left_ring="Stormsoul Ring",
    right_ring="Stormsoul Ring",
    back="Ik Cape",
	}

	sets['crit hit rate'] = {
		head=""
	}
	
	sets['crit hit damage'] = {
		back=""
	}
	
	sets['attack'] = {
	}
	
	sets['da'] = {
    head={ name="Taeon Chapeau", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
    body="Thaumas Coat",
    hands={ name="Taeon Gloves", augments={'Accuracy+18 Attack+18','"Triple Atk."+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+19','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet={ name="Taeon Boots", augments={'Accuracy+22','"Triple Atk."+2','Crit. hit damage +1%',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}
	
	sets['mab'] = {
    head={ name="Taeon Chapeau", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Sklchn.dmg.+3%',}},
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Taeon Gloves", augments={'"Mag.Atk.Bns."+17','"Snapshot"+1','AGI+5',}},
    legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -2%','"Mag.Def.Bns."+1',}},
    feet={ name="Lanun Bottes", augments={'Enhances "Wild Card" effect',}},
    neck="Stoicheion Medal",
    waist="Aquiline Belt",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Acumen Ring",
    right_ring="Archon Ring",
    back={ name="Gunslinger's Cape", augments={'Enmity-5','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -2',}},
	}
	
	sets['macc'] = {
    head="Pandinus Beret",
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands="Nilas Gloves",
    legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -2%','"Mag.Def.Bns."+1',}},
    feet={ name="Lanun Bottes", augments={'Enhances "Wild Card" effect',}},
    neck="Stoicheion Medal",
    waist="Aquiline Belt",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Acumen Ring",
    back={ name="Gunslinger's Cape", augments={'Enmity-5','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -2',}},
	}
	
	sets['WS'] = {
	}

	sets.WS['default'] = {
		baseset=sets.da
	}
	
	sets.WS['ranged_default'] = {
		basesets={
			sets.ratt, sets.racc,sets.agi,
			ammo=sets.misc.ammo_s.ws.ammo,
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
		}
	}
	
	sets.WS['Fast Blade'] = sets.WS.default
	sets.WS['Buring Blade'] = sets.mab
	sets.WS['Flat Blade'] = sets.WS.default
	sets.WS['Shining Blade'] = sets.mab
	sets.WS['Circle Blade'] = sets.WS.default
	sets.WS['Spirits Within'] = sets.mab
	sets.WS['Hot Shot'] = sets.mab
	sets.WS['Split Shot'] = sets.WS.ranged_default
	sets.WS['Sniper Shot'] = sets.WS.ranged_default
	sets.WS['Slug Shot'] = sets.WS.ranged_default
	sets.WS['Detonator'] = sets.WS.ranged_default
	sets.WS['Numbing Shot'] = sets.WS.ranged_default
	sets.WS['Wildfire'] = {
		ammo=sets.misc.ammo_s.ws_matt.ammo,
    head={ name="Taeon Chapeau", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15','Sklchn.dmg.+3%',}},
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Taeon Gloves", augments={'"Mag.Atk.Bns."+17','"Snapshot"+1','AGI+5',}},
    legs={ name="Taeon Tights", augments={'"Mag.Atk.Bns."+15','AGI+9',}},
    feet={ name="Taeon Boots", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','Sklchn.dmg.+3%',}},
    neck="Stoicheion Medal",
    waist="Aquiline Belt",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Acumen Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
    right_ring="Stormsoul Ring",
	}
	sets.WS['Leaden Salute'] = {
--		basesets={sets.agi, sets.mab},
--		precast={
--			ammo=sets.misc.ammo_s.ws_matt.ammo
--		},
		ammo=sets.misc.ammo_s.ws_matt.ammo,
    head="Pixie Hairpin +1",
    body={ name="Lanun Frac +1", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Taeon Gloves", augments={'"Mag.Atk.Bns."+17','"Snapshot"+1','AGI+5',}},
    legs={ name="Taeon Tights", augments={'"Mag.Atk.Bns."+15','AGI+9',}},
    feet={ name="Taeon Boots", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','Sklchn.dmg.+3%',}},
    neck="Stoicheion Medal",
    waist="Aquiline Belt",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Acumen Ring",
    right_ring="Archon Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
	}
	sets.WS['Last Stand'] = {
		precast=sets.misc["ammo_s"].ws,
		basesets={sets.WS.ranged_default,sets.racc},
		hands="Meg. Gloves +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
    feet="Meg. Jam. +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
	}
	
	sets['quickdraw'] = {
		basesets={sets.mab},
		ammo=sets.misc.ammo_s.quickdraw.ammo,
		hands="Schutzen mittens",
    right_ring="Stormsoul Ring",
		feet="Navarch's bottes +2"
	}
	
	sets['phantom roll'] = {
		head="Lanun tricorne +1",
		hands="Navarch's gants +2",
		left_ring="Barataria Ring",
		right_ring="Luzaf's ring",
		precast={
    	back={ name="Gunslinger's Cape", augments={'Enmity-5','"Mag.Atk.Bns."+4','"Phantom Roll" ability delay -2',}},
    },
    back="Camulus's mantle",
	}
	
	sets['JA'] = {}
	
	sets.JA['Wild Card'] = {
		feet="Lanun Bottes"
	}
	
	sets.JA["Fighter's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Monk's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Healer's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Wizard's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Warlock's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Rogue's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Gallant's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Chaos Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Beast Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Hunter's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Samurai Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Ninja Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Drachen Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Evoker's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Magus's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Corsair's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Puppet Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Dancer's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Scholar's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Bolter's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Caster's Roll"] = {
		baseset=sets["phantom roll"],
		legs="Navarch's culottes +2"
	}
	
	sets.JA["Courser's Roll"] = {
		baseset=sets["phantom roll"],
		feet="Navarch's bottes +2"
	}
	
	sets.JA["Blitzer's Roll"] = {
		baseset=sets["phantom roll"],
		head="Navarch's tricorne +1"
	}
	
	sets.JA["Tactician's Roll"] = {
		baseset=sets["phantom roll"],
		body="Navarch's frac +2"
	}
	
	sets.JA["Allies' Roll"] = {
		baseset=sets["phantom roll"],
		hands="Navarch's gants +2"
	}
	
	sets.JA["Miser's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Companion's Roll"] = {
		baseset=sets["phantom roll"]
	}
	
	sets.JA["Avenger's Roll"] = {
		baseset=sets["phantom roll"],
	}
	
	sets.JA["Naturalist's Roll"] = {
		baseset=sets["phantom roll"],
	}
	
	sets.JA["Runeist's Roll"] = {
		baseset=sets["phantom roll"],
	}
	
	sets.JA["Double-Up"] = {
		baseset=sets['phantom roll']
	}
	
	sets.JA["Fire Shot"] = sets.quickdraw
	
	sets.JA["Ice Shot"] = sets.quickdraw
	
	sets.JA["Wind Shot"] = sets.quickdraw
	
	sets.JA["Earth Shot"] = sets.quickdraw
	
	sets.JA["Thunder Shot"] = sets.quickdraw
	
	sets.JA["Water Shot"] = sets.quickdraw
	
	sets.JA["Light Shot"] = {
		basesets={sets.quickdraw, sets.macc},
	}
	
	sets.JA["Dark Shot"] = {
		basesets={sets.quickdraw, sets.macc},
	}
	
	sets.JA["Random Deal"] = {
		body="Lanun Frac +1"
	}
	
	sets.JA["Snake Eye"] = {
		legs="Lanun Culottes"
	}
	
	sets.JA["Fold"] = {}
	
	sets.JA["Triple Shot"] = {
		back="Camulus's mantle",
	}
	
	sets.JA["Cutting Cards"] = {}
	
	sets.JA["Crooked Cards"] = {}
	
	-- Red Mage Sub
	sets.JA['Convert'] = {}

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
	
	sets.MA = {}
	
	sets.MA['fast cast'] = {
		precast={
			head="Athos's chapeau",
			right_ear='Loquac. Earring',
			right_ring='Prolix Ring',
			waist='Twilight Belt'
		}
	}
	
	-- White mage subjob
	sets.MA["Curaga"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Curaga II"] = {basesets={sets.MA['fast cast']}}
	
	-- Red Mage subjob
	sets.MA["Cure"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Cure II"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Cure III"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Cure IV"] = {basesets={sets.MA['fast cast']}}
	
	sets.MA["Raise"] = {basesets={sets.MA['fast cast']}}
	
	sets.MA["Dia"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Dia II"] = {basesets={sets.MA['fast cast']}}	
	sets.MA["Diaga"] = {basesets={sets.MA['fast cast']}}
	
	sets.MA["Protect"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Protect II"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Protect III"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Protect IV"] = {basesets={sets.MA['fast cast']}}
	
	sets.MA["Shell"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Shell II"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Shell III"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Shell IV"] = {basesets={sets.MA['fast cast']}}
	
	sets.MA["Blink"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Stoneskin"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Aquaveil"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Slow"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Haste"] = {basesets={sets.MA['fast cast']}}
	sets.MA["Paralyze"] = {}
	sets.MA["Silence"] = {}
	sets.MA["Barfire"] = {}
	sets.MA["Barblizzard"] = {}
	sets.MA["Baraero"] = {}
	sets.MA["Barstone"] = {}
	sets.MA["Barthunder"] = {}
	sets.MA["Barwater"] = {}
	sets.MA["Barsleep"] = {}
	sets.MA["Barpoison"] = {}
	sets.MA["Barparalyze"] = {}
	sets.MA["Barblind"] = {}
	sets.MA["Barsilence"] = {}
	sets.MA["Barpetrify"] = {}
	sets.MA["Barvirus"] = {}
	sets.MA["Enfire"] = {}
	sets.MA["Enblizzard"] = {}
	sets.MA["Enaero"] = {}
	sets.MA["Enthunder"] = {}
	sets.MA["Enwater"] = {}
	sets.MA["Phalanx"] = {}
	sets.MA["Refresh"] = {}
	sets.MA["Invisible"] = {}
	sets.MA["Sneak"] = {}
	sets.MA["Deodorize"] = {}
	sets.MA["Fire"] = {}
	sets.MA["Blizzard"] = {}
	sets.MA["Aero"] = {}
	sets.MA["Aero II"] = {}
	sets.MA["Stone"] = {}
	sets.MA["Stone II"] = {}
	sets.MA["Thunder"] = {}
	sets.MA["Water"] = {}
	sets.MA["Water II"] = {}
	sets.MA["Gravity"] = {}
	sets.MA["Poison"] = {}
	sets.MA["Poison II"] = {}
	sets.MA["Bio"] = {}
	sets.MA["Bio II"] = {}
	sets.MA["Ice Spikes"] = {}
	sets.MA["Sleep"] = {}
	sets.MA["Blind"] = {}
	sets.MA["Bind"] = {}
	sets.MA["Sleep II"] = {}
	sets.MA["Dispel"] = {}

	-- Ninja subjob
	
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
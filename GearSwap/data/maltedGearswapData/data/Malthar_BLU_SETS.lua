function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')
	send_command('alias ochain gs c weapon ochain')
	send_command('alias aegis gs c weapon aegis')

	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets.weapons["swords"] = {
    main="Tanmogayi +1",
    sub="Tanmogayi",
	}
	
	sets.weapons["colada"] = {
    main="Tanmogayi +1",
    sub="colada",
	}
	
	sets.weapons["sword and shield"] = {
    main="Tanmogayi +1",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +2%','"Cure" spellcasting time -2%',}},
	}
	sets.weapons["sword_and_shield"] = sets.weapons["sword and shield"]
	sets.weapons["sword_shield"] = sets.weapons["sword and shield"]
	sets.weapons["shield"] = sets.weapons["sword and shield"]
	sets.weapons["PDT"] = sets.weapons["sword and shield"]
	sets.weapons["pdt"] = sets.weapons["sword and shield"]
	
	sets.weapons["vampirism"] = {
    main={ name="Vampirism", augments={'STR+10','INT+10','"Occult Acumen"+10','DMG:+15',}},
    sub={ name="Vampirism", augments={'STR+5','INT+5','DMG:+3',}},
	}
	
		
	sets['Idle'] = {
    ammo="Staunch Tathlum",
    head="Ocelo. Headpiece",
    body="Jhakri Robe +1",
    hands="Serpentes Cuffs",
    legs="Carmine Cuisses +1",
    feet="Serpentes Sabots",
    neck="Bathy Choker",
    waist="Flume Belt +1",
    left_ear="Etiolation Earring",
    right_ear="Genmei Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring="Defending Ring",
    back="Agema Cape",
	}
	
	
	sets['Engaged'] = {
    ammo="Falcon Eye",
    head={ name="Herculean Helm", augments={'Accuracy+22','"Store TP"+6',}},
    body="Adhemar Jacket",
    hands={ name="Herculean Gloves", augments={'Accuracy+13','"Store TP"+6','AGI+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','Accuracy+8','Attack+13',}},
    --legs="Carmine Cuisses +1",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	sets.Idle['STP'] = tempIdleset
	sets.Engaged['STP'] = tempEngagedset
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting

	sets.Idle['DA'] = sets.Idle
	sets.Engaged['DA'] = {
    ammo="Ginsen",
    head={ name="Herculean Helm", augments={'Attack+2','"Triple Atk."+3','STR+1','Accuracy+11',}},
    body="Adhemar Jacket",
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','Accuracy+8','Attack+13',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
	
	sets.Idle['CRIT'] = sets.Idle
	sets.Engaged['CRIT'] = {
    ammo="Jukukik Feather",
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+27','Crit.hit rate+2','Attack+13',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+2','Crit.hit rate+4','AGI+4',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
    ammo="Staunch Tathlum",
    head={ name="Herculean Helm", augments={'Accuracy+22','"Store TP"+6',}},
    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs="Carmine Cuisses +1",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Genmei Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Agema Cape",
	}
	
	sets.Engaged['PDT'] = {
    ammo="Staunch Tathlum",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +1",
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs="Aya. Cosciales +1",
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Brutal Earring",
    right_ear="Genmei Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Agema Cape",
    PDT={
    
    }
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
		PDT={
		
		}
		
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.PDT,
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
	
	sets.Idle['ACC'] = tempIdleset
	
	sets.Engaged['ACC'] = {
    ammo="Falcon Eye",
    head="Jhakri Coronal +1",
    body={ name="Herculean Vest", augments={'Attack+25','Weapon skill damage +4%','Accuracy+7',}},
    hands="Jhakri Cuffs +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+22 Attack+22','"Triple Atk."+2','Accuracy+8','Attack+13',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Iqabi Necklace",
    waist="Kentarch Belt +1",
    left_ear="Zennaroi Earring",
    right_ear="Steelflash Earring",
    left_ring="Patricius Ring",
    right_ring="Cacoethic Ring",
    back="Agema Cape",
	}

	sets['fast cast'] = {
		precast={
		}
	}

	sets['blue magic precast'] = {
		basesets={sets['fast cast'], {precast={body="Hashishin mintan +1", hands="Hashishin bazubands +1"}}}
	}

	sets['blue magic'] = {
		baseset=sets['blue magic precast'],
    ammo="Mavi Tathlum",
    head="Luhlaza Keffiyeh +1",
    body="Assim. Jubbah +1",
    hands="Ayao's Gages",
    legs="Hashishin Tayt +1",
    feet="Luhlaza charuqs +1",
    back="Cornflower Cape",
	}
	
	sets.Idle['LEARNING'] = {
		baseset=sets['blue magic'],
		hands="Assim. Bazu. +1",
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Genmei Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
	}
	
	sets.Engaged['LEARNING'] = {
		baseset=sets['blue magic'],
		hands="Assim. Bazu. +1",
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Thureous Earring",
    right_ear="Genmei Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
	}

	sets['da'] = {
	}
	
	sets['str'] = {
	}
	
	sets['dex'] = {
	}
	
	sets['vit'] = {
	}
	

	sets['agi'] = {
	}
	

	sets['int'] = {
	}
	

	sets['mnd'] = {
	}
	

	sets['chr'] = {
	}
	
	
	sets['mab'] = {
    ammo="Erlene's Notebook",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Deviant Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Strendu Ring",
    right_ring="Acumen Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}

	sets['macc'] = {
	}
	

	sets['breath damage'] = {
	}
	
	sets['healing'] = {
	}
	
	sets['healing me'] = {
	}
	
	sets['WS'] = {}
	
	sets.WS["Fast Blade"] = {
		basesets={sets.str, sets.dex, sets.da}
	}

	sets.WS["Burning Blade"] = {
		basesets={sets.str, sets.int, sets.mab}
	}

	sets.WS["Red Lotus Blade"] = {
		basesets={sets.str, sets.int, sets.mab}
	}

	sets.WS["Flat Blade"] = {
		basesets={sets.str, 
		--sets.macc
		},
		right_ear="Moonshade Earring"
	}

	sets.WS["Shining Blade"] = {
		basesets={sets.str, sets.mnd, sets.mab}
	}

	sets.WS["Seraph Blade"] = {
		basesets={sets.str, sets.mnd, sets.mab}
	}

	sets.WS["Circle Blade"] = {
		basesets={sets.str, sets.da},
		left_ear="Brutal Earring",
		right_ear="Moonshade Earring"
	}

	sets.WS["Spirits Within"] = {
		basesets={sets.str},
		right_ear="Moonshade Earring"
	}

	sets.WS["Vorpal Blade"] = {
    ammo="Jukukik Feather",
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
    hands="Jhakri Cuffs +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+2','Crit.hit rate+4','AGI+4',}},
    feet="Aya. Gambieras +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Hetairoi Ring",
    right_ring="Apate Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}

	sets.WS["Savage Blade"] = {
    ammo="Amar Cluster",
    head={ name="Herculean Helm", augments={'Accuracy+22','"Store TP"+6',}},
    body={ name="Herculean Vest", augments={'Attack+25','Weapon skill damage +4%','Accuracy+7',}},
    hands="Jhakri Cuffs +1",
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Hetairoi Ring",
    right_ring="Apate Ring",
    back="Atheling Mantle",
	}

	sets.WS["Expiacion"] = {
    ammo="Jukukik Feather",
    head={ name="Herculean Helm", augments={'Accuracy+22','"Store TP"+6',}},
    body={ name="Herculean Vest", augments={'Attack+25','Weapon skill damage +4%','Accuracy+7',}},
    hands="Jhakri Cuffs +1",
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Hetairoi Ring",
    right_ring="Apate Ring",
    back="Atheling Mantle",
	}

	sets.WS["Sanguine Blade"] = {
		basesets={sets.str, sets.mnd, sets.mab},
		right_ear="moonshade earring"
	}

	sets.WS["Chant du Cygne"] = {
    ammo="Jukukik Feather",
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
--    body={ name="Herculean Vest", augments={'Crit. hit damage +4%','Accuracy+15','Attack+9',}},
		body = "Abnoba Kaftan",
    hands="Jhakri Cuffs +1",
    legs={ name="Herculean Trousers", augments={'Accuracy+2','Crit.hit rate+4','AGI+4',}},
    feet="Aya. Gambieras +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Hetairoi Ring",
    right_ring="Apate Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
	}

	sets.WS["Requiescat"] = {
    ammo="Ginsen",
    head="Hashishin Kavuk +1",
    body={ name="Herculean Vest", augments={'Attack+25','Weapon skill damage +4%','Accuracy+7',}},
    hands="Jhakri Cuffs +1",
    legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','AGI+8','Accuracy+14','Attack+2',}},
    feet={ name="Herculean Boots", augments={'Accuracy+21 Attack+21','Weapon skill damage +3%','Accuracy+14',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Atheling Mantle",
	}

	sets.WS["Shining Strike"] = {
		basesets={sets.str, sets.mab}
	}

	sets.WS["Seraph Strike"] = {
		basesets={sets.str, sets.mab}
	}

	sets.WS["Brainshaker"] = {
		basesets={sets.str, sets.da}
	}

	sets.WS["Starlight"] = {
		basesets={sets.str, sets.mab}
	}

	sets.WS["Moonlight"] = {
		basesets={sets.str, sets.mab}
	}

	sets.WS["Skullbreaker"] = {
		basesets={sets.str, sets.da}
	}

	sets.WS["True Strike"] = {
		basesets={sets.str, sets.da}
	}

	sets.WS["Judgement"] = {
		basesets={sets.str, sets.da}
	}

	sets.WS["Black Halo"] = {
		basesets={sets.str, sets.mab}
	}

	sets.WS["Flash Nova"] = {
		basesets={sets.str, sets.mab}
	}

	
	sets['JA'] = {}

	sets.JA["Azure Lore"] = {
		hands="Luh. Bazubands +1"
	}

	sets.JA["Chain Affinity"] = {
		head="Hashishin Kavuk +1",
		feet="Assimilator's charuqs +1"
	}

	sets.JA["Burst Affinity"] = {
		legs="Assimilator's shalwar +1",
		feet="Hashishin basmak"
	}

	sets.JA["Diffusion"] = {
		feet="Luhlaza charuqs +1"
	}

	sets.JA["Efflux"] = {
		legs="Hashishin tayt +1"
	}

	sets.JA["Unbridled Learning"] = {
	
	}

	sets.JA["Unbridled Wisdom"] = {
	
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
	
	-- Magic
	sets['MA'] = {}

	sets.MA["Pollen"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sandspin"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Foot Kick"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sprout Smack"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Wild Oats"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Power Attack"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Cocoon"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Metallic Body"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Queasyshroom"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Battle Dance"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Feather Storm"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Head Butt"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Healing Breeze"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sheep Song"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Helldive"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Cursed Sphere"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blastbomb"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Bludgeon"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blood Drain"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Claw Cyclone"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Poison Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Soporific"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Screwdriver"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Bomb Toss"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Grand Slam"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Wild Carrot"] = {
		basesets={sets['blue magic precast'], sets['blue magic']},
    ammo="Hydrocera",
    head="Hashishin Kavuk +1",
    body="Hashishin Mintan +1",
    hands="Hashi. Bazu. +1",
    legs="Hashishin Tayt +1",
    feet="Manabyss Pigaches",
    neck="Phalaina Locket",
    waist="Latria Sash",
    left_ear="Lifestorm Earring",
    right_ear="Genmei Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Tantalic Cape",
	}

	sets.MA["Chaotic Eye"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sound Blast"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Death Ray"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Smite of Rage"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Digest"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Pinecone Bomb"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blank Gaze"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Jet Stream"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Uppercut"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Mysterious Light"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Terror Touch"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["MP Drainkiss"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Venom Shell"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Stinking Gas"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blitzstrahl"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Mandibular Bite"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Awful Eye"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Geist Wall"] = {
		basesets={sets['blue magic precast'], sets['blue magic']},
    neck="Eddy Necklace",
    waist="Luminary Sash",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
    right_ring="Strendu Ring",
	}

	sets.MA["Magnetite Cloud"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Jettatura"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blood Saber"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Refueling"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sickle Slash"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Ice Break"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Self-Destruct"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Frightful Roar"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Cold Wave"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Filamented Hold"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Hecatomb Wave"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Radiant Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Feather Barrier"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Light of Penance"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Flying Hip Press"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Magic Fruit"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Dimensional Death"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Spiral Spin"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Death Scissors"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Eyes on Me"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Bad Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Maelstrom"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Seedspray"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["1000 Needles"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Memento Mori"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Body Slam"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Hydro Shot"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Frypan"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Frenetic Rip"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Spinal Cleave"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Voracious Trunk"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Feather Tickle"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Yawn"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Infrasonics"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Zephyr Mantle"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Corrosive Ooze"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sandspray"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Frost Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Diamondhide"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Enervation"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Firespit"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Warm-Up"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Regurgitation"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Tail Slap"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Hysteric Barrage"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Asuran Claws"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Cannonball"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Amplification"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Heat Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Lowing"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Triumphant Roar"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Saline Coat"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Disseverment"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sub-zero Smash"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Temporal Shift"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Ram Charge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Mind Blast"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Actinic Burst"] = {
		basesets={sets['blue magic precast'], sets.macc, sets['blue magic']}
	}

	sets.MA["Reactor Cool"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Magic Hammer"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Exuviation"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Plasma Charge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Vertical Cleave"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Plenilune Embrace"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Acrid Stream"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Leafstorm"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Cimicine Discharge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Regeneration"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Animating Wail"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Battery Charge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blazing Bound"] = {
		basesets={sets['blue magic precast'], sets.mab, sets['blue magic']}
	}

	sets.MA["Demoralizing Roar"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Final Sting"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Goblin Rush"] = {
		basesets={sets['blue magic precast'], sets.dex, sets.str, sets['blue magic']}
	}

	sets.MA["Vanity Dive"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Magic Barrier"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Whirl of Rage"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Benthic Typhoon"] = {
		basesets={sets['blue magic precast'], sets.agi, sets['blue magic']}
	}

	sets.MA["Auroral Drape"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Osmosis"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Quad. Continuum"] = {
		basesets={sets['blue magic precast'], sets.vit, sets.str, sets['blue magic']}
	}

	sets.MA["Fantod"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Thermal Pulse"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Empty Thrash"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Dream Flower"] = {
		basesets={sets['blue magic precast'], sets.macc, sets['blue magic']}
	}

	sets.MA["Occultation"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Charged Whisker"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Winds of Promy."] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Delta Thrust"] = {
		basesets={sets['blue magic precast'], sets.str, sets.vit, sets['blue magic']}
	}

	sets.MA["Evryone. Grudge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Reaving Wind"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Barrier Tusk"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Mortal Ray"] = {
		basesets={sets['blue magic precast'], sets.macc, sets['blue magic']}
	}

	sets.MA["Water Bomb"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Heavy Strike"] = {
		basesets={sets['blue magic precast'], sets.str, sets.Engaged, acc, sets['blue magic']}
	}

	sets.MA["Dark Orb"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["White Wind"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Sudden Lunge"] = {
		basesets={sets['blue magic precast'], sets.agi, sets['blue magic'], sets.macc}
	}

	sets.MA["Thunderbolt"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Harden Shell"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Quadrastrike"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Vapor Spray"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Absolute Terror"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Thunder Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Gates of Hades"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Tourbillion"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Orcish Counterstance"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Amorphic Spikes"] = {
		basesets={sets['blue magic precast'], sets.int, sets.dex, sets['blue magic']}
	}

	sets.MA["Pyric Bulwark"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Wind Breath"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Barbed Crescent"] = {
		basesets={sets['blue magic precast'], sets.dex, sets.macc, sets['blue magic']}
	}

	sets.MA["Bilgestorm"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Bloodrake"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Nat. Meditation"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Glutinous Dart"] = {
		basesets={sets['blue magic precast'], set.vit, sets.str, sets['blue magic']}
	}

	sets.MA["Paralyzing Triad"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Tempestuous Upheaval"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Embalming Earth"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Rending Deluge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Foul Waters"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Retinal Glare"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Droning Whirlwind"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Carcharian Verve"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Blistering Roar"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Erratic Flutter"] = {
		basesets={sets['blue magic precast'], sets['blue magic']}
	}

	sets.MA["Subduction"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,},
    ammo="Erlene's Notebook",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Deviant Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Strendu Ring",
    right_ring="Acumen Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}

	sets.MA["Thrashing Assault"] = {
		basesets={sets['blue magic precast'], sets['blue magic'],sets.dex, sets.str},
	}
	
	sets.MA["Mighty Guard"] = {
		basesets={sets['blue magic precast'], sets['blue magic'],}
	}

	sets.MA["Palling Salvo"] = {
		basesets={sets['blue magic precast'], sets['blue magic'],},
	}

	sets.MA["Sinker Drill"] = {
		basesets={sets['blue magic precast'], sets['blue magic'],},
    ammo="Bibiki Seashell",
    head={ name="Herculean Helm", augments={'Attack+28','Crit. hit damage +5%','DEX+9','Accuracy+2',}},
    body={ name="Herculean Vest", augments={'Attack+25','Weapon skill damage +4%','Accuracy+7',}},
    hands={ name="Herculean Gloves", augments={'Accuracy+17 Attack+17','Magic dmg. taken -4%','STR+2','Accuracy+15',}},
    legs="Hashishin Tayt +1",
    feet="Assim. Charuqs +1",
    neck="Caro Necklace",
    waist="Latria Sash",
    left_ear="Thureous Earring",
    right_ear="Handler's Earring +1",
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}

	sets.MA["Saurian Slide"] = {
		basesets={sets['blue magic precast'], sets['blue magic'],}
	}

	sets.MA["Searing Tempest"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,}
	}
	sets.MA["Spectral Floe"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,},
    ammo="Erlene's Notebook",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Deviant Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Strendu Ring",
    right_ring="Acumen Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
	sets.MA["Silent Storm"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,}
	}
	sets.MA["Entomb"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,},
    ammo="Erlene's Notebook",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +1",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Deviant Necklace",
    waist="Eschan Stone",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Strendu Ring",
    right_ring="Acumen Ring",
    back={ name="Cornflower Cape", augments={'MP+30','DEX+1','Accuracy+1','Blue Magic skill +10',}},
	}
	sets.MA["Anvil Lightning"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,}
	}
	sets.MA["Scouring Spate"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,}
	}
	sets.MA["Blinding Fulgor"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,}
	}
	sets.MA["Tenebral Crush"] = {
		basesets={sets['blue magic precast'],  sets['blue magic'], sets.mab,}
	}
	
	sets.MA["Sweeping Gouge"] = {
		basesets={sets['blue magic precast'], sets['blue magic']},
    neck="Iqabi Necklace",
    waist="Eschan Stone",
    left_ear="Zennaroi Earring",
    right_ear="Steelflash Earring",
    left_ring="Cacoethic Ring",
    right_ring="Mars's Ring",
    back={ name="Mecisto. Mantle", augments={'Cap. Point+48%','INT+3','Rng.Atk.+5','DEF+14',}},
	}

	sets.MA["Utsusemi: Ni"] = sets["fast cast"]
	sets.MA["Utsusemi: Ichi"] = sets["fast cast"]

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
end
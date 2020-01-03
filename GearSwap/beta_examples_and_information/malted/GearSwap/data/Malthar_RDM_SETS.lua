function get_sets()
	local baseset = 'baseset'
	local pdt     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'

	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')

	playstyle = "magic"
	magicstyle= "magicburst"
	local playstyles = {
		["melee"]=function()
			playstyle = "melee"
			magicstyle= "magic"
	  end,
	  ["magic"]=function()
	  	playstyle ="magic"
	  	magicstyle="magic"
	  end,
	  ["magicburst"]=function()
	  	playstyle="magic"
	  	magicstyle="magicburst"
	  end
	}
	
	add_to_chat(5, "Gearswap: Playstyle " .. playstyle)

	if not playstyles[playstyle] then
		add_to_chat(5, "You set an incorrect playstyle of " .. playstyle ..
		               ". I'm changnig it to 'melee'.")
		playstyle = "melee"
	end

	playstyles[playstyle]()

	--  These are the weapons I use
	sets["weapons"] = {}

if playstyle == "magic" then
	if T{"NIN","DNC"}:contains(player.sub_job) then
		sets.weapons['swords'] = {
	    main="Excalibur",
	    sub="Demers. Degen +1",
		}
		
		sets.weapons['Sword and Dagger'] = {
		  main="Pukulatmuj +1",
		  sub={ name="Malevolence", augments={'INT+1','"Fast Cast"+5',}},
		 }
	
		sets.weapons['acc sword and dagger'] = {
	--    main="Excalibur",
	--    sub={ name="Ipetam", augments={'Accuracy+12 Attack+12','"Dbl.Atk."+2','STR+8 AGI+8',}},
		}
	
		sets.weapons['pukus'] = {
			main="Pukulatmuj +1",
			sub="Pukulatmuj",
		}
		
		sets.weapons['puku'] = {
			main="Pukulatmuj +1",
			sub="Demers. Degen +1",
		}
		
		sets.weapons['daggers'] = {
		
		}
		
	end		
	sets.weapons['sword and shield'] = {
    main="Excalibur",
		sub="Beatific Shield +1",
	}
	
	sets.weapons['dagger and shield'] = {
    main={ name="Malevolence", augments={'INT+1','"Fast Cast"+5',}},
		sub="Beatific Shield +1",
	}
elseif T{"magic", "magicburst"}:contains(playstyle) then	
	sets.weapons['clubs'] = {
    main="Bolelabunga",
    sub={ name="Gabaxorea", augments={'MP+12','"Mag.Atk.Bns."+6','INT+1',}},
	}
	
	sets.weapons['club and shield'] = {
    main="Bolelabunga",
    sub="Beatific Shield +1",
	}
	
	sets.weapons['staff'] = {
		main="Serenity",
		sub="Umbra Strap",
	}
end

	-- Set default weapon based on subjob
	-- default_weapons.Default.RDM
	if T{"NIN","DNC"}:contains(player.sub_job) then
		if playstyle == "melee" then
			weapon = "swords"
		else
			weapon = "clubs"
		end
	elseif T{"WAR","PLD","BST","RNG","COR","MNK","THF","DRK","SAM","DRG","BLU","PUP","RUN"}:contains(player.sub_job) then
		if playstyle == "melee" then
			weapon = "sword and shield"
		else
			weapon = "club and shield"
		end
	else
		weapon = "staff"
	end

	sets.weapons['staff'] = {
		main="Serenity",
		sub="Umbra Strap",
	}


	sets['Idle'] = {
    ammo="Demonry Stone",
    head="Vitivation Chapeau +1",
    body="Hagondes Coat +1",
    hands="Serpentes Cuffs",
    legs="Crimson Cuisses",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Repulse Mantle",
	}

	sets['Engaged'] = {
    ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+18','"Triple Atk."+2',}},
    body={ name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
    hands={ name="Taeon Gloves", augments={'Accuracy+22','"Dual Wield"+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Battlecast gaiters",
    neck="Asperity Necklace",
--    waist="Windbuffet Belt +1",
		waist="Goading belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Pernicious Ring",
    back="Atheling Mantle",
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['ACC'] = sets.Idle
	sets.Engaged['ACC'] = {
    ammo="Ginsen",
    head={ name="Taeon Chapeau", augments={'Accuracy+18','"Triple Atk."+2',}},
    body={ name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
    hands={ name="Taeon Gloves", augments={'Accuracy+22','"Dual Wield"+4','Pet: Damage taken -3%',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet={ name="Taeon Boots", augments={'Accuracy+22','"Dual Wield"+5',}},
    neck="Iqabi Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
    right_ear="Zennaroi Earring",
    left_ring="Patricius Ring",
    right_ring="Mars's Ring",
    back="Kayapa Cape",
	}	
	
	-- PDT and MDT gear
	sets.Idle['PDT'] = {
		baseset=sets.Idle,
    hands="Umuthi Gloves",
    legs={ name="Viti. Tights +1", augments={'Enhances "Bio III" effect','Enhances "Blind II" effect',}},
    feet="Battlecast Gaiters",
	}
	
	sets.Engaged['PDT'] = {
    ammo="Ginsen",
    head="Lithelimb Cap",
    body={ name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
    hands="Umuthi Gloves",
    legs={ name="Viti. Tights +1", augments={'Enhances "Bio III" effect','Enhances "Blind II" effect',}},
    feet="Battlecast Gaiters",
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Mollusca Mantle",
	}

	sets.Idle['HPDT'] = sets.Idle.PDT
	
	sets.Engaged['HPDT'] = sets.Idle.PDT
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = sets.Idle.PDT
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Idle.PDT
	
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
    head="Vitivation Chapeau +1",
    body="Gende. Bilaut +1",
    hands="Gende. Gages +1",
    legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
    feet="Umbani Boots",
    neck="Estoqueur's Collar",
    left_ear="Lifestorm Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Estoqueur's Cape",
	}
if playstyle ~= "melee" then
	sets.mnd["main"] = { name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}}
  sets.mnd["sub"]  = "Reign Grip"
end

	
	sets['chr'] = {
	}
	
	
	sets['mdmg'] = {
    ammo="Dosis Tathlum",
    waist="Sekhmet Corset",
    right_ear="Crematio Earring",
    left_ring="Mephitas's Ring",
	}
if playstyle ~= "melee" then
	sets.mdmg["main"] = { name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}}
end

	
if playstyle == "magicburst" then
	sets['mab'] = {
    main={ name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}},
    sub="Elder's Grip",
    ammo="Erlene's Notebook",
    head={ name="Helios Band", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic crit. hit rate +6','Magic burst mdg.+8%',}},
    body={ name="Helios Jacket", augments={'"Mag.Atk.Bns."+22','Magic crit. hit rate +7','Magic burst mdg.+7%',}},
    hands={ name="Helios Gloves", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic crit. hit rate +7','INT+10',}},
    legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
--    feet="Tutyr Sabots",
    feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+9','Magic crit. hit rate +6','Magic burst mdg.+8%',}},
    neck="Mizu. Kubikazari",
    waist="Othila Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring="Locus Ring",
    back="Argocham. Mantle",
	}
else
	sets['mab'] = {
    ammo="Erlene's Notebook",
    head={ name="Helios Band", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic crit. hit rate +6','Magic burst mdg.+8%',}},
    body={ name="Helios Jacket", augments={'"Mag.Atk.Bns."+22','Magic crit. hit rate +7','Magic burst mdg.+7%',}},
--    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    hands={ name="Helios Gloves", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','Magic crit. hit rate +7','INT+10',}},
    legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
--    feet="Tutyr Sabots",
    feet={ name="Helios Boots", augments={'"Mag.Atk.Bns."+9','Magic crit. hit rate +6','Magic burst mdg.+8%',}},
    neck="Mizu. Kubikazari",
    waist="Othila Sash",
    left_ear="Friomisi Earring",
    right_ear="Crematio Earring",
    left_ring="Acumen Ring",
    right_ring="Locus Ring",
    back="Argocham. Mantle",
--    right_ring="Strendu Ring",
	}
if playstyle ~= "melee" then
	sets.mab["main"] = { name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}}
  sets.mab["sub"]="Elder's Grip"
end
end
	
	sets['macc'] = {
    head={ name="Telchine Cap", augments={'Mag. Acc.+21',}},
    body="Lethargy sayon +1",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
    feet={ name="Taeon Boots", augments={'Mag. Acc.+20',}},
    neck="Eddy Necklace",
    waist="Salire Belt",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Strendu Ring",
    right_ring="Perception Ring",
    back="Ogapepo Cape",
	}
if playstyle ~= "melee" then
	sets.macc["main"] = { name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}}
	sets.macc["sub"]  = "Mephitis Grip"
end

	sets['da'] = {
    ammo="Paeapua",
    head={ name="Taeon Chapeau", augments={'Accuracy+18','"Triple Atk."+2',}},
    body={ name="Taeon Tabard", augments={'Accuracy+20 Attack+20','"Triple Atk."+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    right_ring="Pernicious Ring",
    back="Atheling Mantle",
	}

	sets["physical weaponskill"] = {
		basesets={sets.str,sets.da},
	}
	
	sets["magical weaponskill"] = {
		basesets={sets.macc,sets.mab},
	}

	sets['WS'] = {}
	
	sets.WS["Fast Blade"] = sets["physical weaponskill"]
	sets.WS["Burning Blade"] = sets["magical weaponskill"]
	sets.WS["Red Lotus Blade"] = sets["magical weaponskill"]
	sets.WS["Flat Blade"] = sets["physical weaponskill"]
	sets.WS["Shining Blade"] = sets["magical weaponskill"]
	sets.WS["Seraph Blade"] = sets["magical weaponskill"]
	sets.WS["Circle Blade"] = sets["physical weaponskill"]
	sets.WS["Spirits Within"] = sets["physical weaponskill"]
	sets.WS["Vorpal Blade"] = sets["physical weaponskill"]
	sets.WS["Savage Blade"] = {
    ammo="Ginsen",
    head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Atheling Mantle",
	}
	sets.WS["Sanguine Blade"] = sets["magical weaponskill"]
	sets.WS["Chant du Cygne"] = {
		baseset=sets["physical weaponskill"],
    ammo="Jukukik Feather",
    neck="Rancor Collar",
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Battlecast Gaiters",
    waist="Windbuffet Belt +1",
    left_ring="Rajas Ring",
    right_ring="Pernicious Ring",
    back="Atheling Mantle",
	}
	sets.WS["Requiescat"] = {
    ammo="Ginsen",
    head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +1", augments={'Enhances "Phalanx II" effect',}},
    legs="Atrophy Tights +1",
    feet={ name="Vitivation Boots +1", augments={'Enhances "Paralyze II" effect',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Atheling Mantle",
	}
	sets.WS["Knights of Round"] = {
    ammo="Ginsen",
    head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Atheling Mantle",
	}
	sets.WS["Death Blossom"] = {
    ammo="Ginsen",
    head={ name="Viti. Chapeau +1", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
    body={ name="Viti. Tabard +1", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+23','"Triple Atk."+2','Weapon skill damage +2%',}},
    feet="Battlecast Gaiters",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Aquasoul Ring",
    right_ring="Aquasoul Ring",
    back="Atheling Mantle",
	}	
	
	
	sets['JA'] = {}
	sets.JA['Haste Samba'] = {}
	
	
	sets.JA["Chainspell"] = {}
	sets.JA["Convert"] = {}
	sets.JA["Composure"] = {}
	sets.JA["Saboteur"] = {
		precast={
			head="Lethargy gantherots +1",
		}
	}
	sets.JA["Spontaneity"] = {}
	sets.JA["Styme"] = {}
	
	-- Magic
	sets['af'] = {
    head="Lethargy Chappel +1",
    body="Lethargy sayon +1",
    hands="Leth. Gantherots +1",
    legs="Leth. Fuseau +1",
    feet="Leth. Houseaux +1",
	}
	
	sets['fast cast'] = {
		precast={
	    ammo="Impatiens",
	    head="Atrophy Chapeau +1",
	    body="Vitivation Tabard +1",
	    hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
	    legs={ name="Lengo Pants", augments={'INT+9','Mag. Acc.+15','"Mag.Atk.Bns."+14',}},
	    waist="Witful Belt",
	    left_ear="Estq. Earring",
	    right_ear="Loquac. Earring",
	    left_ring="Prolix Ring",
	    back="Ogapepo Cape",
	   }
	}
if playstyle ~= "melee" then
	sets["fast cast"]["precast"]["main"] = "Marin Staff"
end
	
	sets['MA'] = {}

	sets['Divine'] = {
	
	}
	
	sets['Enhancing'] = {
		head={"Umuthi hat"},
    body="Vitivation Tabard +1",
    hands="Vitivation Gloves +1",
    legs="Atrophy Tights +1",
    feet="Lethargy houseaux +1",
    waist={ name="Brocade Obi", augments={'Enha.mag. skill +2',}},
    right_ear="Andoaa Earring",
    back="Estoqueur's Cape",
	}
	
	sets['Elemental'] = {
	
	}
	
	sets['Enfeebling'] = {
		neck="Imbodla necklace",
    head="Vitivation Chapeau +1",
    body="Atrophy Tabard +1",
    hands="Lurid Mitts",
    feet="Vitivation Boots +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +8','Enha.mag. skill +3',}},
	}
if playstyle ~= "melee" then
	sets.Enfeebling["sub"] = "Mephitis Grip"
end
	
	sets['Dark'] = {
	
	}
	
	sets['cure potency'] = {
    head="Vitivation Chapeau +1",
    body="Atrophy Tabard +1",
    hands="Serpentes Cuffs",
    legs="Atrophy Tights +1",
    feet="Serpentes Sabots",
    neck="Phalaina Locket",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +8','Enha.mag. skill +3',}},
	}
if playstyle ~= "melee" then
	sets["cure potency"]["main"] = { name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}}
end

	sets['Healing'] = {
    body="Vitivation Tabard +1",
    legs="Atrophy Tights +1",
    left_ring="Sirona's Ring",
	}
	
 sets['healing magic'] = {
 	basesets={sets['fast cast'], sets.mnd, sets['Healing'], sets['cure potency']},
 	precast={
 	},
 }
if playstyle ~= "melee" then
	sets["healing magic"]["precast"]["main"] = { name="Serenity", augments={'MP+25','"Cure" spellcasting time -5%',}}
end
 
 sets['enfeebling magic'] = {
 		basesets={sets['fast cast'], sets.mnd, sets.macc, sets.Enfeebling},
 		precast={
 			head="Lethargy Chappel +1",
 		}
 }
 
 sets['elemental magic'] = {
 		basesets={sets['fast cast'], sets.int, sets.mab,},
 		precast={
 			feet="Tutyr Sabots",
 		}
 }

	sets['enhancing magic'] = {
 		basesets={sets['fast cast'], sets.mnd, sets.Enhancing,},
 		precast={
 			waist="Siegel sash",
 		},
	}
	
	sets['enhancing magic duration'] = {
		baseset=sets['enhancing magic'],
 		hands="Atrophy gloves +1",
	}

	sets.MA["Cure"] = sets['healing magic']
	sets.MA["Cure II"]  = sets.MA.Cure
	sets.MA["Cure III"] = sets.MA.Cure
	sets.MA["Cure IV"]  = sets.MA.Cure
	sets.MA["Raise"]    = sets.MA.Cure
	sets.MA["Raise II"] = sets.MA.Raise
	sets.MA["Protect"]     = sets['enhancing magic duration']
	sets.MA["Protect II"]  = sets.MA.Protect
	sets.MA["Protect III"] = sets.MA.Protect
	sets.MA["Protect IV"]  = sets.MA.Protect
	sets.MA["Protect V"]   = sets.MA.Protect
	sets.MA["Shell"] = sets['enhancing magic duration']
	sets.MA["Shell II"]  = sets.MA.Shell
	sets.MA["Shell III"] = sets.MA.Shell
	sets.MA["Shell IV"]  = sets.MA.Shell
	sets.MA["Shell V"]   = sets.MA.Shell
	sets.MA["Blink"] = sets['enhancing magic']
	sets.MA["Stoneskin"] = {
		basesets={sets['enhancing magic'],sets.mnd,},
		precast={
			head="Umuthi hat",
		},
		waist="Siegel sash",
	}
	sets.MA["Aquaveil"] = {
		baseset=sets['enhancing magic'],
		waist="Emphatikos rope",
	}

	sets.MA["Phalanx"] = sets['enhancing magic']
	sets.MA["Phalanx II"] = {
		baseset=sets.MA.Phalanx,
		hands="Vitivation Gloves +1",
	}
	sets.MA["Haste"] = sets['enhancing magic duration']
	sets.MA["Haste II"] = sets.MA.Haste
	sets.MA["Flurry"] = sets['enhancing magic']
	sets.MA["Flurry II"] = sets.MA.Flurry
	sets.MA["Barfire"] = sets['enhancing magic']
	sets.MA["Barblizzard"] = sets['enhancing magic']
	sets.MA["Baraero"] = sets['enhancing magic']
	sets.MA["Barstone"] = sets['enhancing magic']
	sets.MA["Barthunder"] = sets['enhancing magic']
	sets.MA["Barwater"] = sets['enhancing magic']
	sets.MA["Barsleep"] = sets['enhancing magic']
	sets.MA["Barpoison"] = sets['enhancing magic']
	sets.MA["Barparalyze"] = sets['enhancing magic']
	sets.MA["Barblind"] = sets['enhancing magic']
	sets.MA["Barsilence"] = sets['enhancing magic']
	sets.MA["Barpetrify"] = sets['enhancing magic']
	sets.MA["Barvirus"] = sets['enhancing magic']
	sets.MA["Baramnesia"] = sets['enhancing magic']
	sets.MA["Enfire"] = sets['enhancing magic']
	sets.MA["Enfire II"] = sets['enhancing magic']
	sets.MA["Enblizzard"] = sets['enhancing magic']
	sets.MA["Enblizzard II"] = sets['enhancing magic']
	sets.MA["Enaero"] = sets['enhancing magic']
	sets.MA["Enaero II"] = sets['enhancing magic']
	sets.MA["Enstone"] = sets['enhancing magic']
	sets.MA["Enstone II"] = sets['enhancing magic']
	sets.MA["Enthunder"] = sets['enhancing magic']
	sets.MA["Enthunder II"] = sets['enhancing magic']
	sets.MA["Enwater"] = sets['enhancing magic']
	sets.MA["Enwater II"] = sets['enhancing magic']
	sets.MA["Temper"] = {
		basesets={sets['enhancing magic']},
		sets['Enhancing'],
	}
	sets.MA["Temper II"] = sets.MA.Temper
	sets.MA["Regen"] = sets['enhancing magic duration']
	sets.MA["Regen II"] = sets.MA.Regen
	sets.MA["Refresh"] = {
		baseset=sets['enhancing magic duration'],
		head="Vitivation chapeau +1",
		legs="Lethargy fuseau +1",
	}
	sets.MA["Refresh II"] = sets.MA.Refresh
	sets.MA["Refresh III"] = sets.MA.Refresh
	sets.MA["Gain-STR"] = sets['enhancing magic']
	sets.MA["Gain-DEX"] = sets['enhancing magic']
	sets.MA["Gain-VIT"] = sets['enhancing magic']
	sets.MA["Gain-AGI"] = sets['enhancing magic']
	sets.MA["Gain-INT"] = sets['enhancing magic']
	sets.MA["Gain-MND"] = sets['enhancing magic']
	sets.MA["Gain-CHR"] = sets['enhancing magic']
	sets.MA["Invisible"] = sets['enhancing magic duration']
	sets.MA["Sneak"] = sets['enhancing magic duration']
	sets.MA["Deodorize"] = sets['enhancing magic duration']
	sets.MA["Dia"] = sets['enfeebling magic']
	sets.MA["Dia II"] = sets.MA.Dia
	sets.MA["Dia III"] = {
		baseset=sets.MA.Dia,
		head="Vitivation chapeau +1",
	}
	sets.MA["Diaga"] = sets.MA.Dia
	sets.MA["Slow"] = sets['enfeebling magic']
	sets.MA["Slow II"] =  {
		baseset=sets.MA.Slow,
		head="Vitivation chapeau +1",
	}
	sets.MA["Paralyze"] = sets['enfeebling magic']
	sets.MA["Paralyze II"] = sets.MA.Paralyze
	sets.MA["Silence"] = sets['enfeebling magic']
	sets.MA["Addle"] = sets['enfeebling magic']
	sets.MA["Addle II"] = sets['enfeebling magic']
	sets.MA["Inundation"] = sets['enfeebling magic']
	sets.MA["Fire"] = sets['elemental magic']
	sets.MA["Fire II"] = sets['elemental magic']
	sets.MA["Fire III"] = sets['elemental magic']
	sets.MA["Fire IV"] = sets['elemental magic']
	sets.MA["Fire V"] = sets['elemental magic']
	sets.MA["Blizzard"] = sets['elemental magic']
	sets.MA["Blizzard II"] = sets['elemental magic']
	sets.MA["Blizzard III"] = sets['elemental magic']
	sets.MA["Blizzard IV"] = sets['elemental magic']
	sets.MA["Blizzard V"] = sets['elemental magic']
	sets.MA["Aero"] = sets['elemental magic']
	sets.MA["Aero II"] = sets['elemental magic']
	sets.MA["Aero III"] = sets['elemental magic']
	sets.MA["Aero IV"] = sets['elemental magic']
	sets.MA["Aero V"] = sets['elemental magic']
	sets.MA["Stone"] = sets['elemental magic']
	sets.MA["Stone II"] = sets['elemental magic']
	sets.MA["Stone III"] = sets['elemental magic']
	sets.MA["Stone IV"] = sets['elemental magic']
	sets.MA["Stone V"] = sets['elemental magic']
	sets.MA["Thunder"] = sets['elemental magic']
	sets.MA["Thunder II"] = sets['elemental magic']
	sets.MA["Thunder III"] = sets['elemental magic']
	sets.MA["Thunder IV"] = sets['elemental magic']
	sets.MA["Thunder V"] = sets['elemental magic']
	sets.MA["Water"] = sets['elemental magic']
	sets.MA["Water II"] = sets['elemental magic']
	sets.MA["Water III"] = sets['elemental magic']
	sets.MA["Water IV"] = sets['elemental magic']
	sets.MA["Water V"] = sets['elemental magic']
	sets.MA["Blaze Spikes"] = sets['enhancing magic']
	sets.MA["Ice Spikes"] = sets['enhancing magic']
	sets.MA["Shock Spikes"] = sets['enhancing magic']
	sets.MA["Poison"] = sets['enfeebling magic']
	sets.MA["Poison II"] = sets['enfeebling magic']
	sets.MA["Sleep"] = sets['enfeebling magic']
	sets.MA["Sleep II"] = sets['enfeebling magic']
	sets.MA["Blind"] = sets['enfeebling magic']
	sets.MA["Blind II"] = {
		baseset=sets['enfeebling magic'],
		legs="Vitivation tights +1",
	}
	sets.MA["Break"] = sets['enfeebling magic']
	sets.MA["Bind"] = sets['enfeebling magic']
	sets.MA["Dispel"] = sets['enfeebling magic']
	sets.MA["Gravity"] = sets['enfeebling magic']
	sets.MA["Gravity II"] = sets['enfeebling magic']
	sets.MA["Distract"] = sets['enfeebling magic']
	sets.MA["Distract II"] = sets['enfeebling magic']
	sets.MA["Distract III"] = sets['enfeebling magic']
	sets.MA["Frazzle"] = sets['enfeebling magic']
	sets.MA["Frazzle II"] = sets['enfeebling magic']
	sets.MA["Frazzle III"] = sets['enfeebling magic']
	sets.MA["Bio"] = sets['enfeebling magic']
	sets.MA["Bio II"] = sets['enfeebling magic']
	sets.MA["Bio III"] = {
		sets['enfeebling magic'],
		legs="Vitivation tights +1",
	}
	
	-- Bluemage sub
	sets.MA['Cocoon'] = sets['fast cast']
	sets.MA['Blank Gave'] = sets['fast cast']
	sets.MA['Jettatura'] = sets['fast cast']
	sets.MA['Battle Dance'] = sets['fast cast']
	
	-- White Mage Sub
	sets.MA['Curaga'] = sets.MA.Cure
	sets.MA['Curaga II'] = sets.MA.Cure
	
	sets.MA['Poisona'] = sets['fast cast']
	sets.MA['Paralina'] = sets['fast cast']
	sets.MA['Blindna'] = sets['fast cast']
	sets.MA['Silena'] = sets['fast cast']
	sets.MA['Stona'] = sets['fast cast']
	sets.MA['Viruna'] = sets['fast cast']
	sets.MA['Cursna'] = sets['fast cast']

	sets.MA['Barfira'] = sets['fast cast']
	sets.MA['Barblizzara'] = sets['fast cast']
	sets.MA['Baraera'] = sets['fast cast']
	sets.MA['Barstonra'] = sets['fast cast']
	sets.MA['Barthundra'] = sets['fast cast']
	sets.MA['Barwatera'] = sets['fast cast']
	sets.MA['Barsleepra'] = sets['fast cast']
	sets.MA['Barpoisonra'] = sets['fast cast']
	sets.MA['Barparalyzra'] = sets['fast cast']
	sets.MA['Barblindra'] = sets['fast cast']
	sets.MA['Barsilencera'] = sets['fast cast']
	sets.MA['Barpetra'] = sets['fast cast']
	sets.MA['Barvira'] = sets['fast cast']

	sets.MA['Cura'] = sets.MA.Cure
	
	sets.MA['Repose'] = {
		precast=sets['fast cast'],
		baseset=sets.macc
	}

	sets.MA['Flash'] = {
		precast=sets['fast cast'],
		baseset=sets.macc
	}

	sets.MA['Teleport-Holla'] = sets['fast cast']
	sets.MA['Teleport-Mea'] = sets['fast cast']
	sets.MA['Teleport-Dem'] = sets['fast cast']



	sets.MA['Reraise'] = sets['fast cast']


	sets.MA['Erase'] = sets['fast cast']

	-- White Mage sub

	sets.JA['Divine Seal'] = {
	
	}
	
	-- Ninja sub
if player.sub_job == 'NIN' then	
	sets.MA["Utsusemi: Ichi"] ={
		baseset=sets["fast cast"],
		precast={
			neck="Magoraga Beads"
		}
	}
	
	sets.MA["Utsusemi: Ni"] = sets.MA["Utsusemi: Ichi"]
end	
	
	-- Dancer sub
if player.sub_job == 'DNC' then	
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
end

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
end
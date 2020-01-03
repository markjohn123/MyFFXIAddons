function sub_job_change(new,old)
	local player = windower.ffxi.get_player()
	
	if T{'DNC', 'NIN'}:contains(new) ~= true 
	   or player.sub_job_level < 49
	then
		weapon = "axe and shield"
	else
		weapon = "axes"
	end
	gear_command()
end

function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	windower.send_command('bh ready 10 ; bh dws Calamity')
	-- Whether or not to idle with the glyph axe.
	idle_in_glyph = idle_in_glyph or false
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')

	magical_pet_tp = T{"Fireball"}

	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets["glyph"] = {
		sub="Glyph Axe"
	}
	
	sets["weapons"]["Charmer's Merlin"] = {
		main="Kerehcatl",
		sub="Charmer's Merlin",
	}
	
	sets["weapons"]["sic"]  = sets["weapons"]["Charmer's Merlin"]
	sets["weapons"]["ready"]  = sets["weapons"]["Charmer's Merlin"]
	
--	sets.weapons["Kumbhakarna"] = {
--		main="Kumbhakarna",
--		sub="Hatxiik"
--	}
	
--	sets.weapons["Guttler"] = {
--		main="Guttler",
--		sub="Kumbhakarna"
--	}

--	sets.weapons["Guttler_Arktoi"] = {
--		main="Guttler",
--		sub="Arktoi"
--	}


	sets.weapons["Kerehcatl_Buramgh"] = {
		main="Kerehcatl",
		sub="Buramgh",
	}

	sets.weapons['axes'] = sets["weapons"]["Charmer's Merlin"]
--	sets.weapons['petpdt'] = {
--		baseset=sets.weapons_Guttler_Arktoi,
--		main="Izizoeksi"
--	}
	
--	sets.weapons["Izizoeksi"]  = {
--		main="Izizoeksi",
--		sub="Hunahpu"
--	}
	

--	sets.weapons["axes pet haste"]  = {
--		main="Izizoeksi",
--		sub="Hunahpu"
--	}
	
--	sets.weapons["axes pet acc"]  = {
--		main="Kerehcatl",
--		sub="Hunahpu"
--	}
	
	
--	sets.weapons['Izizoeksi and shield'] = {
--		main="Izizoeksi",
--		sub="Evalach +1"
--	}
	
--	sets.weapons['Izizoeksi and shield killer'] = {
--		main="Izizoeksi",
--		sub="Thuellaic Ecu +1",
--		range="Killer Shortbow"
	--}
	
	sets.weapons['axe and shield'] = {
		main="Kerehcatl",
		sub="Evalach"
	}

	sets.weapons['axe and shield magic'] = {
		main="Kerehcatl",
		sub="Beatific Shield +1"
	}

	sets.weapons['axe_and_shield_magic'] = sets.weapons['axe and shield magic']
	sets.weapons['axeandshieldmagic'] = sets.weapons['axe and shield magic']
	sets.weapons['axe_and_shield'] = sets.weapons['axe and shield']
	sets.weapons['axeandshield'] = sets.weapons['axe and shield']

--	sets.weapons['petpdt axe and shield'] = {
--		baseset=sets.weapons['axe and shield'],
--		main="Izizoeksi"
--	}
	
--	sets.weapons['axe and shield killer'] = {
--		main="Kumbhakarna",
--		sub="Thuellaic Ecu +1",
--		range="Killer Shortbow"
--	}
	
--	sets.weapons['charm axe'] = {
	--	main="Buramgh +1",
--	}
	
	sets['Idle'] = {
    ammo="Demonry Core",
    head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -1%','Rng.Acc.+9',}},
    body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -2%','Enmity-3',}},
    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Rng.Atk.+7',}},
    legs="Wisent Kecks",
    feet="Skadi's Jambeaux",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    back="Pastoralist's Mantle",
	}
	
	sets['Idle']['pet'] = sets['Idle']
	
	sets['status'] = {}
	
	sets.Idle['ACC'] = sets.Idle
	
	sets.status["pet"] = {
    ammo="Paeapua",
 --   head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
--    body={ name="Ankusa Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
 --   hands="Totemic Gloves +1",
-- --   legs="Ankusa Trousers +1",
--    feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Pastoralist's Mantle",
	}

	sets.status['stp'] = {
--    ammo="Ginsen",
    head="Yaoyotl Helm",
--    body={ name="Xaddi Mail", augments={'Attack+15','Accuracy+10','"Store TP"+3',}},
--    hands="Xaddi Gauntlets",
    legs="Iuitl Tights +1",
--    feet="Tot. Gaiters +1",
    neck="Ocachi Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
--		left_ear="Dudgeon Earring",
--		right_ear="Heartseeker Earring",
    left_ring="Rajas Ring",
    right_ring="K'ayres Ring",
    back="Atheling Mantle",
	}
	
	sets.status['da'] = {
    ammo="Paeapua",
    head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -1%','Rng.Acc.+9',}},
    body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -2%','Enmity-3',}},
    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Rng.Atk.+7',}},
    legs="Wisent Kecks",
    feet={ name="Iuitl Gaiters +1", augments={'Phys. dmg. taken -3%','Accuracy+5',}},
    neck="Asperity Necklace",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}

	sets.status['dw'] = {
--    ammo="Hasty pinion +1",
--    head="Felistris Mask",
--    body="Skadi's Cuirie +1",
 --   hands="Nilas Gloves",
--    legs="Sombra Tights",
--    feet="Iuitl gaiters +1",
    neck="Asperity Necklace",
--    waist="Patentia Sash",
    left_ear="Brutal Earring",
    right_ear="Suppanomimi",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Atheling Mantle",
	}

	local tmpplayer = windower.ffxi.get_player()
	sets['Engaged'] = sets.status.da
	if tmpplayer then
		if T{"DNC", "NIN"}:contains(tmpplayer.sub_job) then
			sets['Engaged'] = sets.status.da
		else
				sets['Engaged'] = sets.status.da
		end
	end
	
	sets.Engaged['ACC'] = {
--    ammo="Jukukik Feather",
    head="Yaoyotl Helm",
--    body={ name="Xaddi Mail", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
--    hands={ name="Xaddi Gauntlets", augments={'Accuracy+15','"Store TP"+3','"Dbl.Atk."+2',}},
--    legs={ name="Xaddi Cuisses", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
--    feet={ name="Xaddi Boots", augments={'HP+45','Accuracy+15','Phys. dmg. taken -3',}},
--    neck="Iqabi Necklace",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
--    left_ring="Patricius Ring",
--    right_ring="Mars's Ring",
    back="Pastoralist's Mantle",
}

	sets.Engaged["pet"] = sets.status.stp
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Idle['NORMAL']['pet'] = sets.Idle.pet
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Engaged['NORMAL']['pet'] = sets.Engaged.pet
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['DA']  = tempIdleset
	sets.Idle['STP'] = tempIdleset
	sets.Idle['DW']  = tempIdleset
	sets.Engaged['DA']  = sets.status.da
	sets.Engaged['STP'] = sets.status.stp
	sets.Engaged['DW']  = sets.status.dw
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
    ammo="Demonry Core",
    head={ name="Iuitl Headgear +1", augments={'Phys. dmg. taken -1%','Rng.Acc.+9',}},
    body={ name="Iuitl Vest +1", augments={'Phys. dmg. taken -2%','Enmity-3',}},
    hands={ name="Iuitl Wristbands +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -3%','Rng.Atk.+7',}},
    legs="Iuitl Tights +1",
    feet={ name="Iuitl Gaiters +1", augments={'Phys. dmg. taken -3%','Accuracy+5',}},
    neck="Twilight Torque",
    waist="Flume Belt",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    back="Repulse Mantle",
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
		PDT={
		
		}
		
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.HPDT,
--    head="Ighwa Cap",
    hands="Iuitl Wristbands +1",
    legs="Iuitl Tights +1",
		PDT={
		
		}
		
	}
	
	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = {
--    head="Felistris Mask",
    body="Iuitl Vest +1",
    hands="Iuitl Wristbands +1",
    legs="Iuitl Tights +1",
--    feet={ name="Ankusa Gaiters +1", augments={'Enhances "Beast Healer" effect',}},
    neck="Twilight Torque",
--    waist="Nierenschutz",
--    left_ear="Sabong Earring",
    right_ear="Rimeice Earring",
    left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Breath dmg. taken -5%',}},
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -5%','Breath dmg. taken -3%',}},
    back="Mubvum. Mantle",
	}
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Engaged.PDT

	sets.Engaged['PETHASTE'] = {
    ammo="Demonry Core",
--    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
--    body={ name="Ankusa Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
 --   hands="Totemic Gloves +1",
 --   legs="Ankusa Trousers +1",
 --   feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
--    left_ear="Sabong Earring",
    right_ear="Rimeice earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Pastoralist's Mantle",
	}
	
	sets.Idle['PETHASTE'] = sets.Engaged['PETHASTE']
	
	sets.Engaged['PETHASTE']['pet'] = {
    ammo="Demonry Core",
--    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
--    body={ name="Ankusa Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
--    hands="Totemic Gloves +1",
--    legs="Ankusa Trousers +1",
--    feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
--    left_ear="Sabong Earring",
--    right_ear="Ferine Earring",
    left_ring="Rajas Ring",
    right_ring="Epona's Ring",
    back="Pastoralist's Mantle",
	}


	sets.Idle['PETPDT'] = {
		baseset=temIdleset,
--    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Accuracy+3','Pet: Haste+5',}},
--    hands={ name="Ankusa Gloves +1", augments={'Enhances "Beast Affinity" effect',}},
    legs="Ferine Quijotes +2",
--    feet={ name="Ankusa Gaiters +1", augments={'Enhances "Beast Healer" effect',}},
--    waist="Isa Belt",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    back="Pastoralist's Mantle"
	}	
	
	sets.Engaged['PETPDT'] = {
		baseset=tempEngagedset,
--    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Accuracy+3','Pet: Haste+5',}},
--    hands={ name="Ankusa Gloves +1", augments={'Enhances "Beast Affinity" effect',}},
    legs="Ferine Quijotes +2",
--    feet={ name="Ankusa Gaiters +1", augments={'Enhances "Beast Healer" effect',}},
--    waist="Isa Belt",
    left_ear="Handler's Earring",
    right_ear="Rimeice Earring",
    back="Pastoralist's Mantle"
	}
	
	sets.Idle['PETACC'] = {
		baseset=tempIdleset,
    ammo="Demonry Core",
--    head="Totemic Helm +1",
		legs="Wisent Kecks",
--    feet="Tot. Gaiters +1",
    waist="Hurch'lan Sash",
--    right_ear="Ferine Earring",
    back="Pastoralist's Mantle",
	}

	sets.Engaged['PETACC'] = {
		baseset=tempEngagedset,
    ammo="Demonry Core",
--    head="Totemic Helm +1",
--    feet="Tot. Gaiters +1",
    waist="Hurch'lan Sash",
--    right_ear="Ferine Earring",
    back="Pastoralist's Mantle",
	}

	sets.Idle['PETMDT'] = {
		baseset=sets.Idle.PETPDT,
--		waist="Isa belt",
	}
	
	sets.Engaged['PETMDT'] = {
		baseset=sets.Engaged.PETPDT,
--		waist="Isa belt",
	}
	-- "PETPDT", "MASTERMDT", "PETMDT", "HYBRIDMASTERPETPDT", "MASTERACC", "PETACC"
	
	sets.Idle['PETEVA'] = {
	
	}
	sets.Idle['PETEVASION'] = sets.Idle.PETEVA
	
	sets.Engaged['PETEVA'] = {
	
	}
	sets.Engaged['PETEVASION'] = {
	
	}
	
	sets.Idle['TWILIGHT'] = {
		baseset=tempIdleset,
		head="Twilight Helm",
--		body="Twilight mail",
	}
	
	sets.Engaged['TWILIGHT'] = {
		baseset=sets.Idle['TWILIGHT'],
		PDT={
			head="Twilight Helm",
--			body="Twilight mail",
		}
	}
	
	sets['da'] = {
    ammo="Paeapua",
--    head="Felistris Mask",
--    body={ name="Xaddi Mail", augments={'Attack+15','Accuracy+10','"Store TP"+3',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    back="Atheling Mantle",
--    hands="Nilas Gloves"
	}
	
	sets['str'] = {
--    body="Tot. Jackcoat +1",
--    hands={ name="Ankusa Gloves +1", augments={'Enhances "Beast Affinity" effect',}},
--    legs="Osmium Cuisses",
--    feet="Tot. Gaiters +1",
--    left_ring="Pyrosoul Ring",
 --   right_ring="Pyrosoul Ring",
	}
	
	sets['dex'] = {
----    ammo="Jukukik Feather",
--    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
--    body="Ankusa jackcoat +1",
--    hands="Nilas Gloves",
--    legs="Ankusa Trousers +1",
--    feet="Tot. Gaiters +1",
    left_ring="Rajas Ring",
--    right_ring="Thundersoul Ring",
	}
	
	sets['vit'] = {
    head="Yaoyotl Helm",
--    body="Tot. Jackcoat +1",
--    hands="Tot. Gloves +1",
--    legs="Osmium Cuisses",
--    feet="Tot. Gaiters +1",
--    right_ring="Terrasoul Ring",
	
	}
	
	sets['agi'] = {}
	
	sets['int'] = {}
	
	sets['mnd'] = {
--    head="Totemic Helm +1",
--    body="Tot. Jackcoat +1",
--    hands={ name="Ankusa Gloves +1", augments={'Enhances "Beast Affinity" effect',}},
--    legs="Tot. Trousers +1",
--    feet="Tot. Gaiters +1",
    neck="Promise Badge",
--    left_ring="Aquasoul Ring",
--    right_ring="Aquasoul Ring",
    back="Pastoralist's Mantle",
	}
	
	
	sets['chr'] = {
--    head="totemic helm +1",
--    body="Tot. Jackcoat +1",
--    hands="Totemic Gloves +1",
--    feet="Aristo Belt",
--    legs="Osmium Cuisses",
--    feet="Tot. Gaiters +1",
    back="Pastoralist's Mantle",
	}

	sets['attack'] = {
--    head="Ighwa Cap",
--    body={ name="Xaddi Mail", augments={'Attack+15','Accuracy+10','"Store TP"+3',}},
    back="Atheling Mantle",
	}
	
	sets['charm plus'] = {
		baseset=sets["charm axe"],
--    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
--    body={ name="Ankusa Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
--    hands={ name="Ankusa Gloves +1", augments={'Enhances "Beast Affinity" effect',}},
--    legs="Tot. Trousers +1",
--    feet="Ankusa gaiters +1"
	}
	
	sets['mab'] = {
--    ammo="Erlene's Notebook",
--    head="Highwing Helm",
    body="Phorcys Korazin",
--   hands="Nilas gloves",
    legs="Augury Cuisses",
    neck="Stoicheion Medal",
--    left_ear="Crematio Earring",
    right_ear="Friomisi earring",
		left_ring="Acumen Ring",
--    right_ring="Adoulin Ring",
--    back="Argochampsa mantle",
--		waist="Salire Belt",
	}
	
	sets['macc'] = {
--    hands="Tot. Gloves +1",
    legs="Iuitl Tights +1",
    feet="Iuitl Gaiters +1",
--    neck="Enfeebling Torque",
    waist="Crudelis Belt",
    left_ear="Lifestorm Earring",
    right_ear="Psystorm Earring",
    left_ring="Perception Ring",
--    right_ring="Aquasoul Ring",
    back="Pastoralist's Mantle",
	}
	
	sets['killer effects'] = {
--    head="Ankusa Helm +1",
--    body="Ferine Gausape +2",
 --   legs="Tot. Trousers +1",
	}
	
	sets['weaponskill']={
		basesets={sets.attack, sets.str, sets.da},
		left_ear="Brutal Earring",
--		right_ear="Moonshade Earring",
	}
	
	sets['WS'] = {}

	sets.WS['Raging Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Smash Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Gale Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Avalanche Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Spinning Axe'] = {
		baseset=sets.weaponskill
	}
	
	-- Needs soil necklace and belt
	sets.WS['Rampage'] = {
		baseset=sets.weaponskill,
		neck="Soil Gorget",
		left_ear="Steelflash earring",
		right_ear="Bladeborn earring",
--		hands="Ferine manoplas +2",
--		back="Rancorous Mantle",
		waist="Soil belt"
	}
	
	sets.WS['Calamity'] = {
    ammo="Paeapua",
--    head="Felistris Mask",
    body="Phorcys Korazin",
--    hands="Nilas Gloves",
--    legs="Osmium Cuisses",
--    feet="Whirlpool Greaves",
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Brutal Earring",
--    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Epona's Ring",
--    right_ring="Pyrosoul Ring",
    back="Atheling Mantle",
	}
	
	sets.WS['Mistral Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Decimation'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Primal Rend'] = {
		basesets={sets.dex,sets.mab,sets.chr},
--    ammo="Erlene's Notebook",
--		right_ear="Moonshade Earring",
--		head="Highwing Helm",
		body="Phorcys Korazin",
--		hands="",
		left_ring="Acumen Ring",
--		right_ring="Adoulin Ring",
--		back="Argochampsa mantle",
		legs="Augury Cuisses"
	}
	
	sets.WS['Bora Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Cloudsplitter'] = {
		baseset=sets.mab,
--  	head="Highwing helm",
--  	left_ear="moonshade earring",
--		body="Totemic Jackcoat +1",
--		hands="Nilas gloves",
--		waist="Crudelis Belt",
--		legs="Ogier's breeches",
--		feet="Whirlpool greaves",
--		feet="Sombra Leggings",
--		right_ear="Moonshade Earring"
	}
	
	sets.WS['Ruinator'] = {
		basesets={
			sets.weaponskill,
			-- sets.Engaged.ACC
			},
		neck="Breeze Gorget",
		waist="Breeze Belt",
		ACC=sets.Engaged.ACC
	}
	
	sets.WS['Onslaught'] = {
--    ammo="Paeapua",
---    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
--    body={ name="An. Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
 --   hands="Nilas Gloves",
 --   legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
--    feet="Tot. Gaiters +1",
 --   neck="Shadow Gorget",
--    waist="Windbuffet Belt +1 +1",
--    left_ear="Steelflash Earring",
--    right_ear="Bladeborn Earring",
--    left_ring="Rajas Ring",
--    right_ring="Thundersoul Ring",
--    back="Atheling Mantle",
--		ACC=sets.Engaged.ACC
	}
	
	sets['JA'] = {}
	
	sets.JA['Familiar'] = {
--		legs="Ankusa Trousers +1"
	}

	sets.JA['Charm'] = {
		basesets={sets.macc, sets.chr, sets["charm plus"]}
	}

	sets.JA['Gauge'] = sets.JA.Charm

	sets.JA['Tame'] = {
		baseset=sets.JA.Charm,
--		head="Totemic helm +1"
	}

	sets.JA['Reward'] = {
		basesets={sets.mnd,{precast={head="Bison Warbonnet"}}},
		ammo="Pet Food Theta",
--		left_ear="Pratik Earring",
--		right_ear="Ferine Earring",
--		body="Totemic jackcoat +1",
--		hands="Ogre Gloves",
--		legs="Totemic trousers +1",
--		feet="Ankusa gaiters +1"
	}

	sets.JA['Call Beast'] = {
		hands="Monster Gloves +2"
	}
	
	sets.JA['Bestial Loyalty'] = sets.JA['Call Beast']

	sets.JA['Killer Instinct'] = {
--		head="Ankusa helm +1"
	}

	sets.JA['Unleash'] = {
	}
	
	sets.JA['Feral Howl'] = {
		baseset=sets.macc,
--		body="Ankusa Jackcoat +1"
	}

	sets['petmatt'] = {
--		back="Argocham. mantle"
	}

	sets['petda'] = {
		neck="Ferine Necklace",
--		left_ear="Sabong Earring",
--		body="Acro Surcoat",
--		feet="Ferine Ocreae +2"
	}
	
	sets['petacc'] = {
		ammo="Demonry Core",
--		head="Totemic Helm +1",
--		right_ear="Ferine Earring",
		back="Pastoralist's Mantle",
		waist="Hurch'lan Sash",
		legs="Wisent Kecks",
--		feet="Totemic gaiters +1"
	}
	
	sets['petatt'] = {
--    head="Totemic Helm +1",
--    body={ name="An. Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
--    hands="Frn. Manoplas +2",
--    legs="Tot. Trousers +1",
--    feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
--    left_ear="Sabong Earring",
--    right_ear="Ferine Earring",
    back="Pastoralist's Mantle",
	}

	sets['sic'] = {
		precast={
	    legs="Desultor Tassets",
		},
    ammo="Demonry Core",
--    head="Totemic Helm +1",
--    body="Acro Surcoat",
--    hands="Frn. Manoplas +2",
    legs="Desultor Tassets",
--    feet="Totemic gaiters +1",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
 --   left_ear="Sabong Earring",
--    right_ear="Ferine Earring",
    back="Pastoralist's Mantle",
	}

	sets['PET'] = {}
	
	sets.PET['Fight'] = {
	
	}
	
	sets.PET['Heel'] = {
	
	}
	
	sets.PET['Leave'] = {
	
	}
	
	sets.PET['Stay'] = {
	
	}
	
	sets.PET['Snarl'] = {
	
	}
	
	sets.PET['Sic'] = {
		baseset=sets.sic
	}
	
	sets.PET['Spur'] = {
--		feet="Ferine Ocreae +2"
	}
	
	sets.PET['Run Wild'] = {
	
	}
	
	sets.PET["Foot Kick"] = {
		baseset=sets.sic,
	}

	sets.PET["Dust Cloud"] = {
		baseset=sets.sic
	}

	sets.PET["Whirl Claws"] = {
		baseset=sets.sic
	}

	sets.PET["Head Butt"] = {
		baseset=sets.sic
	}

	sets.PET["Dream Flower"] = {
		baseset=sets.sic
	}

	sets.PET["Wild Oats"] = {
		baseset=sets.sic
	}

	sets.PET["Leaf Dagger"] = {
		baseset=sets.sic
	}

	sets.PET["Scream"] = {
		baseset=sets.sic
	}

	sets.PET["Roar"] = {
		baseset=sets.sic
	}

	sets.PET["Razor Fang"] = {
		baseset=sets.sic
	}

	sets.PET["Claw Cyclone"] = {
		baseset=sets.sic
	}

	sets.PET["Tail Blow"] = {
		baseset=sets.sic
	}

	sets.PET["Fireball"] = {
		basesets={sets.sic, sets.petmatt}
	}

	sets.PET["Blockhead"] = {
		baseset=sets.sic
	}

	sets.PET["Brain Crush"] = {
		baseset=sets.sic
	}

	sets.PET["Infrasonics"] = {
		baseset=sets.sic
	}

	sets.PET["Secretion"] = {
		baseset=sets.sic
	}

	sets.PET["Lamb Chop"] = {
		basesets={sets.sic, sets.petatt}
	}

	sets.PET["Rage"] = {
		baseset=sets.sic
	}

	sets.PET["Sheep Charge"] = {
		baseset={sets.sic, sets.petatt}
	}

	sets.PET["Sheep Song"] = {
		baseset=sets.sic
	}

	sets.PET["Bubble Shower"] = {
		baseset=sets.sic
	}

	sets.PET["Bubble Curtain"] = {
		baseset=sets.sic
	}

	sets.PET["Big Scissors"] = {
		baseset=sets.sic,
	}

	sets.PET["Scissor Guard"] = {
		baseset=sets.sic
	}

	sets.PET["Metallic Body"] = {
		baseset=sets.sic
	}

	sets.PET["Needleshot"] = {
		baseset=sets.sic
	}

	sets.PET["1000 Needles"] = {
		baseset=sets.sic
	}

	sets.PET["Frogkick"] = {
		baseset=sets.sic
	}

	sets.PET["Spore"] = {
		baseset=sets.sic
	}

	sets.PET["Queasyshroom"] = {
		baseset=sets.sic
	}

	sets.PET["Numbshroom"] = {
		baseset=sets.sic
	}

	sets.PET["Shakeshroom"] = {
		baseset=sets.sic
	}

	sets.PET["Silence Gas"] = {
		baseset=sets.sic
	}

	sets.PET["Dark Spore"] = {
		baseset=sets.sic
	}

	sets.PET["Power Attack"] = {
		baseset=sets.sic,
	}

	sets.PET["Hi-Freq Field"] = {
		baseset=sets.sic
	}

	sets.PET["Rhino Attack"] = {
		baseset=sets.sic
	}

	sets.PET["Rhino Guard"] = {
		baseset=sets.sic
	}

	sets.PET["Spoil"] = {
		baseset=sets.sic
	}

	sets.PET["Cursed Sphere"] = {
		baseset=sets.sic
	}

	sets.PET["Venom"] = {
		baseset=sets.sic
	}

	sets.PET["Sandblast"] = {
		baseset=sets.sic
	}

	sets.PET["Sandpit"] = {
		baseset=sets.sic
	}

	sets.PET["Venom Spray"] = {
		baseset=sets.sic
	}

	sets.PET["Mandibular Bite"] = {
		baseset=sets.sic
	}

	sets.PET["Soporific"] = {
		baseset=sets.sic
	}

	sets.PET["Gloeosuccus"] = {
		baseset=sets.sic
	}

	sets.PET["Palsy Pollen"] = {
		baseset=sets.sic
	}

	sets.PET["Geist Wall"] = {
		baseset=sets.sic
	}

	sets.PET["Numbing Noise"] = {
		baseset=sets.sic
	}

	sets.PET["Nimble Snap"] = {
		baseset=sets.sic
	}

	sets.PET["Cyclotail"] = {
		baseset=sets.sic
	}

	sets.PET["Toxic Spit"] = {
		baseset=sets.sic
	}

	sets.PET["Double Claw"] = {
		baseset=sets.sic
	}

	sets.PET["Grapple"] = {
		baseset=sets.sic
	}

	sets.PET["Spinning Top"] = {
		baseset=sets.sic
	}

	sets.PET["Filamented Hold"] = {
		baseset=sets.sic
	}

	sets.PET["Chaotic Eye"] = {
		baseset=sets.sic
	}

	sets.PET["Blaster"] = {
		baseset=sets.sic
	}

	sets.PET["Suction"] = {
		baseset=sets.sic
	}

	sets.PET["Drainkiss"] = {
		baseset=sets.sic
	}

	sets.PET["Snow Cloud"] = {
		baseset=sets.sic
	}

	sets.PET["Wild Carrot"] = {
		baseset=sets.sic
	}

	sets.PET["Sudden Lunge"] = {
		baseset=sets.sic
	}

	sets.PET["Spiral Spin"] = {
		baseset=sets.sic
	}

	sets.PET["Noisome Powder"] = {
		baseset=sets.sic
	}

	sets.PET["Acid Mist"] = {
		baseset=sets.sic
	}

	sets.PET["TP Drainkiss"] = {
		baseset=sets.sic
	}

	sets.PET["Scythe Tail"] = {
		baseset=sets.sic
	}

	sets.PET["Ripper Fang"] = {
		baseset=sets.sic
	}

	sets.PET["Chomp Rush"] = {
		baseset=sets.sic
	}

	sets.PET["Charged Whisker"] = {
		baseset=sets.sic
	}

	sets.PET["Purulent Ooze"] = {
		baseset=sets.sic
	}

	sets.PET["Corrosive Ooze"] = {
		baseset=sets.sic
	}

	sets.PET["Back Heel"] = {
		baseset=sets.sic
	}

	sets.PET["Jettatura"] = {
		baseset=sets.sic
	}

	sets.PET["Choke Breath"] = {
		baseset=sets.sic
	}

	sets.PET["Fantod"] = {
		baseset=sets.sic
	}

	sets.PET["Tortoise Stomp"] = {
		baseset=sets.sic
	}

	sets.PET["Harden Shell"] = {
		baseset=sets.sic
	}

	sets.PET["Aqua Breath"] = {
		baseset=sets.sic
	}

	sets.PET["Wing Slap"] = {
		baseset=sets.sic
	}

	sets.PET["Beak Lunge"] = {
		baseset=sets.sic
	}

	sets.PET["Intimidate"] = {
		baseset=sets.sic
	}

	sets.PET["Recoil Dive"] = {
		baseset=sets.sic
	}

	sets.PET["Water Wall"] = {
		baseset=sets.sic
	}

	sets.PET["Sensilla Blades"] = {
		baseset=sets.sic
	}

	sets.PET["Tegmina Buffet"] = {
		baseset=sets.sic
	}

	sets.PET["Molting Plumage"] = {
		basesets={sets.sic, sets.petmatt}
	}

	sets.PET["Swooping Frenzy"] = {
		baseset=sets.sic
	}

	sets.PET["Sweeping Gouge"] = {
		baseset=sets.sic
	}

	sets.PET["Zealous Snort"] = {
		baseset=sets.sic
	}

	sets.PET["Pentapeck"] = {
		baseset=sets.sic
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
--		ammo='Impatiens',
		right_ear='Loquac. Earring',
		right_ring='Prolix Ring',
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
		precast = {
--	    ammo="Impatiens",
--	    head="Ighwa Cap",
	    body="Iuitl Vest +1",
--	    hands="Umuthi Gloves",
	    legs="Iuitl Tights +1",
--	    feet={ name="Ankusa Gaiters +1", augments={'Enhances "Beast Healer" effect',}},
	    neck="Magoraga Beads",
	    waist="Flume Belt",
	    left_ear="Loquac. Earring",
	    right_ear="Rimeice Earring",
	    left_ring="Prolix Ring",
--	    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
	    back="Repulse Mantle",
		}
	}
	
	sets.MA['Utsusemi: Ni'] = sets.MA['Utsusemi: Ichi']

	sets.MA["Refresh"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Haste"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Stoneskin"]={
		precast=sets.MA['fast cast'],
		baseset=sets.mnd
	}

	sets.MA["Phalanx"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Protect III"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Shell II"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Sneak"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Invisible"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Dispel"]={
		precast=sets.MA['fast cast']
	}

	sets.MA["Distract"]={
		precast=sets.MA['fast cast'],
		baseset=sets.macc
	}

	sets.MA["Frazzle"]={
		precast=sets.MA['fast cast'],
		baseset=sets.macc
	}
	
	sets.MA["Cure"] = {
		precast=sets.MA['fast cast'],
		baseset=sets.mnd,
	}
	
	sets.MA["Cure IV"] = sets.MA.Cure
	sets.MA["Cure III"] = sets.MA.Cure

	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {
--		["killer instinct"] = sets['killer effects']
	}
	
end
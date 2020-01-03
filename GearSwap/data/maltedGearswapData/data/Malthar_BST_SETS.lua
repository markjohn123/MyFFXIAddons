function sub_job_change(new,old)
	local player = windower.ffxi.get_player()
	
	if T{'DNC', 'NIN'}:contains(new) ~= true 
	   or player.sub_job_level < 49
	then
		weapon = "axe and shield"
		windower.send_command('bh ready 15 ; bh dws Primal Rend ; alias glyph gs c glyph')
	else
		weapon = "axes"
		windower.send_command('bh ready 10 ; bh dws Calamity ; alias glyph gs c glyph')
		windower.send_command('petpdt')
	end
	gear_command()
end

function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	sets.elemental_obi 			= { waist="Hachirin-no-obi" }
	sets.weaponskill_belt 	= { waist="Fotia Belt" }
	sets.weaponskill_gorget = { neck ="Fotia Gorget" }

	-- Whether or not to idle with the glyph axe or pdt axe.
	-- Set to glyph or pdt
	idle_in = idle_in or false
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')

	magical_pet_tp = T{"Fireball"}

	--  These are the weapons I use
	sets["weapons"] = {}
	sets.weapons['skullrender'] = {
    main="Skullrender",
    sub="Skullrender",
	}
	
	sets["glyph"] = {
		sub="Glyph Axe"
	}	

	sets["weapons"]["Aymur"] = {
		main="Aymur",
		sub="Charmer's Merlin",	
	}
	
	sets.weapons['aymur'] = sets.weapons.Aymur
	
	sets["weapons"]["Aymur2"] = {
		main="Aymur",
		sub="Arktoi",	
	}
	
	sets["weapons"]["Aymur_Arktoi"] = sets["weapons"]["Aymur2"]
	sets["weapons"]["aymur_Arktoi"] = sets["weapons"]["Aymur2"]
	sets["weapons"]["Aymur_arktoi"] = sets["weapons"]["Aymur2"]
	sets["weapons"]["aymur_arktoi"] = sets["weapons"]["Aymur2"]

	sets["weapons"]["Charmer's Merlin"] = sets["weapons"]["Aymur"]
	sets["weapons"]["sic"]  = sets["weapons"]["Charmer's Merlin"]
	sets["weapons"]["ready"]  = sets["weapons"]["Charmer's Merlin"]
	
	sets.weapons["Guttler_Arktoi"] = {
		main="Guttler",
		sub="Arktoi"
	}

	sets.weapons["Aymur_Arktoi"] = {
		main="Aymur",
		sub="Arktoi"
	}

	sets.weapons["Guttler"] = {
		main="Guttler",
		sub="Charmer's Merlin"
	}

	sets["weapons"]["Guttler2"] = {
		main="Guttler",
		sub="Arktoi",	
	}
	
	if not T{'NIN', 'DNC'}:contains(player.sub_job) then
		sets.weapons.Guttler.sub = "Adapa Shield"
		sets.weapons.Guttler2.sub = ""
		sets["weapons"]["Aymur"].sub = "Adapa Shield"
		sets["weapons"]["Aymur2"].sub = "Adapa Shield"
	end
	
	sets.weapons['aymur and kaidate'] = {
		main="Aymur",
		sub = "kaidate"
	}

	sets.weapons['aymur_and_kaidate'] = sets.weapons['aymur and kaidate']
	sets.weapons['aymur kaidate'] = sets.weapons['aymur and kaidate']
	sets.weapons['aymur_kaidate'] = sets.weapons['aymur and kaidate']

	sets.weapons['aymur and shield'] = {
		main="Aymur",
		sub = "Adapa Shield"
	}

	sets.weapons['aymur_and_shield'] = sets.weapons['aymur and shield']
	sets.weapons['aymur shield'] = sets.weapons['aymur and shield']
	sets.weapons['aymur_shield'] = sets.weapons['aymur and shield']


	sets["weapons"]["Guttler_Arktoi"] = sets["weapons"]["Guttler2"]
	sets["weapons"]["guttler_Arktoi"] = sets["weapons"]["Guttler2"]
	sets["weapons"]["Guttler_arktoi"] = sets["weapons"]["Guttler2"]
	sets["weapons"]["guttler_arktoi"] = sets["weapons"]["Guttler2"]

	sets.weapons["guttler"] = sets.weapons["Guttler"]

	sets.weapons['guttler and shield'] = {
		main="Guttler",
		sub="Adapa Shield"
	}
	
	sets.weapons['guttler and kaidate'] = {
		main="Guttler",
		sub="Kaidate"	
	}
	sets.weapons['guttler_and_kaidate'] = sets.weapons['guttler and kaidate']
	sets.weapons['guttler kaidate'] = sets.weapons['guttler and kaidate']
	sets.weapons['guttler_kaidate'] = sets.weapons['guttler and kaidate']

	sets.weapons['guttler and evalach'] = {
		main="Guttler",
		sub="Adapa Shield"	
	}
	sets.weapons['guttler_and_evalach'] = sets.weapons['guttler and evalach']
	sets.weapons['guttler evalach'] = sets.weapons['guttler and evalach']
	sets.weapons['guttler_evalach'] = sets.weapons['guttler and evalach']

	sets.weapons['farsha'] = {
		main='Farsha',
		sub="Charmer's Merlin"
	}
	
	sets.weapons['farsha and arktoi'] = {
		main="Farsha",
		sub="Arktoi"
	}
	sets.weapons['farsha_and_arktoi'] = sets.weapons['farsha and arktoi']
	sets.weapons['farsha arktoi'] = sets.weapons['farsha and arktoi']
	sets.weapons['farsha_arktoi'] = sets.weapons['farsha and arktoi']

	sets.weapons['farsha and shield'] = {
		main="Farsha",
		sub="Adapa Shield"
	}
	sets.weapons['farsha_and_shield'] = sets.weapons['farsha and shield']
	sets.weapons['farsha shield'] = sets.weapons['farsha and shield']
	
	sets.weapons['farsha and evalach'] = {
		main="Farsha",
		sub="Adapa Shield"
	}
	sets.weapons['farsha_and_Evalach'] = sets.weapons['farsha and Evalach']
	sets.weapons['farsha Evalach'] = sets.weapons['farsha and Evalach']
	
	if not T{'DNC', 'NIN'}:contains(player.sub_job) then
		sets.weapons['farsha'] = sets.weapons['farsha and evalach']	
	end

	sets.weapons['petpdt'] = {
		main="Aymur",
		sub="Izizoeksi"
	}
	
	sets.weapons["petacc"] = {
		main="Aymur",
		sub="Arktoi"
	}
	
	sets.weapons['axe and shield'] = {
		main="Aymur",
		sub="Adapa Shield"
	}

	sets.weapons['axe and shield magic'] = sets.weapons['axe and shield']
	sets.weapons['guttler and shield magic defense'] = {
	
	}
	sets.weapons['axe_and_shield_magic'] = sets.weapons['axe and shield magic']
	sets.weapons['axeandshieldmagic'] = sets.weapons['axe and shield magic']
	sets.weapons['axe_and_shield'] = sets.weapons['axe and shield']
	sets.weapons['axeandshield'] = sets.weapons['axe and shield']

--	sets.weapons['charm axe'] = {
--		main="Buramgh +1",
--	}
	
	-- Equip this weapon when idle_in is not null
	sets.weapons['physical_ready_weapons'] = {
		main="Aymur",
		sub="Arktoi",
		--name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},	
	}
	
	-- TODO: Equip this weapon when idle_in is not null
	sets.weapons['magical_ready_weapons'] = {
	
	}

	sets.weapons['axes'] = sets["weapons"]["Aymur"]

	
  sets.master_pet_idle = {
    ammo="Demonry Core",
    head="Anwig Salade",
    body={ name="Acro Surcoat", augments={'Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    hands={ name="Acro Gauntlets", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    legs={ name="Acro Breeches", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet="Skadi's Jambeaux +1",
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back="Pastoralist's Mantle",
  }

--  sets.regen_axe = {
--  	sub="Buramgh +1",
 -- }

	sets['Idle'] = {
    ammo="Demonry Core",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    body={ name="Acro Surcoat", augments={'Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    hands="Totemic Gloves +2",
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet="Skd. Jambeaux +1",
    neck="Ferine Necklace",
    waist="Klouskap Sash",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}
	
	sets['Idle']['pet'] = sets['Idle']
	
	sets['status'] = {}
	
	sets.Idle['ACC'] = sets.Idle
	
	sets.status["pet"] = {
    ammo="Paeapua",
    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands="Totemic Gloves +2",
    legs={ name="Ankusa Trousers +1", augments={'Enhances "Familiar" effect',}},
    feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}

	sets.status['da'] = {
    ammo="Paeapua",
    head={ name="Valorous Mask", augments={'Attack+2','"Dbl.Atk."+4','STR+11','Accuracy+2',}},
    body="Tali'ah manteel +1",
    hands={ name="Valorous Mitts", augments={'Accuracy+28','"Dbl.Atk."+5',}},
    legs={ name="Valor. Hose", augments={'Accuracy+7','"Dbl.Atk."+5','STR+1',}},
    feet={ name="Loyalist Sabatons", augments={'STR+3','Attack+5',}},
    neck="Asperity Necklace",
    waist="Sarissapho. Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}

	sets.status['petda'] = {
    ammo="Demonry Core",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Ferine Necklace",
    waist="Incarnation Sash",
    left_ear="Sabong Earring",
    right_ear="Domes. Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	local tmpplayer = windower.ffxi.get_player()

	sets['Engaged'] = sets.status.petda
	--if tmpplayer then
		--if T{"DNC", "NIN"}:contains(tmpplayer.sub_job) then
			--sets['Engaged'] = sets.status.petda
		--else
		--		sets['Engaged'] = sets.status.petda
		--end
	--end
	
	sets.Engaged['ACC'] = {
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','Sklchn.dmg.+1%','DEX+5','Accuracy+14',}},
    body="Tali'ah manteel +1",
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+30','Rng.Acc.+23','Accuracy+17 Attack+17','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet="Meg. Jam. +1",
    neck="Iqabi Necklace",
    waist="Klouskap Sash",
    left_ear="Steelflash Earring",
    right_ear="Zennaroi Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
}

	sets.Idle['RESISTSTUN'] = {
    ammo="Staunch Tathlum",
    head="Lithelimb Cap",
    body="Onca Suit",
    neck="Asperity Necklace",
    waist="Sarissapho. Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Thundersoul Ring",
    right_ring="Terrasoul Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}

	sets.Engaged['RESISTSTUN'] = {
    ammo="Staunch Tathlum",
    head="Lithelimb Cap",
    body="Onca Suit",
    neck="Asperity Necklace",
    waist="Sarissapho. Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Thundersoul Ring",
    right_ring="Terrasoul Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
		PDT={
	    ammo="Staunch Tathlum",
	    head="Lithelimb Cap",
	    body="Onca Suit",
	    left_ring="Thundersoul Ring",
	    right_ring="Terrasoul Ring",
		}
	}
	sets.Engaged["pet"] = sets.Engaged
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	sets.Idle['PETDA'] = {
    ammo="Demonry Core",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Seraweels +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Ferine Necklace",
    waist="Incarnation Sash",
    left_ear="Sabong Earring",
    right_ear="Domes. Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
	
	sets.Engaged['PETDA'] = {
    ammo="Demonry Core",
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Seraweels +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Ferine Necklace",
    waist="Incarnation Sash",
    left_ear="Sabong Earring",
    right_ear="Domes. Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}

	
	sets.Idle['DA']  = tempIdleset
	sets.Idle.DA.head = sets.status['da'].head
	sets.Engaged['DA']  = sets.status.da
	sets.Idle['NORMAL'] = sets.Idle.PETDA
	sets.Idle['NORMAL']['pet'] = sets.Idle.PETDA
	sets.Engaged['NORMAL'] = sets.Engaged.PETDA
	sets.Engaged['NORMAL']['pet'] = sets.Engaged.PETDA
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['STP'] = tempIdleset
	sets.Idle['DW']  = tempIdleset
--	sets.Engaged.DA.ammo = "Ginsen"
--	if T{"NIN","DNC"}:contains(player.sub_job) then
--		sets.Engaged.DA.left_ear  = "Dudgeon Earring"
--		sets.Engaged.DA.right_ear = "Heartseeker Earring"	
--	end
--	sets.Engaged.DA.feet      = "Whirlpool greaves"	
	sets.Engaged.DA.waist = "Sarissaphoroi belt"
	sets.Engaged['STP'] = {
    ammo="Ginsen",
    head={ name="Valorous Mask", augments={'Accuracy+20','"Store TP"+5','Attack+12',}},
    body="Tali'ah Manteel +1",
    hands={ name="Acro Gauntlets", augments={'Accuracy+16 Attack+16','"Store TP"+5','HP+43',}},
    legs={ name="Valor. Hose", augments={'Accuracy+23','"Store TP"+6','DEX+9','Attack+8',}},
    feet={ name="Valorous Greaves", augments={'"Store TP"+7','STR+10','Accuracy+12','Attack+5',}},
    neck="Anu Torque",
    waist="Kentarch Belt +1",
    left_ear="Brutal Earring",
    right_ear="Sherida Earring",
    left_ring="Rajas Ring",
    right_ring="Petrov Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
	sets.Engaged['DW']  = sets.status.dw
	
	sets.Idle['CRIT'] = tempIdleset
	sets.Engaged['CRIT'] = {
    ammo="Jukukik Feather",
    head={ name="Valorous Mask", augments={'Accuracy+18','Crit.hit rate+4','VIT+6','Attack+14',}},
    body="Meg. Cuirie +1",
    hands="Tali'ah Gages +1",
    legs={ name="Valor. Hose", augments={'Accuracy+21','Crit.hit rate+3','DEX+4',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    neck="Nefarious Collar +1",
    waist="Sarissapho. Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Hetairoi Ring",
    right_ring="Epona's Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
	}
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['PDT'] = {
    ammo="Staunch Tathlum",
    head="Skormoth Mask",
    body={ name="Jumalik Mail", augments={'HP+25','Enmity+3',}},
    hands={ name="Valorous Mitts", augments={'Damage taken-4%','STR+1','Accuracy+5','Attack+10',}},
    legs={ name="Valor. Hose", augments={'Accuracy+30','Rng.Acc.+23','Accuracy+17 Attack+17','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet={ name="Amm Greaves", augments={'HP+20','VIT+10','Damage taken-1%',}},
    neck="Twilight Torque",
    waist="Nierenschutz",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring="Defending Ring",
    back="Mollusca Mantle",
	}

	sets.Idle['HPDT'] = sets.Idle.PDT
	sets.Engaged['HPDT'] = {
    ammo="Staunch Tathlum",
    head={ name="Valorous Mask", augments={'Accuracy+22 Attack+22','Sklchn.dmg.+1%','DEX+5','Accuracy+14',}},
    body={ name="Jumalik Mail", augments={'HP+25','Enmity+3',}},
    hands={ name="Valorous Mitts", augments={'Damage taken-4%','STR+1','Accuracy+5','Attack+10',}},
    legs={ name="Valor. Hose", augments={'Accuracy+30','Rng.Acc.+23','Accuracy+17 Attack+17','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
    feet="Meg. Jam. +1",
    neck="Twilight Torque",
    waist="Nierenschutz",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Varar Ring",
    right_ring="Defending Ring",
    back="Mollusca Mantle",
	}

	sets.Idle['MDT'] = sets.Idle.PDT
	
	sets.Engaged['MDT'] = {
    ammo="Sihirik",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Jumalik Mail", augments={'HP+25','Enmity+3',}},
    hands={ name="Valorous Mitts", augments={'Damage taken-4%','STR+1','Accuracy+5','Attack+10',}},
    legs="Meg. Chausses +1",
    feet="Meg. Jam. +1",
    neck="Twilight Torque",
    waist="Nierenschutz",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Patricius Ring",
    right_ring="Defending Ring",
    back="Mollusca Mantle",
	}
	
	sets.Idle['HMDT'] = sets.Idle.PDT
	
	sets.Engaged['HMDT'] = sets.Engaged.PDT

	sets.Engaged['PETHASTE'] = {
    ammo="Demonry Core",
    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands="Totemic Gloves +2",
    legs="Ankusa Trousers +1",
    feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
    waist="Klouskap Sash",
    left_ear="Sabong Earring",
    right_ear="Rimeice earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back="Pastoralist's Mantle",
	}
	
	sets.Idle['PETHASTE'] = sets.Engaged['PETHASTE']
	
	sets.Engaged['PETHASTE']['pet'] = {
    ammo="Demonry Core",
    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands="Totemic Gloves +2",
    legs="Ankusa Trousers +1",
    feet="Tot. Gaiters +1",
    neck="Ferine Necklace",
    waist="Hurch'lan Sash",
    left_ear="Sabong Earring",
    right_ear="Ferine Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back="Pastoralist's Mantle",
	}

	sets.Idle['PETPDT'] = {
    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
--    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body="Totemic jackcoat +2",
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring ="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}	
	
	sets.Engaged['PETPDT'] = {
    head={ name="Anwig Salade", augments={'Attack+3','Pet: Damage taken -10%','Attack+3','Pet: "Regen"+1',}},
--    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		body="Totemic jackcoat +2",
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+23 Pet: Rng. Acc.+23','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+4','Pet: Damage taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}
	
	
	sets.Idle['PETPDTMASTERPDT'] = {
    ammo="Staunch Tathlum",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    body={ name="Jumalik Mail", augments={'HP+25','Enmity+3',}},
    hands={ name="Acro Gauntlets", augments={'Pet: Accuracy+21 Pet: Rng. Acc.+21','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Amm Greaves", augments={'HP+20','VIT+10','Damage taken-1%',}},
    neck="Twilight Torque",
    waist="Flume Belt +1",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -6%','Spell interruption rate down -3%',}},
    right_ring="Defending Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}
	
	sets.Engaged['PETPDTMASTERPDT'] = sets.Idle.PETPDTMASTERPDT
	sets.Idle['MASTERPDTPETPDT'] = sets.Idle.PETPDTMASTERPDT
	sets.Engaged['MASTERPDTPETPDT'] = sets.Engaged.PETPDTMASTERPDT
	
	
	sets.Idle["PETPDTMASTERACC"] = sets.Idle['PETPDT']
	
	sets.Engaged["PETPDTMASTERACC"] = {
    ammo="Demonry Core",
    head={ name="Taeon Chapeau", augments={'Accuracy+22','"Triple Atk."+2','Pet: Damage taken -3%',}},
    body={ name="Acro Surcoat", augments={'Accuracy+23','"Dbl.Atk."+2','Pet: Damage taken -4%',}},
    hands="Meg. Gloves +1",
    legs={ name="Acro Breeches", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet={ name="Acro Leggings", augments={'Accuracy+19 Attack+19','"Dbl.Atk."+3','Pet: Damage taken -4%',}},
    neck="Shepherd's Chain",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}
	
	sets.Idle['PETACC'] = {
		baseset=tempIdleset,
    ammo="Demonry Core",
    head="Tali'ah Turban +1",
    body="Tali'ah Manteel +1",
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Empath Necklace",
    waist="Klouskap Sash",
    left_ear="Handler's Earring +1",
    right_ear="Ferine Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}

	sets.Engaged['PETACC'] = {
		baseset=tempEngagedset,
    ammo="Demonry Core",
    head="Tali'ah Turban +1",
    body="Tali'ah Manteel +1",
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Empath Necklace",
    waist="Klouskap Sash",
    left_ear="Handler's Earring +1",
    right_ear="Ferine Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
	}

	sets.Idle['PETACCMASTERACC'] = sets.Idle.PETACC
	sets.Engaged['PETACCMASTERACC'] = {
    ammo="Demonry Core",
    head="Tali'ah Turban +1",
    body="Tali'ah Manteel +1",
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Iqabi Necklace",
    waist="Klouskap Sash",
    left_ear="Zennaroi Earring",
    right_ear="Ferine Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Artio's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}},
	}
	
	sets.Idle['MASTERACCPETACC'] = sets.Idle.PETACCMASTERACC
	sets.Engaged['MASTERACCPETACC'] = sets.Engaged.PETACCMASTERACC

	sets.Idle['PETMDT'] = {
		baseset=sets.Idle.PETPDT,
		waist="Isa belt",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
	}
	
	sets.Engaged['PETMDT'] = {
		baseset=sets.Engaged.PETPDT,
		waist="Isa belt",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
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
		body="Twilight mail",
	}
	
	sets.Engaged['TWILIGHT'] = {
		baseset=sets.Idle['TWILIGHT'],
		PDT={
			head="Twilight Helm",
			body="Twilight mail",
		}
	}
	
	sets.correlation = {
		head="Nukumi Cabasset +1",
	}
	
	sets['charm plus'] = {
--		baseset=sets["charm axe"],
    head={ name="Ankusa Helm +1", augments={'Enhances "Killer Instinct" effect',}},
    body={ name="Ankusa Jackcoat +1", augments={'Enhances "Feral Howl" effect',}},
    hands={ name="Ankusa Gloves +1", augments={'Enhances "Beast Affinity" effect',}},
    legs="Tot. Trousers +1",
    feet="Ankusa gaiters +1"
	}
	
	sets['mab'] = {
    ammo="Erlene's Notebook",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
    neck="Deviant Necklace",
    left_ear="Crematio Earring",
    right_ear="Friomisi earring",
		body="Jumalik mail",
    hands="Leyline gloves",
		left_ring="Acumen Ring",
    right_ring="Demon's Ring",
    back="Argochampsa mantle",
		waist="Eschan stone",
    legs="Augury Cuisses +1",
		feet="Sombra Leggings",
	}
	
	sets['macc'] = {
--    hands="Totemic Gloves +2",
--    legs={ name="Iuitl Tights +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -3%','"Dbl.Atk."+1',}},
--    feet="Iuitl Gaiters +1",
--    neck="Enfeebling Torque",
--    waist="Crudelis Belt",
--    left_ear="Lifestorm Earring",
--    right_ear="Psystorm Earring",
--    left_ring="Perception Ring",
--    right_ring="Aquasoul Ring",
--    back="Pastoralist's Mantle",
	}
	
	sets['killer effects'] = {
    head="Ankusa Helm +1",
    body="Nukumi Gausape +1",
    legs="Tot. Trousers +1",
	}
	
	sets['weaponskill']={
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Attack+25','Weapon skill damage +5%','DEX+7','Accuracy+12',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+8','Weapon skill damage +5%','Attack+6',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets['WS'] = {}

	sets.WS['Raging Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Smash Axe'] = {
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Attack+25','Weapon skill damage +5%','DEX+7','Accuracy+12',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+8','Weapon skill damage +5%','Attack+6',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
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
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Accuracy+18','Crit.hit rate+4','VIT+6','Attack+14',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Tali'ah Gages +1",
    legs={ name="Valor. Hose", augments={'Accuracy+21','Crit.hit rate+3','DEX+4',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Hetairoi Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10',}},
	}
	
	sets.WS['Calamity'] = {
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Attack+25','Weapon skill damage +5%','DEX+7','Accuracy+12',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+8','Weapon skill damage +5%','Attack+6',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.WS['Mistral Axe'] = {
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Attack+25','Weapon skill damage +5%','DEX+7','Accuracy+12',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+8','Weapon skill damage +5%','Attack+6',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +25',}},
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.WS['Decimation'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Primal Rend'] = {
		basesets={sets.mab},
    ammo="Erlene's Notebook",
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
  	left_ear="moonshade earring",
		body="Jumalik mail",
		left_ring="Acumen Ring",
		right_ring="Demon's Ring",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		legs="Augury Cuisses +1",
		feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},		}
	
	sets.WS['Bora Axe'] = {
		baseset=sets.weaponskill
	}
	
	sets.WS['Cloudsplitter'] = {
		baseset=sets.mab,
    head={ name="Jumalik Helm", augments={'MND+10','"Mag.Atk.Bns."+15','Magic burst dmg.+10%','"Refresh"+1',}},
  	left_ear="moonshade earring",
		body="Jumalik mail",
		feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.WS['Ruinator'] = {
    ammo="Amar Cluster",
    head={ name="Valorous Mask", augments={'Attack+25','Weapon skill damage +5%','DEX+7','Accuracy+12',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+8','Weapon skill damage +5%','Attack+6',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    --neck="Breeze Gorget",
    --waist="Breeze Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Pyrosoul Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.WS['Onslaught'] = {
    ammo="Jukukik Feather",
    head={ name="Valorous Mask", augments={'Attack+25','Weapon skill damage +5%','DEX+7','Accuracy+12',}},
    body={ name="Valorous Mail", augments={'Attack+29','Weapon skill damage +4%','STR+10',}},
    hands="Meg. Gloves +1",
    legs={ name="Valor. Hose", augments={'Accuracy+8','Weapon skill damage +5%','Attack+6',}},
    feet={ name="Valorous Greaves", augments={'Accuracy+26','Weapon skill damage +5%','STR+5','Attack+6',}},
    left_ear="Pixie Earring",
    right_ear="Ishvara Earring",
    left_ring="Apate Ring",
    right_ring="Zilant Ring",
    back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
		ACC=sets.Engaged.ACC
	}
	
	sets['JA'] = {}
	
	sets.JA['Familiar'] = {
		legs="Ankusa Trousers +1"
	}

	sets.JA['Charm'] = {
		basesets={sets.macc, sets.chr, sets["charm plus"]}
	}

	sets.JA['Gauge'] = sets.JA.Charm

	sets.JA['Tame'] = {
		baseset=sets.JA.Charm,
		head="Totemic helm +1"
	}

	sets.JA['Reward'] = {
		basesets={
--			sets.mnd,
			{
				precast={
				head="Khimaira Bonnet",
				legs="Totemic trousers +1",
				},
			},
		},
		ammo="Pet Food Theta",
		left_ear="Pratik Earring",
		right_ear="Ferine Earring",
		body="Totemic jackcoat +2",
		hands="Ogre Gloves",
		legs="Ankusa trousers +1",
		feet="Ankusa gaiters +1",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}


	sets.JA['Call Beast'] = {
		hands="Ankusa Gloves +1"
	}
	
	sets.JA['Bestial Loyalty'] = sets.JA['Call Beast']

	sets.JA['Killer Instinct'] = {
		head="Ankusa helm +1"
	}

	sets.JA['Unleash'] = {
	}
	
	sets.JA['Feral Howl'] = {
		baseset=sets.macc,
		body="Ankusa Jackcoat +1"
	}
	
	sets['petmatt'] = {
    sub={ name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},
    head="Tali'ah Turban +1",
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
    hands="Nukumi Manoplas +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Adad Amulet",
    waist="Incarnation Sash",
    back="Argocham. Mantle",
	}
	
	sets['petmacc'] = {
    sub={ name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},
    head="Tali'ah Turban +1",
    body={ name="Acro Surcoat", augments={'Pet: Accuracy+10 Pet: Rng. Acc.+10','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Adad Amulet",
    waist="Incarnation Sash",
	}

	sets['petda'] = {
    head={ name="Taeon Chapeau", augments={'Pet: Accuracy+22 Pet: Rng. Acc.+22','Pet: "Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: Crit.hit rate +3','Pet: Haste+3',}},
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Ferine Necklace",
    left_ear="Sabong Earring",
    right_ear="Domesticator's Earring",
	}
	
	sets['petacc'] = {
		ammo="Demonry Core",
		head="Totemic Helm +1",
    body={ name="Taeon Tabard", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: "Dbl. Atk."+5','Pet: Damage taken -4%',}},
		right_ear="Ferine Earring",
		back="Pastoralist's Mantle",
		waist="Hurch'lan Sash",
    legs={ name="Taeon Tights", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet: Crit.hit rate +4','Pet: Haste+4',}},
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
--    hands={ name="Taeon Gloves", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: Crit.hit rate +3',}},
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    neck="Empath necklace",
	}
	
	sets['petatt'] = {
    head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+1',}},
    body="Mirke Wardecors",
    hands="Nukumi Manoplas +1",
    legs="Tot. Trousers +1",
    feet={ name="Taeon Boots", augments={'Pet: Accuracy+24 Pet: Rng. Acc.+24','Pet:"Dbl. Atk."+4','Pet:Damage Taken -4%',}},
    neck="Ferine Necklace",
    right_ear="Ferine Earring",
    back="Pastoralist's Mantle",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    neck="Empath necklace",
	}

	sets['pet tp bonus'] = {
		main="Aymur",
		sub={ name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},
		hands="Nukumi Manoplas +1",
	}

	sets['sic'] = {
		precast={
			sub="Charmer's Merlin",
	    legs="Desultor Tassets",
    	hands="Nukumi Manoplas +1",
		},
		main="Aymur",
    sub={ name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},
    ammo="Demonry Core",
    head={ name="Taeon Chapeau", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+1',}},
    body={ name="Mirke Wardecors", augments={'Pet: Accuracy+15 Pet: Rng. Acc.+15','Pet: Attack+15 Pet: Rng.Atk.+15',}},
    hands="Tali'ah Gages +1",
    legs="Desultor Tassets",
    feet="Tali'ah Crackows +1",
    neck="Empath Necklace",
    waist="Hurch'lan Sash",
    left_ear="Sabong Earring",
    right_ear="Domes. Earring",
    left_ring="Varar Ring",
    right_ring="Overbearing Ring",
    back={ name="Pastoralist's Mantle", augments={'STR+3 DEX+3','Pet: Accuracy+12 Pet: Rng. Acc.+12','Pet: Damage taken -4%',}},
}

	sets['PET'] = {}
	
	sets.PET['pet'] = {
		main="Aymur",
    sub={ name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},
    ammo="Demonry Core",
    head={ name="Valorous Mask", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: STR+1','Pet: Accuracy+5 Pet: Rng. Acc.+5',}},
    body="Tali'ah Manteel +1",
    hands={ name="Valorous Mitts", augments={'Pet: Attack+30 Pet: Rng.Atk.+30','Pet: "Dbl. Atk."+1','Pet: Accuracy+4 Pet: Rng. Acc.+4',}},
    legs={ name="Valor. Hose", augments={'Pet: Attack+27 Pet: Rng.Atk.+27','Pet: Phys. dmg. taken -2%','Pet: DEX+5','Pet: Accuracy+8 Pet: Rng. Acc.+8',}},
    feet="Tali'ah Crackows +1",
    neck="Empath Necklace",
    waist="Incarnation Sash",
    left_ear="Sabong Earring",
    right_ear="Domes. Earring",
    left_ring="Varar Ring",
    right_ring="Overbearing Ring",
    back={ name="Artio's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+10 Pet: Rng.Atk.+10','Pet: Haste+10',}},
	}
		
	--sets.PET['pet'] = sets.Engaged['PETACC']
	
	sets.PET.pet["petmatt"] = {
    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath +8'}},
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath +7','Pet: Haste+5',}},
--    hands={ name="Acro Gauntlets", augments={'Pet: "Mag.Atk.Bns."+11','Pet: Breath +7',}},
		hands="Nukumi Manoplas +1",
    --legs={ name="Acro Breeches", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Breath +6'}},
    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath +8',}},
    back="Argocham. Mantle",
	}
	sets.PET.pet["mobs"] = {}
	sets.PET.pet["mobs"]["elementals"] = {}
	
	sets.PET.pet["mobs"]["elementals"]["petmatt"] = {
    sub={ name="Kumbhakarna", augments={'Pet: Mag. Acc.+15','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+140',}},
    head={ name="Acro Helm", augments={'Pet: Mag. Acc.+24','Pet: Breath+8',}},
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
--    hands={ name="Acro Gauntlets", augments={'Pet: "Mag.Atk.Bns."+11','Pet: Breath +7',}},
    hands="Nukumi Manoplas +1",
    legs={ name="Acro Breeches", augments={'Pet: Mag. Acc.+19','Pet: Crit.hit rate +3',}},
    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
    back="Argocham. Mantle",
	}

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
		main="Skullrender",
		sub="Skullrender",
		feet="Nukumi Ocreae +1",
		back={ name="Artio's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
	}
	
	sets.PET['Run Wild'] = {
	
	}
	
	sets.PET["Foot Kick"] = {
		baseset=sets.sic,
		pet=sets.PET.pet
	}

	sets.PET["Dust Cloud"] = {
		baseset=sets.sic,
		pet=sets.petmatt,
	}

	sets.PET["Whirl Claws"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Head Butt"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Dream Flower"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Wild Oats"] = {
		baseset=sets.sic
	}

	sets.PET["Leaf Dagger"] = {
		baseset=sets.sic
	}

	sets.PET["Scream"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Roar"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Razor Fang"] = {
		baseset=sets.sic,
		pet=sets.PET.pet
	}

	sets.PET["Claw Cyclone"] = {
		baseset=sets.sic,
		pet=sets.PET.pet
	}

	sets.PET["Tail Blow"] = {
		basesets={sets.sic,sets.petmacc},
		pet = sets.PET.pet,
	}

	sets.PET["Fireball"] = {
		basesets={sets.sic, sets.petmatt},
		pet = sets.petmatt,
		mobs = {
		
		}
	}

	sets.PET["Blockhead"] = {
		baseset=sets.sic,
		pet=sets.PET.pet
	}

	sets.PET["Brain Crush"] = {
		basesets={sets.sic,sets.petmacc},
		pet = sets.PET.pet,
	}

	sets.PET["Infrasonics"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Secretion"] = {
		baseset=sets.sic
	}

	sets.PET["Lamb Chop"] = {
		basesets={sets.sic, sets.petatt},
		pet=sets.PET['pet']
	}

	sets.PET["Rage"] = {
		baseset=sets.sic
	}

	sets.PET["Sheep Charge"] = {
		baseset={sets.sic, sets.petatt},
		pet=sets.PET['pet']
	}

	sets.PET["Sheep Song"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Bubble Shower"] = {
		basesets={sets.sic,sets.petmatt, sets.petmacc}
	}

	sets.PET["Bubble Curtain"] = {
		baseset=sets.sic
	}

	sets.PET["Big Scissors"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Scissor Guard"] = {
		baseset=sets.sic
	}

	sets.PET["Metallic Body"] = {
		baseset=sets.sic
	}

	sets.PET["Needleshot"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["1000 Needles"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Frogkick"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Spore"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Queasyshroom"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Numbshroom"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Shakeshroom"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Silence Gas"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Dark Spore"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Power Attack"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Hi-Freq Field"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Rhino Attack"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Rhino Guard"] = {
		baseset=sets.sic
	}

	sets.PET["Spoil"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Cursed Sphere"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Venom"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Sandblast"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Sandpit"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Venom Spray"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Mandibular Bite"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Soporific"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Gloeosuccus"] = {
		baseset=sets.sic
	}

	sets.PET["Palsy Pollen"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Geist Wall"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Numbing Noise"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Nimble Snap"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Cyclotail"] = {
		basesets={sets.sic,sets.petmacc},
		pet=sets.PET['pet']
	}

	sets.PET["Toxic Spit"] = {
		basesets={sets.sic,sets.petmatt, sets.petmacc}
	}

	sets.PET["Double Claw"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Grapple"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Spinning Top"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Filamented Hold"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Chaotic Eye"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Blaster"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Suction"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Drainkiss"] = {
		basesets={sets.sic, sets.petmatt, sets.petmacc}
	}

	sets.PET["Snow Cloud"] = {
		basesets={sets.sic,sets.petmatt, sets.petmacc}
	}

	sets.PET["Wild Carrot"] = {
		baseset=sets.sic
	}

	sets.PET["Sudden Lunge"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Spiral Spin"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Noisome Powder"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Acid Mist"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["TP Drainkiss"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Scythe Tail"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Ripper Fang"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Chomp Rush"] = {
		basesets={sets.sic,sets.petmacc},
		pet=sets.PET['pet']
	}

	sets.PET["Charged Whisker"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Purulent Ooze"] = {
		basesets={sets.sic,sets.petmatt},
		pet=sets.PET['pet'].petmatt
	}

	sets.PET["Corrosive Ooze"] = {
--		basesets={sets.sic,sets.petmatt},
--		pet=sets.PET['pet'].petmatt
		basesets={sets.sic,},
    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
    hands="Nukumi Manoplas +1",
    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
    waist="Incarnation Sash",
    back="Argocham. Mantle",
		neck="Adad Amulet",
		pet={
	    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
	    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
	    hands="Nukumi Manoplas +1",
	    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
	    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
	    waist="Incarnation Sash",
	    back="Argocham. Mantle",
			neck="Adad Amulet",
    }
	}

	sets.PET["Back Heel"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Jettatura"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Choke Breath"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Fantod"] = {
		baseset=sets.sic
	}

	sets.PET["Tortoise Stomp"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Harden Shell"] = {
		baseset=sets.sic
	}

	sets.PET["Aqua Breath"] = {
		basesets={sets.sic,sets.petmatt}
	}

	sets.PET["Wing Slap"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Beak Lunge"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Intimidate"] = {
		basesets={sets.sic,sets.petmacc}
	}

	sets.PET["Recoil Dive"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Water Wall"] = {
		baseset=sets.sic
	}

	sets.PET["Sensilla Blades"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Tegmina Buffet"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Molting Plumage"] = {
		basesets={sets.sic, sets.petmatt},
		pet = sets['petmatt'],
		mobs = {
		
		}
	}

	sets.PET["Swooping Frenzy"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Sweeping Gouge"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Zealous Snort"] = {
		baseset=sets.sic
	}

	sets.PET["Pentapeck"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}

	sets.PET["Foul Waters"] = {
		basesets={sets.sic, sets.petmatt},
		pet = sets['petmatt'],
		mobs = {
		
		}
	}

	sets.PET["Pestilent Plume"] = {
		basesets={sets.sic, sets.petmatt},
		pet = sets['petmatt'],
		mobs = {
		
		}
	}

	sets.PET["Tickling Tendrils"] = {
		baseset=sets.sic,
		pet=sets.PET['pet']
	}
	
	sets.PET["Stink Bomb"] = {
		basesets={sets.sic,},
    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
    hands="Nukumi Manoplas +1",
    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
    waist="Incarnation Sash",
    back="Argocham. Mantle",
		pet={
	    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
	    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
	    hands="Nukumi Manoplas +1",
	    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
	    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
	    waist="Incarnation Sash",
	    back="Argocham. Mantle",
    }
	}


	sets.PET["Nectarous Deluge"] = {
		basesets={sets.sic,},
    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
    hands="Nukumi Manoplas +1",
    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
    waist="Incarnation Sash",
    back="Argocham. Mantle",
		pet={
	    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
	    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
	    hands="Nukumi Manoplas +1",
	    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
	    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
	    waist="Incarnation Sash",
	    back="Argocham. Mantle",
    }
	}


	sets.PET["Nepenthic Plunge"] = {
		basesets={sets.sic,},
    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
    hands="Nukumi Manoplas +1",
    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
    waist="Incarnation Sash",
    back="Argocham. Mantle",
		pet={
	    head={ name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+17','Pet: Breath+8',}},
	    body={ name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+7','Pet: Haste+5',}},
	    hands="Nukumi Manoplas +1",
	    legs={ name="Valor. Hose", augments={'Pet: "Mag.Atk.Bns."+30','Pet: DEX+1','Pet: Accuracy+12 Pet: Rng. Acc.+12',}},
	    feet={ name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+25','Pet: Breath+8',}},
	    waist="Incarnation Sash",
	    back="Argocham. Mantle",
    }
	}


	sets.PET["Infected Leech"] = {
		basesets={sets.sic, sets.petmatt},
		pet = sets.PET.pet["mobs"]["elementals"]["petmatt"],
		mobs = {
		
		}
	}

	sets.PET["Gloom Spray"] = {
		basesets={sets.sic, sets.petmatt},
		pet = sets.PET.pet["mobs"]["elementals"]["petmatt"],
		mobs = {
		
		}
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
		precast={
				ammo="Sapience Orb",
			right_ear='Loquac. Earring',
			right_ring='Prolix Ring',
			legs="Limbo Trousers",
		}
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
		neck="Magoraga Beads",
	}
	
	sets.MA['Utsusemi: Ni'] = sets.MA['Utsusemi: Ichi']

	sets.MA["Refresh"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Haste"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Stoneskin"]={
		basesets={sets.MA['fast cast'],sets.mnd}
	}

	sets.MA["Phalanx"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Protect III"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Shell II"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Sneak"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Invisible"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Dispel"]={
		basesets={sets.MA['fast cast']}
	}

	sets.MA["Distract"]={
		basesets={sets.MA['fast cast'],sets.macc},
	}

	sets.MA["Frazzle"]={
		basesets={sets.MA['fast cast'],sets.macc},
	}
	
	sets.MA["Cure"] = {
		basesets={sets.MA['fast cast'],sets.mnd,},
	}
	
	sets.MA["Cure IV"] = sets.MA.Cure
	sets.MA["Cure III"] = sets.MA.Cure

	-- Equip this gear when certain buffs are actIVe
	
	sets['buff active'] = {
--		["killer instinct"] = sets['killer effects']
	}
	
	
	sets['ITEM'] = {}
	sets.ITEM['Dawn Mulsum'] = sets.JA.Reward
	
end
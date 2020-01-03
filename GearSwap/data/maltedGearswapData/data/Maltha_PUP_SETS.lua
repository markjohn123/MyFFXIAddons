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
	
	
	sets.weapons["Ohtas"]  = {
    main="Ohtas",
    range="Animator P II +1",
    ammo="Automat. Oil +3",
	}
	
	sets.weapons["Animator P +1"]  = {
    main="Ohtas",
    range="Animator P +1",
    ammo="Automat. Oil +3",
	}
	
	sets.weapons["Animator P2 +1"]  = {
    main="Ohtas",
    range="Animator P II +1",
    ammo="Automat. Oil +3",
	}
	
	sets.weapons['h2h'] = sets.weapons.Ohtas
	
  sets.master_pet_idle = {
		feet="Hermes' Sandals",
	}

	sets['Idle'] = {
    head="Karagoz Capello +1",
    body={ name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
    hands={ name="Herculean Gloves", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: DEX+3','Pet: Attack+12 Pet: Rng.Atk.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Empath Necklace",
    waist="Hurch'lan Sash",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+7 Pet: Rng.Atk.+7','Pet: Haste+10',}},
	}
	
	sets['Engaged'] = {
    head="Karagoz Capello +1",
    body={ name="Pitre Tobe +1", augments={'Enhances "Overdrive" effect',}},
    hands={ name="Herculean Gloves", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: DEX+3','Pet: Attack+12 Pet: Rng.Atk.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs="Tali'ah Sera. +1",
    feet="Tali'ah Crackows +1",
    neck="Empath Necklace",
    waist="Hurch'lan Sash",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+7 Pet: Rng.Atk.+7','Pet: Haste+10',}},
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting
	
	sets.Idle['TH'] = {
    head={ name="Herculean Helm", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Store TP"+5','Pet: INT+1','Pet: Attack+3 Pet: Rng.Atk.+3','Pet: "Mag.Atk.Bns."+14',}},
    body="Tali'ah Manteel +1",
    hands={ name="Herculean Gloves", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: DEX+3','Pet: Attack+12 Pet: Rng.Atk.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Herculean Boots", augments={'Pet: STR+6','STR+5','"Treasure Hunter"+2','Accuracy+3 Attack+3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Empath Necklace",
    waist="Chaac Belt",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+7 Pet: Rng.Atk.+7','Pet: Haste+10',}},
	}
	sets.Engaged['TH'] = {
    head={ name="Herculean Helm", augments={'Pet: Accuracy+30 Pet: Rng. Acc.+30','Pet: "Store TP"+5','Pet: INT+1','Pet: Attack+3 Pet: Rng.Atk.+3','Pet: "Mag.Atk.Bns."+14',}},
    body="Tali'ah Manteel +1",
    hands={ name="Herculean Gloves", augments={'Pet: Accuracy+29 Pet: Rng. Acc.+29','Pet: DEX+3','Pet: Attack+12 Pet: Rng.Atk.+12','Pet: "Mag.Atk.Bns."+3',}},
    legs="Tali'ah Sera. +1",
    feet={ name="Herculean Boots", augments={'Pet: STR+6','STR+5','"Treasure Hunter"+2','Accuracy+3 Attack+3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    neck="Empath Necklace",
    waist="Chaac Belt",
    left_ear={ name="Moonshade Earring", augments={'MP+25','Latent effect: "Refresh"+1',}},
    right_ear="Handler's Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+7 Pet: Rng.Atk.+7','Pet: Haste+10',}},
	}
	
	sets.Idle['ACC'] = sets.Idle
	sets.Engaged['ACC'] = {
--    head="Tali'ah Turban +1",
    
    hands="Tali'ah Gages +1",
    legs="Tali'ah Sera. +1",
--    feet="Tali'ah Crackows +1",
    waist="Hurch'lan Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Varar Ring",
    right_ring="Varar Ring",
    back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+7 Pet: Rng.Atk.+7','Pet: Haste+10',}},
	}
	
	sets.Idle["PETMAB"] = {
	}
	
	sets.Engaged["PETMAB"] = sets.Idle["PETMAB"]

	sets.Idle["PETACC"] = {
	}
	
	sets.Engaged["PETACC"] = {
	}
	
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
	}
	
	sets.Engaged['PDT'] = {
		baseset=tempEngagedset,
	}

	sets.Idle['PETPDT'] = {
	}
	
	sets.Engaged['PETPDT'] = {
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

	sets.Idle['COUNTER'] = sets.Idle
	
	sets.Engaged['COUNTER'] = {
	}
	
	-- PUP can't wear twilight
	sets.Idle['TWILIGHT'] = nil
	
	sets.Engaged['TWILIGHT'] = nil
	
	sets['dex'] = {
	}
	
	sets['mnd'] = {
	}
	
	sets['hp'] = {
	}
	
	sets['vit'] = {
	}
	
	sets['str'] = {
	}
	
	sets['da'] = {
	}
	
	sets['att'] = {
	}
	
	sets['mele_stp'] = nil
	
	sets['subtle_blow'] = nil
	
	sets['mab'] = { }
	
	sets['WS'] = {}
	sets.WS['Combo'] = {
		baseset=sets.da
	}
	
	sets.WS['Shoulder Tackle'] = {
		baseset=sets.da,
	}
	
	sets.WS['One Inch Punch'] = {
		baseset=sets.da,
	}
	
	sets.WS['Backhand Blow'] = {
		baseset=sets.da,
	}
	
	sets.WS['Raging Fists'] = {
		baseset=sets.da,
	}
	
	sets.WS['Spinning Attack'] = {
		baseset=sets.da,
	}
	
	sets.WS['Howling Fist'] = {
		baseset=sets.da,
	}
	
	sets.WS['Dragon Kick'] = {
		baseset=sets.da,
	}
	
	sets.WS['Asuran Fists'] = {
	}
	
	sets.WS["Ascetic's Fury"] = {
		baseset=sets.da,
	}
	
	sets.WS['Tornado Kick'] = {
		baseset=sets.da,
	}
	
	sets.WS['Victory Smite'] = {
		baseset=sets.da,
	}
	
	sets.WS['Stringing Pummel'] = {
		baseset=sets.da,
	}

	sets.WS['Shijin Spiral'] = {
	}
	
	
	sets.WS['Shining Strike'] = {
		baseset=sets.da,
	}
	
	sets.WS['Seraph Strike'] = {
		baseset=sets.da,
	}
	
	sets.WS['Brainshaker'] = {
		baseset=sets.da,
	}
	
	sets.WS['Starlight'] = {
		baseset=sets.da,
	}
	
	sets.WS['Moonlight'] = {
		baseset=sets.da,
	}
	
	sets.WS['Skullbreaker'] = {
		baseset=sets.da,
	}
	
	sets.WS['True Strike'] = {
		baseset=sets.da,
	}
	
	sets.WS['Judgement'] = {
		baseset=sets.da,
	}
	
	sets.WS['Black Halo'] = {
		baseset=sets.da,
	}
	
	sets.WS['Flash Nova'] = {
		baseset=sets.da,
	}
	
	sets.WS['Heavy Swing'] = {
		baseset=sets.da,
	}
	
	sets.WS['Rock Crusher'] = {
		baseset=sets.da,
	}
	
	sets.WS['Earth Crusher'] = {
		baseset=sets.da,
	}
	
	sets.WS['Starburst'] = {
		baseset=sets.da,
	}
	
	sets.WS['Sunburst'] = {
		baseset=sets.da,
	}
	
	sets.WS['Shell Crusher'] = {
		baseset=sets.da,
	}
	
	sets.WS['Full Swing'] = {
		baseset=sets.da,
	}
	
	sets.WS['Spirit Taker'] = {
		baseset=sets.da,
	}
	
	sets.WS['Retribution'] = {
		baseset=sets.da,
	}
	
	sets.WS['Cataclysm'] = {
		baseset=sets.da,
	}
	
	sets['JA'] = {}
	

	sets.JA['Overdrive'] = {
		body="Pitre Tobe +1"
	}

	sets.JA['Activate'] = {
	}

	sets.JA['Repair'] = {
	}

	sets.JA['Role Reversal'] = {
	}

	sets.JA['Ventriloquy'] = {
	
	}

	sets.JA['Tactical Switch'] = {
	
	}

	sets.JA['Cooldown'] = {
	}

	sets.JA['Deus Ex Automata'] = {
	}

	sets.JA['Maintenance'] = {
	
	}

	sets.JA['Heady Artifice'] = {
	
	}
	
	sets['PET'] = {}
	
	sets.PET['Deploy'] = {}
	
	sets.PET['Deactivate'] = {}
	
	sets.PET['Retrieve'] = {}
	
	sets['maneuver'] = {
		neck="Buffoon's Collar",
		body="Karagoz farsetto",
		hands="Foire Dastanas +3",
		back={ name="Visucius's Mantle", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Accuracy+20 Attack+20','Pet: Attack+7 Pet: Rng.Atk.+7','Pet: Haste+10',}},
	}
	
	sets.PET['Fire Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Ice Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Wind Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Earth Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Thunder Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Water Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Light Maneuver'] = {hands=sets.maneuver}
	
	sets.PET['Dark Maneuver'] = {hands=sets.maneuver}

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
		baseset=sets.mab
	}
	
	sets.JA['Swipe'] = sets.effusion
	sets.JA['Lunge'] = sets.effusion
	
	-- Ninja subjob
	
	-- sam subjob
	sets.JA['Meditate'] = {}
	
	-- White Mage subjob
	sets.JA['Divine Seal'] = {}

	sets.MA = {}
	
	add_trusts()
	
	sets.MA['fast cast'] = {
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
	
	sets.MA['Utsusemi: Ni'] = sets.MA['Utsusemi: Ichi']
	
	
	sets["PET"]["Physical Weaponskills"] = {
	}
	
	sets["PET"]["Ranged Weaponskills"] = {
	}
	
	sets["PET"]["mab"] = {
	
	}
	
	-- Physical puppet weaponskills
	sets.PET["Slapstick"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Knockout"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Magic Mortar"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Chimera Ripper"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["String Clipper"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Cannibal Blade"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["Bone Crusher"] = sets["PET"]["Physical Weaponskills"]
	sets.PET["String Shredder"] = sets["PET"]["Physical Weaponskills"]
	
	-- Ranged puppet weaponskills
	sets.PET["Arcuballista"] = sets["PET"]["Ranged Weaponskills"]
	sets.PET["Daze"] = sets["PET"]["Ranged Weaponskills"]
	sets.PET["Armor Piercer"] = sets["PET"]["Ranged Weaponskills"]
	sets.PET["Armor Shatterer"] = sets["PET"]["Ranged Weaponskills"]

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
end
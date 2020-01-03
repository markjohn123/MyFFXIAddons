-- PLD Gearsets
-- Created:4/1/2014
-- Last Modified: 2/12/2017
-- To Do List
--
--
--
--

if player.name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
		
		-- Auto Sets
		physicalshield = {sub="Ochain"}
		magicalshield = {sub="Aegis"}

		-- Standard/Idle 
		sets.idle.PDT = {ammo="Staunch Tathlum",
				-- Souveran Schaller +1 Combatant's Torque Thureous Earring
				head="Sulevia's Mask +1", neck="Loricate Torque", lear="Ethereal Earring", rear="Etiolation Earring",
				-- Chev. Gauntlets +1
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring=Aug.Darkring1, rring="Defending Ring",
				-- Chev Cuisses +1 Soveriegn Schuhs +1
				back=Aug.Cape.PLD, waist="Flume Belt", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}

		sets.idle.MDT = {ammo="Staunch Tathlum",
				-- Founder's Corona Warder's Charm +1 Sanare Earring Spellbound. Earring 
				head="Sulevia's Mask +1", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
				-- Lunette Earring
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",
				-- Flax Sash Cab Leggings +1
				back="Engulfer Cape +1", waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}

		sets.idle.MDT.Shell = {ammo="Staunch Tathlum",
				-- Founder's Corona Warder's Charm +1 Spellbr. Earring  Sanare Earring
				head="Sulevia's Mask +1", neck="Loricate Torque", lear="Merman's Earring", rear="Etiolation Earring",
				-- Lunette Ring +1
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Shadow Ring", rring="Defending Ring",				
				back="Engulfer Cape +1", waist="Creed Baudrier", legs="Mes'yohi Slacks", feet="Sulev. Leggings +1"}

		sets.idle.BDT = {ammo="Staunch Tathlum",
				-- Souveran Schaller +1 Zwazo Earring +1
				head="Sulevia's Mask +1", neck="Loricate Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Souv. Cuirass +1
				body="Cab. Surcoat +1", hands="Sulev. Gauntlets +1", lring=Aug.Darkring1, rring="Defending Ring",
				-- Xucau Mantle
				back="Mollusca Mantle", waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}			
			
		-- Turtle
		sets.idle.DT = {ammo="Staunch Tathlum",
				-- Souv. Schaller +1 Warder's Charm +1 Odnowa Earring +1 Odnowa Earring
				head="Sulevia's Mask +1", neck="Loricate Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Souveran Cuirass +1 
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring=Aug.Darkring1, rring="Defending Ring",
				-- Reiki Cloak  Gold Mog. Belt Souveran Schuhs +1
				back="Mollusca Mantle", waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"}			

		sets.misc.Town = set_combine(sets.idle.PDT, {
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})
			
		sets.lockstyle = set_combine(sets.misc.Town,{
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})
			
		sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Shang's Fishing Rod", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Smock", hands="Kachina Gloves", lring="Noddy Ring", rring="",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Waders"})
		sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carver's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="Craftmaster's Ring",
				waist="Carpenter's Belt", legs="Carmine Cuisses +1"})		
					
		sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring", 
				back="Shadow Mantle", legs="Carmine Cuisses +1"})
						
		-- TP 
		sets.TP = {ammo="Ginsen",
				head="Carmine Mask +1", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Souveran Cuirass +1
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="K'ayres Ring",
				back=Aug.Cape.PLD.TP, waist="Windbuffet Belt +1", legs="Souv. Diechlings +1", feet="Carmine Greaves +1"}
		sets.TP.Acc = { ammo="Hasty Pinion +1",
				head="Carmine Mask +1", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Souveran Cuirass +1
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="Ramuh Ring +1",
				back=Aug.Cape.PLD.TP, waist="Windbuffet Belt +1", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"}
		-- Tank 
		sets.TP.Tank = {ammo="Staunch Tathlum",
				-- Souv. Schaller +1 Odnowa Earring +1 Odnowa Earring
				head="Carmine Mask +1", neck="Loricate Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Souveran Cuirass +1
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="K'ayres Ring",
				back=Aug.Cape.PLD.TP, waist="Windbuffet Belt +1", legs="Souv. Diechlings +1", feet="Carmine Greaves +1"}
		
		-- DT/Acc Turtle Build
		sets.TP.Hybrid = {ammo="Staunch Tathlum",
				-- Souv. Schaller +1 Odnowa Earring +1 Odnowa Earring
				head="Sulevia's Mask +1", neck="Loricate Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Souveran Cuirass +1
				body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="Rajas Ring", rring="Defending Ring",
				-- Souv. Schuh +1
				back=Aug.Cape.PLD.TP, waist="Nierenschutz", legs="Souv. Diechlings +1", feet="Sulevia's Leggings +1"}
		
		sets.Weakened = set_combine(sets.TP.Hybrid,{})

		-- Precast 
		sets.precast.Fastcast = set_combine(sets.idle.PDT, {ammo="Incanter Stone",
				-- neck="Voltsurge Torque", Odnowa Earring +1
				head="Carmine Mask +1", lear="Odnowa Earring", rear="Etiolation Earring",
				-- Reverence Surcoat +2 lring="Kishar Ring",
				hands="Souv. Handsch. +1", lring="Prolix Ring", rring="Meridian Ring",
				back=Aug.Cape.PLD.FC, waist="Creed Baudrier", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {
				waist="Siegel Sash"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				body="Jumalik Mail"})
		sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {
				neck="Magoraga Beads"})
		sets.misc.Waltz = set_combine(sets.precast.JA["Chivalry"],{
				legs="Dashing Subligar"})
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = {}
		
		-- Enmity Caps at ?, Gear caps at 120, Current is 
		sets.Enmity = set_combine(sets.idle.PDT,{ ammo="Paeapua",
				-- Loess Barbuta +1 Unmoving Collar +1 lear="Trux Earring", rear="Cryptic Earring",
				head="Rev. Coronet +1", neck="Atzintli Necklace", 
				-- Souv. Cuirass +1 Yorium Gauntlets Apeile Ring +1
				body="Cab. Surcoat +1", hands="Souv. Handsch. +1", lring="Vengeful Ring", rring="Apeile Ring",
				-- Obyssean Cuisses Eschite Greaves path A
				back=Aug.Cape.PLD.Enmity, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Cab. Leggings"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.precast.Fastcast,{})

		-- Healing Magic 
		sets.midcast.Cure = set_combine(sets.midcast.Recast,{ammo="Paeapua",
				-- Souv. Schaller +1 Nourish. Earring +1
				head="Rev. Coronet +1", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
				-- hands="Macabre Gaunt. +1"
				body="Jumalik Mail", hands="Buremte Gloves", lring="Meridian Ring", rring="K'ayres Ring",
				--  Solemnity Cape Rumination Sash  Odyssean Greaves
				back=Aug.Cape.PLD.Enmity, waist="Chuq'aba Belt", legs="Founder's Hose", feet="Cab. Leggings"})
		sets.midcast.Cure.Self = set_combine(sets.midcast.Cure,{ammo="Paeapua",
				-- Souv. Schaller +1
				head="Rev. Coronet +1", neck="Phalaina Locket", lear="Ethereal Earring", rear="Knightly Earring",
				body="Jumalik Mail", hands="Buremte Gloves", lring="Meridian Ring", rring="K'ayres Ring",
				--  Solemnity Cape Gishdubar Sash
				back=Aug.Cape.PLD.Enmity, waist="Chuq'aba Belt", legs="Founder's Hose", feet="Cab. Leggings"})

		-- Divine Magic - Enlight 490 Goal
		sets.midcast.DivineMagic = set_combine(sets.midcast.Recast,{
				--  heck="Nesanica Torque",
				head="Jumalik Helm", lear="Beatific Earring", rear="Divine Earring",
				-- Eschite Gauntlets
				body="Reverence Surcoat", hands="Paragon Moufles", lring="Stikini Ring", rring="Stikini Ring",
				-- back="Altruistic Cape", Asklepian Belt
				waist="Bishop's Sash", legs="Kaiser Diechlings", feet="Templar Sabatons"})

		sets.midcast.DivineMagic.Flash = set_combine(sets.midcast.DivineMagic,{ammo="Paeapua",
				-- lear="Cryptic Earring", lear="Odnowa Earring +1", 
				head="Cizin Helm +1", neck="Atzintli Necklace", lear="Odnowa Earring", rear="Etiolation Earring",
				-- Reverence Surcoat +3 Apeile Ring +1
				body="Cab. Surcoat +1", hands="Souv. Handsch. +1", lring="Vengeful Ring", rring="Apeile Ring",
				-- Souv. Schuhs +1
				back=Aug.Cape.PLD.Enmity, waist="Goading Belt", legs="Souv. Diechlings +1", feet="Cab. Leggings"})
		
		-- Enhancing Magic 				
		sets.midcast.EnhancingMagic = set_combine(sets.midcast.Recast,{ammo="Incanter Stone",
				-- Incanter Torque
				head="Carmine Mask +1", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
				-- body="Shabti Cuirass",
				lring="Stikini Ring", rring="Stikini Ring",
				back="Merciful Cape", waist="Olympus Sash", legs="Carmine Cuisses +1"})
		sets.midcast.EnhancingMagic.Phalanx = set_combine(sets.midcast.EnhancingMagic,{ammo="Staunch Tathlum",
				-- Obyssean Helm Phalanx +5 Incanter Torque
				head="Carmine Mask +1", neck="Colossus's Torque", lear="Augment. Earring", rear="Andoaa Earring",
				-- body="Shabti Cuirass", Apeile Ring +1
				hands="Souv. Handsch. +1", lring="Vengeful Ring", rring="Apeile Ring",
				-- Obyssean Cuisses Phalanx +5 Souv. Schuhs +1
				back="Weard Mantle", waist="Olympus Sash", legs="Carmine Cuisses +1",})
		sets.midcast.EnhancingMagic.Refresh = {feet="Shab. Sabatons +1"}
		sets.midcast.EnhancingMagic.Reprisal = set_combine(sets.midcast.EnhancingMagic, {
					-- Souveran Schaller Dualism Collar +1 Odnowa Earring Odnowa Earring +1
					head="Flamma Zucchetto +1", neck="Iqabi Necklace", rear="Etiolation Earring",
					-- Souveran Cuirass  Eihwaz Ring
					body="Tartarus Platemail", hands="Souv. Handsch. +1", lring="K'ayres Ring", rring="Meridian Ring",
					-- Reiki Cloak Souv Schuhs
					back=Aug.Cape.PLD.Enmity, waist="Creed Baudrier", legs="Souv. Diechlings +1", feet="Flam. Gambieras +1"})
		
		-- JA
		sets.precast.JA['Invincible'] = set_combine(sets.Enmity,{legs="Cab. Breeches"})
		sets.precast.JA['Intervene'] = set_combine(sets.Enmity,{
						lear="Knightly Earring",
						hands="Cab. Gauntlets +1"})
		-- MND			
		sets.precast.JA['Chivalry'] = set_combine(sets.idle.PDT,{hands="Cab. Gauntlets +1"},{
				head="Carmine Mask +1", neck="Phalaina Locket", rear="Lifestorm Earring",
				body="Cab. Surcoat +1", lring="Stikini Ring", rring="Stikini Ring",
				back=Aug.Cape.PLD.Enmity, wasit="Salire Belt", legs="Mes'yohi Slacks", feet="Carmine Greaves +1"})
		-- VIT - No Cap
		sets.precast.JA['Rampart'] = set_combine(sets.Enmity,{
				-- neck="Unmoving Collar +1", lear="Odnowa Earring +1", rear="Odnowa Earring",
				head="Cab. Coronet", neck="Tjukurrpa Medal", 
				-- Souv. Cuirass +1
				body="Sulevia's Plate.", hands="Souv. Handsch. +1", lring="Titan Ring", rring="Titan Ring",
				-- Souv. Schuhs +1
				back=Aug.Cape.PLD.Enmity, waist="Chuq'aba Belt", legs="Souv. Diechlings +1", feet="Sulev. Leggings +1"})
		sets.precast.JA['Sentinel'] = set_combine(sets.Enmity,{feet="Cab. Leggings"})
		sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
		sets.precast.JA['Fealty'] = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
		sets.precast.JA['Shield Bash'] = set_combine(sets.Enmity,{
						lear="Knightly Earring",
						hands="Cab. Gauntlets +1"})

		-- WS
		sets.precast.WS = { ammo="Ginsen",
				-- Lust. Cap +1
				head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
				-- Lustr. Harness +1 Lustr.	Mittens +1 
				body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				-- Lustr. Subligar +1 Lustra. Leggings +1
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +1"}
			
		sets.precast.WS.Acc = {ammo="Ginsen",
				head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}

		-- Swords
		-- Requiescat
		sets.precast.WS['Requiescat'] = { ammo="Ginsen",
				head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Stikini Ring", rring="Stikini Ring",
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulevia's Leggings +1"}
		
		sets.precast.WS.Acc['Requiescat'] = set_combine(sets.precast.WS.Requiescat, {ammo="Ginsen",
				head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Carmine Mail +1 Carmine Fin. Gauntlets +1
				body="Chev. Cuirass", hands="Sulevia's Gauntlets +1", lring="Stikini Ring", rring="Stikini Ring",
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Carmine Greaves +1"})

		-- Savage Blade
		sets.precast.WS['Savage Blade'] = {ammo="Ginsen",
				-- Valorous Mask 
				head="Sulevia's Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Valor/Emicho Body +1  Rufuscent Ring
				body="Flamma Korazin +1", hands="Sulev. Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				-- Metalsinger Belt 
				back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Sulevi. Cuisses +1", feet="Sulev. Leggings +1"}
		sets.precast.WS.Acc['Savage Blade'] = {ammo="Hasty Pinion +1",
				head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				body="Flamma Korazin +1", hands="Sulevia's Gauntlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
				back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +1"}

		-- Chant du Cygne
		sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
				-- Lust. Cap +1 A
				head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Lustr. Mittens +1 A  Begrudging Ring
				body="Flamma Korazin +1", hands="Flam. Manopolas +1", lring="Rajas Ring", rring="Ramuh Ring +1",
				-- Chiner's Belt +1 Lustr. Subligar +1 A  Lustra. Leggings +1 D
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +1"}
		
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Hasty Pinion +1",
				-- Lust. Cap +1
				head="Carmine Mask +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
				-- Lustr. Mittens +1  Begrudging Ring
				body="Flamma Korazin +1", hands="Flam. Manopolas +1", lring="Rajas Ring", rring="Ramuh Ring +1",
				-- Rudianos's Cape Chiner's Belt +1 Lustr. Subligar +1 Lustra. Leggings +1
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", legs="Carmine Cuisses +1", feet="Sulev. Leggings +1"}
		
		-- Atonement
		sets.precast.WS['Atonement'] = set_combine(sets.precast.WS, sets.Enmity,{
				neck="Fotia Gorget", rear="Moonshade Earring",
				body="Phorcys Korazin",
				back=Aug.Cape.PLD.WS, waist="Fotia Belt", feet="Sulev. Leggings +1"})

		sets.precast.WS.Acc['Atonement'] = set_combine(sets.precast.WS.Atonement)
		
		-- Dagger
		-- Aeolian Edge
		sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS,{
				-- Founder/obyssean
				head="Jumalik Helm", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
				-- Carmine Mail +1  Carmine Fin. Gauntlets +1
				body="Jumalik Mail", hands="Founder's Gauntlets",  lring="Shiva Ring +1", rring="Shiva Ring +1",
				-- Aug.Cape.PLD.MAB Yamabuki-no-Obi 
				back=Aug.Cape.PLD.WS, waist="Wanion Belt", legs="Founder's Hose", feet="Sulev. Leggings +1"})
end
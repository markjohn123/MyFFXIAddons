-- BLU Gearsets
-- Created: 4/26/2014
-- Last Updated: 6/13/2014
-- To Do List:
--
--

if player.name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(8,1)
			elseif player.sub_job == 'WAR' then
				set_macro_page(8,2)
			elseif player.sub_job == 'RDM' then
				set_macro_page(8,3)
			elseif player.sub_job == 'DNC' then
				set_macro_page(8,4)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(8,5)
			end
		else
			set_macro_page(8,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Flume belt", legs="Hagondes Pants +1", feet="Hagondes Sabots"}
		sets.idle.MDT = {ammo="Vanir Battery",
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt",  legs="Hagondes Pants +1", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {
				head="", neck="Eidolon Pendant", lear="", rear="",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Fucho-no-obi", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Etiolation Earring",
				legs="Blood Cuisses"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Luhlaza Keffiyeh",
				body="Assim. Jubbah",
				legs="Blood Cuisses"})
		 sets.lockstyle = set_combine{sets.misc.Town}
		 sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Sh. F. Rod +1", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Tunica", hands="Kachina Gloves", lring="Albatross Ring", rring="Albatross Ring",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Fisherman's Boots"})
		sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="",
				waist="Carpenter's Belt"})		
				 
		-- JA
		sets.precast.JA["Azure Lore"] = {hands="Luhlaza Bazubands"}
		sets.precast.JA["Unbridled Wisdom"] = {}
		
		sets.precast.JA["Unbridled Learning"] = {}
		sets.precast.JA["Chain Affinity"] = {head="Mavi Kavuk +2", feet="Assimilator's Charuqs"}
		sets.precast.JA["Burst Affinity"] = {legs="Assimilator's Shalwar", feet="Mavi Basmak +2"}
		sets.precast.JA["Efflux"] = {legs="Hashishin Tayt"}
		sets.precast.JA["Diffusion"] = {feet="Luhlaza Charuqs"}
		sets.precast.JA["Convergence"] = {head="Luhlaza Keffiyeh"}
		sets.precast.JA["Enchainment"] = {body="Luhlaza Jubbah"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Haruspex Hat +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Luhlaza Jubbah", hands="Thaumas Gloves", rring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots +1"}
		sets.precast.BlueMagic = set_combine(sets.precast.Fastcast,{body="Hashishin Mintan"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {back="Pahtli Cape"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, {
			waist="Witful Belt"})
		sets.midcast.ConserveMP = {}
		
		-- Blue Magic
		-- Skill
		sets.midcast.BlueMagic = set_combine(sets.TP,{ammo="Mavi Tathlum",
                head="Luhlaza Keffiyeh",
                body="Assimilator's Jubbah", hands="Fea's Cuffs",
                back="Cornflower Cape", legs="Hashishin Tayt", feet="Luhlaza Charuqs"})
		sets.idle.BlueMagic = {}
		sets.idle.BlueMagic.Learn = set_combine(sets.midcast.BlueMagic,{hands="Assim. Bazu.", back="Atheling Mantle"})
		-- Recast
		sets.midcast.BlueMagic.Recast = set_combine(sets.midcast.Recast,{hands="Hashi. Bazubands"})
		-- STR
		sets.midcast.BlueMagic.STR = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- STR Accuracy - I.E Heavy Strike
		sets.midcast.BlueMagic.STRAcc = set_combine(sets.midcast.BlueMagic, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- Dex 
		sets.midcast.BlueMagic.DEX = set_combine(sets.midcast.BlueMagic, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- VIT
		sets.midcast.BlueMagic.VIT = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- AGI
		sets.midcast.BlueMagic.AGI = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- MND
		sets.midcast.BlueMagic.MND = set_combine(sets.midcast.BlueMagic, {ammo="Flame Sachet",
                head="Taeon Chapeau", neck="Phalaina Locket", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Assim. Jubbah", hands="Luh. Bazubands", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Hashishin Tayt", feet="Taeon Boots"})
		-- INT
		sets.midcast.BlueMagic.INT = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- CHR
		sets.midcast.BlueMagic.CHR = set_combine(sets.midcast.BlueMagic, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- Macc
		sets.midcast.BlueMagic.Macc = set_combine(sets.midcast.BlueMagic, {
                head="Mirage Keffiyeh", neck="Eddy Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Assimilator's Jubbah", hands="Hagondes Cuffs +1", lring="Sangoma Ring", rring="Perception Ring",
                back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt", feet="Helios Boots"})	
		-- Acc
		sets.midcast.BlueMagic.PhysMagicAcc = set_combine(sets.midcast.Macc, {
                head="Mirage Keffiyeh", neck="Iqabi Necklace", lear="Gwati Earring", rear="Enchntr. Earring +1",
                body="Assimilator's Jubbah", hands="Helios Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Cornflower Cape", waist="Ovate Rope", legs="Hashishin Tayt", feet="Helios Boots"})

		-- Healing Cure Pot
		sets.midcast.BlueMagic.CurePot = set_combine(sets.midcast.BlueMagic.MND, {
				head="Telchine Cap", neck="Phalaina Locket", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				body="Telchine Chas.", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Chuq'aba Belt", legs="Telchine Braconi", feet="Telchine Pigaches"})
		sets.midcast.BlueMagic.CurePot.Self = set_combine(sets.midcast.BlueMagic.CurePot, {
                neck="Phalaina Locket",
                hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Chuq'aba Belt",})
		
		-- Nuke
		sets.midcast.BlueMagic.Nuke = set_combine(sets.midcast.BlueMagic, {ammo="Dosis Tahlum",
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- Dark
		-- Pixie Hairpin +1
		sets.midcast.BlueMagic.Nuke,Dark = set_combine(sets.midcast.Nuke, {
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Shiva Ring", rring="Archon Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"})
		-- Breath 
		sets.midcast.BlueMagic.Breath = set_combine(sets.midcast.BlueMagic.Nuke, {
        ammo="Mavi Tathlum",
        head="Luh. Keffiyeh"})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {ammo="Vanir Battery",
                head="Taeon Chapeau", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- Accuracy
		sets.TP.Acc = set_combine(sets.TP, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Epona Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- Alliance Buffs - Haste + March x2 
		sets.TP.Buffed = set_combine(sets.TP, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Epona's Ring +1",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"})

		-- Evasion or DT ?
		sets.TP.Hybrid = set_combine(sets.idle.PDT, {ammo="Ginsen",
                head="Taeon Chapeau", neck="Twilight Torque", lear="Brutal Earring", rear="Suppanomimi",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring=Aug.Darkring1, rring="Defending Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"})
		
		-- Weaponskill
		sets.precast.WS = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})
		sets.precast.WS.Acc = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})		
		-- Savage Blade
		sets.precast.WS['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		sets.precast.WS.Acc['Savage Blade'] = set_combine(sets.TP, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Tjukurrpa Medal", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Vespid Mantle", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})
		-- Chant du Cygne
		sets.precast.WS['Chant du Cygne'] = {ammo="Ginsen",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		sets.precast.WS.Acc['Chant du Cygne'] = {ammo="Ginsen",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ramuh Ring +1", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Requiescat
		sets.precast.WS['Requiescat'] = {ammo="Vanir Battery",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Levia. Ring +1", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		sets.precast.WS.Acc['Requiescat'] = {ammo="Vanir Battery",
                head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Expiacion
		sets.precast.WS['Expiacion'] = {ammo="Dosis Tathlum",
                head="Hagondes Hat +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.TA, lring="Ifrit Ring +1", rring="Epona's Ring",
                back="Vespid Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
		-- Sanguine Blade
		sets.precast.WS['Sanguine Blade'] = {ammo="Aqua Sachet",
                head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Realmrazer
		sets.precast.WS['Realmrazer'] = {ammo="Hasty Pinion +1",
                head="Taeon Chapeau", neck="Fotia Gorget Necklace", lear="Brutal Earring", rear="Moonshade Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Toro Cape", waist="Wanion Belt", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc,{})
		sets.misc.flourish = {}
end
-- MNK Gear_sets
-- Created: 1/25/2014
-- Last Modified: 02/03/2015
-- To Do List
--
--
--
--

if player.name == 'Feary' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	-- include('../include/autoexec.lua')
	
-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'WAR' then
				set_macro_page(6,1)
			elseif player.sub_job == 'NIN' then
				set_macro_page(6,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(6,3)
			elseif player.sub_job == 'DRG' then 
				set_macro_page(6,4)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(6,5)
			elseif player.sub_job == 'RUN' then 
				set_macro_page(6,6)
			end
		else
			set_macro_page(6,1)
		end

-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Otronif Mask", neck="Twilight Torque",
                body="Otronif Harness", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Black Belt", legs="Otronif Brais +1", feet="Otronif Boots +1"}

sets.idle.MDT = { 
				head="Felistris Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Black Belt", legs="Otronif Brais +1", feet="Otronif Boots +1"}

sets.idle.Regen = set_combine(sets.idle.PDT, {body="Hes. Cyclas"})
sets.idle.Evasion = {
				head="Felistris Mask", neck="Torero Torque", lear="Musical earring", rear="Novia Earring",
                body="Manibozho Jerkin", hands="Otronif Gloves +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Boxer's Mantle", waist="Scouter's Rope",  legs="Otronif Brais +1", feet="Taeon Boots"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Felistris Mask",
				feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring",
				feet="Hermes' Sandals"})
				
-- Precast
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
				head="Haruspex Hat +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchan Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="", rring="Prolix Ring",
                back="", waist="Black Belt", legs="Taeon Tights", feet="Taeon Boots"})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = {ammo="Ginsen",
				head="Taeon Chapeau", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Kayapa Cape", waist="Anguinus Belt", legs="Taeon Tights", feet="Taeon Boots"}
sets.misc.flourish = {}

-- JA
sets.precast.JA["Formless Strikes"] = {body="Hes. Cyclas"}
sets.precast.JA["Chakra"] = set_combine(sets.idle.PDT, { ammo="Tantra Tahtlum",
				head="Taeon Chapeau",
				body="Anchorite's Cyclas", hands="Hes. Gloves", 
				legs="Nahtirah Trousers"})
sets.precast.JA["Chi Blast"] = set_combine(sets.idle.PDT, {
				head="Uk'uxkaj Cap", neck="Morgana's Choker",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="", waist="", legs="Taeon Tights", feet="Taeon Boots"})
sets.precast.JA["Impetus"] = {body="Bhikku Cyclas"}
sets.precast.JA["Hundred Fists"] = {legs="Hes. Hose"}
sets.precast.JA["Focus"] = {head="Anchorite's Crown"}
sets.precast.JA["Dodge"] = {feet="Anch. Gaiters"}
sets.precast.JA["Boost"] = {hands="Anchorite's Gloves"}
sets.precast.JA["Counterstance"] = {feet="Hes. Gaiters"}
sets.precast.JA["Mantra"] = {feet="Hes. Gaiters"}
			
-- TP 
sets.TP = { ammo="Ginsen",
				head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}
-- Accuracy TP
sets.TP.MidAcc = { ammo="Ginsen",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Anguinus Belt", legs="Taeon Tights", feet="Taeon Boots"}
				
-- High Accuracy TP
sets.TP.HighAcc = { ammo="Ginsen",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Anguinus Belt", legs="Taeon Tights", feet="Taeon Boots"}

-- Hybrid PDT/TP
sets.TP.Hybrid = set_combine(sets.TP, sets.idle.PDT)
				
-- Hundred Fists
sets.TP.HF = set_combine(sets.TP,{body="Bhikku Cyclas"})
sets.TP.HF.Acc = set_combine(sets.TP.MidAcc,{body="Bhikku Cyclas"})

-- Impetus Sets
sets.TP.Impetus = set_combine(sets.TP, {body="Bhikku Cyclas"})
sets.TP.MidAcc.Impetus = set_combine(sets.TP.MidAcc, {body="Bhikku Cyclas"})
sets.TP.HighAcc.Impetus =  set_combine(sets.TP.HighAcc, {body="Bhikku Cyclas"})

-- Weaponskills
sets.precast.WS = {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}

sets.precast.WS.Acc = {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}

-- Victory Smite
sets.precast.WS['Victory Smite'] = { ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Epona's Ring",
                back="Atheling Mantle", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"}

sets.precast.WS.Acc['Victory Smite'] = { ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Kayapa Cape", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}

sets.precast.WS['Final Heaven'] = set_combine(sets.precast.WS)
sets.precast.WS.Acc['Final Heaven'] = set_combine(sets.precast.WS.Acc)

-- Shijun Spiral - Brutal/Trux 2 Ramuh
sets.precast.WS['Shijin Spiral'] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Kayapa Cape", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})

sets.precast.WS.Acc['Shijin Spiral'] = set_combine(sets.precast.WS['Shijin Spiral'], {
				head="Taeon Chapeau", neck="Justiciar's Torque", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Kayapa Cape", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})

-- Ascetic's Fury
sets.precast.WS["Ascetic's Fury"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})

sets.precast.WS.Acc["Ascetic's Fury"] = set_combine(sets.precast.WS.Acc, {
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Epona's Ring",
                back="Kayapa Cape", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})

-- Asuran Fists
sets.precast.WS["Asuran Fists"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})

sets.precast.WS.Acc["Asuran Fists"] = set_combine(sets.precast.WS.Acc, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})
end
				
	

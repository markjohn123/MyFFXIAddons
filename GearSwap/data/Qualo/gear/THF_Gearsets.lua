-- Feary's THF Gear_sets
-- Created: 4/5/2014
-- Last Modified: 02/03/2015
-- To Do List
--
--
--
--

-- best of the reforged
-- Skulker's Bonnet +1
-- skulkers vest augments conspirator (meh)
-- all three hands are good to have
-- plund culottes enhances feint (eva down)
-- skulker's feet th+3



if player.name == 'Qualo' then
-- includes
	include('organizer-lib')
        include('include/utility.lua')
	include('include/mappings.lua')
	windower.add_to_chat(128,'Loaded THF_Gearsets.lua')
	include('gear/equipment.lua')
	-- include('../include/autoexec.lua')


-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'NIN' then
				set_macro_page(1,5)
			elseif player.sub_job == 'WAR' then
				set_macro_page(1,5)
			elseif player.sub_job == 'DNC' then
				set_macro_page(1,6)
			elseif player.sub_job == 'DRK' then
				set_macro_page(1,5)
			end
		else
			set_macro_page(1,1)
		end


organizer_items = {
  -- echos="Echo Drops",
  -- shihei="Shihei",
  -- orb="Macrocosmic Orb",
  warpring="Warp Ring"
}

-- Auto Sets
-- Standard/idle
sets.idle.PDT = {
--    main = "Sandung",
--    sub = "Taming Sari",
    main =  "Taming Sari",
    sub = "Sandung",
    range = {"Raider's Boomerang"},
    ammo = {},
    head = "Skormoth Mask",
    body = "Adhemar Jacket",
    hands = "Herculean Gloves",
    legs = "Herculean Trousers",
    -- feet = "Herculean Boots",
    feet = "Jute Boots +1",
    neck="Asperity Necklace",
    waist="Sarissapho. Belt Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Rajas Ring",
    right_ring="Apate Ring",
    back="Ground. Mantle +1",
}

sets.idle.MDT = {
--    main = "Sandung",
--    sub = "Taming Sari",
    main =  "Taming Sari",
    sub = "Sandung",
    range = {"Raider's Boomerang"},
    ammo = {},
    head = "Skormoth Mask",
    body = "Adhemar Jacket",
    hands = "Herculean Gloves",
--    legs = "Herculean Trousers",
    legs = "Samnuha Tights",
    -- feet = "Herculean Boots",
    feet = "Jute Boots +1",
    neck="Asperity Necklace",
    waist="Sarissapho. Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Rajas Ring",
    right_ring="Apate Ring",
    back="Ground. Mantle +1",
}


sets.misc.Town = set_combine(sets.idle.PDT, {
				body="Councilor's Garb"})

sets.idle.Standard = sets.idle.PDT

-- Full Evasion
sets.idle.Evasion = set_combine(sets.idle.PDT,{
			})

sets.TH = {
			hands="Plun. Armlets +1",
			waist="Chaac Belt", feet="Skulk. Poulaines +1"}

-- Precast
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			head="Haruspex Hat +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
			body=Aug.Skirmish.Taeon.Body, hands="Thaumas Gloves", lring="Prolix Ring",
			waist="Twilight Belt", legs="Enif Cosciales"})
sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

-- Midcast
sets.midcast.Fastcast = set_combine(sets.idle.PDT,{
			head="Haruspex Hat +1", neck="Voltsurge Torque",lear="Loquac. Earring", rear="Enchntr. Earring +1",
            body="Taeon Tabard", hands="Thaumas Gloves", lring="Prolix Ring",
            back="Fravashi Mantle", waist="Twilight Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"})

-- TP Sets
sets.TP = {
--    main = "Sandung",
--    sub = "Taming Sari",
    main =  "Taming Sari",
    sub = "Sandung",
    range = {"Raider's Boomerang"},
    ammo = {},
    head = "Skormoth Mask",
    body = "Adhemar Jacket",
    hands = "Herculean Gloves",
--    legs = "Herculean Trousers",
    legs = "Samnuha Tights",
    feet = "Herculean Boots",
    neck="Asperity Necklace",
    waist="Sarissapho. Belt",
    left_ear="Bladeborn Earring",
    right_ear="Steelflash Earring",
    left_ring="Rajas Ring",
    right_ring="Apate Ring",
    back="Ground. Mantle +1",
}

-- Accuracy TP Set
sets.TP.Acc = {	head="Skulker's Bonnet", neck="Iqabi Necklace", lear="Brutal Earring", rear="Suppanomimi",
            body="Pillager's Vest +1", Aug.Herc.hands, lring="Rajas Ring", rring="Apate Ring",
            back="Atheling Mantle", waist="Patentia Sash"}

-- Alliance Buffed
-- 11 DW needed
sets.TP.Buffed = {head="Skulker's Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Suppanomimi",
            body="Pillager's Vest +1", Aug.Herc.hands, lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt"}

-- Hybrid Evasion
sets.TP.Hybrid = set_combine(sets.idle.PDT,{
			head="Pill. Bonnet +1", neck="Torero Torque", lear="Brutal Earring", rear="Suppanomimi",
            body="Pillager's Vest +1", hands="Iuitl Wristbands +1", lring="Rajas Ring", rring="Epona's Ring",
            back="Fravashi Mantle", waist="Twilight Belt"})

-- RA Sets
sets.precast.Snapshot = {legs="Nahtirah Trousers"}

sets.RA = {range="Raider's Boomerang"}


-- JA
sets.precast.JA["Perfect Dodge"] = {hands="Plunderer's Armlets +1"}
sets.precast.JA["Larceny"] = {}

sets.precast.JA["Steal"] = {head="Plun. Bonnet",hands="Pillager's Armlets",legs="Pillager's Culottes",feet="Rogue's Poulaines"}
sets.precast.JA["Mug"] = {head="Plun. Bonnet"}
sets.precast.JA["Feint"] = {legs="Plun. Culottes"}
sets.precast.JA["Flee"] = {feet="Rogue's Poulaines"}
sets.precast.JA["Hide"] = {body="Pillager's Vest +1"}
sets.precast.JA["Ambush"] = {body="Plunderer's Vest"}
sets.precast.JA["Assassin's Charge"] = {feet="Plunderer's Poulaines"}
sets.precast.JA["Accomplice"] = {head="Skulker's Bonnet"}
sets.precast.JA["Collaborator"] = {head="Skulker's Bonnet"}
sets.precast.JA["Conspirator"] = {body="Skulker's Vest"}
sets.precast.JA["Bully"] = {}
sets.precast.JA["Despoil"] = {legs="Skulker's Culottes", feet="Skulker's Poulaines"}

-- Sneak Attack
sets.precast.JA["Sneak Attack"] = {
				head="Pill. Bonnet +1", neck="Love Torque", lear="Brutal Earring", rear="Kuwunga Earring",
                body="Pillager's Vest +1", hands="Skulker's Armlets +1", lring="Apate Ring", rring="Epona's Ring",
                back="Toutatis's Cape", waist="Windbuffet Belt", legs = "Samnuha Tights"}
-- Trick Attack
sets.precast.JA["Trick Attack"] = {
				head="Pill. Bonnet +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Kuwunga Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Toutatis's Cape", waist="Windbuffet Belt", legs = "Samnuha Tights"}

-- Weaponskills
sets.precast.WS = {
				head="Pill. Bonnet +1", neck="Asperity Necklace", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Toutatis's Cape", waist="Wanion Belt", legs = "Samnuha Tights"}

sets.precast.WS.SA = {}

sets.precast.WS.TA = {}

sets.precast.WS.Acc = {
				head="Pill. Bonnet +1", neck="Iqabi Necklace", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Rajas Ring", rring="Ramub Ring +1",
                back="Toutatis's Cape", waist="Wanion Belt", legs = "Samnuha Tights"}

sets.precast.WS.Acc.SA = {}

sets.precast.WS.Acc.TA = {}

-- Mercy Stroke
sets.precast.WS["Mercy Stroke"] = {
				head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Toutatis's Cape", waist="Prosilio Belt", legs = "Samnuha Tights"}

sets.precast.WS.SA["Mercy Stroke"] = {
				head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Pillager's Vest +1", hands="Skulker's Armlets +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Toutatis's Cape", waist="Prosilio Belt", legs = "Samnuha Tights"}

sets.precast.WS.TA["Mercy Stroke"] = {
				head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Toutatis's Cape", waist="Prosilio Belt", legs = "Samnuha Tights"}

-- Rudra's Storm
-- Solo
sets.precast.WS["Rudra's Storm"] = {
				head="Pill. Bonnet +1", neck="Fotia Gorget", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", hands=Aug.Lustratio.hands, lring="Rajas Ring", rring="Apate Ring",
                back="Toutatis's Cape", waist="Wanion Belt", legs = "Samnuha Tights", feet=Aug.Herc.feet, ammo="Falcon Eye"}
sets.precast.WS.SA["Rudra's Storm"] = {
				head="Adhemar Bonnet", neck="Love Torque", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Apate Ring",
                back="Toutatis's Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet, ammo="Falcon Eye"}
sets.precast.WS.TA["Rudra's Storm"] = {
				head="Adhemar Bonnet", neck="Fotia Gorget", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Apate Ring",
                back="Toutatis's Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet, ammo="Falcon Eye"}

sets.precast.WS.Acc["Rudra's Storm"] = {
				head="Skormoth Mask", neck="Fotia Gorget", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Apate Ring",
                back="Toutatis's Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet, ammo="Falcon Eye"}
sets.precast.WS.Acc.SA["Rudra's Storm"] = {
				head="Adhemar Bonnet", neck="Fotia Gorget", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Apate Ring",
                back="Toutatis's Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet, ammo="Falcon Eye"}
sets.precast.WS.Acc.TA["Rudra's Storm"] = {
				head="Adhemar Bonnet", neck="Fotia Gorget", lear="Kuwunga Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", hands="Pillager's Armlets", lring="Rajas Ring", rring="Apate Ring",
                back="Toutatis's Cape", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet, ammo="Falcon Eye"}

-- Exenterator
sets.precast.WS["Exenterator"] = {
				head="Skulker's Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Garuda Ring +1", rring="Epona's Ring",
                back="Toutatis's Cape", waist="Prosilio Belt", legs = "Samnuha Tights", feet=Aug.Herc.feet}

sets.precast.WS.Acc["Exenterator"] = {
				head="Skulker's Bonnet", neck="Asperity Necklace", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Garuda Ring +1", rring="Epona's Ring",
                back="Toutatis's Cape", waist="Prosilio Belt", legs = "Samnuha Tights", feet=Aug.Herc.feet}
-- Evisceration
sets.precast.WS["Evisceration"] = {
				head="Pill. Bonnet +1", neck="Love Torque", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Samnuha Tights", feet=Aug.Herc.feet}

sets.precast.WS.Acc["Evisceration"] = {
				head="Skulker's Bonnet", neck="Love Torque", lear="Brutal Earring", rear="Dominance Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Apate Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet}

-- Dancing Edge
sets.precast.WS["Dancing Edge"] = {
				head="Skulker's Bonnet", neck="Asperity Necklace", lear="Steelflash Earring", rear="Bladeborn Earring",
                body="Pillager's Vest +1", Aug.Herc.hands, lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Pillager's Culottes", feet=Aug.Herc.feet}


-- Misc Sets
sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}

sets.movement = {feet="Jute Boots +1"}

end
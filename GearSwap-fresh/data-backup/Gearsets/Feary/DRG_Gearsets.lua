-- Feary's DRG Gear_sets
-- Created: 3/15/2014
-- Last Modified: 5/1/2015
-- To Do List:
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
			if player.sub_job == 'SAM' then
				set_macro_page(12,1)
			elseif player.sub_job == 'NIN' then
				set_macro_page(12,2)
			elseif player.sub_job == 'DNC' then
				set_macro_page(12,3)
			elseif player.sub_job == 'WAR' then 
				set_macro_page(12,4)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(12,5)
			elseif player.sub_job == 'RDM' then 
				set_macro_page(12,6)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(12,7)	
			elseif player.sub_job == 'SCH' then 
				set_macro_page(12,8)	
			elseif player.sub_job == 'PLD' then 
				set_macro_page(12,9)	
			end
		else
			set_macro_page(12,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Cizin Mail +1", hands="Cizin Mufflers +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Cizin Breeches +1", feet="Cizin Greaves +1"}

sets.idle.MDT = { 
				head="Yaoyotl Helm", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Cizin Mail +1", hands="Cizin Mufflers +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Nierenschutz", legs="Cizin Breeches +1", feet="Cizin Greaves +1"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				legs="Blood Cuisses"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring", 
				legs="Blood Cuisses"})

sets.lockstyle = {}

-- Precast
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			head="Cizin Helm +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
			body=Aug.Skirmish.Taeon.Body.FC, hands=Aug.Skirmish.Taeon.Hands.FC, rring="Prolix Ring",
			legs=Aug.Skirmish.Taeon.Legs.FC, feet=Aug.Skirmish.Taeon.Feet.FC})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = {}
sets.misc.flourish = {}

-- JA
sets.precast.JA["Spirit Surge"] = {body="Pteroslaver Mail"}
sets.precast.JA["Fly High"] = {}

sets.precast.JA["Call Wyvern"] = {body="Pteroslaver Mail"}
sets.precast.JA["Angon"] = {ammo="Angon", hands="Ptero. Fin. Gaunt.", lear="Dragoon's Earring"}
sets.precast.JA["Deep Breathing"] = {head="Ptero. Armet"}
sets.precast.JA["Strafe"] = {legs="Pteroslaver Brais"}
sets.precast.JA["Empathy"] = {feet="Ptero. Greaves"}
sets.precast.JA["Ancient Circle"] = {legs="Vishap Brais"}
sets.precast.JA["Spirit Link"] = {head="Vishap Armet"}

-- Jumps 
sets.precast.JA["Jump"] = {ammo="Ginsen",
				head="Acro Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Brutal Earring",
				body="Vishap Mail", hands="Vishap Finger Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Acro Breeches", feet="Vishap Greaves"}

sets.precast.JA["High Jump"] = {ammo="Ginsen",
				head="Acro Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Steelflash Earring",
				body="Vishap Mail", hands="Vishap Finger Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Acro Breeches", feet="Acro Leggings"}

sets.precast.JA["Super Jump"] = {}

sets.precast.JA["Spirit Jump"] = {ammo="Ginsen",
				head="Acro Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Neritic Earring",
				body="Peltast Plackert", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Acro Breeches", feet="Acro Leggings"}

sets.precast.JA["Soul Jump"] = {ammo="Ginsen",
				head="Acro Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Neritic Earring",
				body="Peltast Plackert", hands="Acro Gauntlets", lring="Rajas Ring", rring="K'ayres Ring",
				back="Atheling Mantle", waist="Windbuffet Belt", legs="Acro Breeches", feet="Acro Leggings"}

-- Melee TP 
sets.TP = { ammo="Ginsen",
			head="Otomi Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Brutal Earring",
            body="Peltast Plackert", hands=Aug.Skirmish.Acro.Hands.STP, lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs=Aug.Skirmish.Acro.Legs.STP, feet=Aug.Skirmish.Acro.Feet.STP}

sets.TP.Ionis = { ammo="Ginsen",
			head="Otomi Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Brutal Earring",
            body="Peltast Plackert", hands=Aug.Skirmish.Acro.Hands.STP, lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs=Aug.Skirmish.Acro.Legs.STP, feet=Aug.Skirmish.Acro.Feet.STP}

-- Melee Accuracy TP
sets.TP.Acc = {	ammo="Ginsen",
		head="Otomi Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Brutal Earring",
            body="Peltast Plackert", hands=Aug.Skirmish.Acro.Hands.STP, lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs=Aug.Skirmish.Acro.Legs.STP, feet=Aug.Skirmish.Acro.Feet.STP}
-- Ionis Haste +2% Save TP 25+
sets.TP.Acc.Ionis = {ammo="Ginsen",
			head="Otomi Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Brutal Earring",
            body="Peltast Plackert", hands=Aug.Skirmish.Acro.Hands.STP lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs=Aug.Skirmish.Acro.Legs.STP, feet=Aug.Skirmish.Acro.Feet.STP}
-- Alliance Buffs - Rolls + Songs
sets.TP.Buffed = {ammo="Ginsen",
			head="Otomi Helm", neck="Ganesha's Mala", lear="Tripudio Earring", rear="Brutal Earring",
            body="Peltast Plackert", hands=Aug.Skirmish.Acro.Hands.STP, lring="Rajas Ring", rring="K'ayres Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs=Aug.Skirmish.Acro.Legs.STP, feet=Aug.Skirmish.Acro.Feet.STP}

-- Pet
-- Acro Breath +8 Pet Macc +25
sets.precast.HealingBreath = {
				head="Vishap Armet", 
				body=Aug.Skirmish.Acro.Body.Breathe, hands=Aug.Skirmish.Acro.Hands.Breathe, lring="Meridian Ring", rring="K'ayres Ring",
				back="Strendu Mantle", waist="Glassblower's Belt", legs=Aug.Skirmish.Acro.Legs.Breathe, feet=Aug.Skirmish.Acro.Feet.Breathe}
sets.midcast.HealingBreath = {
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring", rear="",
				body=Aug.Skirmish.Acro.Body.Breathe, hands=Aug.Skirmish.Acro.Hands.Breathe,
				back="Updraft Mantle", waist="Glassblower's Belt", legs="Vishap Brais", feet="Ptero. Greaves"}
sets.midcast.Breath = {	
				head="Ptero. Armet", neck="Lancer's Torque", lear="Dragoon's Earring", rear="",
				body=Aug.Skirmish.Acro.Body.Breathe, hands=Aug.Skirmish.Acro.Hands.Breathe, lring="", rring="",
				back="Updraft Mantle", waist="Glassblower's Belt", legs=Aug.Skirmish.Acro.Legs.Breathe, feet=Aug.Skirmish.Acro.Feet.Breathe }

sets.precast.JA["Steady Wing"] = {
				head="Ptero. Armet", neck="Lancer's Torque", lear="Lancer's Earring",
				back="Updraft Mantle", legs="Pteroslaver Brais", feet="Ptero. Greaves"}

-- Weaponskills
sets.precast.WS = {ammo="Ginsen",
				head="Otomi Helm", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Acro Breeches", feet="Acro Leggings"}

sets.precast.WS.Acc = {}

-- Stardiver
sets.precast.WS["Stardiver"] = {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"}

sets.precast.WS.Acc["Stardiver"] = {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"}

-- Drakesbane
sets.precast.WS["Drakesbane"] = {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Mantle", waist="Fotia Belt", legs="Peltast Cuissots", feet="Acro Leggings"}

sets.precast.WS.Acc["Drakesbane"] = {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"}

-- Camlann's Torment
sets.precast.WS["Camlann's Torment"] = {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"}

sets.precast.WS.Acc["Camlann's Torment"] = {ammo="Ginsen",
				head="Otomi Helm", neck="Fotia Gorget", lear="Moonshade Earring", rear="Brutal Earring",
                body="Acro Surcoat", hands="Miki. Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Updraft Mantle", waist="Fotia Belt", legs="Acro Breeches", feet="Acro Leggings"}
end
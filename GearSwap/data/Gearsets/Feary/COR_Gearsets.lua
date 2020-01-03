-- Feary's COR Gear_sets
-- Created:
-- Last Modified: 9/4/2014
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
			if player.sub_job == 'DNC' then
				set_macro_page(10,1)
			elseif player.sub_job == 'NIN' then
				set_macro_page(10,2)
			elseif player.sub_job == 'RNG' then
				set_macro_page(10,3)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(10,4)
			elseif player.sub_job == 'SCH' then 
				set_macro_page(10,6)
			elseif player.sub_job == 'BRD' then 
				set_macro_page(10,5)	
			end
		else
			set_macro_page(10,1)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Lanun Frac", hands="Umuthi Gloves", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Lanun Boots"}

sets.idle.MDT = { 
				head="Whirlpool Mask", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Lanun Tricorne",
				body="Lak. Frac", hands="Lanun Gants",
				legs="Lanun Culottes", feet="Hermes' Sandals"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring", 
				feet="Hermes' Sandals"})
				
-- Precast 
sets.precast.Fastcast = set_combine(sets.idle.PDT, {
			head="Haruspex Hat +1", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring", 
			body="Taeon Tabard", hands=Aug.Skirmish.Taeon.Hands.FC, rring="Prolix Ring",
			back="", waist="", legs="", feet=""})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})
						
sets.misc.Waltz = {}
sets.misc.Steps = {}
sets.misc.flourish = {}

-- JA
sets.precast.JA["Wild Card"] = {feet="Lanun Bottes"}
sets.precast.JA["Cutting Cards"] = {}

sets.precast.JA["Fold"] = {hands="Lanun Gants"}
sets.precast.JA["Random Deal"] = {body="Lanun Frac"}
sets.precast.JA["Snake Eye"] = {legs="Lanun Culottes"}
sets.precast.JA["Triple Shot"] = {body="Chasseur's Frac"}
sets.precast.JA["Double-Up"] = set_combine(sets.precast.JA["Phantom Roll"])

-- Corsair Rolls
sets.precast.JA["Phantom Roll"] = {head="Lanun Tricorne", hands="Chasseur's Gants", legs="Desultor Tassets", rring="Luzaf's Ring"}
sets.precast.JA["Caster's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {legs="Chasseur's Culottes"})
sets.precast.JA["Courser's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {feet="Navarch's Bottes +2"})
sets.precast.JA["Blitzer's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {head="Chass. Tricorne"})
sets.precast.JA["Tactician's Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {body="Chasseur's Frac"})
sets.precast.JA["Allies' Roll"] = set_combine(sets.precast.JA["Phantom Roll"], {hands="Chasseur's Gants"})

-- Quick Draw 
sets.precast.QD = {}
--Light/Dark Shot
sets.precast.QD.ACC = {
				head="Blood Mask", neck="Stoicheion Medal", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Lanun Frac", hands="Chasseur Gants", lring="Perception Ring", rring="Sangoma Ring",
                back="Gunslinger's Cape", waist="Aquiline Belt", legs="Thur. Tights +1", feet="Lanun Boots"}
-- Elemental Shots
-- Deviant Necklace, Gunslinger's Cape
sets.precast.QD.MAB = {
				head="Blood Mask", neck="Stoicheion Medal", lear="Friomisi Earring", rear="Crematio Earring",
                body="Lanun Frac", hands="Taeon Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Hachirin-no-Obi", legs="Iuitl Tights", feet="Lanun Boots"}
				
-- RA Sets
sets.precast.Snapshot = {ammo="TPBullet",
				head="Chass. Tricorne", 
				Body="Skopos Jerkin", hands="Lanun Gants",
                back="Navarch's Mantle", waist="Impulse Belt", legs="Nahtirah Trousers", feet="Wurrukatte Boots"}
-- Eminent Gun
-- Gunslinger's Cape
sets.RA = { ammo="TPBullet",
			head="Chass. Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
            body="Chasseur's Frac", hands="Chasseur's Gants", lring="Hajduk Ring", rring="Hajduk Ring",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Feast Hose", feet="Taeon Boots"}
				
sets.RA.Acc = { ammo="TPBullet",
			head="Chass. Tricorne", neck="Iqabi Necklace", lear="Clearview Earring", rear="Enervating Earring",
            body="Chasseur's Frac", hands="Lanun Gants", lring="Hajduk Ring", rring="Hajduk Ring",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Feast Hose", feet="Taeon Boots"}

-- Armageddon 
sets.RA.Armageddon = { ammo="TPBullet",
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
            body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Terebellum Mantle", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.RA.Armageddon.Acc = { ammo="TPBullet",
			head="Lanun Tricorne", neck="Ocachi Gorget", lear="Clearview Earring", rear="Enervating Earring",
            body="Lanun Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Kayapa Cape", waist="Buccaneer's Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

--Barrage
sets.precast.JA["Barrage"] =  set_combine(sets.RA.Acc)

-- Melee TP 
sets.TP = { 
			head="Taeon Chapeau", neck="Asperity Necklace", lear="Heartseeker Earring", rear="Dudgeon Earring",
            body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs=Aug.Skirmish.Taeon.Legs.DW, feet="Taeon Boots"}

-- Melee Accuracy TP
sets.TP.Acc = {	
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Hurch'lan Sash", legs="Taeon Tights", feet="Taeon Boots"}

-- Weaponskills
-- Melee WS
sets.precast.WS = {
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"}

sets.precast.WS["Requiescat"] = {
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}
sets.precast.WS["Exenterator"] = {
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"}

-- RA WS
sets.precast.RAWS = {
				head="Chasseur Tricorne", neck="Fotia Gorget", lear="Clearview Earring", rear="Enervating Earring",
                body="Chasseur Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Gunslinger's Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Taeon Boots"}
-- Physical
sets.precast.RAWS['Last Stand'] = set_combine(sets.precast.RAWS,{
				head="Chasseur Tricorne", neck="Fotia Gorget", lear="Clearview Earring", rear="Moonshade Earring",
                body="Chasseur Frac", hands="Lanun Gants", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Gunslinger's Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Chasseur Bottes"})
-- Magical
sets.precast.RAWS['Wildfire'] = set_combine(sets.precast.RAWS,{
				head="Chasseur Tricorne", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Pearl",
                body="Lanun Frac", hands="Taeon Gloves", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Toro Cape", waist="Aquiline Belt", legs="Lak. Trews", feet="Lanun Boots"})

sets.precast.RAWS['Leaden Salute'] = set_combine(sets.precast.RAWS,{
				head="Lanun Tricorne", neck="Stoicheion Medal", lear="Clearview Earring", rear="Enervating Earring",
                body="Lanun Frac", hands="Taeon Gloves", lring="Shiva Ring", rring="Archon Ring",
                back="Toro Cape", waist="Aquiline Belt", legs="Lak. Trews", feet="Lanun Boots"})

end
-- RUN Gear_sets
-- Created: 7/13/2014
-- Last Modified: 7/19/2014
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
			if player.sub_job == 'NIN' then
				set_macro_page(15,5)
			elseif player.sub_job == 'SAM' then
				set_macro_page(15,6)
			elseif player.sub_job == 'DNC' then 
				set_macro_page(15,7)
			elseif player.sub_job == 'DRK' then 
				set_macro_page(15,8)
			elseif player.sub_job == 'BLU' then 
				set_macro_page(12,9)
			elseif player.sub_job == 'WHM' then 
				set_macro_page(12,10)
			end
		else
			set_macro_page(12,7)
		end
		
-- Auto Sets
-- Standard/idle
	sets.idle.PDT = { 
					head="Futhark Bandeau", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
					body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
					back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

	sets.idle.MDT = { ammo="Vanir Battery",
					head="Futhark Bandeau", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
					body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
					back="Engulfer Cape", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

	sets.misc.Town = set_combine(sets.idle.PDT, {legs="Blood Cuisses"})
					
	sets.idle.Standard = set_combine(sets.idle.PDT, {
					lear="Merman's Earring", rear="Etiolation Earring",
					back="Shadow Mantle", legs="Blood Cuisses"})

	sets.idle.Evasion = { 
					head="Taeon Chapeau", neck="Torero Torque", lear="Musical Earring", rear="Novia Earring",
					body="Taeon Tabard", hands="Taeon Gloves", lring=Aug.Darkring1, rring="Defending Ring",
					back="Fravashi Mantle", waist="Flume Belt", legs="Taeon Tights", feet="Taeon Boots"}

	sets.idle.Fishing = set_combine(sets.idle.Standard,{range="Lu Shang's Fishing Rod", ammo="Sinking Minnow",
				head="Tlahtlamah Glasses", neck="Fisherman's Torque",
				body="Fisherman's Tunica", hands="Kachina Gloves", lring="Pelican Ring", rring="Pelican Ring",
				waist="Fisherman's Belt", legs="Fisherman's Hose", feet="Fisherman's Boots"})
	sets.idle.Wood = set_combine(sets.idle.Standard,{
				neck="Carpenter's Torque",
				body="Carpenter's Smock", hands="Carpenter's Gloves", lring="Orvail Ring", rring="",
				waist="Carpenter's Belt"})		
				
	sets.Enmity = {
				neck="Atzintli Necklace", lear="Friomisi Earring",
				lring="Eihwaz Ring", 
				back="Fravashi Mantle", waist="Goading Belt", legs="Erilaz Leg Guards", feet="Hermes' Sandals"}
					
	-- JA
	sets.precast.JA["Elemental Sforzo"] = {body="Futhark Coat"}
	sets.precast.JA["Odyllic Subterfuge"] = {}

	sets.precast.JA["Lunge"] = {
					head="Haruspex Hat +1", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
					hands="Taeon Gloves", lring="Shiva Ring", rring="Shiva Ring",
					back="Toro Cape", legs="Iuitl Tights"}
					
	sets.precast.JA["Valiance"] = {body="Runiest Coat"}
	sets.precast.JA["Vallation"] = {body="Runiest Coat"}
	sets.precast.JA["Gambit"] = {hands="Runiest Mitons"}
	sets.precast.JA["Pflug"] = {feet="Runiest Boots"}
	sets.precast.JA["Battuta"] = {head="Futhark Bandeau"}
	sets.precast.JA["Sleight of Sword"] = {hands="Futhark Mitons"}
	sets.precast.JA["Inspiration"] = {legs="Futhark Trousers"}
	sets.precast.JA["Rayke"] = {feet="Futhark Boots"}
	sets.precast.JA["Vivacious Pulse"] = {head="Erilaz Galea"}
	
-- Precast Sets
	sets.precast.Fastcast = set_combine(sets.idle.PDT, {
					head="Runiest Bandeau", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchtr. Earring +1",
					body="Taeon Tabard", hands="Thaumas Gloves", rring="Prolix Ring",
					legs="Orvail Pants +1", feet="Chelona Boots +1"})
	sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {})
	sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{waist="Siegel Sash"})
		
	sets.misc.Waltz = set_combine(sets.idle.PDT,{
								head="Kheper Bonnet", lear="Roundel Earring",
								body="Passion Jacket", hands="Slither Gloves +1", lring="Valseur Ring", rring="Asklepian Ring",
								feet="Rawhide Boots"})
	sets.misc.Steps = {ammo="Hasty Pinion +1",
				head="Taeon Chapeau", neck="Iqabi Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
				body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Ramuh Ring +1",
				back="Kayapa Cape", waist="Dynamic Belt +1", legs="Taeon Tights", feet="Taeon Boots"}
	sets.misc.flourish = {
				neck="Eddy Necklace",
				hands="Taeon Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
				legs="Iuitl Tights", feet="Iuitl Gaiters"}

-- Magic 
sets.midcast.Enhancing = {
				head="Erilaz Galea", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
				hands="Runeist Mitons",
				back="Merciful Cape", waist="Olympus Sash", legs="Futhark Trousers"}
sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing,{
				head="Futhark Bandeau"})
sets.midcast.Regen = {head="Runiest Bandeau"}

-- INT
sets.midcast.Spikes = set_combine(sets.idle.PDT,{lring="Shiva Ring", rring="Shiva Ring"})

-- Divine
sets.midcast.Flash = set_combine(sets.Enmity, sets.precast.Fastcast, {})

-- TP set
sets.TP = { ammo="Vanir Battery",
			head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}
-- Acc Set
sets.TP.Acc = { ammo="Hasty Pinion +1",
			head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Dynamic Belt +1", legs="Taeon Tights", feet="Taeon Boots"}
-- Alliance Buffed
sets.TP.Buffed = { ammo="Vanir Battery",
			head="Felistris Mask", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
            body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
            back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}		
-- Tank			
sets.TP.Hybrid = { ammo="Vanir Battery",
			head="Futhark Bandeau", neck="Twilight Torque", lear="Ethereal Earring", rear="Etiolation Earring",
            body="Erilaz Surcoat", hands="Erilaz Gauntlets", lring="Patricius Ring", rring="Defending Ring",
            back="Repulse Mantle", waist="Flume Belt", legs="Erilaz Leg Guards", feet="Erilaz Greaves"}

-- Weaponskills
sets.precast.WS = {ammo="Ginsen",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"}
sets.precast.WS.Acc = {ammo="Ginsen",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Manibozho Jerkin", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"}

-- Great Sword
-- Resolution
sets.precast.WS["Resolution"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Taeon Tabard", hands="Erilaz Gauntlets", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})
sets.precast.WS.Acc["Resolution"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})				
-- Dimidiation
sets.precast.WS["Dimidiation"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Love Torque", lear="Brutal Earring", rear="Moonshade Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ramuh Ring +1", rring="Ramuh Ring +1",
                back="Kayapa Cape", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})
-- Torcleaver
sets.precast.WS["Torcleaver"] = set_combine(sets.precast.WS, {ammo="Vanir Battery",
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Atheling Mantle", waist="Wanion Belt", legs="Taeon Tights", feet="Taeon Boots"})
-- Sword
-- Requiescat
sets.precast.WS["Requiescat"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Atheling Mantle", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})
-- Savage Blade
sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Fotia Belt", legs="Taeon Tights", feet="Taeon Boots"})
-- Sanguine Blade
sets.precast.WS["Sanguine Blade"] = set_combine(sets.precast.WS, {
				head="", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
				body="", hands="Taeon Gloves", lring="Archon Ring", rring="Shiva Ring",
				back="Toro Cape", waist="", legs="", feet=""})

-- Great Axe
sets.precast.WS["Fell Cleave"] = set_combine(sets.precast.WS, {ammo="Ginsen",
				head="Taeon Chapeau", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Prosilio Belt", legs="Taeon Tights", feet="Taeon Boots"})

end
-- BLM Gearsets
-- Date: 4/11/2014
--
---

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(2,1)
			elseif player.sub_job == 'WHM' then
				set_macro_page(2,2)
			elseif player.sub_job == 'SCH' then
				set_macro_page(2,3)
			elseif player.sub_job == 'BRD' then
				set_macro_page(2,4)
			elseif player.sub_job == 'NIN' then 
				set_macro_page(2,5)
			end
		else
			set_macro_page(2,3)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Earth Staff",
				head="Hagondes Hat", neck="Twilight Torque",
                body="Hagondes Coat +1", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Fucho-no-obi",  legs="Hagondes Pants +1", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",
				hands="Serpentes Cuffs",
				feet="Herald's Gaiters"})
		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		
		-- JA
		sets.precast.JA["Manafont"] = {body="Archmage's Coat"}
		sets.precast.JA["Subtle Sorcery"] = {}
		sets.precast.JA["Elemental Seal"] = {main="Baqil Staff"}
		sets.precast.JA["Emnity Douse"] = {}
		sets.precast.JA["Manawell"] = {}
		
		-- Precast
		-- Magic
		sets.precast.MinusHP = {
				head="Zenith Crown", neck="Morgana's Choker",
				body="Dalmatica", hands="Zenith Mitts", 
				legs="Zenith Slacks", feet="Zenith Pumps"}
		sets.precast.Fastcast = {ammo="Impatiens",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Anhur Robe", hands="Magavan Mitts", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots +1"}
		sets.precast.Elemental = set_combine(sets.precast.Fastcast,{
				head="Goetia Petasos +2"})
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris",
                back="Pahtli Cape"})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
				waist="Seigel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat"})
		-- Midcast
		sets.midcast.Recast = set_combine(sets.precast.Fastcast, {
				waist="Witful Belt"})		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs",
				waist="Sekhmet Corset", feet="Umbani Boots"}
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Damage
		sets.midcast.Nuke = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		sets.midcast.Nuke.Acc = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Spaekona's Coat", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Nahtirah Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Sirona's Ring",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="Nahtirah Hat", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Artsieq Hose", feet="Rubeus Boots"}
	
		-- Enhancing 
		-- 
		sets.midcast.Enhancing = {main="Kirin's Pole", sub="Fulcio Grip",
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring",
				body="Anhur Robe", hands="Ayao's Gages", 
				back="Merciful Cape", waist="Olympus Sash", legs="Portant Pants", feet="Rubeus Boots"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", 
				back="Ogapego Cape", waist="Witful Belt"}
		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing,{waist="Siegel Sash"})
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Helios Gloves", lring="Perception ring", rring="Sangoma ring",
                back="Ogapego Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Hagondes Cuffs", lring="Perception ring", rring="Sangoma ring",
                back="Ogapego Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				hands="Sorcerer's Gloves", 
				back="Merciful Cape", legs="Wizard's Tonban", feet="Wicce Sabots"})
		sets.midcast.Aspir = set_combine(sets.midcast.DarkMagic, {waist="Fucho-no-Obi"})
		sets.midcast.Stun = set_combine(sets.midcast.Macc,{ammo="Hasty Pinion",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchtr. Earring",
				body="Vanir Cotehardie", hands="Hagondes Cuffs", lring="Prolix Ring", rring="Sangoma Ring",
				back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Hagondes Sabots"})
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS = set_combine(sets.TP, {
				head="", neck="", lear="", rear="",
                body="", hands="", lring="", rring="",
                back="", waist="", legs="", feet=""})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end
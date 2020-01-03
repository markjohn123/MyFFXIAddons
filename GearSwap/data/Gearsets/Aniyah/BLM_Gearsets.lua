-- Aniyah's BLM Gearsets
-- Created On: 4/11/2014
-- Last Updated: 9/11/2014
-- To Do List
--
--
--
--

if player.Name == 'Aniyah' then
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
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1.Aniyah, rring=Aug.Darkring1.Aniyah,
                back="Cheviot Cape", waist="Fucho-no-obi", legs="Hagondes Pants", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat", neck="Twilight Torque", lear="Merman's Earring", rear="Merman's Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Fucho-no-obi",  legs="Hagondes Pants", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Iridal Staff", ammo="Clarus Stone",
				head="Orvail Corona +1", neck="Eidolon Pendant", lear="Relaxing Earring", rear="Antivenom Earring",
                body="Hagondes Coat", hands="Serpentes Cuffs",
                back="Felicitas Cape"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		sets.lockstyle = set_combine(sets.idle.Standard,{})
		
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
				head="Nahtirah Hat", neck="", lear="Loquac. Earring",
                body="Anhur Robe", hands="Hagondes Cuffs", rring="Prolix Ring",
                back="Swith Cape", waist="Witful Belt", legs="Orvail Pants +1", feet="Chelona Boots"}
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
		sets.midcast.Recast = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {}
		
		-- Elemental
		-- High Resist
		sets.midcast.Elemental = {main="Atinian Staff", sub="Pax Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Aesir Torque", lear="Moldavite Earring", rear="Hecate's Earring",
                body="Hagondes Coat", hands="Hagondes Cuffs", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Cognition Belt", legs="Hagondes Pants", feet="Rubeus Boots"}
				-- Damage
		sets.midcast.Nuke = {main="Atinian Staff", sub="Pax Grip", ammo="Witchstone",
				head="Hagondes Hat", neck="Aesir Torque", lear="Moldavite Earring", rear="Hecate's Earring",
                body="Hagondes Coat", hands="Goetia Gloves +2", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Cognition Belt", legs="Hagondes Pants", feet="Rubeus Boots"}
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="Novia Earring", rear="Lifestorm Earring",
                body="Heka's Kalasiris", hands="Bokwus Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Bokwus Slops", feet="Rubeus Boots"}
	
		-- Enhancing 
		-- 
		sets.midcast.Enhancing = {sub="Fulcio Grip",neck="Colossus's Torque",body="Anhur Robe",hands="Ayao's Gloves",legs="Portant Pants",feet="Rubeus Boots",waist="Cascade Belt",back="Merciful Cape"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="", ammo="Kalboron Stone",
				head="Orvail Corona +1", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Goetia Coat +2", hands="Hagondes Cuffs", lring="Perception Ring", rring="Balrahn's Ring",
                back="", waist="Demonry Sash", legs="Orvail Pants +1", feet="Rubeus Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="", ammo="Kalboron Stone",
				head="Orvail Corona +1", neck="Enfeebling Torque", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Goetia Coat +2", hands="Hagondes Cuffs", lring="Perception Ring", rring="Balrahn's Ring",
                back="", waist="Demonry Sash", legs="Orvail Pants +1", feet="Rubeus Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				hands="Sorcerer's Gloves", 
				back="Merciful Cape", waist="", legs="Wizard's Tonban", feet="Goetia Sabots +2"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark)
		sets.midcast.Stun = set_combine(sets.midcast.Macc)
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {
				 lring="Rajas Ring", rring="Spiral Ring",
                })
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = {}
		sets.misc.flourish = {}
end
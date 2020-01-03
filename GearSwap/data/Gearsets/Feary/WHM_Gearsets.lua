-- WHM Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 02/03/2015
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
			if player.sub_job == 'RDM' then
				set_macro_page(1,1)
			elseif player.sub_job == 'SCH' then
				set_macro_page(1,2)
			elseif player.sub_job == 'SMN' then
				set_macro_page(1,3)
			elseif player.sub_job == 'BLM' then 
				set_macro_page(1,4)
			end
		else
			set_macro_page(1,1)
		end
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield", 
				head="Gende. Caubeen +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Gende. Bilaut +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-Obi", legs="Gende. Spats +1", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {
				head="Gende. Caubeen +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Gende. Bilaut +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Fucho-no-Obi",  legs="Gende. Spats +1", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff", ammo="Clarus Stone",
				head="Gende. Caubeen +1", neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs", lring="", rring="",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Etiolation Earring",
				hands="Serpentes Cuffs",
                legs="Nares Trews", feet="Herald's Gaiters"})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
				
		-- JA
		sets.precast.JA['Benediction'] = {body="Piety Briault"}
		sets.precast.JA['Asylum'] = {}
		
		sets.precast.JA['Divine Caress'] = {head="Ebers Cap", hands="Ebers Mitts", back="Mending Cape"}
		sets.precast.JA['Devotion'] = {head="Piety Cap"}
		sets.precast.JA['Martyr'] = {hands="Piety Mitts"}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Incantor Stone",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
                body="Anhur Robe", hands="Gende. Gages +1", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots +1"}
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
				waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat", waist="Siegel Sash"})
		sets.precast.Healing = set_combine(sets.precast.Fastcast,{legs="Ebers Pantaloons"})
		-- Caps - 80%/26 Current: 81%/13 Haste
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="Piety Cap",
                body="Heka's Kalasiris",
                back="Pahtli Cape", legs="Ebers Pantaloons", feet="Cure Clogs"})
	
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {
				})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera Cotehardie",
                waist="Austerity Belt", legs="Nares Trews", feet="Umbani Boots"}

		--Healing Magic
		-- Cures
		sets.midcast.Cure = {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Ebers Briault", hands="Theophany Mitts", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Ebers Briault", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"})

		sets.midcast.Curaga = {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {main="Tamaxchi",
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Roundel Earring",
                body="Heka Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"})

		sets.midcast.Cura = {}

		-- Status Ailments
		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {
				legs="Ebers Pantaloons"})
		
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells, {})

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {ammo="Impatiens",
				neck="Debilis Medallion",
                rring="Haoma's Ring",
                back="Mending Cape", legs="Theo. Pantaloons", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{main="Bolelabunga",
                body="Piety Briault", hands="Piety Mitts",
                legs="Theo. Pantaloons"})
		sets.midcast.BarElement = {main="Beneficus",
				head="Ebers Cap", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
                body="Ebers Briault", hands="Piety Mitts",
                back="Merciful Cape", waist="Olympus Sash", legs="Ebers Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.BarStatus = {main="Beneficus",
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
                body="Anhur Robe", hands="Ayao's Gages",
                back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.Boost = {main="Beneficus",
				head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
                body="Anhur Robe", hands="Ayao's Gages", 
                back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.Phalanx = set_combine(sets.midcast.Boost)
		sets.midcast.Hastespell = set_combine(sets.precast.Fastcast,{ammo="Impatiens", 
				back="Ogapepo Cape", waist="Witful Belt"})
		sets.midcast.Stoneskin = {waist="Siegel Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast,{ammo="Aureole",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Gwati Earring", rear="Enchntr. Earring +1",
				body="Vanir Cotehardie", hands="Gende. Gages +1", lring="Levi. Ring +1", rring="Levi. Ring +1",
				back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots +1"})
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Bolelabunga", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Friomisi Earring", rear="Crematio Earring",
                body="Helios Jacket", hands=Aug.Skirmish.Helios.Hands.MAB, lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Toro Cape", waist="Sekhmet Corset", legs="Artsieq Hose", feet=Aug.Skirmish.Helios.Feet.MAB}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency - Slow Addle Paralyze
		sets.midcast.Enfeebling = {main="Bolelabunga", ammo="Aureole",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Gende. Gages +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Pahtli Cape", waist="Ovate Rope", legs="Artsieq Hose", feet=Aug.Skirmish.Helios.Feet.MAB}
		sets.midcast.Macc = {main="Bolelabunga", ammo="Aureole",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Gende. Gages +1", lring="Perception ring", rring="Sangoma Ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet=Aug.Skirmish.Helios.Feet.MAB}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {	
				head="Appetence Crown", neck="Aesir Torque",
				body="Hedera Cotehardie",
				back="Merciful Cape"})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				waist="Fucho-no-Obi"})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				waist="Fucho-no-Obi"})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.DOT = set_combine(sets.midcast.Macc,{})

		-- Melee Sets
		sets.TP = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})
end
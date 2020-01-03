-- WHM Gearsets
--
--
--
--


if player.name == 'Carrisa' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- sets Macros off = 0  on = 1
		automacroset = 0
		if automacroset == 1 then
			if player.sub_job == 'rdm' then
				set_macro_page(4,1)
			elseif player.sub_job =='sch' then
				set_macro_page(4,2)
			elseif player.sub_job == 'smn' then
				set_macro_page(4,3)
			elseif player.sub_job =='blm' then 
				set_macro_page(4,4)
			end
		else
			set_macro_page(4,1)
		end
		
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Earth Staff", sub="Achaq Grip", ammo="Incantor Stone",
				head="Gendewitha Caubeen", neck="Twilight Torque", lear="Roundel Earring", rear="Novia Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                back="Umbra Cape", waist="", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.idle.MDT = {
				head="Gendewitha Caubeen", neck="Twilight Torque", lear="Roundel Earring", rear="Orison Earring",
                body="Gendewitha Bliaut", hands="Gendewitha Gages", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                back="Umbra Cape", waist="",  legs="Gendewitha Spats", feet="Gendewitha Galoshes"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Boonwell Staff", sub="Achaq Grip", ammo="Clarus Stone",
				head="Nefer Khat", neck="Eidolon Pendant", lear="Antivenom Earring", rear="Novia Earring",
                body="Heka's Kalasiris", hands="Serpentes Cuffs", lring="", rring="Angha Ring",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{main="Bolelabunga", sub="Sors Shield",
				head="Wivre Hairpin", lear="Loquac. Earring", rear="Novia Earring", lring=Aug.Darkring1.Carrisa, rring=Aug.Darkring2.Carrisa,
                body="Gendewitha Bliaut", hands="Serpentes Cuffs", legs="Nares Trews", feet="Herald's Gaiters"})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				feet="Herald's Gaiters"})
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Impatiens", sub="Vivid Strap", main="Arka IV",
				head="Haruspex Hat +1", neck="Orison Locket", lear="Loquac. Earring", rear="Orison Earring",
                body="Anhur Robe", hands="Gendewitha Gages", lring="Prolix Ring", rring="",
                back="Swith Cape", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {main="Tamaxchi", sub="Sors Shield", ammo="Incantor Stone",
				head="Piety Cap", neck="Aceso's Choker", lear="", rear="",
                body="Heka's Kalairis", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="Ebers Pantaloons", feet="Cure Clogs"})
		-- JA
		sets.precast.JA = {}
		sets.precast.JA['Divine Caress'] = {head="Ebers Cap", hands="Ebers Mitts", back="Mending Cape"}
		sets.precast.JA['Benediction'] = {body="Piety Briault"}
		
		-- Midcast
		sets.midcast = {}
		sets.midcast.Recast = set_combine(sets.idle.PDT,{ main="Plenitas Virga",
				head="Nahtirah hat", neck="", lear="", rear="",
                body="Hedera Cotehardie", hands="Bokwus Gloves", lring="", rring="",
                back="Swith Cape", waist="Witful Belt", legs="", feet="Gende. Galoshes"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="", waist="Austerity Belt", legs="Nares Trews", feet="Serpentes Sabots"}

		--Healing Magic
		sets.midcast.Cure = {main="Tamaxchi", sub="Sors Shield", 
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Roundel Earring", rear="Healing Earring",
                body="Ebers Briault", hands="Theo. Mitts", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Ebers Pantaloons", feet="Piety Duckbills"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {main="Tamaxchi", sub="Sors Shield",
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Roundel Earring", rear="Healing Earring",
                body="Ebers Briault", hands="Theo. Mitts", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Mending Cape", waist="Cascade Belt", legs="Ebers Pantaloons", feet="Piety Duckbills"})

		sets.midcast.Curaga = {main="Tamaxchi", sub="Sors Shield",
				head="Gendewitha Caubeen", neck="Colossus's Torque", lear="Novia Earring", rear="Healing Earring",
                body="Heka's Kalasiris", hands="Theo. Mitts", lring="Sirona's Ring", rring="Haoma's Ring",
                back="Refraction Cape", waist="Cascade Belt", legs="Ebers Pantaloons", feet="Piety Duckbills"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.Cura = {}

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast, {ammo="Incantor Stone",
				head="Nahtirah Hat", neck="Orison Locket", lear="Loquac. Earring", rear="",
                body="Hedera Cotehardie", hands="", legs= "Theophany Pantaloons", lring="Prolix Ring", rring="",
                back="", waist="Witful Belt", legs="", feet=""})
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {
				head="", neck="Malison Medallion", lear="Loquac. Earring", rear="",
                body="Ebers Briault", hands="", lring="Prolix Ring", rring="Haoma's Ring",
                back="Mending Cape", waist="Witful Belt", legs="Ebers Pantaloons", feet="Gende. Galoshes"})
				
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{
				main="Bolelabunga", sub="Sors Shield", head="", neck="", lear="", rear="",
                body="Piety Briault", hands="Ebers Mitts", lring="", rring="",
                back="", waist="", legs="Theophany Pantaloons", feet=""})
		sets.midcast.BarElement = {main="Beneficus",
				head="Ebers Cap", neck="Colossus's Torque", lear="", rear="",
                body="Ebers Briault", hands="Ebers Mitts", lring="", rring="",
                back="Merciful Cape", waist="Olympus Sash", legs="Ebers Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.BarStatus = {main="Beneficus",
				head="Umuthi Hat", neck="Colossus's Torque", lear="", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.Boost = {main="Beneficus", sub="Fulcio Grip",
				head="Umuthi Hat", neck="Colossus's Torque", lear="", rear="",
                body="Anhur Robe", hands="Ayao's Gages", lring="", rring="",
                back="Merciful Cape", waist="Olympus Sash", legs="Piety Pantaloons", feet="Ebers Duckbills"}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {head="Umuthi Hat", neck="Stone Gorget", rear="Earthcry Earring", hands="Carapacho Cuffs",waist="Siegal Sash", legs="Haven Hose"}
		sets.midcast.Aquaveil = {head="Umuthi Hat", waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = {main="Eminent Staff",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Hecate's Earring", rear="Novio Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Aquasoul Ring", rring="Aquasoul Ring",
                back="Searing Cape", waist="Bishop's Sash", legs="Gendewitha Spats", feet="Gendewitha Galoshes"}
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Eminent Staff", sub="Mephitis Grip", ammo="Kalboron Stone",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Ogapepo Cape", waist="Demonry Sash", legs="Artsieq Hose", feet="Bokwus Boots"}
		sets.midcast.Macc = {main="Eminent Staff", sub="Mephitis Grip", ammo="Kalboron Stone",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Lifestorm Earring", rear="Psystorm Earring",
                body="Bokwus Robe", hands="Yaoyotl Gloves", lring="Sangoma Ring", rring="Perception Ring",
                back="Ogapepo Cape", waist="Demonry Sash", legs="Artsieq Hose", feet="Bokwus Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = {}

		-- Melee Sets
		sets.TP = {}
		sets.precast.WS = set_combine(sets.TP, {})
		sets.precast.WS['Hexa Strike'] = set_combine(sets.precast.WS, {})
end
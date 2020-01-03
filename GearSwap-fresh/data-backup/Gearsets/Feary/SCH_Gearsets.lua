-- SCH Gearsets
-- Created: 6/13/2014
-- Last Updated: 6/13/2014
-- To Do:
--
--
--
--

if player.Name == 'Feary' then
		-- includes
		include('include/mappings.lua')
		include('include/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'RDM' then
				set_macro_page(9,1)
			elseif player.sub_job =='WHM' then
				set_macro_page(9,2)
			elseif player.sub_job == 'BLM' then
				set_macro_page(9,3)
			elseif player.sub_job == 'DRK' then
				set_macro_page(9,4)
			elseif player.sub_job =='NIN' then 
				set_macro_page(9,5)
			end
		else
			set_macro_page(9,1)
		end

		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hagondes Sabots"}
		sets.idle.MDT = {
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff",
				neck="Eidolon Pendant", lear="Magnetic Earring", rear="Moonshade Earring",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{
				lear="Merman's Earring", rear="Moonshade Earring",
				feet="Herald's Gaiters"})
		sets.misc.Town = set_combine(sets.idle.PDT, {feet="Herald's Gaiters"})
		
		-- JA
		sets.precast.JA["Tabula Rasa"] = {legs="Argute Pants +2"}
		sets.precast.JA["Caper Emissarius"] = {}
		
		sets.precast.JA["Sublimation"] = {}
		sets.precast.JA["Enlightenment"] = {}
		sets.precast.JA["Libra"] = {}
		sets.precast.JA["Modus Veritas"] = {}
		sets.precast.JA["Libra"] = {}
		
		-- Strategems 
		sets.precast.JA["Rapture"] = {}
		
		-- Precast
		-- Magic
		sets.precast.Fastcast = {ammo="Incantor Stone",
				head="Nahtirah Hat", neck="", lear="Loquac. Earring",
                body="Anhur Robe", hands="Gende. Gages +1", rring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Peda. Loafers"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                body="Heka's Kalasiris", 
                back="Pahtli Cape"})  		
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast,{
				waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat", waist="Siegel Sash"})
		
		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				rear="Gifted Earring",
                body="Hedera's Cotehardie",
				waist="Austerity Belt", feet="Umbani Boots"}
		
		-- Elemental Magic 
		-- High Resist
		sets.midcast.Elemental = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Strophadic Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Damage
		sets.midcast.Nuke = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Hagondes Hat +1", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Hagondes Coat", hands="Helios Gloves", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		
		sets.midcast.Nuke.Acc = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Helios Hat", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Helios Jacket", hands="Helios Gloves", lring="Shiva ring", rring="Shiva ring",
                back="Toro Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Helios Boots"}
		-- Hellx 
		sets.midcast.Helix = {main="Atinian Staff", sub="Zuuxowu Grip", ammo="Witchstone",
				head="Svnt. Bonnet +2", neck="Eddy Necklace", lear="Crematio Earring", rear="Friomisi Earring",
                body="Bokwus Robe", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Bookworm's Cape", waist="Sekhmet Corset", legs="Hagondes Pants +1", feet="Svnt. Loafers +2"}
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
                body="Pedagogy Gown", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Academic's Pants", feet="Pedagogy Loafers"}
		
		sets.midcast.Cure.Weather = {main="Chatoyant Staff", 
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
                body="Gende. Bilaut +1", hands="Telchine Gloves", lring="Sirona's Ring", rring="Levia. Ring +1",
                back="Twilight Cape", waist="Hachirin-no-Obi", legs="Academic's Pants", feet="Pedagogy Loafers"}
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="Gendewitha Caubeen +1", neck="Colossus's Torque", lear="Novia Earring", rear="Beatific Earring",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="Academic's Pants", feet="Pedagogy Loafers"}
	
		-- Enhancing 
		-- Target 500+ 
		sets.midcast.Enhancing = {main="Kirin's Pole", sub="Fulcio Grip", ammo="Savant's Treatise",
			head="Umuthi Hat", neck="Colossus's Torque", lear="Andoaa Earring", rear="Augment. Earring",
			body="Anhur Robe", hands="Svnt. Bracers +2",
			back="Merciful Cape", waist="Olympus Sash", legs="Scholar's Pants", feet="Rubeus Boots"}
		sets.midcast.Embrava = set_combine(sets.midcast.Enhancing, {hands="Svnt. Bracers +2"})
		sets.midcast.Regen = set_combine(sets.midcast.Enhancing,{main="Bolelabunga",
			head="Svnt. Bonnet +2",
			back="Bookworm's Cape"})
		sets.midcast.Enspell = set_combine{sets.midcast.Enhancing,{})
		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegel Sash"}
		sets.midcast.Aquaveil = {}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Atinian Staff", sub="Mephitis Grip", range="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helios Jacket", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Macc = {main="Atinian Staff", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Helio Jacket", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Helios Boots"}
		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc)
		sets.midcast.Blind = set_combine(sets.midcast.Macc)
		sets.midcast.Bio = set_combine(sets.midcast.Macc)
		sets.midcast.Slow = set_combine(sets.midcast.Macc)
		
		
		-- Dark Magic
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {
				head="Appetence Crown", neck="Aesir Torque",
				back="Merciful Cape", })
		sets.midcast.Aspir = set_combine(sets.midcast.Dark, {
			head="Appetence Crown",
			waist="Fucho-no-Obi",})
		
		sets.midcast.Kaustra = set_combine(sets.midcast.Macc,{main="Atinian Staff", sub="Mephitis Grip",
				head="Helios Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Hagondes Coat +1", hands="Helios Gloves", lring="Shiva Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Hachirin-no-Obi", legs="Hagondes Pants +1", feet="Helios Boots"}})
		
		-- Stun - Alacrity Down
		sets.midcast.Stun = set_combine(sets.precast.Fastcast, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
			head="Argute M.board +2", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Gwati Earring",
			body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
			back="Swith Cape +1", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Acad. Loafers"})
		-- Stun - Alacrity Up
		sets.midcast.Stun.Alacrity = set_combine(sets.midcast.Stun, {main="Atinian Staff", sub="Arbuda Grip", ammo="Incantor Stone",
			head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Gwati Earring",
			body="Hedera Cotehardie", hands="Gende. Gages +1", lring="Prolix Ring", rring="Sangoma Ring",
			back="Swith Cape +1", waist="Ninurta's Sash", legs="Artsieq Hose", feet="Argute's Loafers +2"})
		
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
-- SMN Gearsets
-- Created:
-- Last Updated: 
-- To Do:
--
--
--

if player.name == 'Feary' then
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')
		-- include('../include/autoexec.lua')
			
		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {main="Earth Staff",
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etoilation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Hagondes Pants +1", feet="Hagondes Sabots"}
		sets.idle.MDT = {main="Earth Staff",
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Hagondes Cuffs +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Felicitas Cape", waist="Austerity Belt", legs="Hagondes Pants +1", feet="Hagondes Sabots"}			
		sets.Resting = set_combine(sets.idle.PDT, {main="Chatoyant Staff", ammo="Clarus Stone",
				head="Caller's Horn +2", neck="Eidolon Pendant",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Felicitas Cape", waist="Austerity Belt", legs="Nares Trews", feet="Chelona Boots +1"})
		sets.misc.Town = set_combine(sets.idle.PDT, {main="Hvergelmir",
				feet="Herald's Gaiters"})
		sets.idle.Standard = set_combine(sets.idle.PDT,{ammo="",
				head="Caller's Horn +2",lear="Merman's Earring", rear="Etoilation Earring",
                body="Hagondes Coat +1", hands="Serpentes Cuffs",
                back="Umbra Cape", waist="Fucho-no-obi", legs="Nares Trews", feet="Herald's Gaiters"})
		sets.lockstyle = {main="Hvergelmir",
				head="Caller's Horn +2",
				body="Beckoner's Doublet", hands="Caller's Bracers +2",
				legs="Beckoner's Spats", feet="Herald's Gaiters"}
		
		-- Precast	
		-- Blood Pacts 
		sets.precast.BP = {ammo="Eminent Sachet",
			head="Convoker's Horn",
			body="Glyphic Doublet", hands="Glyphic Bracers",
			legs="Glyphic Spats", feet="Glyphic Pigaches"}
		
		-- Magic
		sets.precast.Fastcast = { ammo="Impatiens",
				head="Nahtirah Hat", neck="Voltsurge Torque", lear="Loquac. Earring", rear="Enchntr. Earring +1",
				body="Anhur Robe", hands="Magavan Mitts", lring="Prolix Ring",
                back="Swith Cape +1", waist="Witful Belt", legs="Artsieq Hose", feet="Chelona Boots +1"}
		sets.precast.Cure = set_combine(sets.precast.Fastcast, {
				head="", neck="", lear="", rear="",
                body="Heka's Kalairis", hands="", lring="", rring="",
                back="Pahtli Cape", waist="", legs="", feet=""})
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {waist="Siegel Sash"})
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing, {head="Umuthi Hat"})
	
		-- JA
		sets.precast.JA['Astral Conduit'] = {}
		sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
		
		sets.precast.JA['Elemental Siphon'] = {main="Keraunos", sub="Vox Grip", ammo="Esper Stone +1",
				-- Telchine Cap Smn. Earring
				head="Caller's Horn +2", neck="Caller's Pendant", lear="Andoaa Earring", rear="Gifted Earring",
				-- Telchine Chas. Telchine Gloves 
				body="Anhur Robe", hands="Glyphic Bracers", lring="Evoker's Ring",rring="Fervor Ring",
				-- Telchine braconi
				back="Conveyance Cape", waist="Cimmerian Sash", legs="Beckoner's Spats", feet="Beck. Pigaches"}
				
		sets.precast.JA['Mana Cede'] = {hands="Caller's Bracers +2"}
		
		-- Midcast
		-- Summoning
		sets.midcast.SummoningMagic = {main="Kirin's Pole", sub="Vox Grip", ammo="Eminent Sachet",
				-- Smn. Earring
				head="Convoker's Horn",neck="Caller's Pendant", lear="Andoaa Earring", rear="Gifted Earring",
				-- Globidonta Ring
				body="Beckoner's Doublet", hands="Glyphic Bracers", lring="Evoker's Ring",rring="Fervor Ring",
				-- Marduk Crackows +1
				back="Conveyance Cape", waist="Cimmerian Sash", legs="Beckoner's Spats", feet="Rubeus Boots"}

		-- BloodPactWard
		sets.midcast.Pet.BloodPactWard = set_combine(sets.midcast.SummoningMagic,{main="", sub=""})
				
		-- Debuffs	
		sets.midcast.Pet.BloodPactWard.Macc = set_combine(sets.midcast.SummoningMagic,{main="", sub=""
				-- Aug.Skirmish.Helios.Head.smn
				-- Aug.Skirmish.Helios.Body.smn, Aug.Skirmish.Helios.Hands.smn
				-- Aug.Skirmish.Helios.Legs.smn, Aug.Skirmish.Helios.Feet.smn
				})
		
		-- BloodPactRage
		-- Physical 
		sets.midcast.Pet.PhysicalBloodPactRage = {main="Keraunos", sub="Vox Grip", ammo="Eminent Sachet",
				-- Aug.Skirmish.Helios.Head.PBPD, Esper Earring Domes. Earring	
				head="Glyphic Horn", neck="Sacrifice Torque", lear="Andoaa Earring", rear="Smn. Earring",
				-- Aug.Skirmish.Helios.Hands.PBPD 
				body="Convoker's Doublet", hands="Glyphic Bracers", lring="Evoker's Ring", rring="Fervor Ring",
				-- Aug.Skirmish.Helios.Legs.PBPD Aug.Skirmish.Helios.Feet.PBPD
				back="Conveyance Cape", waist="Mujin Obi", legs="Beckoner's Spats", feet="Hagondes Sabots"}
		
		-- Magical
		-- 'Nether Blast','Aerial Blast','Searing Light','Diamond Dust','Earthen Fury','Zantetsuken','Tidal Wave','Judgment Bolt','Inferno','Howling Moon','Ruinous Omen','Flaming Crush'
		sets.midcast.Pet.MagicalBloodPactRage = {main="Keraunos", sub="Vox Grip", ammo="Eminent Sachet",
				-- Aug.Skirmish.Helios.Head.MBPD, Esper Earring
				head="Glyphic Horn", neck="Eidolon Pendant", lear="Andoaa Earring", rear="Smn. Earring",
				-- Aug.Skirmish.Helios.Body.MBPD, Aug.Skirmish.Helios.Hands.MBPD,
				body="Beckoner's Doublet", hands="Glyphic Bracers", lring="Evoker's Ring", rring="Fervor Ring",
				-- Aug.Skirmish.Helios.Legs.MBPD Aug.Skirmish.Helios.Feet.MBPD
				back="Conveyance Cape", waist="Caller's Sash", legs="Beckoner's Spats", feet="Hagondes Sabots"}
		
		-- Flaming Crush - Not Added to Smn.lua
		sets.midcast.Pet.FC = set_combine(sets.midcast.Pet.MagicalBloodPactRage,{
				rring="Fervor Ring"})
		
		-- Heavenly Strike','Wind Blade','Holy Mist','Night Terror','Thunderstorm','Geocrush','Meteor Strike','Grand Fall','Lunar Bay','Thunderspark'		
		sets.midcast.Pet.MagicalBloodPactRage.TP = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {legs="Beckoner's Spats"})
		
		--	Additional Effect BPs
		sets.midcast.Pet.MagicalBloodPactRage.Macc = set_combine(sets.midcast.SummoningMagic,{
				--Aug.Skirmish.Helios.Head.BPbuff
				--Aug.Skirmish.Helios.Body.BPbuff Aug.Skirmish.Helios.Hands.BPbuff
				--Aug.Skirmish.Helios.Legs.BPbuff Aug.Skirmish.Helios.Feet.BPbuff
				})
		-- Avatar Nukes 
		sets.midcast.Pet.MagicalBloodPactRage.MAB = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {})
		
		sets.midcast.Pet.Spirit = set_combine(sets.midcast.Pet.BloodPactRage, {legs="Glyphic Spats"})		
		
		-- Magic 
		sets.midcast.Recast = set_combine(sets.idle.PDT,{main="Plenitas Virga", waist="Witful Belt"})
		
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				head="", neck="", lear="Magnetic Earring", rear="Gifted Earring",
                body="Hedera's Cotehardie", hands="Serpentes Cuffs", lring="", rring="",
                back="", waist="Austerity Belt", legs="Nares Trews", feet="Serpentes Sabots"}
		
		--Healing Magic
		sets.midcast.Cure = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="", feet="Rubeus Boots"}
		sets.midcast.EnmityCure = set_combine(sets.midcast.Cure, {})
		
		sets.midcast.Curaga = {main="Arka IV", 
				head="", neck="Colossus's Torque", lear="", rear="",
                body="Heka's Kalasiris", hands="Telchine Gloves", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Tempered Cape +1", waist="Bishop's Sash", legs="", feet="Rubeus Boots"}
		sets.midcast.EnmityCuraga = set_combine(sets.midcast.Curaga, {})

		sets.midcast.NaSpells = set_combine(sets.midcast.Recast)
		sets.midcast.Erase = set_combine(sets.midcast.NaSpells)

		sets.midcast.Cursna = set_combine(sets.midcast.Recast, {})
		
		sets.midcast.Esuna = set_combine(sets.midcast.Recast)
		sets.midcast.Sacrifice = set_combine(sets.midcast.Recast)

		-- Enhancing
		sets.midcast.Regen = set_combine(sets.midcast.ConserveMP,{main="Bolelabunga"})
		sets.midcast.BarElement = {}
		sets.midcast.BarStatus = {}
		sets.midcast.Phalanx = set_combine(sets.Boost)
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = {waist="Siegal Sash"}
		sets.midcast.Aquaveil = {waist="Empahatikos Rope", legs="Shedir Seraweels"}
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)

		--Divine Magic
		sets.midcast.Repose = set_combine(sets.midcast.Recast)
		sets.midcast.Flash = set_combine(sets.midcast.Macc)
		sets.midcast.Banish = set_combine(sets.midcast.Macc)
		sets.midcast.Holy = set_combine(sets.midcast.Banish)

		-- Enfeebling
		-- Potency
		sets.midcast.Enfeebling = {main="Eminent Pole", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs +1", lring="Levia. Ring +1", rring="Levia. Ring +1",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet=Aug.Skirmish.Telchine.Feet.Song}
		sets.midcast.Macc = {main="Eminent Pole", sub="Mephitis Grip", ammo="Aureole",
				head="Nahtirah Hat", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Bokwus Robe", hands="Hagondes Cuffs +1", lring="Perception ring", rring="Sangoma Ring",
                back="Refraction Cape", waist="Ovate Rope", legs="Artsieq Hose", feet=Aug.Skirmish.Telchine.Feet.Song}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{})

		-- Dark Magic
		sets.midcast.DarkMagic = set_combine(sets.midcast.Macc, {})
		sets.midcast.Drain = set_combine(sets.midcast.Macc, {})
		sets.midcast.Aspir = set_combine(sets.midcast.Macc, {})
		
		-- Elemental Magic
		sets.midcast.Nuke = set_combine(sets.midcast.Banish)
		sets.midcast.Dot = {}
		
		-- Perp Sets
		sets.perp = {}
		sets.perp.Day = {hands="Caller's Bracers +2"}
		sets.perp.Weather = {neck="Caller's Pendant", hands="Caller's Bracers +2"}
		--Avatar
		sets.idle.Avatar = {main="Keraunos", sub="Vox Grip", ammo="Eminent Sachet",
				-- Rimeice Earring
				head="Convoker's Horn", neck="Caller's Pendant", lear="Gifted Earring", rear="Etoilation Earring",
				-- Shomonjijoe +1 hands=Aug.Skirmish.Helios.Hands.Perp
				body="Beckoner's Doublet", hands="Serpentes Cuffs", lring="Evoker's Ring", rring="Fervor Ring",
				-- Conveyence Cape - Moepapa Stone - Assipidity Pants. - Aug.Skirmish.Helios.Feet.Pet = {}
				back="Pahtli Cape", waist="Fucho-no-Obi", legs="Nares Trews", feet="Beck. Pigaches"}
		sets.idle.Avatar["Carbuncle"] = set_combine(sets.idle.Avatar,{hands="Carbuncle Mitts"}) -- Asteria Mitts +1
		sets.idle.Avatar["Diabolos"] = set_combine(sets.idle.Avatar, {waist="Diabolos's Rope"})
		sets.idle.Avatar["Alexander"] = set_combine(sets.midcast.SummoningMagic)
		sets.idle.Avatar["Odin"] = set_combine(sets.midcast.SummoningMagic)
		
		-- Avator Favor - needs 450 skill minimum
		sets.idle.Avatar.Favor = set_combine(sets.idle.Avatar,{
				head="Caller's Horn +2",
				body="Beckoner's Doublet"})
			
		-- Avatar TP
		sets.idle.Avatar.Melee = set_combine(sets.idle.Avatar,{})
		
		-- Avatar DT - add to smn.lua
		sets.idle.Avatar.DT = set_combine(sets.idle.Avatar,{
				head="Selenian Cap", neck="Caller's Pendant", lear="Handler's Earring +1", rear="Handler's Earring",
				body="Shomonjijoe +1", hands="Telchine Gloves", lring="Evoker's Ring", rring="Defending Ring",
				back="Conveyance Cape", waist="Isa Belt", legs="Telchine Braconi", feet="Beckoner's Pigaches"})
		
		-- Spirit
		sets.idle.Avatar.Spirit = {
				head="Caller's Horn +2", neck="Caller's Pendant", lear="Loquacious Earring", rear="Moonshade Earring",
				body="Hagondes Coat +1", hands="Serpentes Cuffs", lring="Evoker's Ring", rring="Sangoma Ring",
				back="Tiresias' Cape",waist="Fucho-no-obi", legs="Glyphic Spats",feet="Beck. Pigaches"}
		
		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {waist="Witful Belt"})
		
		-- Weaponskills
		sets.precast.WS = set_combine(sets.TP, {})
		
		-- MP Gear
		sets.precast.WS['Myrkr'] = set_combine(sets.precast.WS, {})
		
		sets.precast.WS['Shattersoul'] = set_combine(sets.precast.WS, {})
		
		sets.precast.WS['Garland of Bliss'] = set_combine(sets.precast.WS, {})


end 
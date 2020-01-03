-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Accuracy')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    gear.default.weaponskill_waist = "light Belt"
	gear.default.obi_waist = "yamabuki-no-obi"
	gear.default.obi_back = "seshaw Cape"
	gear.default.obi_ring = "Acumen Ring"
	
    select_default_macro_book()
	
end


-- Define sets and vars used by this job file.
function init_gear_sets()
		 aug = {}	
			--Solstice
				aug.solsticeclub = { name="Solstice", augments={'Mag. Acc.+20','Pet: Damage taken -4%','"Fast Cast"+5',}}
				
			--Cure Gear
				aug.curehead = { name="Vanya Hood", augments={'MP+50','"Cure" potency +7%','Enmity-6',}}
				aug.curebody = { name="Vanya Robe", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
				aug.curehands = { name="Vanya Cuffs", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
				aug.curelegs = { name="Vanya Slops", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}}
				aug.curefeet = { name="Vanya Clogs", augments={'"Cure" potency +5%','"Cure" spellcasting time -15%','"Conserve MP"+6',}}

			--MB Gear
				aug.MBhead = { name="Merlinic Hood", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst mdg.+5%','INT+10',}}
				aug.MBhands = { name="Amalric Gages", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15',}}
				aug.MBlegs = { name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+5','Mag. Acc.+14','"Mag.Atk.Bns."+15',}}
				aug.MBfeet = { name="Merlinic Crackows", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Magic burst mdg.+6%','MND+9','Mag. Acc.+7','"Mag.Atk.Bns."+14',}}

			--Relic Gear
				aug.georelichead={ name="Bagua Galero", augments={'Enhances "Primeval Zeal" effect',}}
				aug.georelicbody={ name="Bagua Tunic +1", augments={'Enhances "Bolster" effect',}}
				aug.georelichands={ name="Bagua Mitaines", augments={'Enhances "Curative Recantation" effect',}}
				aug.georeliclegs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}}
				aug.georelicfeet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}}

			--Geo Cape
				aug.geocape = { name="Lifestream Cape", augments={'Geomancy Skill +7','Indi. eff. dur. +17','Pet: Damage taken -1%',}}

			--Dark Rings
				aug.darkring1 = { name="Dark Ring", augments={'Phys. dmg. taken -4%','Spell interruption rate down -3%','Magic dmg. taken -4%',}}
				aug.darkring2 = { name="Dark Ring", augments={'Phys. dmg. taken -4%','Magic dmg. taken -5%',}}
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body=aug.georelicbody}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Curative Recantation'] = {hands=aug.georelichands}
	sets.precast.JA['Mending Halation'] = {legs=aug.georeliclegs}
	sets.precast.JA['Radial Arcana'] = {feet=aug.georelicfeet}
	sets.precast.JA['Primal Zeal'] = {head=aug.georelichead}	
	sets.precast.JA['Cardinal Chant'] = {head="geomancy galero"}


    -- Fast cast sets for spells

    sets.precast.FC = {
    main=aug.solsticeclub,
    sub="Culminus",
    range="Dunna",
    head="Nahtirah Hat",
    body="Vanir Cotehardie",
    hands="Repartie Gloves",
    legs="Geomancy Pants",
    feet=aug.MBfeet,
    neck="Orunmila's Torque",
    waist="Witful Belt",
    ear1="Enchntr. Earring +1",
    ear2="Loquac. Earring",
    ring1="Prolix Ring",
    ring2="Veneficium Ring",
    back="swith cape"
}

    sets.precast.FC.Cure = {
	main="Tamaxchi",
	sub="Culminus",
	ammo="Impatiens",
    head=aug.curehead,
	ear1="Mendicant's Earring",
	ear2="Loquacious Earring",
    body=aug.curebody,
	hands=aug.curehands,
	ring1="Prolix Ring",
    back="Swith Cape",
	waist="Witful Belt",
	legs=aug.curelegs,
	feet=aug.curefeet
}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
	waist="Siegel Sash"})	
	
    sets.precast.FC['Elemental Magic'] = {
    main=aug.solsticeclub,
    sub="Culminus",
    range="Dunna",
    head="Nahtirah Hat",
    body="Vanir Cotehardie",
    hands=aug.georelichands,
    legs="Geomancy Pants",
    feet=aug.MBfeet,
    neck="Orunmila's Torque",
    waist="Channeler's Stone",
    ear1="Enchntr. Earring +1",
    ear2="Loquac. Earring",
    ring1="Prolix Ring",
    ring2="Veneficium Ring",
    back="swith cape"
}

	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
	
    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nahtirah Hat",
		neck="asperity necklace",
		ear1="Bladeborn Earring",
		ear2="Steelflash Earring",
        body="Ischemia chasuble",
		hands="Yaoyotl Gloves",
		ring1="Rajas Ring",
		ring2="K'ayres Ring",
        back="Refraction Cape",
		waist="cetl belt",
		legs=aug.georeliclegs,
		feet=aug.georelicfeet
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

		sets.precast.WS['Hexa Strike'] = {
    main={ name="Nehushtan", augments={'Accuracy+11','"Dbl.Atk."+2',}},
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Resist Paralyze"+6','"Cure" spellcasting time -5%',}},
    range="Dunna",
    head="Nahtirah Hat",
    body="Ischemia Chasu.",
    hands={ name="Otomi Gloves", augments={'Haste+2','"Snapshot"+2','MND+8',}},
    legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Light Gorget",
    waist="Light Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Levia. Ring",
    right_ring="Levia. Ring",
    back="Refraction Cape",
}
		
		sets.precast.WS['Realmrazer'] = {
    main={ name="Nehushtan", augments={'Accuracy+11','"Dbl.Atk."+2',}},
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Resist Paralyze"+6','"Cure" spellcasting time -5%',}},
    range="Dunna",
    head={ name="Artsieq Hat", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    body="Vanir Cotehardie",
    hands={ name="Otomi Gloves", augments={'Haste+2','"Snapshot"+2','MND+8',}},
    legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
    feet={ name="Artsieq Boots", augments={'MP+30','Mag. Acc.+20','MND+7',}},
    neck="Light Gorget",
    waist="Light Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Levia. Ring",
    right_ring="Levia. Ring",
    back="Refraction Cape",
}
		
		sets.precast.WS['Flash Nova'] = {head={ name="Hagondes Hat", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+22',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+16',}},
    hands={ name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','"Mag.Atk.Bns."+27',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+22',}},
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Friomisi Earring",
    right_ear=gear.ElementalRing,
    left_ring="Strendu Ring",
    right_ring="Sangoma Ring",
    back=gear.ElementalCape,}
		
		sets.precast.WS['Black Halo'] = {head={ name="Hagondes Hat", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+22',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+16',}},
    hands={ name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','"Mag.Atk.Bns."+27',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+22',}},
    feet="Umbani Boots",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Friomisi Earring",
    right_ear=gear.ElementalRing,
    left_ring="Strendu Ring",
    right_ring="Sangoma Ring",
    back=gear.ElementalCape,}
		
		 sets.precast.WS['Exudation'] = {
    main={ name="Nehushtan", augments={'Accuracy+11','"Dbl.Atk."+2',}},
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Resist Paralyze"+6','"Cure" spellcasting time -5%',}},
    range="Dunna",
    head="Geo. Galero +1",
    body="Vanir Cotehardie",
    hands={ name="Otomi Gloves", augments={'Haste+2','"Snapshot"+2','MND+8',}},
    legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Asperity Necklace",
    waist="Cetl Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    right_ear="Brutal Earring",
    left_ring="Levia. Ring",
    right_ring="Levia. Ring",
    back="Refraction Cape",
}
		
		
		
    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast.FastRecast = {
    main=aug.solsticeclub,
    sub="Culminus",
    range="Dunna",
    head="Nahtirah Hat",
    body="Vanir Cotehardie",
    hands="Repartie Gloves",
    legs="Geomancy Pants",
    feet=aug.MBfeet,
    neck="Orunmila's Torque",
    waist="Witful Belt",
    ear1="Enchntr. Earring +1",
    ear2="Loquac. Earring",
    ring1="Prolix Ring",
    ring2="Veneficium Ring",
    back="swith cape"
}
	
	sets.midcast.Phalanx = {
    main={ name="Kirin's Pole", augments={'DMG:+24','"Resist Sleep"+5','Enha.mag. skill +11',}},
    sub="Fulcio Grip",
    range="Dunna",
    head="Umuthi Hat",
    hands="Ayao's Gages",
    legs="Portent Pants",
    feet="Umbani Boots",
    neck="Colossus's Torque",
    waist="Cascade Belt",
    left_ear="Andoaa Earring",
    right_ear="Magnetic Earring",
    left_ring="Water Ring",
    right_ring="Vocane Ring",
    back="Merciful Cape",
}
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
	back="grapevine cape"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
	waist="Emphatikos rope"})

    sets.midcast.Geomancy ={
    main=aug.solsticeclub,
    sub="Culminus",
    range="Dunna",
    head="Azimuth Hood +1",
    body=aug.georelicbody,
    hands="Geomancy Mitaines +1",
    legs="Azimuth Tights",
    feet="Azimuth Gaiters +1",
    neck="Orunmila's Torque",
    waist="Channeler's Stone",
    ear1="Gifted Earring",
    ear2="Loquac. Earring",
    ring1="Prolix Ring",
    ring2="Veneficium Ring",
    back=aug.geocape
}
	
    sets.midcast.Geomancy.Indi =set_combine(sets.midcast.Geomancy, {legs=aug.georeliclegs})

    sets.midcast.Cure = {
	main="Tamaxchi",
	sub="Sors Shield",
	ammo="Impatiens",
    head=aug.curehead,
	neck="Nodens Gorget",
	ear1="Mendicant's Earring",
	ear2="Roundel Earring",
    body=aug.curebody,
	hands=aug.curehands,
	ring1="Sirona's Ring",
	ring2="Ephedra Ring",
    back="Swith Cape",
	waist="Witful Belt",
	legs=aug.curelegs,
	feet=aug.curefeet
}


		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    head="Umuthi Hat",
})	
    	
	
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

		-- Custom Spell Classes
	sets.midcast['Enfeebling Magic'] = {
    main=aug.solsticeclub,
    sub="Sors Shield",
    range="Dunna",
    head="Befouled Crown",
    body=aug.curebody,
    hands="Azimuth Gloves",
    legs=aug.MBlegs,
    feet=aug.georelicfeet,
    neck="Imbolda Necklace",
    waist="Eschan Stone",
    ear1="Lifestorm Earring",
    ear2="Psystorm Earring",
    ring1="Sangoma Ring",
    ring2="Irrwisch Ring",
    back=aug.geocape
}

	sets.midcast.IntEnfeebles = {
    main=aug.solsticeclub,
    sub="Sors Shield",
    range="Dunna",
    head="Befouled Crown",
    body=aug.curebody,
    hands="Azimuth Gloves",
    legs=aug.MBlegs,
    feet=aug.georelicfeet,
    neck="Imbolda Necklace",
    waist="Eschan Stone",
    ear1="Lifestorm Earring",
    ear2="Psystorm Earring",
    ring1="Sangoma Ring",
    ring2="Irrwisch Ring",
    back=aug.geocape
}

	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']

	sets.midcast['Dark Magic'] = {
    main=aug.solsticeclub,
    sub="Culminus",
    range="Dunna",
    head=aug.MBhead,
    body="Geomancy Tunic",
    hands=aug.MBhands,
    legs=aug.MBlegs,
    feet=aug.MBfeet,
    neck="Eddy Necklace",
    ear1="Barkarole Earring",
    ear2="Hecate's Earring",
    ring1="Fenrir Ring",
    ring2="Sangoma Ring",
    back="Seshaw Cape",
	waist="Eschan Stone",
}
		
		sets.midcast.Drain = {
    main=aug.solsticeclub,
    sub="Culminus",
    range="Dunna",
    head=aug.georelichead,
    body="Geomancy Tunic",
    hands=aug.MBhands,
    legs=aug.MBlegs,
    feet=aug.MBfeet,
    neck="Eddy Necklace",
    ear1="Barkarole Earring",
    ear2="Hecate's Earring",
    ring1="Fenrir Ring",
    ring2="Sangoma Ring",
    back="Seshaw Cape",
	waist="Fucho-no-obi",
}
	
	sets.midcast.Aspir = sets.midcast.Drain
	


	sets.midcast.Stun = {
    main=aug.solsticeclub,
    sub="Sors Shield",
    range="Dunna",
    head="Befouled Crown",
    body=aug.curebody,
    hands="Azimuth Gloves",
    legs=aug.MBlegs,
    feet=aug.georelicfeet,
    neck="Imbolda Necklace",
    waist="Eschan Stone",
    ear1="Lifestorm Earring",
    ear2="Psystorm Earring",
    ring1="Sangoma Ring",
    ring2="Irrwisch Ring",
    back=aug.geocape
}	
			

	    sets.midcast.Bolster = {body=aug.georelicbody}
        sets.midcast['Life Cycle'] = {body="Geomancy Tunic"}
        sets.midcast['Mending Halation'] = {legs=aug.georeliclegs}
        sets.midcast['Radial Arcana'] = {feet=aug.georelicfeet}
        sets.midcast.Bolster.Pet = {body=aug.georelicbody}
        sets.midcast['Life Cycle'].Pet = {body="Geomancy Tunic"}
        sets.midcast['Mending Halation'].Pet = {legs=aug.georeliclegs}
		sets.midcast.Bolster.Pet.Indi = {body=aug.georelicbody}
        sets.midcast['Life Cycle'].Pet.Indi = {body="Geomancy Tunic"}
        sets.midcast['Mending Halation'].Pet.Indi = {legs=aug.georeliclegs}

		  -- Elemental Magic sets

    sets.midcast['Elemental Magic'] = {
    main=aug.solsticeclub,
    sub="Culminus",
    ammo="Erlene's Notebook",
    head=aug.MBhead,
    body="Wretched Coat",
    hands=aug.MBhands,
    legs=aug.MBlegs,
    feet=aug.MBfeet,
    neck="Mizukage-no-Kubikazari",
    ear1="Barkarole Earring",
    ear2="Hecate's Earring",
    ring1="Locus Ring",
    ring2="Mujin Band",
    back="Seshaw Cape",
	waist="Eschan Stone",
}

    sets.midcast['Elemental Magic'].Resistant = {
	main=aug.solsticeclub,
    sub="Culminus",
    ammo="Erlene's Notebook",
    head=aug.MBhead,
    body="Wretched Coat",
    hands=aug.MBhands,
    legs=aug.MBlegs,
    feet=aug.MBfeet,
    neck="Mizukage-no-Kubikazari",
    ear1="Barkarole Earring",
    ear2="Hecate's Earring",
    ring1="Locus Ring",
    ring2="Mujin Band",
    back="Seshaw Cape",
	waist="Eschan Stone",
}


	   sets.midcast.Impact = {
    main=aug.solsticeclub,
    sub="Culminus",
    ammo="Erlene's Notebook",
    head=none
    body="Twilight Cloak",
    hands=aug.MBhands,
    legs=aug.MBlegs,
    feet=aug.MBfeet,
    neck="Mizukage-no-Kubikazari",
    ear1="Barkarole Earring",
    ear2="Hecate's Earring",
    ring1="Locus Ring",
    ring2="Mujin Band",
    back="Seshaw Cape",
	waist="Eschan Stone",
}	
		
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}


    -- Idle sets

    sets.idle = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    range="Dunna",
	head="Befouled Crown",
    body="Azimuth Coat +1",
    hands=aug.georelichands,
    legs="Assiduity Pants +1",
    feet="Geomancy Sandals",
    neck="Bathy Choker +1",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring=aug.darkring1,
    right_ring=aug.darkring2,
    back="Kumbira Cape",
}

    sets.idle.PDT = {
	main="Mafic Club",
    sub="Genbu's Shield",
    range="Dunna",
	head="Befouled Crown",
    body="Azimuth Coat +1",
    hands=aug.georelichands,
    legs="Assiduity Pants +1",
    feet="Azimuth Gaiters +1",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring=aug.darkring1,
    right_ring=aug.darkring2,
    back="Kumbira Cape",

    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {
    main=aug.solsticeclub,
    sub="Genbu's Shield",
    range="Dunna",
	head="Befouled Crown",
    body="Azimuth Coat +1",
    hands=aug.georelichands,
    legs="Assiduity Pants +1",
    feet=aug.georelicfeet,
    neck="Bathy Choker +1",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring=aug.darkring1,
    right_ring=aug.darkring2,
    back=aug.geocape
}

    sets.idle.PDT.Pet = {
    main=aug.solsticeclub,
    sub="Genbu's Shield",
    range="Dunna",
	head="Befouled Crown",
    body="Azimuth Coat +1",
    hands=aug.georelichands,
    legs="Assiduity Pants +1",
    feet=aug.georelicfeet,
    neck="Twilight Cloak",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring=aug.darkring1,
    right_ring=aug.darkring2,
    back=aug.geocape,
}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

    sets.idle.Town = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    range="Dunna",
	head="Befouled Crown",
    body="Azimuth Coat +1",
    hands=aug.georelichands,
    legs="Assiduity Pants +1",
    feet="Geomancy Sandals",
    neck="Bathy Choker +1",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring=aug.darkring1,
    right_ring=aug.darkring2,
    back="Kumbira Cape",
}

    sets.idle.Weak = {
    main="Bolelabunga",
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Resist Paralyze"+6','"Cure" spellcasting time -5%',}},
    range="Dunna",
    body="Respite Cloak",
    hands={ name="Bagua Mitaines +1", augments={'Enhances "Curative Recantation" effect',}},
    legs="Assid. Pants +1",
    feet="Geo. Sandals +1",
    neck="Wiglen Gorget",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Sheltered Ring",
    right_ring="Paguroidea Ring",
    back="Kumbira Cape",
}

    -- Defense sets

    sets.defense.PDT = {
    main="Terra's Staff",
    sub="Wizzan Grip",
    range="Dunna",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Enmity-4',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+16',}},
    hands={ name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','"Mag.Atk.Bns."+27',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+22',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+11',}},
    neck="Wiglen Gorget",
    left_ring="Vocane Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Spell interruption rate down -3%','Magic dmg. taken -5%',}},
    back="Shadow Mantle",
}

    sets.defense.MDT = {
    main="Terra's Staff",
    sub="Wizzan Grip",
    range="Dunna",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Enmity-4',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+16',}},
    hands={ name="Hagondes Cuffs +1", augments={'Phys. dmg. taken -4%','Magic dmg. taken -2%','"Mag.Atk.Bns."+27',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+22',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+11',}},
    neck="Warder's Charm",
    waist="Flax Sash",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Vocane Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -4%','Spell interruption rate down -3%','Magic dmg. taken -5%',}},
    back="Shadow Mantle",
}

    sets.Kiting = {feet="Geo. Sandals +1"}

    sets.latent_refresh = {waist="Fucho-no-obi"}
	
	 lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
        'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {
    main={ name="Nehushtan", augments={'Accuracy+11','"Dbl.Atk."+2',}},
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Resist Paralyze"+6','"Cure" spellcasting time -5%',}},
    range="Dunna",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Enmity-4',}},
    body={ name="Hagondes Coat +1", augments={'Phys. dmg. taken -3%','"Mag.Atk.Bns."+16',}},
    hands={ name="Otomi Gloves", augments={'Haste+2','"Snapshot"+2','MND+8',}},
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+22',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+11',}},
    neck="Asperity Necklace",
    waist="Cetl Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="K'ayres Ring",
    right_ring="Rajas Ring",
    back="Shadow Mantle",
}

    sets.engaged.Accuracy = {
    main={ name="Nehushtan", augments={'Accuracy+11','"Dbl.Atk."+2',}},
    sub={ name="Genbu's Shield", augments={'"Cure" potency +3%','"Resist Paralyze"+6','"Cure" spellcasting time -5%',}},
    range="Dunna",
    head={ name="Hagondes Hat +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Enmity-4',}},
    body="Ischemia Chasu.",
    hands="Espial Bracers",
    legs={ name="Hagondes Pants +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -2%','"Mag.Atk.Bns."+22',}},
    feet={ name="Hag. Sabots +1", augments={'Phys. dmg. taken -1%','"Mag.Atk.Bns."+11',}},
    neck="Iqabi Necklace",
    waist="Olseni Belt",
    left_ear="Steelflash Earring",
    right_ear="Zennaroi Earring",
    left_ring="Beeline Ring",
    right_ring="Rajas Ring",
    back="Kayapa Cape",
}		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "yamabuki-no-obi"
    elseif spell.skill == 'Elemental Magic' then
        gear.default.obi_waist = "yamabuki-no-obi"
        if state.CastingMode.value == 'Proc' then
            classes.CustomClass = 'Proc'
        end
    end
end



function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		-- Default base equipment layer of fast recast.
		equip(sets.midcast.FastRecast)
	end
end

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
	if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
		if LowTierNukes:contains(spell.english) then
			return 'LowTierNuke'
		else
			return 'HighTierNuke'
		end
	end
end
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)

end

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Accuracy' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function open_coffer()
	CofferType = "Velkk Coffer"
	NCoffer = player.inventory[CofferType].count
	bag = windower.ffxi.get_bag_info(0).count
	max = windower.ffxi.get_bag_info(0).max
	spots = max-bag
	if spots > 0 then
	add_to_chat(204, '*-*-*-*-*-*-*-*-* [ '..NCoffer..'x '..CofferType..' to open - Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
	local nextcommand = ""
	for i=1, spots do
		nextcommand = nextcommand .. 'input /item "'..CofferType..'" <me>; wait 2;'
	end
	nextcommand = nextcommand .. 'input //gs c "open"'
	send_command(nextcommand)
	else
		add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
	end
end

function self_command(command)
	if command == 'open' then
		open_coffer()
	end
end
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 1)
end
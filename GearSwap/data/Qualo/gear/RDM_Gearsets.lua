-- RDM Gearsets
-- Created on: 3/19/2014
-- Last Updated:
-- To Do List
--
--
--
--

if player.Name == 'Qualo' then
		-- includes
		include('include/mappings.lua')
		include('gear/equipment.lua')
		include('include/utility.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job =='WHM' then
				set_macro_page(20,3)
			elseif player.sub_job =='BLM' then
				set_macro_page(20,4)
			elseif player.sub_job =='NIN' then
				set_macro_page(20,3)
			elseif player.sub_job =='DNC' then
				set_macro_page(20,4)
			elseif player.sub_job =='SCH' then
				set_macro_page(20,5)
			end
		else
			set_macro_page(20,1)
		end
		
		
     --------------------------------------
    -- Begin RDM Gear Aliases
    --------------------------------------
        -- Idle - focus on refresh and PDT
        gsRDM = {}
        gsRDM.main = {name="Bolelabunga"}
        gsRDM.sub = {name="Evalach +1"}
        gsRDM.ammo = {name="Hedgehog Bomb"}
        gsRDM.head = {name="Vitivation Chapeau +1"}
        gsRDM.neck = {name="Henic Torque"}
        gsRDM.hands = {name="Umuthi Gloves"}
        gsRDM.body = {name="Witching Robe"}
        gsRDM.legs = {name="Osmium Cuisses"}
        gsRDM.feet = {name="Vanya Clogs"}
        gsRDM.ring1 = {name="Dark Ring"}
        gsRDM.ring2 ={name="Ephedra Ring"}
        gsRDM.ear1= {name="Lifestorm Earring"}
        gsRDM.ear2= {name="Moonshade Earring"}
        gsRDM.back = {name="Xucau Mantle"}
        gsRDM.waist = {name="Fucho-no-obi"}

        gsRDM.FC = {}
        gsRDM.FC.main = {name="Vampirism"}
        gsRDM.FC.sub = {name="Evalach +1"}
        gsRDM.FC.head = {name="Merlinic Hood"}
        gsRDM.FC.body = {name="Vitivation Tabard"}
        gsRDM.FC.hands = {}
        gsRDM.FC.legs = {name="Kayhaus Tights"}
        gsRDM.FC.feet = {}
        gsRDM.FC.ear1 = {name="Loquacious Earring"}
        gsRDM.FC.waist = {name="Channeler's Stone"}

        gsRDM.CP = {}
        gsRDM.CP.main = {name="Tamaxchi"}
        gsRDM.CP.sub = {name="Evalach +1"}
        gsRDM.CP.head = {name="Vanya Hood"}
        gsRDM.CP.neck = {name="Imbodia Necklace"}
        gsRDM.CP.hands = {name="Telchine Gloves"}
        gsRDM.CP.body = {name="Vanya Robe"}
        gsRDM.CP.legs = {name="Kaykaus Tights"}
        gsRDM.CP.feet = {name="Vanya Clogs"}
        gsRDM.CP.ring1 = {name="Ephedra Ring"}
        gsRDM.CP.ring2 ={name="Sirona's Ring"}
        gsRDM.CP.ear1= {name="Lifestorm Earring"}
        gsRDM.CP.ear2= {name="Loquacious Earring"}
        gsRDM.CP.back = {name="Ghostfyre Cape"}
        gsRDM.CP.waist = {name="Rumination Sash"}



        gsRDM.HMP = {}
        -- refresh gear or hmp
        gsRDM.HMP.main = {name="Bolelabunga"}
        gsRDM.HMP.sub = {name="Evalach +1"}
        gsRDM.HMP.head = {name="Vitivation Chapeau +1"}
        gsRDM.HMP.body = {name="Witching Robe"}
        gsRDM.HMP.waist = {name="Duelist's Belt"}
        gsRDM.HMP.neck = {name="Beak Necklace"}

        -- best int or MAB - nuke set
        gsRDM.Int = {}
        gsRDM.Int.main = {name="Marin Staff"}
        gsRDM.Int.sub = {}
        gsRDM.Int.head = {name="Nahtirah Hat"}
        gsRDM.Int.neck = {name="Melic Torque"}
        gsRDM.Int.hands = {name="Chironic Gloves"}
        gsRDM.Int.body = {name="Vanya Robe"}
        gsRDM.Int.legs = {name="Chironic Hose"}
        gsRDM.Int.feet = {name="Tutyr Sabots"}
        gsRDM.Int.ring1 = {name="Resonance Ring"}
        gsRDM.Int.ring2 = {name="Zodiac Ring"}
        gsRDM.Int.ear1= {name="Lifestorm Earring"}
        gsRDM.Int.ear2= {name="Loquacious Earring"}
        gsRDM.Int.back = {name="Ghostfyre Cape"}
        gsRDM.Int.waist = {name="Channeler's Stone"}



        gsRDM.Enf = {}
        gsRDM.Enf.main = {name="Bolelabunga"}
        gsRDM.Enf.sub = {name="Evalach +1"}
        gsRDM.Enf.head = {name="Vitivation Chapeau +1"}
        gsRDM.Enf.neck = {name="Henric Torque"}
        gsRDM.Enf.hands = {name="Lurid Mitts"}
        gsRDM.Enf.body = {name="Vanya Robe"}
        gsRDM.Enf.legs = {name="Chironic Hose"}
        gsRDM.Enf.feet = {name="Medium's Sabots"}
        gsRDM.Enf.ring1 = {name="Irrwisch Ring"}
        gsRDM.Enf.ring2 = {}
        gsRDM.Enf.ear1= {}
        gsRDM.Enf.ear2= {}
        gsRDM.Enf.back = {name="Ghostfyre Cape"}
        gsRDM.Enf.waist = {name="Rumination Sash"}


        gsRDM.Enh = {}
        gsRDM.Enh.main = {name="Pukulatmuj"}
        gsRDM.Enh.sub = {name="Evalach +1"}
        gsRDM.Enh.head = {name="Umuthi Hat"}
        gsRDM.Enh.neck = {name="Melic Torque"}
        gsRDM.Enh.hands = {name="Vivivation Gloves"}
        gsRDM.Enh.body = {name="Vivivation Tabard"}
        gsRDM.Enh.legs = {}
        gsRDM.Enh.feet = {name="Lethargy Houseaux"}
        gsRDM.Enh.ring1 = {}
        gsRDM.Enh.ring2 = {}
        gsRDM.Enh.ear1= {name="Andoaa Earring"}
        gsRDM.Enh.ear2= {name="Loquacious Earring"}
        gsRDM.Enh.back = {name="Ghostfyre Cape"}
        gsRDM.Enh.waist = {name="Rumination Sash"}

        -- needs populated - ele or best MAB
        gsRDM.Ele = {}
        gsRDM.Ele.main = {name="Vampirism"}
        gsRDM.Ele.sub = {name="Evalach +1"}
        gsRDM.Ele.head = {name="Merlinic Hood"}
        gsRDM.Ele.neck = {name="Melic Torque"}
        gsRDM.Ele.hands = {name="Chironic Gloves"}
        gsRDM.Ele.body = {name="Witching Robe"}
        gsRDM.Ele.legs = {name="Vitivation Tights"}
        gsRDM.Ele.feet = {name="Tutyr Sabots"}
        gsRDM.Ele.ring1 = {name="Resonance Ring"}
        gsRDM.Ele.ring2 = {name="Irrwiscch Ring"}
        gsRDM.Ele.ear1= {name="Halasz Earring"}
        gsRDM.Ele.ear2= {name="Moonshade Earring"}
        gsRDM.Ele.back = {name="Ghostfyre Cape"}
        gsRDM.Ele.waist = {name="Channeller's Stone"}

        gsRDM.Macc = {}
        gsRDM.Macc.main = {}
        gsRDM.Macc.sub = {}
        gsRDM.Macc.head = {}
        gsRDM.Macc.neck = {}
        gsRDM.Macc.hands = {}
        gsRDM.Macc.body = {}
        gsRDM.Macc.legs = {}
        gsRDM.Macc.feet = {}
        gsRDM.Macc.ring1 = {}
        gsRDM.Macc.ring2 = {}
        gsRDM.Macc.ear1= {}
        gsRDM.Macc.ear2= {}
        gsRDM.Macc.back = {}
        gsRDM.Macc.waist = {}


		-- Auto Sets
		-- Standard/idle
		sets.idle.PDT = {
                    main=gsRDM.main,
                    sub=gsRDM.sub,
                    ammo=gsRDM.ammo,
                    head=gsRDM.head,
                    neck=gsRDM.neck,
                    hands=gsRDM.hands,
                    body=gsRDM.body,
                    legs=gsRDM.legs,
                    feet=gsRDM.feet,
                    ring1=gsRDM.ring1,
                    ring2=gsRDM.ring2,
                    ear1=gsRDM.ear1,
                    ear2=gsRDM.ear2,
                    back=gsRDM.back,
                    waist=gsRDM.waist}


		sets.idle.MDT = {ammo="Vanir Battery",
				head="Hagondes Hat +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Hagondes Coat +1", hands="Gende. Gages +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt", legs="Hagondes Pants +1", feet="Helios Boots"}

		sets.Resting = set_combine(sets.idle.PDT, {
                    main=gsRDM.HMP.main,
                    sub=gsRDM.sub,
		    head=gsRDM.HMP.head,
                    neck=gsRDM.HMP.neck,
                    rear=gsRDM.ear2,
                    body=gsRDM.HMP.body,
                    waist=gsRDM.HMP.waist})


		sets.idle.Standard = set_combine(sets.idle.PDT,{
				waist="Fucho-no-Obi"})

		sets.misc.Town = set_combine(sets.idle.PDT, {
				head="Vitivation Chapeau +1",
				body="Councilor's Garb",
				legs="Carmine Cuisses"})

		-- JA
		sets.precast.JA["Chainspell"] = {body="Vitivation Tabard"}
		sets.precast.JA["Stymie"] = {}
		sets.precast.JA["Composure"] = {head="Estq. Chappel +2", body="Lethargy Sayon", hands="Leth. Gantherots", legs="Leth. Fuseau ", feet="Leth. Houseaux"}
		sets.precast.JA["Saboteur"] = {hands="Leth. Gantherots"}
		sets.precast.JA["Convert"] = {}
		sets.precast.JA["Spontaneity"] = {}

		-- Precast
		-- Magic
		sets.precast.Fastcast = {
        	    main=gsRDM.FC.main,
        	    sub=gsRDM.FC.sub,
 	            head=gsRDM.FC.head,
                    lear=gsRDM.FC.ear1,
                    body=gsRDM.FC.body,
                    waist=gsRDM.FC.waist,
                    legs=gsRDM.FC.legs}

                sets.precast.Cure = set_combine(sets.precast.Fastcast, {
                    body="Heka's Kalasiris",
                    back="Pahtli Cape"})

        
		sets.precast.Enhancing = set_combine(sets.precast.Fastcast, {
				waist="Siegel Sash"})
                                                                                                            
		sets.precast.Stoneskin = set_combine(sets.precast.Enhancing,{
				head="Umuthi Hat", main="Pukulatmuj"})

		-- Midcast
		sets.midcast.Recast = set_combine(sets.idle.PDT, sets.precast.Fastcast, {ammo="Impatiens",
				waist="Witful Belt"})
		sets.midcast.ConserveMP = {ammo="Clarus Stone",
				rear="Gifted Earring",
                body="Hedera Cotehardie", hands="Serpentes Cuffs",
                waist="Austerity Belt", legs="Nares Trews", feet="Umbani Boots"}

		--Healing Magic
		-- need vanya hood from angroboda in zitah
		sets.midcast.Cure = {
                     main=gsRDM.CP.main,
                     sub=gsRDM.CP.sub,
                     head=gsRDM.CP.Head,
                     neck=gsRDM.CP.neck,
                     lear=gsRDM.CP.ear1,
                     rear=gsRDM.CP.ear2,
                     body=gsRDM.CP.body,
                     hands=gsRDM.CP.hands,
                     lring=gsRDM.CP.ring1,
                     rring=gsRDM.CP.ring2,
                     back=gsRDM.CP.back,
                     waist=gsRDM.CP.waist,
                     legs=gsRDM.CP.legs,
                     feet=gsRDM.CP.feet}


		sets.midcast.Curaga = {
                    main=gsRDM.CP.main,
                     sub=gsRDM.CP.sub,
                     head=gsRDM.CP.Head,
                     neck=gsRDM.CP.neck,
                     lear=gsRDM.CP.ear1,
                     rear=gsRDM.CP.ear2,
                     body=gsRDM.CP.body,
                     hands=gsRDM.CP.hands,
                     lring=gsRDM.CP.ring1,
                     rring=gsRDM.CP.ring2,
                     back=gsRDM.CP.back,
                     waist=gsRDM.CP.waist,
                     legs=gsRDM.CP.legs,
                     feet=gsRDM.CP.feet}

		-- Enhancing
		-- Goal 500+
		sets.midcast.Enhancing = {
                     main=gsRDM.Enh.main,
                     sub=gsRDM.Enh.sub,
                     head=gsRDM.Enh.head,
                     neck=gsRDM.Enh.neck,
                     rear=gsRDM.Enh.ear1,
                     lear=gsRDM.Enh.ear2,
                     body=gsRDM.Enh.body,
                     hands=gsRDM.Enh.hands,
                     back=gsRDM.Enh.back,
                     waist=gsRDM.Enh.waist,
                     legs="Atrophy Tights",
                     feet="Leth. Houseaux"}


         	-- Duration
		sets.midcast.Enhancing.Self = {
                     main=gsRDM.Enh.main,
                     sub=gsRDM.Enh.sub,
                     head=gsRDM.Enh.head,
                     neck=gsRDM.Enh.neck,
                     rear=gsRDM.Enh.ear1,
                     lear=gsRDM.Enh.ear2,
                     body=gsRDM.Enh.body,
                     hands=gsRDM.Enh.hands,
                     back=gsRDM.Enh.back,
                     waist=gsRDM.Enh.waist,
                     legs="Atrophy Tights",
                     feet="Leth. Houseaux"}

		sets.midcast.Enhancing.Party = {
                     main=gsRDM.Enh.main,
                     sub=gsRDM.Enh.sub,
                     head=gsRDM.Enh.head,
                     neck=gsRDM.Enh.neck,
                     rear=gsRDM.Enh.ear1,
                     lear=gsRDM.Enh.ear2,
                     body=gsRDM.Enh.body,
                     hands=gsRDM.Enh.hands,
                     back=gsRDM.Enh.back,
                     waist=gsRDM.Enh.waist,
                     legs="Atrophy Tights",
                     feet="Leth. Houseaux"}

		sets.midcast.Phalanx = set_combine(sets.midcast.Enhancing, {hands="Vitivation Gloves"})
		sets.midcast.Hastespell = {ammo="Impatiens", waist="Witful Belt"}
		sets.midcast.Stoneskin = set_combine(sets.midcast.Enhancing.Self, {waist="Siegel Sash"})
		sets.midcast.Aquaveil = set_combine(sets.midcast.Enhancing.Self,{waist="Empahatikos Rope", legs="Shedir Seraweels"})
		sets.midcast.Blink = set_combine(sets.midcast.Aquaveil)
		sets.midcast.Reraise = set_combine(sets.midcast.ConserveMP)
		sets.midcast.Regen = {main="Bolelabunga", body="Telchine Chasuble"}

		-- Spikes: Goal 250 Int
		-- sets.midcast.INT = {main="Bolelabunga", ammo="Kalboron Stone", head="Atrophy Chapeau", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring", body="Hagondes Coat +1", hands="Vitivation Gloves", lring="Shiva Ring", rring="Shiva Ring", back="Toro Cape", waist="Ovate Rope", legs="Hagondes Pants +1", feet="Umbani Boots"}

                sets.midcast.INT = {
                    main=gsRDM.Int.main,
                    head=gsRDM.Int.head,
                    neck=gsRDM.Int.neck,
                    hands=gsRDM.Int.hands,
                    body=gsRDM.Int.body,
                    legs=gsRDM.Int.legs,
                    feet=gsRDM.Int.feet,
                    ring1=gsRDM.Int.ring1,
                    ring2=gsRDM.Int.ring2,
                    ear1=gsRDM.Int.ear1,
                    ear2=gsRDM.Int.ear2,
                    back=gsRDM.Int.back,
                    waist=gsRDM.Int.waist}

		-- Enfeebling
		-- Potency
		-- sets.midcast.Enfeebling = {ammo="Kalboron Stone", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring", lring="Perception ring", rring="Sangoma ring", back="Ogapepo Cape"}

                sets.midcast.Enfeebling = {
                    main=gsRDM.Enf.main,
                    sub=gsRDM.Enf.sub,
                    head=gsRDM.Enf.head,
                    neck=gsRDM.Enf.neck,
                    hands=gsRDM.Enf.hands,
                    body=gsRDM.Enf.body,
                    legs=gsRDM.Enf.legs,
                    feet=gsRDM.Enf.feet,
                    ring1=gsRDM.Enf.ring1,
                    back=gsRDM.Enf.back,
                    waist=gsRDM.Enf.waist}


  		sets.midcast.Macc = {main="Bolelabunga", ammo="Kalboron Stone",
				head="Vitivation Chapeau +1", neck="Eddy Necklace", lear="Enchntr. Earring +1", rear="Gwati Earring",
                body="Lethargy Sayon", hands="Leth. Gantherots", lring="Perception ring", rring="Sangoma ring",
                back="Ogapepo Cape", waist="Ovate Rope", legs="Artsieq Hose", feet="Vitivation Boots"}

		sets.midcast.Dia = set_combine(sets.midcast.ConserveMP,{head="Vitivation Chapeau +1"})
		sets.midcast.Paralyze = set_combine(sets.midcast.Macc, {feet="Vitivation Boots"})
		sets.midcast.Blind = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Slow = set_combine(sets.midcast.Macc, {head="Vitivation Chapeau +1"})
		sets.midcast.Bind = set_combine(sets.midcast.INT, sets.midcast.Macc)

		-- Elemental
		-- Skill Gear For Elemental Dots And High Resisted Nukes
		sets.midcast.Elemental = {
                     main=gsRDM.Ele.main,
                     ammo=gsRDM.Ele.sub,
                     head=gsRDM.Ele.head,
                     neck=gsRDM.Ele.neck,
                     hands=gsRDM.Ele.hands,
                     body=gsRDM.Ele.body,
                     legs=gsRDM.Ele.legs,
                     feet=gsRDM.Ele.feet,
                     lring=gsRDM.Ele.ring1,
                     rring=gsRDM.Ele.ring2,
                     lear=gsRDM.Ele.ear1,
                     rear=gsRDM.Ele.ear1,
                     back=gsRDM.Ele.back,
                     waist=gsRDM.Ele.waist}


		-- Pure Damage
		sets.midcast.Nuke = {
                     main=gsRDM.Ele.main,
                     ammo=gsRDM.Ele.sub,
                     head=gsRDM.Ele.head,
                     neck=gsRDM.Ele.neck,
                     hands=gsRDM.Ele.hands,
                     body=gsRDM.Ele.body,
                     legs=gsRDM.Ele.legs,
                     feet=gsRDM.Ele.feet,
                     lring=gsRDM.Ele.ring1,
                     rring=gsRDM.Ele.ring2,
                     lear=gsRDM.Ele.ear1,
                     rear=gsRDM.Ele.ear1,
                     back=gsRDM.Ele.back,
                     waist=gsRDM.Ele.waist}

		-- Dark Magic
		sets.midcast.Bio = set_combine(sets.midcast.Macc, {legs="Vitivation Tights"})
		sets.midcast.Dark = set_combine(sets.midcast.Macc, {main="Rubicundity"})
		sets.midcast.Aspir = set_combine(sets.midcast.Dark, {waist="Fucho-no-Obi", feet="Merlinic crackows"})
		sets.midcast.Stun = set_combine(sets.midcast.Macc)

		-- Melee Sets
		sets.TP = set_combine(sets.idle.PDT, {})

		sets.TP.Acc = set_combine(sets.TP, {})

		-- Weaponskills
		sets.precast.WS = set_combine(sets.TP, {})

		-- Dagger
		sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Mercy Stroke'] = set_combine(sets.precast.WS, {})
		sets.precast.WS['Requeiscat'] = set_combine(sets.precast.WS, {})

		-- Misc
		sets.misc.Waltz = {}
		sets.misc.Steps = set_combine(sets.TP.Acc, {})
		sets.misc.flourish = set_combine(sets.midcast.Macc, {})
end
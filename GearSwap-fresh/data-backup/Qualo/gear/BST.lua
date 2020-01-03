if player.name == 'Qualo' then

    windower.add_to_chat(121, "Found BST Gears lua")

    --------------------------------------
    -- Define equipment variables
    --------------------------------------
    include('organizer-lib')
    include('gear/equipment.lua')



    -- AUGMENTED GEAR
    Pet_PDT_AxeMain = "Izizoeksi"
    Pet_PDT_AxeSub = "Arktoi"
    Ready_Atk_Axe = "Izizoeksi"
    Ready_Acc_Axe = "Izizoeksi"
    Ready_MAB_Axe = "Izizoeksi"
    Ready_MAB_Axe2 = "Arktoi"
    Ready_MAcc_Axe = "Izizoeksi"
    Ready_MAcc_Axe2 = "Arktoi"

    -- Ready_Atk_Axe = {name="Kumbhakarna", augments={'Pet: Attack+20 Pet: Rng.Atk.+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+160',}}
    -- Ready_Acc_Axe = {name="Kumbhakarna", augments={'Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: "Dbl.Atk."+2 Pet: Crit.hit rate +2','Pet: TP Bonus+180',}}
    -- Ready_MAB_Axe = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+180',}}
    -- Ready_MAB_Axe2 = {name="Kumbhakarna", augments={'Pet: "Mag.Atk.Bns."+20','Pet: Phys. dmg. taken -4%','Pet: TP Bonus+200',}}
    -- Ready_MAcc_Axe = {name="Kumbhakarna", augments={'Pet: Mag. Acc.+20','"Cure" potency +15%','Pet: TP Bonus+180',}}
    -- Ready_MAcc_Axe2 = {name="Kumbhakarna", augments={'Pet: Mag. Acc.+20','"Cure" potency +15%','Pet: TP Bonus+200',}}

    Pet_PDT_head = "Anwig Salade"
    Pet_PDT_body = {name="Despair Mail", augments={'Accuracy+10','Pet: VIT+7','Pet: Damage taken -3%',}}
    Pet_PDT_hands = "Ankusa Gloves"
    Pet_PDT_legs = {name="Acro Breeches", augments={'Pet: DEF+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_PDT_feet = "Ankusa Gaiters"
    Pet_PDT_back = {name="Pastoralist's Mantle", augments={'STR+2 DEX+2','Accuracy+1','Pet: Damage taken -3%',}}

    Pet_MDT_body = {name="Acro Surcoat", augments={'Pet: DEF+22','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_MDT_hands = {name="Taeon Gloves", augments={'Pet: Mag. Evasion+25','Pet: "Regen"+2','Pet: Damage taken -3%',}}
    Pet_MDT_legs = {name="Acro Breeches", augments={'Pet: DEF+25','Pet: "Regen"+3','Pet: Damage taken -4%',}}
    Pet_MDT_feet = {name="Taeon Boots", augments={'Pet: Mag. Evasion+22','Pet: "Regen"+2','Pet: Damage taken -4%',}}

    Ready_Atk_head = "Emicho Coronet +1"
    Ready_Atk_body = {name="Taeon Tabard", augments={'Pet: Attack+23 Pet: Rng.Atk.+23',}}
    Ready_Atk_hands = {name="Acro Gauntlets", augments={'Pet: Attack+25 Pet: Rng.Atk.+25','Pet: "Dbl. Atk."+5',}}
    Ready_Atk_legs = "Valorous Hose"
    Ready_Atk_feet = "Totemic Gaiters"
    Ready_Atk_back = "Argochampsa Mantle"

    Ready_Acc_head = "Emicho Coronet +1"
    Ready_Acc_body = {name="Acro Surcoat", augments={'Pet: Accuracy+24 Pet: Rng.Acc.+24','Pet: "Dbl. Atk."+5','Pet: Haste+5',}}
    Ready_Acc_hands = {name="Acro Gauntlets", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Dbl. Atk."+4',}}
    Ready_Acc_waist = "Hurch'lan Sash"
    Ready_Acc_legs = {name="Acro Breeches", augments={'Pet: Accuracy+25 Pet: Rng. Acc.+25','Pet: "Store TP"+8',}}
    Ready_Acc_feet = "Totemic Gaiters"
    Ready_Acc_back = {name="Pastoralist's Mantle", augments={'STR+1 DEX+1','Accuracy+1','Pet: Accuracy+20 Pet: Rng. Acc.+20','Pet: Damage taken -5%',}}

    Ready_MAB_head = {name="Acro Helm", augments={'Pet: "Mag.Atk.Bns."+25','Pet: "Store TP"+6',}}
    Ready_MAB_body = {name="Acro Surcoat", augments={'Pet: "Mag.Atk.Bns."+25',}}
    Ready_MAB_hands = {name="Acro Gauntlets", augments={'Pet: "Mag.Atk.Bns."+24',}}
    Ready_MAB_legs = {name="Acro Breeches", augments={'Pet: "Mag.Atk.Bns."+22','Pet: Breath+7',}}
    Ready_MAB_feet = {name="Acro Leggings", augments={'Pet: "Mag.Atk.Bns."+23','Pet: Breath+7',}}

    Ready_MAcc_head = {name="Acro Helm", augments={'Pet: Mag. Acc.+25','"Call Beast" ability delay -5',}}
    Ready_MAcc_body = {name="Acro Surcoat", augments={'Pet: Mag. Acc.+24',}}
    Ready_MAcc_hands = {name="Acro Gauntlets", augments={'Pet: Mag. Acc.+25',}}
    Ready_MAcc_legs = {name="Acro Breeches", augments={'Pet: Mag. Acc.+25','"Call Beast" ability delay -5',}}
    Ready_MAcc_feet = {name="Acro Leggings", augments={'Pet: Mag. Acc.+23',}}

    Pet_Melee_head = Ready_Atk_head
    Pet_Melee_body = Ready_Acc_body
    Pet_Melee_hands = Ready_Acc_hands
    Pet_Melee_legs = Ready_Atk_legs
    Pet_Melee_feet = Ready_Atk_feet

    Hybrid_head = {}
    Hybrid_body = Pet_PDT_body
    Hybrid_hands = Pet_PDT_hands
    Hybrid_legs = {}
    Hybrid_feet = {}

    DW_head = "Skormoth Mask"
    DW_body = {}
    DW_hands = "Regimen Mittens"
    DW_legs = "Valorous Hose"
    DW_feet = {}

    TP_neck="Asperity Necklace"
    ACC_neck="Agitator's Collar"
    PDT_neck="Agitator's Collar"

    MAB_head = "Jumalik Helm"
    MAB_body = "Jumalik Mail"
    MAB_hands = "Leyline Gloves"
    MAB_legs = {}
    MAB_feet = {}

    FC_head = {}
    FC_body = {}
    FC_hands = "Leyline Gloves"
    FC_legs = MAB_legs
    FC_feet = MAB_feet

    MAcc_head = "Jumalik Helm"
    MAcc_body = "Ankusa Jackcoat +1"
    MAcc_hands = MAB_hands
    MAcc_legs = MAB_legs
    MAcc_feet = MAB_feet

    CB_head = Ready_MAcc_head
    CB_body = "Mirke Wardecors"
    CB_hands = "Ankusa Gloves"
    CB_legs = Ready_MAcc_legs
    CB_feet = "Adaman Sollerets"
    Cure_Potency_axe = Ready_MAcc_Axe
    Cure_Potency_head = {}
    Cure_Potency_body = "Jumalik Mail"
    Cure_Potency_hands = "Buremte Gloves"
    Cure_Potency_legs = "Ankusa Trousers +1"
    Cure_Potency_feet = {}

    -- PRECAST SETS
    sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
    sets.precast.JA['Bestial Loyalty'] = {head=CB_head,
        body=CB_body,
        hands=CB_hands,
        legs=CB_legs,
        feet=CB_feet}
    sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
    sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
    sets.precast.JA.Tame = {head="Totemic Helm +1",ear1="Tamer's Earring",legs="Stout Kecks"}
    sets.precast.JA.Spur = {feet="Nukumi Ocreae +1"}
    sets.precast.SpurPetOnly = set_combine(sets.precast.JA.Spur, {main="Skullrender"})
    sets.precast.SpurPetOnlyDW = set_combine(sets.precast.JA.Spur, {main="Skullrender",sub="Skullrender"})

    sets.precast.JA['Feral Howl'] = {main="Mafic Cudgel",sub="Breidox",ammo="Paeapua",
        head="Rabid Visor",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Cryptic Earring",
        body="Jumalik Mail",hands="Macabre Gauntlets +1",ring1="Provocare Ring",ring2="Eihwaz Ring",
        back="Earthcry Mantle",waist="Warwolf Belt",legs="Zoar Subligar +1",feet="Rager Ledelsens +1"}

    sets.precast.JA.Reward = {
        head="Stout Bonnet",neck="Aife's Medal",ear1="Lifestorm Earring",ear2="Neptune's Pearl",
        body="Monster Jackcoat",hands="Ogre Gloves",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back=Pet_PDT_back,
        waist="Engraved Belt",legs="Totemic Trousers",feet="Loyalist Sabatons"}

    sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
    sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
    sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})

    sets.precast.JA.Charm = {ammo="Tsar's Egg",
        head="Jumalik Helm",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        body="Totemic Jackcoat +1",hands="Ankusa Gloves +1",ring1="Dawnsoul Ring",ring2="Dawnsoul Ring",
        back="Aisance Mantle +1",waist="Aristo Belt",legs="Ankusa Trousers +1",feet="Ankusa Gaiters +1"}

    -- CURING WALTZ
    sets.precast.Waltz = {ammo="Sonia's Plectrum",
        head="Jumalik Helm",neck="Dualism Collar +1",ear1="Enchanter's Earring",ear2="Enchanter Earring +1",
        body="Totemic Jackcoat +1",hands="Regimen Mittens",ring1="Valseur's Ring",ring2="Asklepian Ring",
        back="Aisance Mantle +1",waist="Aristo Belt",legs="Desultor Tassets",feet="Totemic Gaiters"}

    -- HEALING WALTZ
    sets.precast.Waltz['Healing Waltz'] = {}

    -- STEPS
	sets.precast.Step = {ammo="Hasty Pinion +1",
        head="Yaoyotl Helm",neck="Subtlety Spectacles",ear1="Steelflash Earring",ear2="Heartseeker Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=DW_legs,
        feet=DW_feet}

    -- VIOLENT FLOURISH
    sets.precast.Flourish1 = {}
    sets.precast.Flourish1['Violent Flourish'] = {ammo="Hasty Pinion +1",
        head=MAcc_head,
        neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body="Mes'yohi Haubergeon",
        hands=MAcc_hands,
        ring1="Sangoma Ring",ring2="Fenrir Ring +1",
        back="Grounded Mantle +1",waist="Eschan Stone",
        legs=MAcc_legs,
        feet=MAcc_feet}

    sets.precast.FC = {ammo="Impatiens",
        head=FC_head,
        neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body=FC_body,
        hands=FC_hands,
        ring1="Prolix Ring",ring2="Fenrir Ring +1",
        legs=FC_legs,
        feet=FC_feet}

        sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

    -- MIDCAST SETS
    sets.midcast.FastRecast = {
        head=FC_head,
        neck="Orunmila's Torque",ear1="Loquacious Earring",ear2="Enchanter Earring +1",
        body=FC_body,
        hands=FC_hands,
        ring1="Prolix Ring",ring2="Defending Ring",
        back="Impassive Mantle",waist="Incarnation Sash",
        legs=FC_legs,
        feet=FC_feet}

    sets.midcast.Utsusemi = sets.midcast.FastRecast

    sets.midcast.Cure = {ammo="Quartz Tathlum +1",
        head=Cure_Potency_head,
        neck="Phalaina Locket",ear1="Lifestorm Earring",ear2="Mendicant's Earring",
        body=Cure_Potency_body,
        hands=Cure_Potency_hands,
        ring1="Lebeche Ring",ring2="Asklepian Ring",back=Pet_PDT_back,waist="Gishdubar Sash",
        legs=Cure_Potency_legs,
        feet=Cure_Potency_feet}

    sets.midcast.Curaga = sets.midcast.Cure
    sets.CurePetOnly = {main=Cure_Potency_axe,sub="Matamata Shield +1"}

    sets.midcast.Stoneskin = {ammo="Quartz Tathlum +1",
        head="Jumalik Helm",neck="Stone Gorget",ear1="Earthcry Earring",ear2="Lifestorm Earring",
        body="Totemic Jackcoat +1",hands="Stone Mufflers",ring1="Leviathan Ring +1",ring2="Leviathan Ring +1",
        back=Pet_PDT_back,
        waist="Engraved Belt",legs="Haven Hose",feet="Whirlpool Greaves"}

    sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Malison Medallion",
        ring1="Eshmun's Ring",ring2="Haoma's Ring",waist="Gishdubar Sash"})

    sets.midcast.Protect = {ring2="Sheltered Ring"}
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = {ring2="Sheltered Ring"}
    sets.midcast.Shellra = sets.midcast.Shell

    sets.midcast['Enfeebling Magic'] = {ammo="Quartz Tathlum +1",
        head=FC_head,
        neck="Stoicheion Medal",ear1="Lifestorm Earring",ear2="Psystorm Earring",
        body=FC_body,
        hands=FC_hands,
        ring1="Sangoma Ring",ring2="Fenrir Ring +1",
        back="Aput Mantle +1",waist="Eschan Stone",
        legs=FC_legs,
        feet=FC_feet}

    sets.midcast['Elemental Magic'] = sets.midcast['Enfeebling Magic']

    sets.precast.JA.Provoke = {main="Mafic Cudgel",sub="Breidox",ammo="Paeapua",
        head="Rabid Visor",neck="Unmoving Collar +1",ear1="Trux Earring",ear2="Cryptic Earring",
        body="Jumalik Mail",hands="Macabre Gauntlets +1",ring1="Provocare Ring",ring2="Eihwaz Ring",
        back="Earthcry Mantle",waist="Warwolf Belt",legs="Zoar Subligar +1",feet="Rager Ledelsens +1"}

    sets.precast.LuzafRing = {ring1="Luzaf's Ring"}

    -- WEAPONSKILLS
    -- Default weaponskill sets.
    sets.precast.WS = {ammo="Cheruski Needle",
        head="Otomi Helm",neck=TP_neck,ear1="Kokou's Earring",ear2="Brutal Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Windbuffet Belt",
        legs=Hybrid_legs,
        feet=Hybrid_Feet}

    sets.precast.WS.WSMedAcc = {ammo="Hasty Pinion +1",
        head="Otomi Helm",neck="Subtlety Spectacles",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Ifrit Ring +1",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Anguinus Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}

    sets.precast.WS.WSHighAcc = {ammo="Hasty Pinion +1",
        head="Yaoyotl Helm",neck="Subtlety Spectacles",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Anguinus Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}

    -- Specific weaponskill sets.
    sets.precast.WS['Ruinator'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",hands="Boor Bracelets",
        back="Buquwik Cape",waist="Fotia Belt"})
    sets.precast.WS['Ruinator'].Gavialis = set_combine(sets.precast.WS['Ruinator'], {head="Gavialis Helm"})
    sets.precast.WS['Ruinator'].WSMedAcc = set_combine(sets.precast.WS.WSMedAcc, {neck="Fotia Gorget",
        ear1="Kokou's Earring",ear2="Brutal Earring",
        back="Buquwik Cape",waist="Fotia Belt"})
    sets.precast.WS['Ruinator'].WSHighAcc = set_combine(sets.precast.WS.WSHighAcc, {neck="Fotia Gorget",
        ear1="Kokou's Earring",ear2="Brutal Earring",
        waist="Fotia Belt"})

    sets.precast.WS['Onslaught'] = set_combine(sets.precast.WS, {neck="Justiciar's Torque",
        ear1="Steelflash Earring",ear2="Bladeborn Earring",
        ring1="Rajas Ring",back="Vespid Mantle"})
    sets.precast.WS['Onslaught'].WSMedAcc = set_combine(sets.precast.WSMedAcc, {ring1="Rajas Ring",back="Vespid Mantle"})
    sets.precast.WS['Onslaught'].WSHighAcc = set_combine(sets.precast.WSHighAcc, {back="Vespid Mantle"})

    sets.precast.WS['Primal Rend'] = {ammo="Erlene's Notebook",
        head=MAB_head,
        neck="Stoicheion Medal",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body=MAB_body,
        hands=MAB_hands,
        ring1="Acumen Ring",ring2="Fenrir Ring +1",
        back="Argochampsa Mantle",waist="Eschan Stone",
        legs=MAB_legs,
        feet=MAB_feet}
    sets.precast.WS['Primal Rend'].WSMedAcc = set_combine(sets.precast.WS['Primal Rend'], {neck="Fotia Gorget",waist="Fotia Belt"})
    sets.precast.WS['Primal Rend'].WShighAcc = sets.precast.WS['Primal Rend'].WSMedAcc
    sets.precast.WS['Cloudsplitter'] = set_combine(sets.precast.WS['Primal Rend'], {neck="Fotia Gorget",
        ring2="Fenrir Ring +1",waist="Fotia Belt"})

    sets.midcast.NightEarrings = {ear1="Lugra Earring",ear2="Lugra Earring +1"}
    sets.midcast.ExtraMAB = {ear1="Hecate's Earring"}

    -- PET SIC & READY MOVES
    sets.midcast.Pet.WS = {ammo="Demonry Core",
        neck="Empath Necklace",ear1="Hija Earring",ear2="Ruby Earring",
        body=Ready_Atk_body,
        hands=Ready_Atk_hands,
        ring1="Thurandaut Ring",
        ring2="Angel's Ring",
        back=Ready_Atk_back,
        waist="Incarnation Sash",
        legs=Ready_Atk_legs,
        feet=Ready_Atk_feet}

    sets.midcast.Pet.MagicAtkReady = set_combine(sets.midcast.Pet.WS, {
        head=Ready_MAB_head,
        ear1="Hija Earring",ear2="Diamond Earring",
        body=Ready_MAB_body,
        hands=Ready_MAB_hands,
        back="Argochampsa Mantle",
        legs=Ready_MAB_legs,
        feet=Ready_MAB_feet})

    sets.midcast.Pet.MagicAccReady = set_combine(sets.midcast.Pet.WS, {
        head=Ready_MAcc_head,
        ear1="Sapphire Earring",ear2="Sapphire Earring",
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        back="Argochampsa Mantle",
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})

    sets.midcast.Pet.ReadyRecast = {legs="Desultor Tassets"}

    sets.midcast.Pet.Neutral = {head=Ready_Atk_head}
    sets.midcast.Pet.Favorable = {head="Nukumi Cabasset"}
    sets.midcast.Pet.MedAcc = set_combine(sets.midcast.Pet.WS, {ear2="Ferine Earring",
        body=Ready_Acc_body,
        legs="Wisent Kecks"})
    sets.midcast.Pet.HighAcc = set_combine(sets.midcast.Pet.WS, {ear1="Spinel Earring",
        ear2="Ferine Earring",
        body=Ready_Acc_body,
        hands=Ready_Acc_hands,
        waist=Ready_Acc_waist,
        legs=Ready_Acc_legs,
        feet=Ready_Acc_feet})
    sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1"}

    -- PET-ONLY READY GEARSETS
    -- Single-wield PetOnly Sets
    sets.midcast.Pet.ReadyRecastNE = {main="Charmer's Merlin",legs="Desultor Tassets"}

    sets.midcast.Pet.ReadyNE = set_combine(sets.midcast.Pet.WS, {main="Aymur"})
    sets.midcast.Pet.ReadyNE.MedAcc = set_combine(sets.midcast.Pet.WS, {main="Aymur",
        ear2="Ferine Earring",
        body=Ready_Acc_body,
        legs="Wisent Kecks"})
    sets.midcast.Pet.ReadyNE.HighAcc = set_combine(sets.midcast.Pet.WS, {main="Kerehcatl",
        ear1="Spinel Earring",
        ear2="Ferine Earring",
        body=Ready_Acc_body,
        hands=Ready_Acc_hands,
        legs=Ready_Acc_legs,
        feet=Ready_Acc_feet})

    sets.midcast.Pet.MagicAtkReadyNE = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe})
    sets.midcast.Pet.MagicAtkReadyNE.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe,
        head=Ready_MAcc_head,
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})
    sets.midcast.Pet.MagicAtkReadyNE.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReady, {main=Ready_MAB_Axe,
        head=Ready_MAcc_head,
        ear1="Sapphire Earring",ear2="Sapphire Earring",
        body=Ready_MAcc_body,
        hands=Ready_MAcc_hands,
        legs=Ready_MAcc_legs,
        feet=Ready_MAcc_feet})

    sets.midcast.Pet.MagicAccReadyNE = set_combine(sets.midcast.Pet.MagicAccReady, {main="Aymur"})

    sets.DTAxeShield = {main=Pet_PDT_AxeMain,
        sub="Beatific Shield +1"}

    -- Dual-wield PetOnly Sets
    sets.midcast.Pet.ReadyRecastDWNE = {main="Aymur",sub="Charmer's Merlin",legs="Desultor Tassets"}

    sets.midcast.Pet.ReadyDWNE = set_combine(sets.midcast.Pet.ReadyNE, {sub=Ready_Atk_Axe})
    sets.midcast.Pet.ReadyDWNE.MedAcc = set_combine(sets.midcast.Pet.ReadyNE.MedAcc, {sub=Ready_Acc_Axe})
    sets.midcast.Pet.ReadyDWNE.HighAcc = set_combine(sets.midcast.Pet.ReadyNE.HighAcc, {sub="Hunahpu"})

    sets.midcast.Pet.MagicAtkReadyDWNE = set_combine(sets.midcast.Pet.MagicAtkReadyNE, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe})
    sets.midcast.Pet.MagicAtkReadyDWNE.MedAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.MedAcc, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe})
    sets.midcast.Pet.MagicAtkReadyDWNE.HighAcc = set_combine(sets.midcast.Pet.MagicAtkReadyNE.HighAcc, {main=Ready_MAB_Axe,sub=Ready_MAcc_Axe})

    sets.midcast.Pet.MagicAccReadyDWNE = set_combine(sets.midcast.Pet.MagicAccReadyNE, {sub=Ready_MAcc_Axe})

    sets.DTAxes = {main=Pet_PDT_AxeMain,
        sub=Pet_PDT_AxeSub}

    -- RESTING
    sets.resting = {}

    -- IDLE SETS
    sets.ExtraRegen = {waist="Muscle Belt +1"}
    sets.RegenAxes = {main="Hatxiik",sub="Hunahpu"}

    sets.idle = {
        main="Izizoeksi",
        sub="Arktoi",
        ammo="Paeapua",
        head="Skormoth Mask",
        body={ name="Despair Mail", augments={'Accuracy+10','Pet: VIT+7','Pet: Damage taken -3%',}},
        hands="Regimen Mittens",
        legs="Valorous Hose",
        feet="Despair Greaves",
        neck="Agitator's Collar",
        waist="Hurch'lan Sash",
        left_ear="Zennaroi Earring",
        right_ear="Handler's Earring +1",
        left_ring="Rajas Ring",
        right_ring="K'ayres Ring",
        back={ name="Pastoralist's Mantle", augments={'STR+2 DEX+2','Accuracy+1','Pet: Damage taken -3%',}}
    }

    sets.idle.Regen = {ammo="Demonry Core",
        head="Twilight Helm",neck="Bathy Choker +1",ear1="Infused Earring",ear2="Dawn Earring",
        body="Kirin's Osode",hands="Umuthi Gloves",ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back="Impassive Mantle",waist="Flume Belt +1",legs="Iuitl Tights +1",feet="Skadi's Jambeaux +1"}

    sets.idle.Refresh = set_combine(sets.idle, {head="Jumalik Helm",body="Jumalik Mail",legs="Stearc Subligar"})
    sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

    sets.idle.Pet = set_combine(sets.idle, {ammo="Demonry Core",
        head=Hybrid_head,
        neck="Empath Necklace",ear1="Infused Earring",ear2="Dawn Earring",
        body=Pet_PDT_body,
        hands=Pet_PDT_hands,
        ring1="Paguroidea Ring",ring2="Sheltered Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Pet_PDT_legs,
        feet="Skadi's Jambeaux +1"})

    sets.idle.Pet.Engaged = {ammo="Demonry Core",
        head=Pet_Melee_head,
        neck="Ferine Necklace",ear1="Hija Earring",ear2="Domesticator's Earring",
        body=Pet_Melee_body,
        hands=Pet_Melee_hands,
        ring1="Thurandaut Ring",ring2="Defending Ring",
        back=Pet_PDT_back,
        waist="Incarnation Sash",
        legs=Pet_Melee_legs,
        feet=Pet_Melee_feet}

    -- DEFENSE SETS
    sets.defense.PDT = {
        head="Ighwa Cap",neck=PDT_neck,ear2="Genmei Earring",
        body="Jumalik Mail",hands="Umuthi Gloves",ring1="Patricius Ring",ring2="Defending Ring",
        back="Impassive Mantle",waist="Flume Belt +1",legs="Iuitl Tights +1",feet="Amm Greaves"}

    sets.defense.Plantoid = set_combine(sets.defense.PDT, {
        head="Ankusa Helm +1",ear1="Vermin Earring",ear2="Vermin Earring",
        body="Nukumi Gausape +1",
        waist="Pipilaka Belt"})

    sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

    sets.defense.HybridPDT = {ammo="Sihirik",
        head="Jumalik Helm",neck="Twilight Torque",ear1="'s Earring",ear2="Handler's Earring +1",
        body="Jumalik Mail",hands=Pet_PDT_hands,ring1="Dark Ring",ring2="Defending Ring",
        back="Impassive Mantle",waist="Flume Belt +1",legs=Pet_PDT_legs,feet="Amm Greaves"}

    sets.defense.MDT = set_combine(sets.defense.PDT, {ammo="Sihirik",
        head="Skormoth Mask",neck="Twilight Torque",ear1="Sanare Earring",ear2="Etiolation Earring",
        body="Jumalik Mail",
        back="Engulfer Cape +1",waist="Nierenschutz"})

    sets.defense.MDTShell = set_combine(sets.defense.MDT, {ammo="Vanir Battery",
        neck="Inquisitor Bead Necklace",
        ring1="Shadow Ring",
        back="Engulfer Cape +1",waist="Resolute Belt"})

    sets.defense.PetPDT = {ammo="Demonry Core",
        head="Anwig Salade",neck="Shepherd's Chain",
        ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Pet_PDT_body,
        hands=Pet_PDT_hands,
        ring1="Thurandaut Ring",ring2="Defending Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Pet_PDT_legs,
        feet=Pet_PDT_feet}

    sets.defense.PetMDT = set_combine(sets.defense.PetPDT, {ear1="Rimeice Earring",
        body=Pet_MDT_body,
        hands=Pet_MDT_hands,
        ring1="Thurandaut Ring",ring2="Defending Ring",
        legs=Pet_MDT_legs,
        feet=Pet_MDT_feet})

    sets.defense.PetSB = set_combine(sets.defense.PetPDT, {ear1="Gelai Earring",
        hands="Bestia Mufflers",
        waist="Isa Belt",
        legs="Bestia Breeches"})

    sets.Kiting = {feet="Skadi's Jambeaux +1"}

    -- MELEE (SINGLE-WIELD) SETS
    sets.engaged = {ammo="Paeapua",
        head="Otomi Helm",neck="Defiant Collar",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Mes'yohi Haubergeon",hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Windbuffet Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
    sets.engaged.LowAccHaste = sets.engaged
    sets.engaged.MedAcc = {ammo="Paeapua",
        head=Hybrid_head,
        neck="Subtlety Spectacles",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Grounded Mantle +1",waist="Incarnation Sash",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
    sets.engaged.MedAccHaste = sets.engaged.MedAcc
    sets.engaged.HighAcc = {ammo="Hasty Pinion +1",
        head=Hybrid_head,
        neck="Subtlety Spectacles",ear1="Steelflash Earring",ear2="Zennaroi Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
    sets.engaged.HighAccHaste = sets.engaged.HighAcc
    sets.engaged.Aftermath = set_combine(sets.engaged, {hands="Aetosaur Gloves +1"})
    sets.engaged.LowAccHaste.Aftermath = sets.engaged.Aftermath
    sets.engaged.MedAcc.Aftermath = set_combine(sets.engaged.MedAcc, {hands="Aetosaur Gloves +1"})
    sets.engaged.MedAccHaste.Aftermath = sets.engaged.MedAcc.Aftermath
    sets.engaged.HighAcc.Aftermath = set_combine(sets.engaged.HighAcc)
    sets.engaged.HighAccHaste.Aftermath = sets.engaged.HighAcc.Aftermath

    -- MELEE (SINGLE-WIELD) HYBRID SETS
    sets.engaged.Hybrid = set_combine(sets.engaged, {head="Iuitl Headgear +1",
        back="Mollusca Mantle",hands="Umuthi Gloves",legs="Iuitl Tights +1",feet="Amm Greaves"})
    sets.engaged.LowAccHaste.Hybrid = sets.engaged.Hybrid
    sets.engaged.MedAcc.Hybrid = set_combine(sets.engaged.MedAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Amm Greaves"})
    sets.engaged.MedAccHaste.Hybrid = sets.engaged.MedAcc.Hybrid
    sets.engaged.HighAcc.Hybrid = set_combine(sets.engaged.HighAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Amm Greaves"})
    sets.engaged.HighAccHaste.Hybrid = sets.engaged.HighAcc.Hybrid

    -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
    sets.engaged.DW = {ammo="Paeapua",
        head=DW_head,
        neck="Asperity Necklace",ear1="Suppanomimi",ear2="Eabani Earring",
        body=DW_body,
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Vellaunus' Mantle +1",waist="Patentia Sash",
        legs=DW_legs,
        feet=DW_feet}
    sets.engaged.DW.LowAccHaste = {ammo="Paeapua",
        head="Otomi Helm",neck="Asperity Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
        body=DW_body,
        hands="Xaddi Gauntlets",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Bleating Mantle",waist="Windbuffet Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
    sets.engaged.DW.MedAcc = {ammo="Hasty Pinion +1",
        head=DW_head,
        neck="Subtlety Spectacles",ear1="Suppanomimi",ear2="Eabani Earring",
        body=DW_body,
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Vellaunus' Mantle +1",waist="Patentia Sash",
        legs=DW_legs,
        feet=DW_feet}
    sets.engaged.DW.MedAccHaste = {ammo="Hasty Pinion +1",
        head=Hybrid_head,
        neck="Subtlety Spectacles",ear1="Suppanomimi",ear2="Brutal Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Rajas Ring",ring2="Epona's Ring",
        back="Grounded Mantle +1",waist="Incarnation Sash",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
    sets.engaged.DW.HighAcc = {ammo="Hasty Pinion +1",
        head=Hybrid_head,
        neck="Subtlety Spectacles",ear1="Heartseeker Earring",ear2="Zennaroi Earring",
        body=DW_body,
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=DW_legs,
        feet=DW_feet}
    sets.engaged.DW.HighAccHaste = {ammo="Hasty Pinion +1",
        head=Hybrid_head,
        neck="Subtlety Spectacles",ear1="Heartseeker Earring",ear2="Zennaroi Earring",
        body="Mes'yohi Haubergeon",
        hands=DW_hands,
        ring1="Mars's Ring",ring2="Oneiros Annulet",
        back="Grounded Mantle +1",waist="Olseni Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet}
    sets.engaged.DW.Aftermath = sets.engaged.DW
    sets.engaged.DW.LowAccHaste.Aftermath = sets.engaged.DW.Aftermath
    sets.engaged.DW.MedAcc.Aftermath = sets.engaged.DW.MedAcc
    sets.engaged.DW.MedAccHaste.Aftermath = sets.engaged.DW.MedAcc.Aftermath
    sets.engaged.DW.HighAcc.Aftermath = sets.engaged.DW.HighAcc
    sets.engaged.DW.HighAccHaste.Aftermath = sets.engaged.DW.HighAcc.Aftermath
    -- MELEE (DUAL-WIELD) HYBRID SETS
    sets.engaged.DW.Hybrid = set_combine(sets.engaged.DW, {head="Iuitl Headgear +1",
        back="Mollusca Mantle",hands="Umuthi Gloves",legs="Iuitl Tights +1",feet="Amm Greaves"})
    sets.engaged.DW.LowAccHaste.Hybrid = sets.engaged.DW.Hybrid
    sets.engaged.DW.MedAcc.Hybrid = set_combine(sets.engaged.DW.MedAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Amm Greaves"})
    sets.engaged.DW.MedAccHaste.Hybrid =sets.engaged.DW.MedAcc.Hybrid
    sets.engaged.DW.HighAcc.Hybrid = set_combine(sets.engaged.DW.HighAcc, {head="Iuitl Headgear +1",
        legs="Iuitl Tights +1",feet="Amm Greaves"})
    sets.engaged.DW.HighAccHaste.Hybrid = sets.engaged.DW.HighAcc.Hybrid

    -- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
    sets.engaged.PetTank = set_combine(sets.engaged, {
        head=Hybrid_head,
        neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Hybrid_body,
        hands=Hybrid_hands,
        ring1="Thurandaut Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet})
    sets.engaged.PetTank.LowAccHaste = sets.engaged.PetTank
    sets.engaged.PetTank.MedAcc = sets.engaged.PetTank
    sets.engaged.PetTank.MedAccHaste = sets.engaged.PetTank
    sets.engaged.PetTank.HighAcc = sets.engaged.PetTank
    sets.engaged.PetTank.HighAccHaste = sets.engaged.PetTank

    -- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
    sets.engaged.DW.PetTank = set_combine(sets.engaged.DW, {
        head=Pet_PDT_head,
        neck="Shepherd's Chain",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Hybrid_body,
        hands=Hybrid_hands,
        ring1="Thurandaut Ring",
        back=Pet_PDT_back,
        waist="Isa Belt",
        legs=Hybrid_legs,
        feet=Hybrid_feet})
    sets.engaged.DW.PetTank.LowAccHaste = sets.engaged.DW.PetTank
    sets.engaged.DW.PetTank.MedAcc = set_combine(sets.engaged.DW.MedAcc, {
        head=Hybrid_head,
        ear1="Handler's Earring",ear2="Handler's Earring +1",
        body=Hybrid_body,
        ring1="Thurandaut Ring",
        hands=Hybrid_hands,
        legs=Hybrid_legs,
        feet=Hybrid_feet})
    sets.engaged.DW.PetTank.MedAccHaste = sets.engaged.DW.PetTank.MedAcc
    sets.engaged.DW.PetTank.HighAcc = set_combine(sets.engaged.DW.HighAcc, {
        head=Hybrid_head,
        ear1="Handler's Earring",ear2="Handler's Earring +1",
        body="Mes'yohi Haubergeon",
        hands=Hybrid_hands,
        ring1="Thurandaut Ring",
        legs=Hybrid_legs,
        feet=Hybrid_feet})
    sets.engaged.DW.PetTank.HighAccHaste = sets.engaged.DW.PetTank.HighAcc

    sets.buff['Killer Instinct'] = {body="Nukumi Gausape +1"}
    sets.buff.Doomed = {ring1="Eshmun's Ring"}
    sets.THBelt = {waist="Chaac Belt"}
    sets.DaytimeAmmo = {ammo="Tengu-no-Hane"}



end


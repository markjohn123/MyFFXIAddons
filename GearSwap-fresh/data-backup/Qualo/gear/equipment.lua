-- Qualo's Equipment
-- Created On 1/12/2014
-- Last Update: 1/12/2016
-- To Do:
--
--
--
--
      windower.add_to_chat(121, "Loaded equipment.lua")
-- Standard WHM Gear used in multiple places

        gsWHM = {}
        gsWHM.Genbu = {name="Genbu's Shield"}
        gsWHM.Hand = {name="Telchine Gloves"}
        gsWHM.Body = {name="Telchine Chas."}
        gsWHM.feet = {name="Regal Pumps"}
        gsWHM.Ring2 ={name="Dark Ring", augments={'Phys. dmg. taken -1%',}}

        gsWHM.FC = {}
        gsWHM.FC.Head = {name="Nahtirah Hat"}
        gsWHM.FC.body = {name="Rosette Jaseran"}
        gsWHM.FC.back = {name="Pahtli Cape"}
        gsWHM.FC.Feet = gsWHM.Feet

        gsWHM.CP = {}
        gsWHM.CP.main = {name="Tamaxchi"}
        gsWHM.CP.Hand = gsWHM.Hand
        gsWHM.CP.ear1= {name="Nourishing Earring"}
        gsWHM.CP.back = {name="Oretania's Cape"}
        gsWHM.CP.ammo = {name="Hedgehog Bomb"}

        gsWHM.HMP = {}
        gsWHM.HMP.waist = {name="Cleric's Belt"}
        gsWHM.HMP.neck = {name="Beak Necklace"}
        gsWHM.HMP.Main = {name="Chatoyant Staff"}
        gsWHM.HMP.feet = {name="Regal Pumps"}

        gsWHM.Int = {}
        gsWHM.Int.Hand = {name="Yaoyotl Gloves"}
        gsWHM.Int.Ring1 = {name="Irrwisch Ring"}

        gsWHM.Enh = {}
        gsWHM.Enh.Body = gsWHM.Body

        gsWHM.Enf = {}
        gsWHM.Enf.Ring1 = {name="Irrwisch Ring"}

        gsWHM.Regen = {}
        gsWHM.Regen.Body = gsWHM.Body



-- replacing this part with section above
-- aliases makes it easier to replace gear later
        GenWHM = {}
        GenWHM.Head = {name="Nahtirah Hat"}
        GenWHM.FCHead = GenWHM.Head
        GenWHM.Hand = {name="Telchine Gloves"}
        GenWHM.CPHand = GenWHM.Hand
        GenWHM.IntHand = {name="Yaoyotl Gloves"}
        GenWHM.Body = {name="Telchine Chas."}
        GenWHM.EnhBody = GenWHM.Body
        GenWHM.RegenBody = GenWHM.Body
        GenWHM.waist = {name="Fucho-no-Obi"}
        GenWHM.Hmpwaist = {name="Cleric's Belt"}
        GenWHM.Legs = {name="Assiduity Pants"}
        GenWHM.Feet = {name="Regal Pumps"}
        GenWHM.FCFeet = GenWHM.Feet
        GenWHM.CPear1= {name="Nourishing Earring"}
        GenWHM.ear1 = GenWHM.CPear1
        GenWHM.ear2 = {name="Gwati Earring"}
        GenWHM.CPback = {name="Oretania's Cape"}
        GenWHM.FCback = {name="Pahtli Cape"}
        GenWHM.ammo = {name="Hedgehog Bomb"}
        GenWHM.rring = {name="Dark Ring", augments={'Phys. dmg. taken -1%',}}
        GenWHM.lring = {name="Hale Ring"}
        GenWHM.neck = {name="Enlightened Chain"}
        GenWHM.Hmpneck = {name="Beak Necklace"}
        GenWHM.CPmain = {name="Tamaxchi"}
        GenWHM.HmpMain = {name="Chatoyant Staff"}


-- BST Gear aliases
        gsBST = {}
        gsBST.main = "Izizoeksi"
        gsBST.DWsub = "Arktoi"
        gsBST.ammo = "Tiphia Sting"
        gsBST.JSEback = {name="Pastoralist's Mantle", augments={'STR+2 DEX+2','Accuracy+1','Pet: Damage taken -3%'}}
        gsBST.head = "Skormoth Mask"
        gsBST.body = {name="Despair Mail", augments={'Accuracy+10','Pet: VIT+7','Pet: Damage taken -3%'}}
        gsBST.hands = {name="Xaddi Gauntlets", augments={'Attack+7','Accuracy+6'}}
        gsBST.legs = {name="Taeon Tights", augments={'Pet: Attack+5 Pet: Rng.Atk.+5','Pet: Breath+3','STR+5 AGI+5'}}
        gsBST.feet = {name="Taeon Boots", augments={'Pet: Attack+10 Pet: Rng.Atk.+10','Pet: "Subtle Blow"+4','STR+1 AGI+1'}}
        gsBST.neck = "Agitator's Collar"
        gsBST.waist = "Hurch'lan Sash"
        gsBST.left_ear = "Zennaroi Earring"
        gsBST.right_ear = "Handler's Earring"
        gsBST.left_ring = "Rajas Ring"
        gsBST.right_ring = "K'ayres Ring"

-- Pet PDT Set Aliases
        gsBST.Pet_PDT = {}
        gsBST.Pet_PDT.ammo = {}
        gsBST.Pet_PDT.head = {}
        gsBST.Pet_PDT.body = gsBST.body
        gsBST.Pet_PDT.hands = "Ankusa Gloves"
        gsBST.Pet_PDT.legs = {}
        gsBST.Pet_PDT.feet = "Ankusa Gaiters"
        gsBST.Pet_PDT.back = gsBST.JSEback
        gsBST.Pet_PDT.right_ear = "Handler's Earring"
        gsBST.Pet_PDT.left_ear = {}
        gsBST.Pet_PDT.left_ring = {}
        gsBST.Pet_PDT.right_ring = {}


-- Call Beast set
        gsBST.CB = {}
        gsBST.CB.ammo = {}
        gsBST.CB.main = {}
        gsBST.CB.sub = {}
        gsBST.CB.head = {}
        gsBST.CB.body = {}
        gsBST.CB.hands = {}
        gsBST.CB.legs = {}
        gsBST.CB.feet = {}
        gsBST.CB.back = {}
        gsBST.CB.right_ear = {}
        gsBST.CB.left_ear = {}
        gsBST.CB.left_ring = {}
        gsBST.CB.right_ring = {}

-- Reward set
        gsBST.Reward = {}
        gsBST.Reward.ammo = {}
        gsBST.Reward.main = {}
        gsBST.Reward.sub = {}
        gsBST.Reward.head = {}
        gsBST.Reward.body = {}
        gsBST.Reward.hands = {}
        gsBST.Reward.legs = {}
        gsBST.Reward.feet = {}
        gsBST.Reward.back = {}
        gsBST.Reward.right_ear = {}
        gsBST.Reward.left_ear = {}
        gsBST.Reward.left_ring = {}
        gsBST.Reward.right_ring = {}
        

-- Augmented Gear
	Aug = {}
	-- Dark Rings
	Aug.Darkring1 = {name="Dark Ring", augments={'Phys. dmg. taken -1%',}}

	-- Demon Rings
	Aug.Demonlring = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	Aug.Demonrring = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	Aug.Demonlring.Derion = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}
	Aug.Demonrring.Derion = {name="Demon's Ring",augments={"Resist Curse+2","Mag. crit. hit dmg. +3%"}}

	Aug.CPCape = {name="Mecisto. Mantle", augments={'Cap. Point+35%','Mag. Acc.+1','DEF+10'}}

	Aug.Rawhide = {}
	Aug.Rawhide.feet = {name="Rawhide Boots", augments={'STR+5','Attack+5','"Store TP"+3',}}
	Aug.Rawhide.hands = {name="Rawhide Gloves", augments={'HP+19','Accuracy+4','Evasion+9',}}

        Aug.Herc = {}
        Aug.Herc.feet = {name="Herculean Boots"}
        Aug.Herc.legs = {name="Herculean Trousers"}
        Aug.Herc.hands = {name="Herculean Gloves"}

	-- Capes
	Aug.Cape = {}
	Aug.Cape.MNK = {}
	-- crit damage +3 acc +7
	Aug.Cape.WAR = {}
	-- cure pot +4/skill +10
	Aug.Cape.WHM = {}
	-- elemental skill
	Aug.Cape.BLM = {}
	-- Duration 10-20
	Aug.Cape.RDM = {}
	-- Dual Wield +5
	Aug.Cape.THF = {}
	-- Phalanx +5
	Aug.Cape.PLD = {}
	Aug.Cape.DRK = {}
	-- pet dt-5
	Aug.Cape.BST = {}
	-- Magic acc +7
	Aug.Cape.BRD = {name="Rhapsode's Cape", augments={'HP+24','Mag. Acc.+7','Enmity-4','Damage taken-1%',}}
	-- STP +3
	Aug.Cape.RNG = {}
	-- stp+3 mediate
	Aug.Cape.SAM = {}
	-- WSD +3
	Aug.Cape.NIN = {}
	-- Breath +10 wsd+5
	Aug.Cape.DRG = {}
	-- skill
	Aug.Cape.SMN = {name="Coveyence Cape", augments="Summoning Skill +5"}
	-- Blu SKill +10
	Aug.Cape.BLU = {}
	-- Phantom Roll -5
	Aug.Cape.COR = {}
	Aug.Cape.PUP = {}
	Aug.Cape.DNC = {}
	Aug.Cape.SCH = {}
	-- skill +10  duration + 10-20
	Aug.Cape.GEO = {}
	-- Enmity -7
	Aug.Cape.RUN = {}

	-- Skirmish
	Aug.Skirmish = {}

	-- Weapons
	Aug.Skirmish.Keraunos = {}

	-- Staff
	-- Nuking
	Aug.Skirmish.Keraunos.MAB = {}
	Aug.Skirmish.Keraunos.Macc = {}
	-- snow acc? leaf perp cost dusk?
	Aug.Skirmish.Keraunos.Perp = {}
	-- pet mab leaf db/crit dusk bpd +10
	Aug.Skirmish.Keraunos.MBPD = {}
	-- siphon?

	-- Armor
	-- Yorcia
	-- Hagondes
	Aug.Skirmish.Hagondes = {}
	Aug.Skirmish.Hagondes.Head = {}
	Aug.Skirmish.Hagondes.Body = {}
	Aug.Skirmish.Hagondes.Hands = {}
	Aug.Skirmish.Hagondes.Legs = {}
	Aug.Skirmish.Hagondes.Feet = {}

	Aug.Skirmish.Hagondes.Legs.MAB = {name="Hagondes Pants +1",augments={"", ""}}

	-- Alluvion Skirmish
	-- Acro - WAR PLD DRK SAM DRG
	Aug.Skirmish.Acro = {}
	Aug.Skirmish.Acro.Head = {}
	Aug.Skirmish.Acro.Body = {}
	Aug.Skirmish.Acro.Hands = {}
	Aug.Skirmish.Acro.Legs = {}
	Aug.Skirmish.Acro.Feet = {}
	
	-- STP Snow: Att/Acc Leaf:STP Dusk: STR
	-- body?
	Aug.Skirmish.Acro.Body.STP = {}
	Aug.Skirmish.Acro.Hands.STP = {}
	Aug.Skirmish.Acro.Legs.STP = {}
	Aug.Skirmish.Acro.Feet.STP = {}
	
	-- TP - Snow: Att/Acc Leaf:D.Atk Dusk: Crit Rate
	Aug.Skirmish.Acro.Head.TP = {}
	Aug.Skirmish.Acro.Body.TP = {}
	Aug.Skirmish.Acro.Hands.TP = {}
	Aug.Skirmish.Acro.Legs.TP = {}
	Aug.Skirmish.Acro.Feet.TP = {}
	
	-- WS - Snow:acc/atk Leaf:WSacc Dusk:WSD
	Aug.Skirmish.Acro.Head.WS = {}
	Aug.Skirmish.Acro.Body.WS = {}
	Aug.Skirmish.Acro.Legs.WS = {}
	Aug.Skirmish.Acro.Feet.WS = {}
	
	-- DRG Breath/BST Macc - Snow: Pet Macc 20 Leaf: Breath +8 Dusk: Pet: haste
	Aug.Skirmish.Acro.Body.Breathe = {}
	Aug.Skirmish.Acro.Hands.Breathe = {}
	Aug.Skirmish.Acro.Legs.Breathe = {}
	Aug.Skirmish.Acro.Feet.Breathe = {}
	
	-- BST Delay - Snow: pet MAB Leaf: CALL BEAST DELAY Dusk:MND head/legs
	-- PET Ready/sic - body/hand/feet pet.mab only
	Aug.Skirmish.Acro.Head.Delay = {}
	Aug.Skirmish.Acro.Body.Delay = {}
	Aug.Skirmish.Acro.Hands.Delay = {}
	Aug.Skirmish.Acro.Legs.Delay = {}
	Aug.Skirmish.Acro.Feet.Delay = {}
	
	-- Yorium - WAR PLD DRK
	Aug.Skirmish.Yorium = {}
	Aug.Skirmish.Yorium.Head = {}
	Aug.Skirmish.Yorium.Body = {}
	Aug.Skirmish.Yorium.Hands = {}
	Aug.Skirmish.Yorium.Legs = {}
	Aug.Skirmish.Yorium.Feet = {}
	
	-- DT Snow: Att/acc Leaf:DA Dusk: DT 
	Aug.Skirmish.Yorium.Head.DT ={ name="Yorium Barbuta", augments={'Accuracy+17 Attack+17','Damage taken-2%',}}
	Aug.Skirmish.Yorium.Body.DT ={ name="Yorium Cuirass", augments={'Accuracy+25','Damage taken-3%',}}
	Aug.Skirmish.Yorium.Hands.DT ={ name="Yorium Gauntlets", augments={'Accuracy+21','Damage taken-3%',}}
	Aug.Skirmish.Yorium.Legs.DT ={ name="Yorium Cuisses", augments={'Accuracy+20','Damage taken-3%',}}
	Aug.Skirmish.Yorium.Feet.DT ={ name="Yorium Sabatons", augments={'Accuracy+18','Damage taken-2%',}}
	
	-- Enmity - Snow ? Leaf: Enmity Dusk: Phalanx 
	Aug.Skirmish.Yorium.Head.Enmity = {}
	Aug.Skirmish.Yorium.Hands.Enmity = {}
	Aug.Skirmish.Yorium.Legs.Enmity = {}
	Aug.Skirmish.Yorium.Feet.Enmity = {}

	-- Taeon
	Aug.Skirmish.Taeon = {}
	Aug.Skirmish.Taeon.Head = {}
	Aug.Skirmish.Taeon.Body = {name="Taeon Tabard", augments={'Accuracy+18 Attack+18','DEX+1',}}
	Aug.Skirmish.Taeon.Hands = {}
	Aug.Skirmish.Taeon.Legs = {}
	Aug.Skirmish.Taeon.Feet = {}
	
	-- Snowslit:Att/Acc Leaf: TA Dusk: STR/DEX
	Aug.Skirmish.Taeon.Head.TA = { name="Taeon Chapeau", augments={'Accuracy+19 Attack+19',}}
	Aug.Skirmish.Taeon.Body.TA = { name="Taeon Tabard", augments={'Accuracy+15 Attack+15',}}
	Aug.Skirmish.Taeon.Hands.TA ={ name="Taeon Gloves", augments={'Accuracy+16 Attack+16','"Triple Atk."+2',}}
	Aug.Skirmish.Taeon.Legs.TA = {}
	Aug.Skirmish.Taeon.Feet.TA = { name="Taeon Boots", augments={'Accuracy+18 Attack+18','"Triple Atk."+1',}}
	
	-- Snow: acc + att Leaf: DW Dusk: Crit
	Aug.Skirmish.Taeon.Head.DW = {  name="Taeon Chapeau"}
	Aug.Skirmish.Taeon.Body.DW = {  name="Taeon Tabard"}
	Aug.Skirmish.Taeon.Hands.DW = { name="Taeon Gloves"}
	Aug.Skirmish.Taeon.Legs.DW = { name="Taeon Tights", augments={'Accuracy+25','"Dual Wield"+5',}}
	Aug.Skirmish.Taeon.Feet.DW = { name="Taeon Boots"}
	
	-- snow: macc/mab Leaf: Fastcast Dusk:WSD
	Aug.Skirmish.Taeon.Body.FC = {}
	Aug.Skirmish.Taeon.Hands.FC = {}
	Aug.Skirmish.Taeon.Legs.FC = {}
	Aug.Skirmish.Taeon.Feet.FC = {}
	
	-- Leaf:Snapshot
	Aug.Skirmish.Taeon.Feet = {}
	
	-- Snow: Racc/Ratt leaf:Crit rate dusk: crit damage
	Aug.Skirmish.Taeon.Head = {}
	Aug.Skirmish.Taeon.Feet = {}
	
	-- BST
	-- pet TP - Snow:Pet: acc/att Leaf Pet DA +5 Dusk pet haste +5
	-- hands Snow Attack +25
	Aug.Skirmish.Taeon.Head.PET = {}
	Aug.Skirmish.Taeon.Body.PET = {}
	Aug.Skirmish.Taeon.Hands.PET = {}
	Aug.Skirmish.Taeon.Legs.PET = {}
	Aug.Skirmish.Taeon.Feet.PET = {}
	
	-- Pet Idle DT - Snow: def +25 Leaf: regen +3 Dusk; pet dt
	Aug.Skirmish.Taeon.Head.PDT = {}
	Aug.Skirmish.Taeon.Body.PDT = {}
	Aug.Skirmish.Taeon.Hands.PDT = {}
	Aug.Skirmish.Taeon.Legs.PDT = {}
	Aug.Skirmish.Taeon.Feet.PDT = {}
	
	-- Helios - WHM BLM RDM SMN BLU SCH GEO
	Aug.Skirmish.Helios = {}
	Aug.Skirmish.Helios.Head = {}
	Aug.Skirmish.Helios.Body = {}
	Aug.Skirmish.Helios.Hands = {}
	Aug.Skirmish.Helios.Legs = {}
	Aug.Skirmish.Helios.Feet = {}
	
	-- MAB 
	Aug.Skirmish.Helios.Head.MAB = {name="Helios Band",augments={"", ""}}
	Aug.Skirmish.Helios.Hands.MAB = { name="Helios Gloves", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','Magic crit. hit rate +7'}}
	Aug.Skirmish.Helios.Feet.MAB = { name="Helios Boots", augments={'Mag. Acc.+15 "Mag.Atk.Bns."+15'}}
	
	--SMN
	
	-- avatar TP
	-- prep cost pet haste pet acc/racc
	Aug.Skirmish.Helios.Hands.Perp = {}
	-- pet haste  pet DA  pet atk/ratk
	Aug.Skirmish.Helios.Feet.Pet = {}
	
	-- Snow:pet mab 30 Leaf:pet crit Dusk:Blood Pact Damage +7
	Aug.Skirmish.Helios.Head.MBPD = {}
	Aug.Skirmish.Helios.Body.MBPD = {}
	Aug.Skirmish.Helios.Hands.MBPD = {}
	Aug.Skirmish.Helios.Legs.MBPD = {}
	Aug.Skirmish.Helios.Feet.MBPD = {}
	
	-- Snow: pet att/ratk Leaf:pet crit Dusk:BPD 7
	Aug.Skirmish.Helios.Head.PBPD = {}
	Aug.Skirmish.Helios.Hands.PBPD = {}
	Aug.Skirmish.Helios.Legs.PBPD = {}
	Aug.Skirmish.Helios.Feet.PBPD = {}
	
	-- Snow:pet macc 30 leaf:boon Duskorb: smn skill
	Aug.Skirmish.Helios.Head.BPbuff = {}
	Aug.Skirmish.Helios.Body.BPbuff = {}
	Aug.Skirmish.Helios.Hands.BPbuff = {}
	Aug.Skirmish.Helios.Legs.BPbuff = {}
	Aug.Skirmish.Helios.Feet.BPbuff = {}
	
	
	-- Telchine - WHM BLM RDM BRD SMN BLU SCH GEO
	Aug.Skirmish.Telchine = {}
	Aug.Skirmish.Telchine.Head = {}
	Aug.Skirmish.Telchine.Body = {}
	Aug.Skirmish.Telchine.Hands = {}
	Aug.Skirmish.Telchine.Legs = {}
	Aug.Skirmish.Telchine.Feet = {}
	
	-- Snow:  Leaf: Cure Pot Dusk: Enhancing pot
	Aug.Skirmish.Telchine.Hands.Cure = { name="Telchine Gloves", augments={'"Cure" potency +8%',}}
	-- Snow: Macc Leaf:Songs Dusk
	Aug.Skirmish.Telchine.Feet.Song = {name="Telchine Pigaches", augments={'Mag. Acc.+20','Song spellcasting time -7%',}}
	
	-- Smn
	-- Elemental siphon
	Aug.Skirmish.Telchine.Head.Siphon = {}
	Aug.Skirmish.Telchine.Body.Siphon = {}
	Aug.Skirmish.Telchine.Hands.Siphon = {}
	Aug.Skirmish.Telchine.Legs.Siphon = {}
	
-- Magian Staves
	-- Elemental Precast
		Fastcast = {}
		Fastcast.Staff = {['Light']='Arka I', ['Dark']='Xsaeta I', ['Fire']='Atar I', ['Ice']='Vourukasha I',
				['Wind']='Vayuvata I', ['Earth']='Vishrava I', ['Lightning']='Apamajas I', ['Water']='Haoma I', ['Thunder']='Apamajas I'}
		Fastcast.Staff.ID = {['Light']=19932, ['Dark']=19936, ['Fire']=19914, ['Ice']=19917,
				['Wind']=19920, ['Earth']=19923, ['Lightning']=19926, ['Water']=19929, ['Thunder']=19926}
	-- Elemental Recast
		Recast = {}
		Recast.Staff = {['Light']='Arka II', ['Dark']='Xsaeta II', ['Fire']='Atar II', ['Ice']='Vourukasha II',
				['Wind']='Vayuvata II', ['Earth']='Vishrava II', ['Lightning']='Apamajas II', ['Water']='Haoma II', ['Thunder']='Apamajas II'}
		Recast.Staff.ID = {['Light']=19933, ['Dark']=19937, ['Fire']=19915, ['Ice']=19918,
				['Wind']=19921, ['Earth']=19924, ['Lightning']=19927, ['Water']=19930, ['Thunder']=19927}

	-- Perp Cost Staves
		Prep = {}
		Prep.Staff = {['Light']='Arka III', ['Dark']='Xsaeta III', ['Fire']='Atar III', ['Ice']='Vourukasha III',
				['Wind']='Vayuvata III', ['Earth']='Vishrava III', ['Lightning']='Apamajas III', ['Water']='Haoma III', ['Thunder']='Apamajas III'}
		Prep.Staff.ID = {['Light']=19934, ['Dark']=19938, ['Fire']=19916, ['Ice']=19919,
				['Wind']=19922, ['Earth']=19925, ['Lightning']=19928, ['Water']=19931, ['Thunder']=19928}

-- Elemental Gear 
	elemental = {}
		
	elemental.Obi = {['Light']='Hachirin-no-Obi', ['Dark']='Anrin Obi', ['Fire']='Hachirin-no-Obi', ['Ice']='Hachirin-no-Obi', ['Wind']='Hachirin-no-Obi',
			['Earth']='Hachirin-no-Obi', ['Lightning']='Hachirin-no-Obi', ['Water']='Hachirin-no-Obi'}

	elemental.Gorget = {['Light']='Fotia Gorget', ['Dark']='Fotia Gorget', ['Fire']='Fotia Gorget', ['Ice']='Fotia Gorget',
			['Wind']='Fotia Gorget', ['Earth']='Fotia Gorget', ['Lightning']='Fotia Gorget', ['Water']='Fotia Gorget'}

	elemental.Belt = {['Light']='Fotia Belt', ['Dark']='Shadow Belt', ['Fire']='Fotia Belt', ['Ice']='Fotia Belt',
			['Wind']='Fotia Belt', ['Earth']='Fotia Belt', ['Lightning']='Fotia Belt', ['Water']='Fotia Belt'}

			
-------------------------------------------------------------------------------------------------------------------
-- Mappings, lists and sets to describe game relationships that aren't easily determinable otherwise.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Elemental mappings for element relationships and certian types of spells.
-------------------------------------------------------------------------------------------------------------------

elements = {}

elements.list = S{'Light','Dark','Fire','Ice','Wind','Earth','Lightning','Water'}

elements.weak_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Ice', ['Ice']='Wind', ['Wind']='Earth', ['Earth']='Lightning',
['Lightning']='Water', ['Water']='Fire'}

elements.strong_to = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind',
['Lightning']='Earth', ['Water']='Lightning'}

elements.storm_of = {['Light']="Aurorastorm", ['Dark']="Voidstorm", ['Fire']="Firestorm", ['Earth']="Sandstorm",
['Water']="Rainstorm", ['Wind']="Windstorm", ['Ice']="Hailstorm", ['Lightning']="Thunderstorm"}

elements.spirit_of = {['Light']="Light Spirit", ['Dark']="Dark Spirit", ['Fire']="Fire Spirit", ['Earth']="Earth Spirit",
['Water']="Water Spirit", ['Wind']="Air Spirit", ['Ice']="Ice Spirit", ['Lightning']="Thunder Spirit"}



storms = S{"Aurorastorm", "Voidstorm", "Firestorm", "Sandstorm", "Rainstorm", "Windstorm", "Hailstorm", "Thunderstorm"}


skillchain_elements = {}
skillchain_elements.Light = S{'Light','Fire','Wind','Lightning'}
skillchain_elements.Dark = S{'Dark','Ice','Earth','Water'}
skillchain_elements.Fusion = S{'Light','Fire'}
skillchain_elements.Fragmentation = S{'Wind','Lightning'}
skillchain_elements.Distortion = S{'Ice','Water'}
skillchain_elements.Gravitation = S{'Dark','Earth'}
skillchain_elements.Transfixion = S{'Light'}
skillchain_elements.Compression = S{'Dark'}
skillchain_elements.Liquification = S{'Fire'}
skillchain_elements.Induration = S{'Ice'}
skillchain_elements.Detonation = S{'Wind'}
skillchain_elements.Scission = S{'Earth'}
skillchain_elements.Impaction = S{'Lightning'}
skillchain_elements.Reverberation = S{'Water'}



-- list of weaponskills that use ammo
bow_gun_weaponskills = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Blast Arrow",
						"Arching Arrow", "Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance",
						"Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Blast Shot", "Heavy Shot", "Detonator",
						"Numbing Shot", "Last Stand", "Coronach", "Trueflight", "Leaden Salute", "Wildfire"}

-- list of weaponskills that can be used at greater than melee range
ranged_weaponskills = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Arching Arrow",
"Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance",
"Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Heavy Shot", "Detonator", "Last Stand",
"Coronach", "Trueflight", "Leaden Salute", "Wildfire",
"Myrkr"}


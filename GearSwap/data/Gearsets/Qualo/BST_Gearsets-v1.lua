-- BST Gearsets
-- Date Created: 1/29/2014
-- Last Updated: 01/14/2016
-- To Do List:
--
--
--
--

if player.name == 'Qualo' then
                windower.add_to_chat(121, "Found BST_Gearsets.lua")
		-- includes
		include('include/utility.lua')
		include('include/mappings.lua')
		include('include/equipment.lua')

                mote_include_version = 2

        	-- Load and initialize the include file.
	        -- include('include/Mote-Include.lua')



		-- figure out where this lib is and get path corrected
		include('include/organizer-lib')
		-- include('../include/autoexec.lua')

		-- sets Macros off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if player.sub_job == 'DNC' then
				set_macro_page(1,1)
			elseif player.sub_job == 'WHM' then
				set_macro_page(1,1)
			end
		else
			set_macro_page(9,1)
		end

		-- Auto Sets
		-- Standard/idle









	-- PRECAST SETS
                sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}

		sets.precast.JA['Bestial Loyalty'] = {hands="Ankusa Gloves"}

		sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']

                sets.precast.JA.Familiar = {legs="Ankusa Trousers"}
		
		sets.precast.JA.Tame = {head="Totemic Helm +1",}
		
		sets.precast.JA.Spur = {feet="Nukumi Ocreae +1"}

        
	--This is what will equip when you use Reward.  No need to manually equip Pet Food Theta.
		sets.precast.JA.Reward = {
				ammo="Pet Food Theta",
				body="Monster Jackcoat",
				hands="Ogre gloves",
				-- mule back from andi
				legs="Totemic Trousers",
				feet="Totemic Gaiters"}

	--This is your base FastCast set that equips during precast for all spells/magic.
                sets.precast.FC = {
				legs="Taeon Tights",
				feet="Taeon Boots"}


        -- WEAPONSKILLS


        -- Default weaponskill set.
	        sets.precast.WS = {
			ammo="Cheruski Needle",
			head="Nukumi Cabasset +1",
                        -- neck="Justiciar's Torque",
			ear1="Flame Pearl",
			ear2="Brutal Earring",
			body="Nukumi Gausape +1",
			hands="Boor Bracelets",
			ring1="Pyrosoul Ring",
			ring2="Ifrit Ring",
			back="Vespid Mantle",
			waist="Windbuffet Belt +1",
			legs="Nukumi Quijotes +1",
			feet="Nukumi Ocreae +1"}



	-- PET SIC & READY MOVES


--This is your base Ready move set, activating for physical Ready moves. Merlin/D.Tassets are accounted for already.
                sets.midcast.Pet.WS = {
			main="Izizoeksi",
			hands="Nukumi Manoplas +1",
			sub="Arktoi",
			waist="Hurch'lan Sash"}

--This will equip for Magical Ready moves like Fireball
                sets.midcast.Pet.MabReady = set_combine(sets.midcast.Pet.WS, {
			main="Izizoeksi",
                        feet="Taeon Boots",
                        back="Argocham. Mantle",
			sub="Arktoi",
                        ring1="Thurandaut Ring",})


                sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1",}

	        -- sets.midcast.Pet.ReadyRecast = {sub="Charmer's Merlin",legs="Desultor Tassets",}
	        sets.midcast.Pet.ReadyRecast = {legs="Desultor Tassets",}



        -- IDLE SETS (TOGGLE between RERAISE and NORMAL with CTRL+F12)


		-- Base Idle Set (when you do NOT have a pet out)
                sets.idle = {
                        main=gsBST.main,
                        -- should sub here be shield since combined dw set sets this?
                        sub=gsBST.DWsub,
                        ammo=gsBST.ammo,
                        head=gsBST.head,
                        body=gsBST.body,
                        hands=gsBST.hands,
                        legs=gsBST.legs,
                        feet=gsBST.feet,
                        neck=gsBST.neck,
                        waist=gsBST.waist,
                        left_ear=gsBST.left_ear,
                        right_ear=gsBST.right_ear,
                        left_ring=gsBST.left_ring,
                        right_ring=gsBST.right_ring,
                        back=gsBST.JSEback}

	        sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})


		-- Idle Set that equips when you have a pet out and not fighting an enemy.
	        sets.idle.Pet = set_combine(sets.idle, {
                        main=gsBST.main,
                        -- should sub here be shield since combined dw set sets this?
                        sub=gsBST.DWsub,
                        ammo=gsBST.ammo,
                        head=gsBST.head,
                        body=gsBST.body,
                        hands=gsBST.hands,
                        legs=gsBST.legs,
                        feet=gsBST.feet,
                        neck=gsBST.neck,
                        waist=gsBST.waist,
                        left_ear=gsBST.left_ear,
                        right_ear=gsBST.right_ear,
                        left_ring=gsBST.left_ring,
                        right_ring=gsBST.right_ring,
                        back=gsBST.JSEback})

		-- Idle set that equips when you have a pet out and ARE fighting an enemy.
	        sets.idle.Pet.Engaged = set_combine(sets.idle, {
			})

       -- MELEE (SINGLE-WIELD) SETS

        sets.engaged = {
                        main=gsBST.main,
                        -- should sub here be shield since combined dw set sets this?
                        sub=gsBST.DWsub,
                        ammo=gsBST.ammo,
                        head=gsBST.head,
                        body=gsBST.body,
                        hands=gsBST.hands,
                        legs=gsBST.legs,
                        feet=gsBST.feet,
                        neck=gsBST.neck,
                        waist=gsBST.waist,
                        left_ear=gsBST.left_ear,
                        right_ear=gsBST.right_ear,
                        left_ring=gsBST.left_ring,
                        right_ring=gsBST.right_ring,
                        back=gsBST.JSEback}


	     -- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB

                sets.engaged.DW = set_combine(sets.engaged, {
                        sub=gsBST.DWsub})

end
-- RNG Gear_sets
-- Created: 3/10/2014
-- Last Updated: 02/03/2015
-- To Do:
--
--
--
--

if player.name == 'Feary' then
-- includes
	include('include/utility.lua')
	include('include/mappings.lua')
	include('include/equipment.lua')
	
-- Auto macro sets off = 0  on = 1
		automacroset = 1
		if automacroset == 1 then
			if ranged_Bow:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(13,1)
				elseif player.sub_job == 'SAM' then
					set_macro_page(13,2)
				elseif player.sub_job == 'WAR' then
					set_macro_page(13,3)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(13,4)
				end
			elseif ranged_Gun:contains(player.equipment.range) then
				if player.sub_job == 'NIN' then
					set_macro_page(13,5)
				elseif player.sub_job == 'SAM' then
					set_macro_page(13,6)
				elseif player.sub_job == 'WAR' then
					set_macro_page(13,7)
				elseif player.sub_job == 'DRG' then 
					set_macro_page(13,8)
				end
			end			
		else
			set_macro_page(13,3)
		end
		
-- Auto Sets
-- Standard/idle
sets.idle.PDT = { 
				head="Arcadian Beret +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Repulse Mantle", waist="Flume Belt", legs="Iuitl Tights", feet="Iuitl Gaiters"}

sets.idle.MDT = { 
				head="Arcadian Beret +1", neck="Twilight Torque", lear="Merman's Earring", rear="Etiolation Earring",
                body="Iuitl Vest", hands="Iuitl Wristbands +1", lring=Aug.Darkring1, rring="Defending Ring",
                back="Engulfer Cape", waist="Flume Belt", legs="Nahtirah Trousers", feet="Iuitl Gaiters"}

sets.misc.Town = set_combine(sets.idle.PDT,{
				head="Arcadian Beret +1",
				body="Arcadian Jerkin +1", hands="Arcadian Bracers +1",
				legs="Arcadian Braccae +1", feet="Fajin Boots"})
				
sets.idle.Standard = set_combine(sets.idle.PDT, {
				lear="Merman's Earring", rear="Etiolation Earring", feet="Fajin Boots"})
-- Melee TP 
sets.TP = { 
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Epona's Ring",
                back="Atheling Mantle", waist="Windbuffet Belt", legs="Taeon Tights", feet="Taeon Boots"}
-- Melee Accuracy TP
sets.TP.Acc = {
				head="Taeon Chapeau", neck="Asperity Necklace", lear="Bladeborn Earring", rear="Steelflash Earring",
                body="Taeon Tabard", hands="Taeon Gloves", lring="Rajas Ring", rring="Ramuh Ring +1",
                back="Atheling Mantle", waist="Hurch'lan Sash",  legs="Taeon Tights", feet="Taeon Boots"}

-- RA Sets
-- Snapshot - Caps at 80 from any source.
sets.precast.Snapshot = {
				head="Amini Gapette",
                body="Amini Caban", hands="Iuitl Wristbands +1",
                back="Lutian Cape", waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"}
sets.precast.Snapshot.Overkill = set_combine(sets.precast.Snapshot,{
				head="Orion Beret +1",
                body="Amini Caban", hands="Arc. Bracers +1",
                waist="Impulse Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"})

-- Bow
-- Needs 42+ STP For 3/4 Hit, Goal is 50.
-- Current: 46 + Recycle
sets.RA = { 
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
            body="Amini Caban", hands="Amini Glovelettes", lring="Rajas Ring", rring="K'ayres Ring",
            back="Lutian Cape", waist="Patentia Sash", legs="Amini Brague", feet="Arcadian Socks +1"}
				
-- Current- 33 STP
sets.RA.Acc = {
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
            body="Kyujutsugi", hands="Amini Glovelettes", lring="Garuda Ring +1", rring="Garuda Ring +1",
			back="Lutian Cape", waist="Patentia Sash", legs="Feast Hose", feet="Orion Socks +1"}
				
-- Gun
sets.RA.Gun = { 
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Garuda Ring +1",
            back="Lutian Cape", waist="Patentia Sash", legs="Nahtirah Trousers", feet="Orion Socks +1"}
				
sets.RA.Acc.Gun = { 
			head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
            body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
            back="Lutian Cape", waist="Patentia Sash", legs="Nahtirah Trousers", feet="Orion Socks +1"}

-- JA
sets.precast.JA.Acc = {}

-- Barrage 
sets.precast.JA["Barrage"] =  {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
                body="Kyujutsugi", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Lutian Cape", waist="Scout's Belt", legs="Aetosaur Trousers +1", feet="Orion Socks +1"}

sets.precast.JA.Acc["Barrage"] =  {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
                body="Kyujutsugi", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Lutian Cape", waist="Scout's Belt", legs="Aetosaur Trousers +1", feet="Orion Socks +1"}
-- Eagle Eye Shot
sets.precast.JA["Eagle Eye Shot"] = set_combine(sets.RA, {legs="Arcadian Braccae +1"})

sets.precast.JA.Acc["Eagle Eye Shot"] = set_combine(sets.RA.Acc, {legs="Arcadian Braccae +1"})

-- Overkill
sets.precast.JA["Overkill"] = {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Garuda Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.JA.Acc["Overkill"] = set_combine(sets.RA.Acc, {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Tripudio Earring", rear="Enervating Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1 ", rring="Garuda Ring +1",
                back="Sylvan's Chlamys", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"})

sets.precast.JA["Shadowbind"] = {hands="Orion Bracers +1"}
sets.precast.JA["Sharpshot"] = {legs="Orion Braccae +1"}
sets.precast.JA["Double Shot"] = {body="Amini Gapette"}
sets.precast.JA["Velocity Shot"] = {legs="Amini Caban"}
sets.precast.JA["Camouflage"] = {head="Orion Jerkin +1"}
sets.precast.JA["Scavenge"] = {feet="Orion Socks +1"}
sets.precast.JA["Bounty Shot"] = {hands="Amini Glovelettes"}
sets.precast.JA["Unlimited Shot"] = {feet="Amini Bottillons"}
sets.precast.JA["Flashy Shot"] = {hands="Arc. Bracers +1"}
sets.precast.JA["Stealth Shot"] = {feet="Arcadian Socks +1"}

-- Weaponskills
-- Melee
sets.precast.WS = {}

-- Range
sets.precast.RAWS = {
				head="Arcadian Beret +1", neck="Ocachi Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Kyujutsugi", hands="Arc. Bracers +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
-- Bow WS
sets.precast.RAWS['Jishnu\'s Radiance'] = {
				head="Uk'uxkaj Cap", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Orion Jerkin +1", hands="Arc. Bracers +1", lring="Ifrit Ring +1", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}
				
sets.precast.RAWS['Namas Arrow'] = {
				head="Arcadian Beret +1", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Kyujutsugi", hands="Arc. Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
				back="Buquwik Cape", waist="Fotia Belt", legs="Nahtirah Trousers", feet="Arcadian Socks +1"}

-- Gun/Crossbow WS
sets.precast.RAWS['Last Stand'] = {
				head="Uk'uxkaj Cap", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.RAWS['Coronach'] = {
				head="Uk'uxkaj Cap", neck="Fotia Gorget", lear="Vulcan's Pearl", rear="Vulcan's Pearl",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Rajas Ring", rring="Ifrit Ring +1",
                back="Buquwik Cape", waist="Scout's Belt", legs="Nahtirah Trousers", feet="Orion Socks +1"}

sets.precast.RAWS['Wildfire'] = {
				head="Uk'uxkaj Cap", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Toro Cape", waist="Aquiline Belt", legs="Arcadian Braccae +1", feet="Arcadian Socks +1"}

sets.precast.RAWS['Trueflight'] = {
				head="Uk'uxkaj Cap", neck="Stoicheion Medal", lear="Crematio Earring", rear="Friomisi Earring",
                body="Orion Jerkin +1", hands="Orion Bracers +1", lring="Garuda Ring +1", rring="Garuda Ring +1",
                back="Toro Cape", waist="Aquiline Belt", legs="Arcadian Braccae +1", feet="Arcadian Socks +1"}
					
-- Midcast Sets

-- Aftercast

-- Misc Sets
sets.precast.Fastcast = set_combine(sets.idle.PDT, {head="Haruspex Hat +1", hands="Thaumas Gloves", lear="Loquac. Earring", rring="Prolix Ring",})

sets.precast.Utsusemi = set_combine(sets.precast.Fastcast, {neck="Magoraga Beads"})

sets.misc.Waltz = {}
sets.misc.Steps = set_combine(sets.TP.ACC)
sets.misc.flourish = {}
end
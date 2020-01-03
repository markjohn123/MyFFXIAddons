Cities = S{
    "Ru'Lude Gardens",
    "Upper Jeuno",
    "Lower Jeuno",
    "Port Jeuno",
    "Port Windurst",
    "Windurst Waters",
    "Windurst Woods",
    "Windurst Walls",
    "Heavens Tower",
    "Port San d'Oria",
    "Northern San d'Oria",
    "Southern San d'Oria",
    "Port Bastok",
    "Bastok Markets",
    "Bastok Mines",
    "Metalworks",
    "Aht Urhgan Whitegate",
    "Tavanazian Safehold",
    "Nashmau",
    "Selbina",
    "Mhaura",
    "Norg",
    "Eastern Adoulin",
    "Western Adoulin",
    "Kazham"
}
naSpells = S{'Paralyna','Silena','Viruna','Stona','Blindna','Poisona'}
resSpells = S{'Barstonra','Barwatera','Baraera','Barfira','Barblizzara','Barthundra',
	'Barstone','Barwater','Baraero','Barfire','Barblizzard','Barthunder'}

conservespells = S{
'Raise','Raise II','Raise III','Arise','Reraise','Reraise II','Reraise III','Reraise IV',
'Sacrifice','Esuna','Blink','Haste','Flurry','Auspice','Aquaveil','Blink'}

function get_sets()
sets.TownGear = {  
	main="Yagrush",
    sub="Chanter's Shield",
    Ammo="Ombre Tathlum +1",
    head="Marduk's Tiara +1",
    body="Councilor's Garb",
    hands="Ebers Mitts +1",
    legs="Ebers Pantaloons +1",
    feet="Herald's Gaiters",
    neck="Orunmila's Torque",
    waist="Fucho-no-Obi",
    left_ear="Glorious Earring",
    right_ear="Enchanter Earring +1", 
    left_ring="Globidonta Ring",
    right_ring="Janniston Ring",
    back="Mending Cape"	}
sets.lockstyle = {
    main="Yagrush",
    sub="Genbu's Shield", 
    head="Theo. Cap +1",
    body="Ebers Bliaud +1",
    hands="Ebers Mitts +1",
    legs="Piety Pantaln. +1",
    feet="Piety Duckbills +1"}
sets.refresh = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    ammo="Impatiens",
    body="Respite Cloak",
    hands="Serpentes Cuffs",
    legs="Assid. Pants +1",
    feet="Serpentes Sabots",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Glorious Earring",
    right_ear="Moonshade Earring",
    right_ring={ name="Dark Ring", augments={'Magic dmg. taken -6%','Phys. dmg. taken -4%',}},
    left_ring="Janniston Ring",
    back="Mecisto. Mantle"}


sets.Resting = {
main="Boonwell Staff",
neck="Eidolon Pendant",
ear2="Moonshade Earring",
ear1="Relaxing Earring",
body="Respite Cloak",
hands="Serpentes Cuffs",
ring1="Kuchekula Ring",
ring2="Janniston Ring",
back="Felicitas Cape",
waist="Austerity Belt +1",
legs="Assiduity Pants +1",
feet="Chelona Boots +1"}
sets.FC = {
sub="Chanter's Shield",
ammo="Impatiens",
head="Nares Cap",
neck="Orunmila's Torque",
ear1="Enchanter Earring +1",
ear2="Magnetic Earring",
body="Dalmatica",
hands="Gendewitha Gages +1",
lring="Veneficium Ring",
rring="Prolix Ring",
back="Alaunus's Cape",
waist="Witful Belt",
legs="Artsieq Hose",
feet="Chelona Boots +1"}
sets.enfebmnd = {
main="Twebuliij",
range="Aureole",
head="Artsieq Hat",
neck="Imbodla Necklace",
ear1="Enchanter Earring +1",
ear2="Gwati Earring",
body="Ischemia Chasuble",
hands="Piety Mitts",
ring1="Globidonta Ring",
ring2="Sangoma Ring",
back="Ogapepo Cape",
waist="Bougonia Rope",
legs="Artsieq Hose",
feet="Theophany Duckbills +1",
sub="Mephitis grip"}
sets.midcast_BarSpells = {
main="Beneficus",
sub="Genbu's Shield",
head="Umuthi Hat",
body="Ebers Bliaud +1",
hands="Dynasty Mitts",
ring1="Kuchekula Ring",
ring2="Prolix Ring",
legs="Piety Pantaloons +1",
waist="Olympus Sash",
back="Mending Cape",
feet="Piety Duckbills +1",
ear1="Glorious Earring",
neck="Colossus's Torque",
ear2="Andoaa Earring"}
sets.midcast_EnhancingMagic = {
main="Beneficus",
sub="Chanter's Shield",
Ammo="Impatiens",
neck="Colossus's Torque",
head="Umuthi Hat",
body="Eirene's Manteel",
hands="Dynasty Mitts",
ring1="Sheltered Ring",
ring2="Prolix Ring",
legs="Piety Pantaloons +1",
feet="Piety Duckbills +1",
waist="Siegel Sash",
ear1="Magnetic Earring",
ear2="Andoaa Earring",
back ="Mending Cape"}
sets.midcast_Regen = set_combine(sets.FC,{
main="Bolelabunga",
head="Marduk's Tiara +1",
body="Piety briault +1",
hands="Ebers Mitts +1",
ear1="Magnetic Earring",
ear2="Gifted Earring",
waist="Austerity Belt +1",
sub="Thuellaic ecu +1",
legs="Theophany pantaloons +1",
feet="Telchine Pigaches"})
sets.midcast_Cursna = {
main="Yagrush",
sub="Chanter's Shield",
Ammo="Impatiens",
neck="Malison medallion",
head="Nares Cap",
body="Eirene's Manteel",
hands="Hieros Mittens",
ring1="Ephedra ring",
ring2="Ephedra ring",
legs="Theophany pantaloons +1",
feet="Gendewitha Galoshes +1",
waist="Siegel Sash",
ear1="Enchanter Earring +1",
ear2="Magnetic Earring",
back ="Alaunus's Cape"}
sets.cureFC = {
main="Tamaxchi",
sub="Genbu's Shield",
ammo="Impatiens",
head="Piety Cap",
neck="Orunmila's Torque",
ear1="Glorious Earring",
ear2="Magnetic Earring",
body="Heka's Kalasiris",
waist="Witful Belt",
hands="Gendewitha Gages +1",
ring1="Kuchekula Ring",
ring2="Prolix Ring",
back="Pahtli Cape",
legs="Ebers Pantaloons +1",
feet="Hygieia Clogs +1"}
sets.midcast_Cure = {
main="Tamaxchi",
sub="Genbu's Shield",
ammo="Ombre Tathlum +1",
head="Theophany Cap +1",
neck="Deviant Necklace",
ear1="Glorious Earring",
ear2="Nourishing Earring +1",
body="Ebers Bliaud +1",
waist="Austerity Belt +1",
hands="Theophany mitts +1",
ring1="Janniston Ring",
ring2="Kuchekula Ring",
back="Alaunus's Cape",
legs="Ebers Pantaloons +1",
feet="Vanya Clogs"}
sets.midcast_Bene = {
Body="Piety briault +1"}
sets.midcast_Stoneskin = {
main="Beneficus",
sub="Chanter's Shield",
Ammo="Impatiens",
neck="Stone Gorget",
head="Umuthi Hat",
body="Eirene's Manteel",
hands="Dynasty Mitts",
ring1="Veneficium Ring",
ring2="Prolix Ring",
legs="Shedir Seraweels",
feet="Theophany Duckbills +1",
waist="Siegel Sash",
ear1="Magnetic Earring",
ear2="Earthcry Earring",
back ="Mending Cape"}
sets.conserveMP = {
main="Seveneyes",
sub="Thuellaic Ecu +1",
neck="Deviant Necklace",
ammo="Ombre Tathlum +1",
body="Hedera Cotehardie",
head="Nares Cap",
left_ear="Magnetic Earring",
right_ear="Gifted Earring",
waist="Austerity Belt +1",
legs="Theurgist's Slacks",
feet="Hygieia Clogs +1"
}
sets.devotion = {
    main="Tamaxchi", 
    sub="Thuellaic Ecu +1",
    ammo="Impatiens",
    head="Piety Cap",
    body="Pluviale",
    hands="Piety Mitts",
    legs="Piety Pantaln. +1",
    feet="Theo. Duckbills +1",
    neck="Twilight Torque",
    waist="Bougonia Rope",
    left_ear="Glorious Earring",
    right_ear="Nourishing Earring +1", 
    left_ring="K'ayres Ring",
    right_ring="Meridian Ring",
    back="Aenotherus Mantle",}
sets.divine={
    main="Twebuliij",
    sub="Mephitis Grip",
    range="Aureole",
    head="Artsieq Hat",
    body="Ischemia Chasu.",
    hands="Piety Mitts",
    legs="Theurgist's Slacks",
    feet="Gende. Galosh. +1",
    neck="Deviant Necklace",
    waist="Austerity Belt +1",
    left_ear="Enchanter Earring +1",
    right_ear="Gwati Earring",
    left_ring="Globidonta Ring",
    right_ring="Sangoma Ring",
    back="Ogapepo Cape",
}
sets.midcast_DebuffRemoval = {
    main="Yagrush",
    sub="Chanter's Shield",
    ammo="Impatiens",
    head="Nares Cap",
    body="Eirene's Manteel",
    hands="Ebers Mitts +1",
    legs="Ebers Pant. +1",
    feet="Hygieia Clogs +1",
    neck="Orunmila's Torque",
    waist="Witful Belt",
    left_ear="Novia Earring",
    right_ear="Magnetic Earring",
    left_ring="Kuchekula Ring",
    right_ring="Prolix Ring",
    back="Alaunus's Cape"}
sets.haste = {}
sets.dynastyFC = set_combine(sets.FC,{hands="Dynasty Mitts"})
sets.hasting = set_combine(sets.FC,{hands="Dynasty Mitts",legs="Artsieq Hose",body="Eirene's Manteel"})--FastCast for enhancing
sets.raising = set_combine(sets.FC, {main="Seveneyes",body="Dalmatica", legs="Ebers Pantaloons +1"})  --Fast Cast for Raising
sets.enfebint = sets.enfebmnd --currently the same gear as mnd set
sets.midcast_CureObi = set_combine(sets.midcast_Cure,{waist="Hachirin-no-Obi"}) --cure gear with Hachirin-no-Obi
sets.gaiters = set_combine(sets.refresh,{feet="Herald's Gaiters"})
end
function precast(spell)
	if spell.skill=='Healing Magic' then	
		if spell.english:startswith('Cure') or spell.english:startswith("Curaga") then equip(sets.cureFC)
		elseif spell.english == 'Cursna' then -- Auto Divine Caress cursna--
            if windower.ffxi.get_ability_recasts()[32] < 1 and (spell.target.type == 'PLAYER' or spell.target.name == player.name) and not buffactive.amnesia then
            cancel_spell()
			equip(sets.midcast_Cursna)	
            send_command('DivineCaress;wait 1.7;input /ma "'..spell.english..'" '..spell.target.name)
			else equip(sets.midcast_Cursna)	
			end		
		elseif spell.english == 'Arise' or spell.english:startswith("Raise") or spell.english:startswith("Reraise") then equip(sets.raising)	
		elseif naSpells:contains(spell.english) then -- Auto Divine Caress --
            if windower.ffxi.get_ability_recasts()[32] < 1 and (spell.target.type == 'PLAYER' or spell.target.name == player.name) and not buffactive.amnesia then
            cancel_spell()
			equip(sets.midcast_DebuffRemoval)
            send_command('DivineCaress;wait 1.7;input /ma "'..spell.english..'" '..spell.target.name)
			else equip(sets.midcast_DebuffRemoval)
			end		
		end
		
	elseif spell.english == 'Erase' then equip(sets.midcast_DebuffRemoval)
	elseif spell.skill=='Enfeebling Magic' then	
		if spell.type=='BlackMagic' then equip(sets.enfebint)
		else equip(sets.enfebmnd) end 
	elseif spell.skill == 'Enhancing Magic' then
		if spell.english == 'Sneak' and spell.target.name == player.name then send_command('@wait 1;cancel 71;')
		elseif spell.english == 'Blink' then send_command('@wait 3;cancel 36;')
		elseif spell.english == 'Stoneskin' then 
			send_command('cancel 37')		
			equip(sets.midcast_Stoneskin)
		elseif spell.english:startswith('Regen') then	equip(sets.midcast_Regen)
		elseif spell.english == 'Haste' then equip(sets.hasting)	
		elseif spell.english == 'Flurry' then equip(sets.dynastyFC)	 
		elseif spell.english == 'Refresh' then equip(sets.dynastyFC)	
		elseif spell.english:startswith('Bar') then equip(sets.midcast_BarSpells)
		elseif spell.english:startswith('Protect') or spell.english:startswith('Shell') then equip(sets.midcast_EnhancingMagic)
		elseif spell.english:startswith('Boost') then equip(sets.dynastyFC)
		end
	elseif spell.english == 'Devotion' then equip(sets.devotion)
	elseif spell.english == 'Benediction' then equip(sets.midcast_Bene)
	elseif spell.type == 'WhiteMagic' then equip(sets.FC)
	elseif spell.type == 'BlackMagic' then equip(sets.FC)
	end	
end
function midcast(spell)
	if spell.skill=='Healing Magic' then	
		if spell.english:startswith('Cure') or spell.english:startswith("Curaga") then
			if world.weather_element == 'Light' or world.day_element == 'Light' then	equip(sets.midcast_CureObi)
			else equip(sets.midcast_Cure) 
			end
		end
	elseif conservespells:contains(spell.english) then equip(sets.conserveMP)
	elseif spell.english:startswith('Boost') then equip(sets.midcast_EnhancingMagic)
	elseif spell.skill=='Divine Magic' then equip(sets.divine)
	end
end	
function aftercast(spell)
		if spell.english:startswith('Divine') then		return
		elseif Cities:contains(world.area) then equip(sets.TownGear)
		elseif world.time >= 23*59 or world.time < 1*00 then equip(sets.gaiters)
		elseif windower.ffxi.get_mob_by_target('bt') then equip(sets.refresh)	
		elseif player.mp > 1200 then equip(sets.gaiters)
		else equip(sets.refresh)
		end
		if buffactive['Reraise'] or spell.english=='Reraise IV' then return
		else 
add_to_chat(57, tostring('YOU HAVE NO RERAISE!!!!!'))
add_to_chat(57, tostring('YOU HAVE NO RERAISE!!!!!'))
add_to_chat(57, tostring('YOU HAVE NO RERAISE!!!!!'))
		end

end
function status_change(new,tab)
	if new == 'Resting' then equip(sets['Resting'])
	elseif Cities:contains(world.area) then equip(sets.TownGear)
	elseif world.time >= 17*59 or world.time < 5*59 then equip(sets.gaiters)
	elseif windower.ffxi.get_mob_by_target('bt') then equip(sets.fail)
	elseif player.mp > 1200 then equip(sets.gaiters)
	else equip(sets.refresh)
	end
end
function buff_change(status,gain_or_loss)
    if status == "Sublimation: Complete" and gain_or_loss == true then 
		add_to_chat(10, tostring('Sublimation: Complete!'))
		end
end

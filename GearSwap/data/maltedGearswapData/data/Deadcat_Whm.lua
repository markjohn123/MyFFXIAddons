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


function get_sets()
sets.TownGear = {
main="Ababinili +1",
sub="Oneiros grip",
range="Impatiens",
body="Councilor's Garb",
hands="Dynasty Mitts",
legs="Assiduity pants +1",
feet="Piety Duckbills +1",
neck="Orison Locket",
waist="Fucho-no-Obi",
ear1="Andoaa Earring",
ear2="Moonshade Earring",
ring1="Janniston ring",
ring2="Lebeche ring",
back="Ogapepo Cape"
}

sets.refresh = {
main="Bolelabunga",
sub="Genbu's Shield",
ammo="Impatiens",
body="Witching Robe",
neck="Orison Locket",
head="Befouled Crown",
ear1="Nourishing Earring +1",
ear2="Moonshade Earring",
hands="Serpentes Cuffs",
ring1="Janniston ring",
ring2="Lebeche ring",
back="Ogapepo Cape",
waist="Fucho-no-obi",
legs="Assiduity pants +1",
feet="Serpentes Sabots"}

sets.Resting = {
main="Bolelabunga",
ammo="Impatiens",
neck="Orison Locket",
ear2="Moonshade Earring",
ear1="Magnetic Earring",
body="Vrikodara Jupon",
hands="Serpentes Cuffs",
ring1="Janniston ring",
ring2="Lebeche ring",
back="Ogapepo Cape",
waist="Fucho-no-obi",
legs="Assiduity pants +1",
feet="Serpentes Sabots"}

sets.FC = {
main="Bolelabunga",
sub="Genbu's Shield",
ammo="Incantor Stone",
head="Nahtirah Hat",
neck="Orison Locket",
ear1="Magnetic Earring",
ear2="Loquac. Earring",
body="Vrikodara Jupon",
hands="",
lring="Janniston ring",
rring="Prolix Ring",
back="Swith Cape",
waist="Witful Belt",
legs="Orvail Pants +1",
feet="Chelona Boots"}

sets.enfebmnd = {
main="Ababinili +1",
range="Hydrocera",
head="Nahtirah Hat",
neck="Imbodla Necklace",
ear1="Nourishing Earring +1",
ear2="Star Earring",
body="Vrikodara Jupon",
hands="Dynasty Mitts",
ring1="Perception Ring",
ring2="Lebeche ring",
back="Pahtli Cape",
waist="Witful Belt",
legs="Assiduity pants +1",
feet="Piety Duckbills +1",
sub="Oneiros grip"}

sets.midcast_BarSpells = {
main="Ababinili +1",
sub="Oneiros grip",
Ammo="Incantor stone",
head="Umuthi Hat",
body="Orison Bliaud +2",
hands="Ayao's Gages",
ring1="Janniston ring",
ring2="Prolix Ring",
legs="Cleric's Pantaloons",
waist="Cleric's Pantaloons",
back="Pahtli Cape",
feet="Piety Duckbills +1",
ear1="Andoaa Earring",
neck="Colossus's Torque",}

sets.midcast_EnhancingMagic = {
main="Beneficus",
sub="Genbu's Shield",
ammo="Impatiens",
neck="Colossus's Torque",
head="Umuthi Hat",
body="Hyksos Robe",
hands="Dynasty Mitts",
ring1="Janniston ring",
ring2="Prolix Ring",
legs="Portent Pants",
feet="Piety Duckbills +1",
waist="Siegel Sash",
back="Mending Cape",
ear1="Loquacious Earring",
ear2="Andoaa Earring",
back =""}

sets.midcast_Regen = set_combine(sets.FC,{
main="Bolelabunga",
body="Cleric's briault",
hands="Orison Mitts +2",
legs="Theophany pantaloons"})

sets.midcast_Cursna = {
main="Bolelabunga",
sub="Genbu's Shield",
Ammo="Impatiens",
neck="Malison medallion",
head="Nahtirah Hat",
body="Eirene's Manteel",
hands="Hieros Mittens",
ring1="Ephedra ring",
ring2="Ephedra ring",
legs="Theophany pantaloons",
feet="Piety Duckbills +1",
waist="Siegel Sash",
ear1="Loquacious Earring",
ear2="",
back ="Mending Cape"}

sets.cureFC = {
main="Ababinili +1",
sub="Oneiros grip",
ammo="Impatiens",
head="Theophany Cap",
neck="Orunmila's Torque",
ear1="Nourishing earring +1",
ear2="Loquacious Earring",
body="Heka's Kalasiris",
waist="Witful Belt",
hands="Gendewitha Gages",
ring1="Lebeche ring",
ring2="Prolix Ring",
back="Pahtli Cape",
legs="Ebers pantaloons",
feet="Cure Clogs"}

sets.midcast_Cure = {
main="ababinili +1",
sub="Oneiros grip",
ammo="Impatiens",
head="Orison cap +2",
neck="Colossus's Torque",
ear1="nourishing earring +1",
ear2="Loquacious Earring",
body="Theo. Briault",
waist="Witful Belt",
hands="Theophany mitts",
ring1="Lebeche ring",
ring2="Prolix Ring",
back="Pahtli Cape",
legs="Ebers pantaloons",
feet="Piety Duckbills +1"}

sets.midcast_Bene = {
Body="Piety Briault"}

sets.midcast_Stoneskin = {
main="Beneficus",
sub="Sors Shield",
Ammo="Impatiens",
neck="Stone Gorget",
head="Umuthi Hat",
body="Eirene's Manteel",
hands="Dynasty Mitts",
ring1="Lebeche ring",
ring2="Prolix Ring",
legs="Shedir Seraweels",
feet="Piety Duckbills +1",
waist="Siegel Sash",
ear1="Loquacious Earring",
ear2="Earthcry Earring",
back ="Merciful Cape"}
sets.conserveMP = {}

sets.midcast_DebuffRemoval = {
main="Yagrush",
sub="Sors Shield",
ammo="Impatiens",
head="Theo. Cap +1",
body="Eirene's Manteel",
hands="Orison Mitts +2",
legs="Ebers pantaloons",
feet="Piety Duckbills +1",
neck="Orunmila's Torque",
waist="Witful Belt",
left_ear="Novia Earring",
right_ear="Loquac. Earring",
left_ring="Lebeche ring",
right_ring="Prolix Ring",
back="Mending Cape"}

sets.dynastyFC = set_combine(sets.FC,{hands="Dynasty Mitts"}) --FastCast for enhancing
sets.raising = set_combine(sets.FC, {legs="Ebers Pantaloons"}) --Fast Cast for Raising
sets.enfebint = sets.enfebmnd --currently the same gear as mnd set
sets.midcast_CureObi = set_combine(sets.midcast_Cure,{waist="Korin Obi"}) --cure gear with korin obi
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
elseif spell.english:startswith('Regen') then equip(sets.midcast_Regen)
elseif spell.english == 'Haste' then equip(sets.dynastyFC)
elseif spell.english == 'Benediction' then equip(sets.midcast_Bene)
elseif spell.english == 'Flurry' then equip(sets.dynastyFC)
elseif spell.english == 'Refresh' then equip(sets.dynastyFC)
elseif resSpells:contains(spell.english) then equip(sets.midcast_BarSpells)
elseif spell.english:startswith('Protect') or spell.english:startswith('Shell') or spell.english:startswith('Boost') then equip(sets.midcast_EnhancingMagic)
end
end
end
function midcast(spell)
if spell.skill=='Healing Magic' then
if spell.english:startswith('Cure') or spell.english:startswith("Curaga") then
if world.weather_element == 'Light' or world.day_element == 'Light' then equip(sets.midcast_CureObi)
else equip(sets.midcast_Cure)
end
end
end
end
function aftercast(spell)
if spell.english:startswith('Divine') then return
elseif Cities:contains(world.area) then equip(sets.TownGear)
else equip(sets.refresh)
end
end
function status_change(new,tab)
if new == 'Resting' then
equip(sets['Resting'])
elseif Cities:contains(world.area) then equip(sets.TownGear)
else equip(sets.refresh)
end
end

function user_buff_change(buff, gain, eventArgs)
if buff:lower() == 'weakness' then
if gain then
send_command('timers create "Weakness" 300 up abilities/00255.png')
else
send_command('timers delete "Weakness"')
end
end
end
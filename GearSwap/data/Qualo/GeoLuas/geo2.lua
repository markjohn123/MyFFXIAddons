function get_sets()
    mote_include_version = 2
    include('organizer-lib')
    include('Mote-Include.lua')
end
  
function job_setup()
    indi_timer = ''
    indi_duration = 324
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')
  
    state.MagicBurst = M(false, 'Magic Burst')
  
    gear.default.weaponskill_waist = "Fotia Belt"
  
    select_default_macro_book()
  
    custom_timers = {}
end
  
-------------------------------------------------------------------------------
  
function init_gear_sets()
  
--------------------------[Job Ability sets]------------------------------
  
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +1"}
    sets.precast.JA['Full Circle'] = {head="Azimuth hood +1",hands="Bagua Mitaines +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua sandals +1"}
  
--------------------------[Fast Cast sets]------------------------------
  
    sets.precast.FC = {main="Solstice",sub="Genmei shield",range=empty,ammo="Sapience orb",
        head=gear.FC_head,neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious Earring",
        body="Anhur Robe",hands="Helios gloves",ring1="Prolix Ring",ring2="Weatherspoon Ring",
        back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants +1",feet=gear.MB_feet }
  
    sets.precast.FC.Stun = {main="Solstice",sub="Genmei shield",range=empty,ammo="Sapience orb",
        head=gear.FC_head,neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious earring",
        body="Shango Robe",hands="Helios gloves",ring1="Prolix Ring",ring2="Weatherspoon Ring",
        back="Lifestream Cape",waist="Witful Belt",legs="Geomancy pants +1",feet=gear.MB_feet }
  
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's shield",
        body="Heka's Kalasiris",
        back="Pahtli Cape",legs="Doyen pants",feet="Vanya clogs"})
  
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {ear2="Barkarole earring",
        hands="Bagua Mitaines +1"})
  
--------------------------[Weaponskill sets]------------------------------
  
    sets.precast.WS = {
        head="Befouled crown",neck="Fotia gorget",ear1="Zennaroi Earring",ear2="Brutal Earring",
        body="Onca Suit",hands=empty,ring1="Rajas Ring",ring2="Petrov Ring",
        back="Refraction cape",waist="Fotia Belt",legs=empty,feet=empty }
  
  
    sets.precast.WS['Flash Nova'] = {range=empty,ammo="Dosis Tathlum",
        head=gear.nuke_head,neck="Fotia gorget",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Amalric doublet",hands="Helios gloves",ring1="Shiva Ring +1",ring2="Weatherspoon Ring",
        back="Toro Cape",waist="Fotia Belt",legs=gear.MB_legs,feet=gear.nuke_feet }
  
    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}
  
    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}
  
--------------------------[Midcast sets]------------------------------
  
    sets.midcast.FastRecast = {main="Solstice",sub="Genmei shield",range=empty,ammo="Sapience orb",
        head=gear.FC_head,neck="Voltsurge torque",ear1="loquacious earring",ear2="Enchanter earring +1",
        body="Shango robe",hands="Helios gloves",ring1="Prolix ring",ring2="Weatherspoon ring",
        back="Swith cape +1",waist="Ninurta's sash",legs="Geomancy Pants +1",feet=gear.nuke_feet }
  
    sets.midcast.Stun = {main="Solstice",sub="Genmei shield",range=empty,ammo="Sapience orb",
        head=gear.FC_head,neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious earring",
        body="Shango Robe",hands="Helios gloves",ring1="Prolix Ring",ring2="Weatherspoon Ring",
        back="Lifestream Cape",waist="Witful Belt",legs="Geomancy pants +1",feet=gear.MB_feet }
  
--------------------------[Geomancy sets]------------------------------
  
    sets.midcast.Geomancy = {main="Solstice",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Azimuth hood +1",neck="Incanter's Torque",ear1="Gifted Earring",ear2="Calamitous earring",
        body="Azimuth Coat +1",hands="Geomancy mitaines +1",
        back="Lifestream Cape",waist="Pythia sash +1",legs="Azimuth tights +1",feet="Azimuth gaiters +1"}
  
    sets.midcast.Geomancy.Indi = {main="Solstice",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Azimuth Hood +1",neck="Incanter's torque",ear1="Gifted Earring",ear2="Calamitous earring",
        body="Azimuth Coat +1",hands="Geomancy mitaines +1",
        back="Lifestream Cape",waist="Pythia sash +1",legs="Bagua pants +1",feet="Azimuth gaiters +1"}
  
--------------------------[Some White Magic sets]------------------------------
  
    sets.midcast.Cure = {main="Tamaxchi",sub="Genmei shield",
        head="Telchine cap",neck="Incanter's torque",ear1="Gifted earring",ear2="Beatific earring",
        body="Heka's kalasiris",hands="Telchine gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
        back="Swith Cape +1",waist="Pythia sash +1",legs="Geomancy Pants +1",feet="Vanya clogs"}
      
    sets.midcast.Curaga = sets.midcast.Cure
  
    sets.midcast['Enhancing Magic'] = {
        head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa earring",
        body="Telchine Chas.",hands="Telchine gloves",
        back="Fi follet cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
      
    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",sub="Genmei shield"})
      
    sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'], 
        {ammo="Sapience orb",
        neck="Voltsurge torque",ear1="Enchanter earring +1",ear2="Loquacious earring",
        ring1="Prolix ring",
        back="Swith cape +1",waist="Ninurta's sash"})
  
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'],{head="Amalric coif"})
  
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'],
        {head="Amalric coif",
        waist="Emphatikos Rope"})   
  
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
  
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
  
--------------------------[Black Magic sets & Magic burst set]------------------------------
  
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Genmei shield",range=empty,ammo="Pemphredo tathlum",
        head="Bagua galero +1",neck="Incanter's Torque",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Shango robe",hands="Amalric gages",ring1="Evanescence Ring",ring2="Archon Ring",
        back="Perimede Cape",waist="Fucho-no-obi",legs="Azimuth tights +1",feet=gear.DA_feet }
  
    sets.midcast['Drain'] = set_combine(sets.midcast['Dark Magic'], {head="Pixie Hairpin +1", legs=gear.DA_legs })
  
    sets.midcast['Aspir'] = sets.midcast['Drain']
  
    sets.midcast['Enfeebling Magic'] = {main="Solstice",sub="Genmei shield", ammo="Pemphredo tathlum",
        head=gear.nuke_head, neck="Incanter's torque", ear1="Gwati earring", ear2="Enchanter earring +1",
        body="Shango Robe", hands="Helios gloves", ring1="Weatherspoon Ring", ring2="Sangoma Ring",
        back="Lifestream cape", waist="Rumination sash", legs="Psycloth lappas", feet="Bagua sandals +1" }
  
    sets.midcast['Elemental Magic'] = {main="Solstice",sub="Genmei shield",range=empty,ammo="Pemphredo tathlum",
        head=gear.nuke_head,neck="Saevus pendant +1",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body=gear.nuke_body,hands="Amalric gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Refoccilation Stone",legs=gear.nuke_legs,feet=gear.nuke_feet }
  
    sets.midcast['Elemental Magic'].Resistant = {main="Solstice",sub="Genmei shield",range=empty,ammo="Pemphredo tathlum",
        head=gear.nuke_head,neck="Sanctity Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
        body=gear.nuke_body,hands="Amalric gages",ring1="Weatherspoon Ring",ring2="Shiva Ring +1",
        back="Toro Cape",waist="Eschan Stone",legs=gear.nuke_legs,feet=gear.nuke_feet }
  
    sets.midcast.Impact = {main="Solstice",sub="Genmei shield",range=empty,ammo="Pemphredo Tathlum",
        head=empty,neck="Sanctity necklace",ear1="Barkarole Earring",ear2="Gwati Earring",
        body="Twilight Cloak",hands="Amalric gages",ring1="Shiva Ring +1",ring2="Archon Ring",
        back="Toro cape",waist="Eschan Stone",legs=gear.nuke_legs,feet=gear.nuke_feet }
  
    sets.magic_burst = {main="Solstice", sub="Genmei shield",
        head=gear.MB_head,neck="Mizukage-no-Kubikazari",
        hands="Amalric gages", ring1="Mujin Band",
        back="Seshaw cape",legs=gear.MB_legs,feet=gear.MB_feet }
  
--------------------------[Idle sets]------------------------------
  
    sets.resting = {main="Bolelabunga",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled Crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Infused Earring",
        body="Geomancy tunic +1",hands="Bagua Mitaines +1",ring1="Shneddick Ring",ring2="Defending Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Assiduity Pants +1",feet="Azimuth gaiters +1"}
  
    sets.idle = {main="Bolelabunga",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled Crown",neck="Sanctity Necklace",ear1="Sanare Earring",ear2="Genmei Earring",
        body="Geomancy tunic +1",hands="Bagua Mitaines +1",ring1="Defending Ring",ring2=gear.DarkRing.PDT,
        back="Solemnity Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Azimuth gaiters +1"}
  
    sets.idle.PDT = {main="Solstice",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Genmei Earring",
        body="Vrikodara jupon",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2=gear.DarkRing.PDT,
        back="Solemnity Cape",waist="Slipor sash",legs="Assiduity pants +1",feet="Azimuth gaiters +1"}
  
    sets.idle.Town = {main="Solstice",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Azimuth Hood +1",neck="Loricate Torque",ear1="Sanare Earring",ear2="Infused Earring",
        body="Azimuth coat +1",hands="Bagua Mitaines +1",ring1=gear.DarkRing.PDT,ring2="Defending Ring",
        back="Solemnity Cape",waist="Slipor Sash",legs="Assiduity Pants +1",feet="Herald's gaiters"}
  
    sets.idle.Weak = {main="Bolelabunga",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Genmei Earring",
        body="Vrikodara jupon",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2=gear.DarkRing.PDT,
        back="Solemnity cape",waist="Slipor sash",legs="Doyen Pants",feet="Azimuth gaiters +1"}
  
-------------------------[When Luopan is present]-----------------------------------    
  
    sets.idle.Pet = {main="Solstice",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Azimuth Hood +1",neck="Loricate Torque",ear1="Handler's Earring",ear2="Handler's Earring +1",
        body="Amalric doublet",hands="Geomancy Mitaines +1",ring1="Defending Ring",ring2=gear.DarkRing.PDT,
        back="Lifestream cape",waist="Isa Belt",legs="Assiduity Pants +1",feet="Bagua Sandals +1"}
  
    sets.idle.PDT.Pet = set_combine(sets.idle.Pet, 
        {body="Vrikodara jupon",
        legs="Psycloth lappas"})
  
--------------------------[When Indicolure spell is active]------------------------------    
  
    sets.idle.Indi = set_combine(sets.idle, {neck="Loricate torque"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {feet="Azimuth gaiters +1"})
  
--------------------------[Defense Sets]------------------------------    
  
    sets.defense.PDT = {main="Mafic Cudgel",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Genmei Earring",
        body="Onca Suit",hands=empty,ring1="Defending Ring",ring2=gear.DarkRing.PDT,
        back="Solemnity cape",waist="Slipor Sash",legs=empty,feet=empty }
  
    sets.defense.MDT = {main="Bolelabunga",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled crown",neck="Loricate Torque",ear1="Sanare Earring",ear2="Zennaroi Earring",
        body="Onca Suit",hands=empty,ring1="Defending Ring",ring2="Archon Ring",
        back="Solemnity cape",waist="Slipor Sash",legs=empty,feet=empty }
  
--------------------------[Misc. sets]------------------------------    
  
    sets.Kiting = {feet="Herald's gaiters"}
  
    sets.latent_refresh = {waist="Fucho-no-obi"}
  
--------------------------[Engaged set(s)]------------------------------    
  
    sets.engaged = {main="Solstice",sub="Genmei shield",range="Dunna",ammo=empty,
        head="Befouled crown",neck="Lissome necklace",ear1="Zennaroi Earring",ear2="Brutal Earring",
        body="Onca Suit",hands=empty,ring1="Defending Ring",ring2="Rajas Ring",
        back="Solemnity Cape",waist="Eschan Stone",legs=empty,feet=empty }
  
end
  
--------------------------[Job functions]------------------------------    
  
--------------------------[Standard events]------------------------------    
  
function job_precast(spell, action, spellMap, eventArgs)
if spell.english == "Impact" then
                                equip(set_combine(sets.precast.FC,{head=empty,body="Twilight Cloak"}))
                    end
end
function job_post_midcast(spell, action, spellMap, eventArts)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
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
    elseif spell.skill == 'Enhancing Magic' then
            --adjust_timers(spell, spellMap)
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    if spell.skill == 'Elemental Magic' then
            ---state.MagicBurst:reset()
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end
  
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
        if newValue == 'Normal' then
            disable('main','sub','range','ammo')
        else
            enable('main','sub','range','ammo')
        end
    end
end
  
--------------------------[Maps Indi- spells and enfeebles]------------------------------    
  
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
  
-----------------------------------------------------------------------------------   
  
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end
  
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end
  
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end
  
-------------------------------------------------------------------------------    
  
function select_default_macro_book()
    set_macro_page(1, 6)
end
  
--------------------------[Custom Buff timers]**deprecated as timers accounts for this now**------------------------------    
  
--[[function adjust_timers(spell, spellMap)
  
    local current_time = os.time()
    local temp_timer_list = {}
    local dur = calculate_duration(spell, spellName, spellMap)
  
         custom_timers[spell.name] = nil
         send_command('timers delete "'..spell.name..' ['..spell.target.name..']"')
         custom_timers[spell.name] = current_time + dur
         send_command('timers create "'..spell.name..' ['..spell.target.name..']" '..dur..' down')
end
  
function calculate_duration(spell, spellName, spellMap)
    local mult = 1.00
  
    if player.equipment.Head == 'Telchine Cap' then mult = mult + 0.09 end
    if player.equipment.Body == 'Telchine Chas.' then mult = mult + 0.09 end
    if player.equipment.Hands == 'Telchine Gloves' then mult = mult + 0.09 end
    if player.equipment.Legs == 'Telchine Braconi' then mult = mult + 0.09 end
    if player.equipment.Feet == 'Telchine Pigaches' then mult = mult + 0.08 end
      
    if player.equipment.Feet == 'Estq. Houseaux +2' then mult = mult + 0.20 end
    if player.equipment.Legs == 'Futhark Trousers' then mult = mult + 0.10 end
    if player.equipment.Legs == 'Futhark Trousers +1' then mult = mult + 0.20 end
    if player.equipment.Hands == 'Atrophy Gloves' then mult = mult + 0.15 end
    if player.equipment.Hands == 'Atrophy Gloves +1' then mult = mult + 0.16 end
    if player.equipment.Back == 'Estoqueur\'s Cape' then mult = mult + 0.10 end
    if player.equipment.Hands == 'Dynasty Mitts' then mult = mult + 0.05 end
    if player.equipment.Body == 'Shabti Cuirass' then mult = mult + 0.09 end
    if player.equipment.Body == 'Shabti Cuirass +1' then mult = mult + 0.10 end
    if player.equipment.Feet == 'Leth. Houseaux' then mult = mult + 0.25 end
    if player.equipment.Feet == 'Leth. Houseaux +1' then mult = mult + 0.30 end
    if player.equipment.Head == 'Erilaz Galea' then mult = mult + 0.10 end
    if player.equipment.Head == 'Erilaz Galea +1' then mult = mult + 0.15 end
  
    local base = 0
  
    if spell.name == 'Haste' then base = base + 180 end
    if spell.name == 'Stoneskin' then base = base + 300 end
    if spell.name:startswith("Bar") then base = base + 480 end
    if spell.name == 'Blink' then base = base + 300 end
    if spell.name == 'Aquaveil' then base = base + 600 end
    if string.find(spell.english,'storm') then base = base + 180 end
    if spell.name == 'Auspice' then base = base + 180 end
    if spell.name:startswith("Boost") then base = base + 300 end
    if spell.name == 'Phalanx' then base = base + 180 end
    if spell.name:startswith("Protect") then base = base + 1800 end
    if spell.name:startswith("Shell") then base = base + 1800 end
    if spell.name:startswith("Refresh") then base = base + 150 end
    if spell.name:startswith("Regen") then 
        base = base + 60
        if buffactive['Light arts'] and player.main_job == 'SCH' then
            base = base*2+60
        -----the *2 here is the additional 60sec from Light Arts job points maxed
        -----+48 is from light arts, +12 more from telchine chas.
        elseif player.main_job == 'WHM' then
            base = base + 60
            if player.equipment.Hands == 'Ebers Mitts' then 
                base = base +  20
            elseif player.equipment.Hands == 'Ebers Mitts +1' then 
                base = base + 22
            end
            if player.equipment.Legs == 'Theo. Pantaloons' or player.equipment.Legs == 'Theo. Pant. +1' then
                base = base + 18
            end
        end
    end
    if spell.name == 'Adloquium' then base = base + 180 end
    if spell.name:startswith("Animus") then base = base + 180 end
    if spell.name == 'Crusade' then base = base + 300 end
    if spell.name == 'Embrava' then base = base + 90 end
    if spell.name:startswith("En") then base = base + 180 end
    if spell.name:startswith("Flurry") then base = base + 180 end
    if spell.name == 'Foil' then base = base + 30 end
    if spell.name:startswith("Gain") then base = base + 180 end
    if spell.name == 'Reprisal' then base = base + 60 end
    if spell.name:startswith("Temper") then base = base + 180 end
    if string.find(spell.english,'Spikes') then base = base + 180 end
  
    if buffactive['Perpetuance'] then
        if player.equipment.Hands == 'Arbatel Bracers' then
            mult = mult*2.5
        elseif player.equipment.Hands == 'Arbatel Bracers +1' then
            mult = mult*2.55
        else
            mult = mult*2
        end
    end
  
    if buffactive['Composure'] then
        if spell.target.type == 'SELF' then
            mult = mult*3
        else
            mult = mult
        end
    end         
              
  
    local totalDuration = math.floor(mult*base)
  
    --print(totalDuration)
  
  
    return totalDuration
  
end
  
function reset_timers()
  
    for i,v in pairs(custom_timers) do
  
        send_command('timers delete "'..i..'"')
  
    end
  
    custom_timers = {}
  
end]]
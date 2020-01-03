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
    indi_duration = 255
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal','Accuracy','Dual')
    state.CastingMode:options('Normal','Accuracy')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
     
    gear.default.obi_waist = "yamabuki-no-obi"
    gear.default.obi_back = "Toro Cape"
    gear.default.obi_ring = "Shiva Ring"
     
    select_default_macro_book()
     
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
 
    --------------------------------------
    -- Precast sets
    --------------------------------------
 
    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic +1",
    head="Azimuth hood +1"
    }
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines +1"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
    sets.precast.JA['Primal Zeal'] = {head="Bagua galero +1"}   
    sets.precast.JA['Cardinal Chant'] = {head="geomancy galero +1"}
 
 
    -- Fast cast sets for spells
 
    sets.precast.FC = {
    main="Marin staff +1",
    sub="vivid strap",
    head="Nahtirah Hat",
    body="Vanir Cotehardie",
    hands="Helios Gloves",
    legs="Geo. Pants +1",
    feet="Regal Pumps +1",
    neck="Jeweled Collar",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="lebeche Ring",
    back="Lifestream Cape",
}
 
    sets.precast.FC.Cure = set_combine(sets.precast.FC, {
    main="Vejovis Wand +1",
    sub="Genbu's Shield",
    body="Heka's Kalasiris",
    waist="Acerbic Sash +1",
    back="Pahtli Cape",
})
 
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
    head="Umuthi Hat",
    hands="Carapacho Cuffs",
    waist="Siegel Sash",
})  
 
     
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
    main="Ngqoqwanb",
    hands="Bagua Mitaines +1",
    neck="Stoicheion Medal",
})
 
    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})
     
     
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
    ammo="Hasty Pinion +1", 
    head="telchine cap",
    body="helios jacket",
    hands="telchine Gloves",
    legs="telchine braconi",
    feet="telchine pigaches",
    neck="fotia Gorget",
    waist="fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Brutal Earring",
    left_ring="levia. Ring",
    right_ring="levia. Ring",
    back="Refraction Cape",
}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
         
        sets.precast.WS['Flash Nova'] = set_combine(sets.precast.WS,{   
    ammo="Memoria sachet",
    head="Helios Bandt",
    body="Azimuth Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="helios Boots",
    neck="Eddy Necklace",
    waist="yamabuki-no-obi",
    left_ear="Friomisi Earring",
    right_ear="crematio Earring",
    left_ring="Shiva Ring",
    right_ring=gear.ElementalRing,
    back=gear.ElementalCape,})
         
        sets.precast.WS['Black Halo'] = sets.precast.WS['Flash Nova']
     
             
    sets.precast.WS['Aeolian Edge'] = set_combine(sets.precast.WS['Flash Nova'],{back="Kaikias' cape",})    
 
sets.precast.WS['Gust Slash'] =sets.precast.WS['Flash Nova']
             
    sets.precast.WS['Starlight'] = sets.precast.WS['Flash Nova']
 
    sets.precast.WS['Moonlight'] = sets.precast.WS['Flash Nova']
         
 
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
    -- Base fast recast for spells
    sets.midcast.FastRecast =set_combine(sets.midcast.fastcast) 
 
sets.midcast.Regen = set_combine(sets.midcast.fastcast, {
    main="bolelabunga",
    body="Telchine Chas."})
     
    sets.midcast['Enhancing Magic']={
    main="Kirin's Pole",
    sub="Fulcio Grip",
    head="Umuthi Hat",
    hands="bagua mitaines +1",
    body={ name="Telchine Chas.", augments={'Mag. Acc.+12 "Mag.Atk.Bns."+12','"Conserve MP"+4','Enh. Mag. eff. dur. +4',}},
    legs="bagua Pants +1",
    feet="helios Boots",
    neck="Colossus's Torque",
    waist="Cascade Belt",
    left_ear="Andoaa Earring",
    right_ear="Magnetic Earring",
    back="Merciful Cape",
}
     
    sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {
    back="grapevine cape"})
 
    sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {
    waist="Emphatikos rope"})
 
    sets.midcast.Geomancy ={
    main="Venabulum",
    sub="Wizzan Grip",
    range="Dunna",
    head="Azimuth hood +1",
    body="Bagua Tunic +1",
    hands="Geo. Mitaines +1",
    legs="azimuth tights  +1",
    feet="azimuth gaiters +1",
    waist="Austerity Belt +1",
    left_ear="magnetic Earring",
    right_ear="Gifted Earring",
    right_ring="Renaye Ring",
    back="Lifestream Cape",
}
     
    sets.midcast.Geomancy.Indi =set_combine(sets.midcast.Geomancy, {legs="bagua pants +1"})
 
 
    sets.midcast.Cure = {
    main="Tamaxchi",
    sub="Genbu's Shield",
    head="Geomancy galero +1",
    body="Heka's Kalasiris",
    hands="telchine Gloves",
    legs="Mes'yohi slacks",
    feet="Regal Pumps +1",
    neck="Colossus's Torque",
    waist="Hachirin-No-Obi",
    left_ear="Gifted Earring",
    right_ear="Magnetic Earring",
    left_ring="Sirona's Ring",
    right_ring=gear.ElementalRing,
    back=gear.ElementalCape,
}
         
        sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
    neck="Stone Gorget",
    waist="siegel sash",
    right_ear="Earthcry Earring",
})  
             
    sets.midcast.Curaga = sets.midcast.Cure
 
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
 
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
 
        -- Custom Spell Classes
    sets.midcast['Enfeebling Magic'] = {
    main="Marin staff +1",
    sub="Mephitis Grip",
    ammo="Memoria sachet",
    head="Artsieq Hat",
    body="Ischemia Chasu.",
    hands="azimuth gloves +1",
    legs="Mes'yohi slacks",
    feet="bagua sandals +1",
    neck="imbodla necklace",
    waist="yamabuki-no-obi",
    left_ear="Gwati Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="lifestream Cape",
}
 
    sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {
     
})  
 
    sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
 
    sets.midcast['Dark Magic'] = {
    main="Marin staff +1",
    sub="Caecus Grip",
    ammo="Memoria sachet",
    head="Pixie hairpin +1",
    body="Geo. Tunic +1",
    hands="azimuth gloves +1",
    legs="Azimuth Tights +1",
    feet="helios Boots",
    neck="Aesir Torque",
    waist="Yamabuki-no-Obi",
    left_ear="Abyssal Earring",
    right_ear="Gwati Earring",
    left_ring="shiva Ring",
    right_ring="sangoma Ring",
    back="Merciful Cape",
}
         
        sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
    waist="Austerity Belt +1",
    left_ear="Abyssal Earring",
    right_ear="Hirudinea Earring",
    right_ring="Excelsis Ring",
})
     
    sets.midcast.Aspir = sets.midcast.Drain
     
 
 
    sets.midcast.Stun = sets.precast.FC
             
 
            sets.midcast.Bolster = {body="Bagua Tunic +1"}
        sets.midcast['Life Cycle'] = {body="Geo. Tunic +1",
    head="Azimuth hood +1"}
        sets.midcast['Mending Halation'] = {legs="Bagua Pants +1"}
        sets.midcast['Radial Arcana'] = {feet="Bagua Sandals +1"}
        sets.midcast.Bolster.Pet = {body="Bagua Tunic +1"}
        sets.midcast['Life Cycle'].Pet = {body="Geo. Tunic +1",
    head="Azimuth hood +1"}
        sets.midcast['Mending Halation'].Pet = {legs="Bagua Pants +1"}        sets.midcast.Bolster.Pet.Indi = {body="Bagua Tunic +1"}
        sets.midcast['Life Cycle'].Pet.Indi = {body="Geo. Tunic +1",
    head="Azimuth hood +1"}
        sets.midcast['Mending Halation'].Pet.Indi = {legs="Bagua Pants +1"}
 
          -- Elemental Magic sets
     
    sets.midcast['Elemental Magic']= {
    main="Marin Staff +1",
    sub="elder's Grip +1",
    ammo="ghastly tathlum",
    head="Helios Band",
    body="Azimuth Coat +1",
    hands="Hagondes Cuffs +1",
    legs="Hagondes Pants +1",
    feet="Helios Boots",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Friomisi Earring",
    right_ear="crematio Earring",
    left_ring="shiva Ring",
    right_ring=gear.ElementalRing,
    back=gear.ElementalCape,
}
 
    sets.midcast['Elemental Magic']['Accuracy']=set_combine(sets.midcast['Elemental Magic'], {
})
       sets.midcast.Impact = {
    main="Marin staff +1",
    sub="Elder's Grip +1",
    ammo="Memoria sachet",
    head=empty,
    body="Twilight Cloak",
    hands="azimuth gloves +1",
    legs="Azimuth Tights +1",
    feet="Helios Boots",
    neck="Eddy Necklace",
    waist=gear.ElementalObi,
    left_ear="Gwati Earring",
    right_ear="Crematio Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Toro Cape",
}   
     
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
 
    -- Resting sets
    sets.resting = {
    main="Bolelabunga",
    sub="Genbu's Shield",
    range="Dunna",
    body="Respite Cloak",
    hands="Bagua Mitaines +1",
    legs="Assid. Pants +1",
    feet="Geo. Sandals +1",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Sheltered Ring",
    right_ring="Renaye Ring",
    back="Kumbira Cape",
}
 
 
    -- Idle sets
 
    sets.idle = sets.resting
 
    sets.idle.PDT = {
    main="Mafic cudgel",
    sub="Genbu's Shield",
        head="Hagondes Hat +1",
        neck="Twilight Torque",
        ear1="Merman's Earring",
        ear2="Merman's Earring",
        body="Hagondes Coat +1",
        hands="hagondes cuffs +1",
        ring1="shadow Ring",
        ring2="dark Ring",
        back="shadow mantle",
        waist="Flax Sash",
        legs="hagondes Pants +1",
        feet="hagondes sabots +1"}
         
        sets.idle.MDT = set_combine(sets.idle.PDT, {
    main="marine staff +1",
    sub="vallus grip",})    
 
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = set_combine(sets.resting, {main={ name="Nehushtan", augments={'Pet: DEF+13','Pet: "Regen"+3','STR+15 CHR+15',}},
    sub="Genbu's Shield",
    head="Azimuth hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Regen"+2',}},
    legs="helios spats",
    hands={ name="Helios Gloves", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: "Regen"+3',}},
    feet="Bagua Sandals +1",
    waist="Isa Belt",
    back="Lifestream Cape",
    ear1="Handler's Earring +1",
})
 
    sets.idle.PDT.Pet = set_combine(sets.idle.PDT, {main={ name="Nehushtan", augments={'Pet: DEF+13','Pet: "Regen"+3','STR+15 CHR+15',}},
    sub="Genbu's Shield",
    head="Azimuth hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Regen"+2',}},
      hands={ name="Helios Gloves", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: "Regen"+3',}},
    legs="helios spats",
    feet="Bagua Sandals +1",
    waist="Isa Belt",
    back="Lifestream Cape",
    ear1="Handler's Earring +1",
})
 
    sets.idle.MDT.Pet = set_combine(sets.idle.MDT, {main={ name="Nehushtan", augments={'Pet: DEF+13','Pet: "Regen"+3','STR+15 CHR+15',}},
    sub="Genbu's Shield",
    head="Azimuth hood +1",
    body={ name="Telchine Chas.", augments={'Pet: Accuracy+18 Pet: Rng. Acc.+18','Pet: "Regen"+2',}},
      hands={ name="Helios Gloves", augments={'Pet: Accuracy+19 Pet: Rng. Acc.+19','Pet: "Regen"+3',}},
    legs="helios spats",
    feet="Bagua Sandals +1",
    waist="Isa Belt",
    back="Lifestream Cape",
    ear1="Handler's Earring +1",
})
 
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = sets.resting
     
    sets.idle.PDT.Indi = sets.idle.PDT
     
    sets.idle.MDT.Indi = sets.idle.MDT
      
    sets.idle.PDT.Pet.Indi = sets.idle.PDT.Pet
     
    sets.idle.MDT.Pet.Indi = sets.idle.MDT.Pet
 
    sets.idle.Town = {
    main="Nodal Wand",
    sub="Genbu's Shield",
    range="Dunna",
    head="Azimuth Hood +1",
    body="Azimuth Coat +1",
    hands="Azimuth Gloves +1",
    legs="Azimuth Tights +1",
    feet="Azimuth Gaiters +1",
    neck="Twilight Torque",
    waist="Fucho-no-Obi",
    left_ear="Merman's Earring",
    right_ear="Merman's Earring",
    left_ring="Sheltered Ring",
    right_ring="Renaye Ring",
    back="Lifestream Cape",
}
 
    sets.idle.Weak = sets.resting
 
    -- Defense sets
 
    sets.defense.PDT = sets.idle.PDT
 
    sets.defense.MDT = sets.idle.MDT
 
    sets.Kiting = {feet="Geo. Sandals +1"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
     
     
 
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 
    -- Normal melee group
    sets.engaged = {
    main={ name="Nehushtan", augments={'Accuracy+7 Attack+7','"Dbl.Atk."+3','DMG:+20',}},
    sub="Genbu's Shield",
    ammo="Hasty Pinion +1",
    head="telchine cap",
    body="helios jacket",
    hands="telchine gloves",
    legs="telchine braconi",
    feet="telchine pigaches",
    neck="Asperity Necklace",
    waist="cetl Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="rajas Ring",
    right_ring="k'ayres ring",
    back="Kayapa Cape",
}
 
    sets.engaged.Accuracy = set_combine(sets.engaged,{
    neck="Iqabi Necklace",
    right_ear="Zennaroi Earring",
    waist="Olseni Belt",
    left_ring="supershear EarRing",
    right_ring="beeline ring",
}   )   
 
    sets.engaged.Dual = set_combine(sets.engaged,{
    sub="Tamaxchi",
    left_ear="Heartseeker Earring",
    right_ear="Dudgeon Earring",
    waist="shetal stone",
}   )
    --------------------------------------
    -- Custom buff sets
    --------------------------------------
 
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
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
        if newValue == 'Dual' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end
 
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' then
        if spell.element == 'Earth' then
            equip(sets.midcast['Elemental Magic'], {neck="Quanpur Necklace"})
        elseif spell.element == 'Ice' then
            equip(sets.midcast['Elemental Magic'], {main="Ngqoqwanb"})  
        elseif spell.element == 'Wind' then
            equip(sets.midcast['Elemental Magic'], {Main="Marin Staff +1", Back="Kaikias' Cape"})
        end
         
 
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip(sets.midcast['Elemental Magic'], {waist="Hachirin-No-Obi"})
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
            elseif spell.skill == 'Elemental Magic' then
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
 
-- MAKE A MACRO : /tell <me> check
function open_coffer()
    CofferType = "Velkk Coffer"
    if player.inventory[CofferType] then
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
    nextcommand = nextcommand .. 'input /tell '..player.name..' check'
    send_command(nextcommand)
    else
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ Inventory('..bag..'/'..max..') ] *-*-*-*-*-*-*-*-*')
    end
    else
        add_to_chat(204, '*-*-*-*-*-*-*-*-* [ No '..CofferType..' in inventory ] *-*-*-*-*-*-*-*-*')
    end
end
 
 
windower.register_event('chat message', function(original, sender, mode, gm)
    local match
 
                if sender == player.name then
                    if original == "check" then
                        open_coffer()
                    end
                end
 
    return sender, mode, gm
end)
 
-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 1)
end[table]
[/table]

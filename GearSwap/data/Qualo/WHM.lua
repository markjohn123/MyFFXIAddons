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

send_command('alias baseb input /ma "Shellra V" <me>;wait 5.3;input /ma "Protectra V" <me>;wait 5.3;input /ma "Haste" <me>;wait 5.2;wait 3.2;input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')



-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.


function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
	-- sneak in command to load healbot
        send_command('@input //lua load healbot')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false

end

function init_gear_sets()

    -- Standard WHM Gear used in multiple places

        gsWHM = {}
        gsWHM.main = {name="Bolelabunga"}
        gsWHM.Genbu = {name="Genbu's Shield"}
        gsWHM.head = {name="Nahtirah Hat"}
        gsWHM.neck = {name="Imbodia Necklace"}
        gsWHM.hand = {name="Telchine Gloves"}
        gsWHM.body = {name="Ebers Bliaud"}
        gsWHM.legs = {name="Assiduity Pants +1"}
        gsWHM.feet = {name="Regal Pumps +1"}
        gsWHM.ring1 = {name="Ephedra Ring"}
        gsWHM.ring2 ={name="Sirona's Ring"}
        gsWHM.back = {name="Mending Cape"}

        gsWHM.FC = {}
        gsWHM.FC.main = {name="Marin Staff"}
        gsWHM.FC.head = {name="Nahtirah Hat"}
        gsWHM.FC.body = {name="Rosette Jaseran"}
        gsWHM.FC.hand = {name="Fanatic Gloves"}
        gsWHM.FC.legs = {name="Kayhaus Tights"}
        gsWHM.FC.feet = {name="Regal Pumps +1"}
        gsWHM.FC.ear1 = {name="Loquacious Earring"}
        gsWHM.FC.waist = {name="Channeler's Stone"}


        gsWHM.CP = {}
        gsWHM.CP.main = {name="Tamaxchi"}
        gsWHM.CP.sub = {name="Genbu's Shield"}
        gsWHM.CP.head = {name="Vanya Hood"}
        gsWHM.CP.hand = {name="Telchine Gloves"}
        gsWHM.CP.body = {name="Vanya Robe"}
        gsWHM.CP.feet = {name="Vanya Clogs"}
        gsWHM.CP.ring1 = {name="Ephedra Ring"}
        gsWHM.CP.ring2 ={name="Sirona's Ring"}
        gsWHM.CP.ear1= {name="Nourishing Earring"}
        gsWHM.CP.ear2= {name="Mendicant's Earring"}
        gsWHM.CP.back = {name="Mending Cape"}


        gsWHM.HMP = {}
        -- refresh gear or hmp
        gsWHM.HMP.waist = {name="Cleric's Belt"}
        gsWHM.HMP.neck = {name="Beak Necklace"}
        gsWHM.HMP.body = {name="Ebers Bliaud"}
        gsWHM.HMP.Main = {name="Chatoyant Staff"}
        gsWHM.HMP.feet = {name="Regal Pumps +1"}

        gsWHM.Int = {}
        gsWHM.Int.main = {name="Marin Staff"}
        gsWHM.Int.hand = {name="Chironic Gloves"}
        gsWHM.Int.legs = {name="Chironic Hose"}
        gsWHM.Int.ring1 = {name="Sophia Ring"}
        gsWHM.Int.waist = {name="Channeler's Stone"}

        gsWHM.Enh = {}
        gsWHM.Enh.body = gsWHM.body
        gsWHM.Enh.hands = {name="Chironic Gloves"}
        gsWHM.Enh.feet = {name="Regal Pumps +1"}
        gsWHM.Enh.back = {name="Mending Cape"}

        gsWHM.Enf = {}
        gsWHM.Enf.ring1 = {name="Irrwisch Ring"}
        gsWHM.Enf.body = {name="Vanya Robe"}
        gsWHM.Enf.hand = {name="Lurid Mitts"}
        gsWHM.Enf.legs = {name="Chironic Hose"}
        gsWHM.Enf.feet = {name="Medium's Sabots"}

        gsWHM.Regen = {}
        gsWHM.Regen.main = {name="Bolelabunga"}
        gsWHM.Regen.body = {name="Piety Briault"}
        gsWHM.Regen.hands = {name="Orison Mitts +2"}


    --------------------------------------
    -- Start defining the sets
    --------------------------------------


    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
        main=gsWHM.FC.main,
        head=gsWHM.FC.head,
        body=gsWHM.FC.body,
        hands=gsWHM.FC.hand,
        ear1=gsWHM.FC.ear1,
        legs=gsWHM.FC.legs,
        feet=gsWHM.FC.feet}

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Bougonia Rope"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {legs="Ebers Pantaloons +1"})

    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {main=gsWHM.CP.main})
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure
    -- CureMelee spell map should default back to Healing Magic.

    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Briault"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head=gsWHM.FC.head,ear1="Roundel Earring",
        body=gsWHM.FC.body,hands="Yaoyotl Gloves",
        back="Refraction Cape",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = ""
    sets.precast.WS = {
        head=gsWHM.FC.head,neck=gear.ElementalGorget,ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body=gsWHM.FC.body,hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Refraction Cape",waist=gear.ElementalBelt,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


    -- Midcast Sets

    sets.midcast.FastRecast = {
        head=gsWHM.FC.head,ear2="Loquacious Earring",
        body=gsWHM.FC.body,hands="Dynasty Mitts",ring1="Prolix Ring",
        back="Swith Cape +1",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    -- Cure sets
    gear.default.obi_waist = "Goading Belt"
    gear.default.obi_back = gsWHM.CP.back

    sets.midcast.CureSolace = {
        main=gsWHM.CP.main,
        sub=gsWHM.CP.sub,
        head=gsWHM.CP.head,
        neck=gsWHM.neck,
        ear1=gsWHM.CP.ear1,
        ear2=gsWHM.CP.ear2,
        body=gsWHM.CP.body,
        hands=gsWHM.CP.hand,
        ring1=gsWHM.CP.ring1,
        ring2=gsWHM.CP.ring2,
        back=gsWHM.CP.back,
        legs="Ebers Pantaloons +1",
        feet=gsWHM.CP.feet}


    sets.midcast.Cure = {
       main=gsWHM.CP.main,
        sub=gsWHM.CP.sub,
        head=gsWHM.CP.head,
        neck=gsWHM.neck,
        ear1=gsWHM.CP.ear1,
        ear2=gsWHM.CP.ear2,
        body=gsWHM.CP.body,
        hands=gsWHM.CP.hand,
        ring1=gsWHM.CP.ring1,
        ring2=gsWHM.CP.ring2,
        back=gsWHM.CP.back,
        legs="Ebers Pantaloons +1",
        feet=gsWHM.CP.feet}

    sets.midcast.Curaga = {
       main=gsWHM.CP.main,
        sub=gsWHM.CP.sub,
        head=gsWHM.CP.head,
        neck=gsWHM.neck,
        ear1=gsWHM.CP.ear1,
        ear2=gsWHM.CP.ear2,
        body=gsWHM.CP.body,
        hands=gsWHM.CP.hand,
        ring1=gsWHM.CP.ring1,
        ring2=gsWHM.CP.ring2,
        back=gsWHM.CP.back,
        legs="Ebers Pantaloons +1",
        feet=gsWHM.CP.feet}

    sets.midcast.CureMelee = {
        head=gsWHM.CP.head,
        neck=gsWHM.neck,
        ear1=gsWHM.CP.ear1,
        ear2=gsWHM.CP.ear2,
        body=gsWHM.CP.body,
        hands=gsWHM.CP.hand,
        ring1=gsWHM.CP.ring1,
        ring2=gsWHM.CP.ring2,
        back=gsWHM.CP.back,
        legs="Ebers Pantaloons +1",
        feet=gsWHM.CP.feet}

    sets.midcast.Cursna = {
        hands="Fanatic Gloves",
        ring1=gsWHM.ring1,
        back=gsWHM.CP.back,
        feet=gsWHM.CP.feet}

    sets.midcast.StatusRemoval = {
        head="Orison Cap +2",legs="Ebers Pantaloons +1"}

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
    sets.midcast['Enhancing Magic'] = {main="Beneficus",sub=gsWHM.Genbu,
        head="Umuthi Hat",neck="Colossus's Torque",
        body=gsWHM.Enh.body,hands=gsWHM.Enh.hands,
        back=gsWHM.Enh.back,legs="Piety Pantaloons",feet=gsWHM.Enh.feet}

    sets.midcast.Stoneskin = {
        head="Umuthi Hat",neck="Orison Locket",ear2="Loquacious Earring",
        body=gsWHM.FC.body,hands="Dynasty Mitts"}

    sets.midcast.Auspice = {hands="Dynasty Mitts",feet="Orison Duckbills +2"}

    sets.midcast.BarElement = {main="Beneficus",sub=gsWHM.Genbu,
        head="Orison Cap +2",neck="Colossus's Torque",
        body="Ebers Bliaud",hands="Orison Mitts +2",
        back=gsWHM.CP.back,waist="Olympus Sash",legs="Piety Pantaloons",feet="- Duckbills +2"}

    sets.midcast.Regen = {
        main=gsWHM.Regen.main,
        sub=gsWHM.Genbu,
        body=gsWHM.Regen.body,
        hands=gsWHM.Regen.hands}

    sets.midcast.Protectra = {feet="Piety Duckbills +1"}

    sets.midcast.Shellra = {legs="Piety Pantaloons"}


    sets.midcast['Divine Magic'] = {main="Divinity",sub=gsWHM.Genbu,
        head=gsWHM.FC.head,neck="Imbodia necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body=gsWHM.Enf.body,hands="Fanatic Gloves",ring2="Sangoma Ring",
        back="Refraction Cape",waist=gear.ElementalObi,legs="Theophany Pantaloons",feet=gsWHM.CP.feet}

    sets.midcast['Dark Magic'] = {
        main="Rubicundity",
        head=gsWHM.FC.head,neck="Imbodia necklace",ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body=gsWHM.FC.body,hands=gsWHM.Int.hand,ring1=gsWHM.Int.ring1,ring2="Resonance Ring",
        back="Refraction Cape",waist="Demonry Sash",legs=gsWHM.Enf.legs,feet="Piety Duckbills +1"}

    -- Custom spell classes
    sets.midcast.MndEnfeebles = {main="Lehbrailg +2", sub="Mephitis Grip",
        head=gsWHM.FC.head,neck=gsWHM.neck,ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body=gsWHM.Enf.body,hands="Fanatic Gloves",ring1=gsWHM.Enf.ring1,ring2="Hale Ring",
        back="Refraction Cape",waist="Rumination Sash",legs=gsWHM.Enf.legs,feet=gsWHM.Enf.feet}

    sets.midcast.IntEnfeebles = {main="Marin Staff", sub="Mephitis Grip",
        head=gsWHM.FC.head,neck=gsWHM.neck,ear1="Psystorm Earring",ear2="Lifestorm Earring",
        body=gsWHM.Enf.body,hands="Fanatic Gloves",ring1=gsWHM.Int.ring1,ring2="Hale Ring",
        back="Refraction Cape",waist="Rumination Sash",legs=gsWHM.Enf.legs,feet=gsWHM.Enf.feet}


    -- Sets to return to when not performing an action.                            5

    -- Resting sets
    sets.resting = {main=gsWHM.HMP.Main,
        body=gsWHM.HMP.body,hands="Serpentes Cuffs",
        neck=gsWHM.HMP.neck,
        waist=gsWHM.HMP.waist,legs="Nares Trews",feet=gsWHM.HMP.feet}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {main=gsWHM.main,sub=gsWHM.Genbu,ammo="Incantor Stone",
        head=gsWHM.FC.head,neck="Imbodia Necklace",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body=gsWHM.HMP.body,hands="Fanatic Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back=gsWHM.back,waist="Witful Belt",legs=gsWHM.legs,feet="Hippomenes Socks"}

    sets.idle.PDT = {main="Bolelabunga", sub=gsWHM.Genbu,ammo="Incantor Stone",
        head=gsWHM.head,neck="Imbodia Necklace",ear1="Moonshade Earring",ear2="Loquacious Earring",
        body="Piety Bliaut",hands="Fanatic Gloves",ring1="Jelly Ring",ring2="Dark Ring",
        back=gsWHM.back,waist="Witful Belt",legs=gsWHM.legs,feet="Hippomenes Socks"}

    sets.idle.Town = {main="Bolelabunga",sub=gsWHM.Genbu,ammo="Incantor Stone",
        head=gsWHM.head,neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body=gsWHM.body,hands="Fanatic Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        back=gsWHM.back,waist="Fucho-no-Obi",legs=gsWHM.legs,feet="Hippomenes Socks"}

    sets.idle.Weak = {main="Bolelabunga",sub=gsWHM.Genbu,ammo="Incantor Stone",
        head=gsWHM.FC.head,neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
        body="Piety Bliaut",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Meridian Ring",
        back=gsWHM.back,waist="Witful Belt",legs="Nares Trews",feet="Gendewitha Galoshes"}

    -- Defense sets

    sets.defense.PDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        head=gsWHM.head,neck="Twilight Torque",
        body="Piety Bliaut",hands="Gendewitha Gages",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back=gsWHM.back,legs="Gendewitha Spats",feet="Gendewitha Galoshes"}

    sets.defense.MDT = {main=gear.Staff.PDT,sub="Achaq Grip",
        head=gsWHM.head,neck="Twilight Torque",
        body=gsWHM.FC.body,hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back=gsWHM.back,legs="Bokwus Slops",feet="Hippomenes Socks"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {body=gsWHM.HMP.body,waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {
        head="Nahtirah Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
        body=gsWHM.FC.body,hands="Dynasty Mitts",ring1="Rajas Ring",ring2="K'ayres Ring",
        back="Umbra Cape",waist="Goading Belt",legs="Gendewitha Spats",feet="Gendewitha Galoshes"}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Orison Mitts +2",back=gsWHM.CP.back}

 organizer_items = {
     echos="Echo Drops",
     shihei="Shihei",
     orb="Macrocosmic Orb",
     warpring="Warp Ring"
}


end


-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
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
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts =
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']

        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(1, 9)
end

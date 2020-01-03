-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
-- Load and initialize the include file.
include('Mote-Include.lua')
end


-- Setup vars that are user-independent.
function job_setup()
state.CombatForm = get_combat_form()

state.Buff.Hasso = buffactive.Hasso or false
state.Buff.Seigan = buffactive.Seigan or false
state.Buff.Sekkanoki = buffactive.Sekkanoki or false
state.Buff.Sengikori = buffactive.Sengikori or false
state.Buff['Meikyo Shisui'] = buffactive['Meikyo Shisui'] or false
end


-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
-- Options: Override default values
options.OffenseModes = {'Normal', 'Acc'}
options.DefenseModes = {'Normal', 'PDT', 'Reraise'}
options.WeaponskillModes = {'Normal', 'Acc', 'Att', 'Mod'}
options.CastingModes = {'Normal'}
options.IdleModes = {'Normal'}
options.RestingModes = {'Normal'}
options.PhysicalDefenseModes = {'PDT', 'Reraise'}
options.MagicalDefenseModes = {'MDT'}

state.Defense.PhysicalMode = 'PDT'

-- Additional local binds
send_command('bind ^` input /ja "Hasso" <me>')
send_command('bind !` input /ja "Seigan" <me>')

select_default_macro_book()
end


-- Called when this job file is unloaded (eg: job change)
function job_file_unload()
send_command('unbind ^`')
send_command('unbind !-')
end


-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------

-- Precast Sets
-- Precast sets to enhance JAs
sets.precast.JA.Meditate = {head="Wakido Kabuto +1",hands="Sakonji Kote"}
sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +1"}
sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote"}

-- Waltz set (chr and vit)
sets.precast.Waltz = {ammo="Sonia's Plectrum",
head="Yaoyotl Helm",
body="Otronif Harness +1",hands="Buremte Gloves",ring1="Spiral Ring",
back="Iximulew Cape",waist="Caudata Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

-- Don't need any special gear for Healing Waltz.
sets.precast.Waltz['Healing Waltz'] = {}

       
-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
            head="Otomi Helm",
            neck="Ganesha's Mala",
            lear="Steelflash earring",
            rear="Bladeborn earring",
            body="Phorcys Korazin",
            hands="Boor Bracelets",
            lring="Rajas Ring",
            rring="Ifrit Ring",
            back="Buquwik cape",
            waist="Windbuffet Belt",
            legs="Wakido Haidate +1",
            feet="Sakonji sune-ate"}
sets.precast.WS.Acc = set_combine(sets.precast.WS, {back="Letalis Mantle"})

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Tachi: Fudo'] = set_combine(sets.precast.WS, {neck="Light Gorget",feet="Sakonji sune-ate"})
sets.precast.WS['Tachi: Fudo'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget"})
sets.precast.WS['Tachi: Fudo'].Mod = set_combine(sets.precast.WS['Tachi: Fudo'], {waist="Snow Belt"})

sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {neck="Thunder Gorget",feet="Whirlpool Greaves"})
sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {neck="Ganesha's mala"})
sets.precast.WS['Tachi: Shoha'].Mod = set_combine(sets.precast.WS['Tachi: Shoha'], {waist="Windbuffet Belt"})

sets.precast.WS['Tachi: Rana'] = set_combine(sets.precast.WS, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
sets.precast.WS['Tachi: Rana'].Acc = set_combine(sets.precast.WS.Acc, {neck="Snow Gorget",ear1="Bladeborn Earring",ear2="Steelflash Earring",})
sets.precast.WS['Tachi: Rana'].Mod = set_combine(sets.precast.WS['Tachi: Rana'], {waist="Snow Belt"})

sets.precast.WS['Namas Arrow'] = set_combine(sets.precast.WS, {head="Otomi helm",
            neck="Light gorget",
            lear="Flame pearl",
            rear="Flame Pearl",
            body="Kyujutsugi",
            hands="Unkai Kote +2",
            lring="Rajas Ring",
            rring="Ifrit Ring",
            back="Kayapa Cape",
            waist="Light Belt",
            legs="Wakido haidate +1",
            feet="Wakido sune-ate"})

sets.precast.WS['Tachi: Gekko'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

sets.precast.WS['Tachi: Yukikaze'] = set_combine(sets.precast.WS, {neck="Snow Gorget",waist="Snow Belt"})

sets.precast.WS['Tachi: Ageha'] = set_combine(sets.precast.WS, {neck="Soil Gorget",waist="Soil Belt"})

sets.precast.WS['Tachi: Kaiten'] = set_combine(sets.precast.WS, {neck="Light Gorget",waist="Light Belt",lear="Trux pearl",rear="Brutal pearl",})


-- Midcast Sets
sets.midcast.FastRecast = {
head="Yaoyotl Helm",
body="Otronif Harness +1",hands="Otronif Gloves +1",
legs="",feet="Otronif Boots +1"}


-- Sets to return to when not performing an action.

-- Resting sets
sets.resting = {neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}


-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
sets.idle.Town = {
            head="Lithelimb cap",
            neck="Twilight Torque",
            lear="Merman's earring",
            rear="Merman's earring",
            body="Xaddi mail",
            hands="Otronif gloves +1",
            lring="Patricius Ring",
            rring="Dark Ring",
            back="Repulse Mantle",
            waist="",
            legs="Otronif brais +1",
            feet="Otronif boots +1"}

sets.idle.Field = {
            head="Lithelimb cap",
            neck="Twilight Torque",
            lear="Merman's earring",
            rear="Merman's earring",
            body="Xaddi mail",
            hands="Otronif gloves +1",
            lring="Patricius Ring",
            rring="Dark Ring",
            back="Repulse Mantle",
            waist="",
            legs="Otronif brais +1",
            feet="Otronif boots +1"}

sets.idle.Weak = {
            head="Lithelimb cap",
            neck="Twilight Torque",
            lear="Merman's earring",
            rear="Merman's earring",
            body="Xaddi mail",
            hands="Otronif gloves +1",
            lring="Patricius Ring",
            rring="Dark Ring",
            back="Repulse Mantle",
            waist="",
            legs="Otronif brais +1",
            feet="Otronif boots +1"}

-- Defense sets
sets.defense.PDT = {
            head="Lithelimb cap",
            neck="Twilight Torque",
            lear="Merman's earring",
            rear="Merman's earring",
            body="Xaddi mail",
            hands="Otronif gloves +1",
            lring="Patricius Ring",
            rring="Dark Ring",
            back="Repulse Mantle",
            waist="",
            legs="Otronif brais +1",
            feet="Otronif boots +1"}

sets.defense.Reraise = {
head="Twilight Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Twilight Mail",hands="Buremte Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
back="Shadow Mantle",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Yaoyotl Helm",neck="Twilight Torque",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Otronif Harness +1",hands="Otronif Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Engulfer Cape",waist="Flume Belt",legs="Karieyh Brayettes +1",feet="Otronif Boots +1"}

sets.Kiting = {feet="Danzo Sune-ate"}

sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}

-- Engaged sets

-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion

-- Normal melee group
-- Delay 450 GK, 25 Save TP => 65 Store TP for a 5-hit (25 Store TP in gear)
sets.engaged = { head="Otomi Helm",
            neck="Ganesha's Mala",
            lear="Trux Earring",
            rear="Brutal Earring",
            body="Xaddi mail",
            hands="Wakido Kote +1",
            lring="K'ayres Ring",
            rring="Rajas Ring",
            back="Takaha Mantle",
            waist="Windbuffet Belt",
            legs="Otronif Brais +1",
            feet="Otronif Boots +1"}
sets.engaged.Acc = {ammo="",
head="Yaoyotl Helm",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="",hands="Otronif Gloves",ring1="Patricius ring",ring2="Adler ring",
back="",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-ate"}
sets.engaged.PDT = {
            head="Wakido kabuto +1",
            neck="Twilight Torque",
            lear="Merman's earring",
            rear="Merman's earring",
            body="Xaddi mail",
            hands="Otronif gloves +1",
            lring="Patricius Ring",
            rring="Dark Ring",
            back="Repulse Mantle",
            waist="",
            legs="Otronif brais +1",
            feet="Otronif boots +1"}
sets.engaged.Acc.PDT = {}
sets.engaged.Reraise = {}
sets.engaged.Acc.Reraise = {}

-- Melee sets for in Adoulin, which has an extra 10 Save TP for weaponskills.
-- Delay 450 GK, 35 Save TP => 89 Store TP for a 4-hit (49 Store TP in gear), 2 Store TP for a 5-hit
sets.engaged.Adoulin = {head="Yaoyotl Helm",
            neck="Ganesha's Mala",
            lear="Steelflash Earring",
            rear="Bladeborn Earring",
            body="Sakonji Domaru +1",
            hands="Wakido Kote +1",
            lring="K'ayres Ring",
            rring="Rajas Ring",
            back="Takaha Mantle",
            waist="Goading Belt",
            legs="Wakido haidate +1",
            feet="Otronif Boots +1"}
sets.engaged.Adoulin.Acc = {ammo="",
head="Yaoyotl Helm",neck="Iqabi necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="",hands="Otronif Gloves",ring1="Patricius ring",ring2="Adler ring",
back="",waist="Goading Belt",legs="Wakido Haidate +1",feet="Wakido Sune-ate"}
sets.engaged.Adoulin.PDT = {
            head="Wakido kabuto +1",
            neck="Twilight Torque",
            lear="Merman's earring",
            rear="Merman's earring",
            body="Xaddi mail",
            hands="Otronif gloves +1",
            lring="Patricius Ring",
            rring="Dark Ring",
            back="Repulse Mantle",
            waist="",
            legs="Otronif brais +1",
            feet="Otronif boots +1"}
sets.engaged.Adoulin.Acc.PDT = {}
sets.engaged.Adoulin.Reraise = {}
sets.engaged.Adoulin.Acc.Reraise = {}


sets.buff.Sekkanoki = {hands="Unkai Kote +2"}
sets.buff.Sengikori = {feet="Unkai Sune-ate +2"}
sets.buff['Meikyo Shisui'] = {feet="Sakonji Sune-ate"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
if spell.type == 'WeaponSkill' then

if state.Buff[spell.english] ~= nil then
state.Buff[spell.english] = true
end
end

-- Run after the default precast() is done.
-- eventArgs is the same one used in job_precast, in case information needs to be persisted.
function job_post_precast(spell, action, spellMap, eventArgs)
if spell.type:lower() == 'weaponskill' then
if state.Buff.Sekkanoki then
equip(sets.buff.Sekkanoki)
end
if state.Buff.Sengikori then
equip(sets.buff.Sengikori)
end
if state.Buff['Meikyo Shisui'] then
equip(sets.buff['Meikyo Shisui'])
end
end


-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
-- Effectively lock these items in place.
if state.DefenseMode == 'Reraise' or
(state.Defense.Active and state.Defense.Type == 'Physical' and state.Defense.PhysicalMode == 'Reraise') then
equip(sets.Reraise)
end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
if state.Buff[spell.english] ~= nil then
state.Buff[spell.english] = not spell.interrupted or buffactive[spell.english]
end
end


-------------------------------------------------------------------------------------------------------------------
-- Customization hooks for idle and melee sets, after they've been automatically constructed.
-------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- General hooks for other events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
if state.Buff[buff] ~= nil then
state.Buff[buff] = gain
end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command, for common needs.
-- Set eventArgs.handled to true if we don't want automatic equipping of gear.
function job_update(cmdParams, eventArgs)
state.CombatForm = get_combat_form()
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function get_combat_form()
if areas.Adoulin:contains(world.area) and buffactive.ionis then
return 'Adoulin'
end
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
-- Default macro set/book
if player.sub_job == 'WAR' then
set_macro_page(1, 11)
elseif player.sub_job == 'DNC' then
set_macro_page(2, 11)
elseif player.sub_job == 'THF' then
set_macro_page(3, 11)
elseif player.sub_job == 'NIN' then
set_macro_page(4, 11)
else
set_macro_page(1, 11) 
            end
    end
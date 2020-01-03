-- Contains a table of avatars and thier spells
-- Constants
local bp_type_offensive = "bp_type_offensive"
local bp_type_buff = "bp_type_buff"
local bp_type_debuff = "bp_type_debuff"
local bp_type = "bp_type"
local bp_target = "bp_target"
local bp_target_self = "bp_target_self"
local bp_target_pc = "bp_target_pc"
local bp_type_npc = "bp_type_npc"

avatar_spells = {
	["Ifrit"] = {
		["Inferno"]        = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Punch"]          = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Fire II"]        = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Burning Strike"] = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Double Punch"]   = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Fire IV"]        = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Flaming Crush"]  = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Meteor Strike"]  = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Conflag Strike"] = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Crimson Howl"]   = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Inferno Howl"]   = {bp_type=bp_type_buff,     bp_target=bp_target_self},
	},
	["Titan"] = {
		["Earthen Fury"]   = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Rock Throw"]     = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Stone II"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Rock Buster"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Megalith Throw"] = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Stone IV"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Mountain Buster"]= {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Geocrush"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Crag Throw"]     = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Earthen Ward"]   = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Earthen Armor"]  = {bp_type=bp_type_buff,     bp_target=bp_target_self},
	},
	["Leviathan"] = {
		["Tidal Wave"]     = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Barracuda Dive"] = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Water II"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Tail Whip"]      = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Water IV"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Spinning Dive"]  = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Grand Fall"]     = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Spring Water"]   = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Slowga"]         = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
		["Tidal Roar"]     = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
		["Soothing Current"]= {bp_type=bp_type_buff,    bp_target=bp_target_self},
	},
	["Garuda"] = {
		["Aerial Blast"]   = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Claw"]           = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Aero II"]        = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Stone IV"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Predator Claws"] = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Wind Blade"]     = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Whispering Wind"]= {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Hastega"]        = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Aerial Armor"]   = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Fleet Wind"]     = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Hastega II"]     = {bp_type=bp_type_buff,     bp_target=bp_target_self},
	},
	["Shiva"] = {
		["Diamond Dust"]   = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Axe Kick"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Blizzard II"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Double Slap"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Blizzard IV"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Rush"]           = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Heavenly Strike"]= {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Frost Armor"]    = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Sleepga"]        = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Diamond Storm"]  = {bp_type=bp_type_debuff,   bp_target=bp_target_self},
		["Crystal Blessing"]= {bp_type=bp_type_buff,    bp_target=bp_target_self},
	},
	["Ramuh"] = {
		["Judgement Bolt"]  = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Shock Strike"]    = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
		["Thunder II"]      = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Thunderspark"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Thunder IV"]      = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Chaotic Strike"]  = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Thunderstorm"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Volt Strike"]     = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Rolling Thunder"] = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Lightning Armor"] = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Shock Squall"]    = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
	},
	["Diabolos"] = {
		["Ruinous Omen"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Camisado"]        = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Nether Blast"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Night Terror"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Somnolence"]      = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
		["Nightmare"]       = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
		["Ultimate Terror"] = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
		["Noctoshield"]     = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Dream Shroud"]    = {bp_type=bp_type_buff,     bp_target=bp_target_self},
		["Somnolence"]      = {bp_type=bp_type_debuff,   bp_target=bp_target_npc},
	},
	["Odin"] = {
	
	},
	["Alexander"] = {
	
	},
	["Cait Sith"] = {
		["Altana's Favor"]  = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Regal Scratch"]   = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Level ? Holy"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
	},
	["Atomos"] = {
	
	},
	["Fenrir"] = {
		["Howling Moon"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Moonlit Charge"]  = {bp_type=bp_type_debuff,bp_target=bp_target_npc},
		["Cresent Fang"]    = {bp_type=bp_type_debuff,bp_target=bp_target_npc},
		["Eclipse Bite"]    = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Lunar Bay"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Lunar Cry"]       = {bp_type=bp_type_debuff,bp_target=bp_target_npc},
		["Lunar Roar"]      = {bp_type=bp_type_debuff,bp_target=bp_target_npc},
		["Ecliptic Growl"]  = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Ecliptic Howl"]   = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Heavenward Howl"] = {bp_type=bp_type_buff,bp_target=bp_target_self},
	},
	["Carbuncle"] = {
		["Searing Light"]   = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Poison Nails"]    = {bp_type=bp_type_debuff,bp_target=bp_target_npc},
		["Meteorite"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Holy Mist"]       = {bp_type=bp_type_offensive,bp_target=bp_target_npc},
		["Healing Ruby"]    = {bp_type=bp_type_buff,bp_target=bp_target_pc},
		["Shining Ruby"]    = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Glittering Ruby"] = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Healing Ruby"]    = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Soothing Ruby"]   = {bp_type=bp_type_buff,bp_target=bp_target_self},
		["Pacifying Ruby"]  = {bp_type=bp_type_buff,bp_target=bp_target_pc},
	}
}

-- Create a list of spells
avatar_spells_list = {}
for avatar, spells in pairs(avatar_spells) do
	for spell, spellinfo in pairs(spells) do
		avatar_spells_list[table.length(avatar_spells_list) + 1] = spell
	end
end

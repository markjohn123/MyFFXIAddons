-- Feary's Lua Mappings
-- Purpose:
-- 
--


-- Basic Tables
	
	sets.idle = {}
	sets.idle.Avatar = {}
	sets.misc = {}
	
	-- Precast
	sets.precast = {}
	sets.precast.JA = {}
	sets.precast.WS = {}
	
	-- Midcast
	sets.midcast = {}
	sets.midcast.Pet = {}
	-- Aftercast
	sets.aftercast = {}	


-- Spell Mappings 

		ranged_weaponskills = S{"Flaming Arrow", "Piercing Arrow", "Dulling Arrow", "Sidewinder", "Arching Arrow", "Blast Arrow",
						"Empyreal Arrow", "Refulgent Arrow", "Apex Arrow", "Namas Arrow", "Jishnu's Radiance",
						"Hot Shot", "Split Shot", "Sniper Shot", "Slug Shot", "Blast Shot", "Heavy Shot", "Detonator", "Numbing Shot", "Last Stand",
						"Coronach", "Trueflight", "Leaden Salute", "Wildfire",
						"Myrkr"}
		ranged_weaponskills_Distance = T{["Sidewinder"] = 24, ["Refulgent Arrow"] = 24, ["Apex Arrow"] = 24, ["Namas Arrow"] = 24, ["Jishnu's Radiance"] = 24,
						["Heavy Shot"] = 24, ["Last Stand"] = 24,
						["Coronach"] = 24, ["Trueflight"] = 24, ["Leaden Salute"] = 24, ["Wildfire"] = 24}

-- Equipment Mappings

	ranged_Bow = T{"Yoichinoyumi", "Echidna's Bow"}
	ranged_Gun = T{"Annihilator", "Eminence Gun"}
	
-- Areas based Equipment
	areas = {}
-- Adoulin areas, where Ionis will grant special stat bonuses.
	areas.Adoulin = S{
		"Yahse Hunting Grounds",
		"Ceizak Battlegrounds",
		"Foret de Hennetiel",
		"Morimar Basalt Fields",
		"Yorcia Weald",
		"Yorcia Weald [U]",
		"Cirdas Caverns",
		"Cirdas Caverns [U]",
		"Marjami Ravine",
		"Kamihr Drifts",
		"Sih Gates",
		"Moh Gates",
		"Dho Gates",
		"Woh Gates",
		"Rala Waterways",
		"Rala Waterways [U]",
		"Outer Ra'Kaznar",
		"Outer Ra'Kaznar [U]"
		}

-- City areas for town gear behavior.
	areas.Town = S{
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
			"Kazham",
			"Rabao"
					}

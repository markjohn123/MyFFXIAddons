sets['obis'] = {
	["Fire"] = {waist=""},
	["Earth"] = {waist=""},
	["Water"] = {waist=""},
	["Wind"] = {waist=""},
	["Ice"] = {waist=""},
	["Thunder"] = {waist="Rairin Obi"},
	["Light"] = {waist="Korin Obi"},
	["Dark"] = {waist=""},
}

if player and T{"WHM", "BLM", "RDM", "BRD", "SMN", "BLU", "PUP", "GEO", "SCH"}:contains(player.main_job) then	
	sets['twilight cape'] = {
		['back'] = "Twilight Cape"
	}
end
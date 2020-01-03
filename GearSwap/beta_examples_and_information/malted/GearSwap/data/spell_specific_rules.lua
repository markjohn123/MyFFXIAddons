-- Rule for equiping Obi's, Twilight Cape,etc... Based on day/weather/etc

valid_command_prefixes = T{'/magic', '/song', '/ninjutsu',}

function precast_MA_specific(spell,precast_set)
	local retVal = precast_set
	
	if spell.en == 'Magic Barrier' and buffactive['Stoneskin'] then
		windower.ffxi.cancel_buff(37)
	end
	
	return retVal
end

function midcast_MA_specific(spell,midcast_set)
	local retVal = midcast_set

	
	return retVal
end

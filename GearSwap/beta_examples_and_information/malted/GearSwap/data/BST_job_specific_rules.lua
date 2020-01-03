function beast_weaponskill_common(spell,set)
	local retSet = set

	if spell.prefix == "/weaponskill"  then
		-- Put killer effects gear on if killer instinct is active
		if buffactive["killer instinct"] and T{'Primal Rend', 'Cloudsplitter'}:contains(spell.en) ~= true then
			retSet = set_combine(retSet, sets["killer effects"])
		end

		-- If TP >= 2890, wear the mab on the left ear
		if player.tp >=2890 or
		   (T{"Kaidate","Beatific Shield +1", "Thuellaic Ecu +1", "Evalach +1"}:contains(player.equipment.sub and player.tp >=2590)) then
			retSet = set_combine(retSet, T{left_ear="Crematio Earring"})
		end
	end

	return retSet
end

function call_beast_119_weapon(spell, set)
	local retVal = set

	-- If using a lower tier axe while using call beast, switch to guttler to
	-- Pets can be 119
	if spell.prefix == '/jobability' and spell.en == 'Call Beast' and
		T{"Buramgh", "Guttler", "Izizoeksi", "Kerehcatl", "Arktoi"}:contains(player.equipment.main) == false then
		retVal = set_combine(retVal, T{main="Buramgh"})		
	elseif spell.prefix == '/jobability' and spell.en == 'Charm' then
		retVal = set_combine(retVal, T{main="Buramgh"})	
	end

	return retVal
end

function precast_job_specific(spell,set)
	local retSet = set
	-- Cancel sneak before you use Spectral Jig
	-- Don't cancel sneak if spectral jig isn't ready to cast
	if spell.name == 'Spectral Jig' and buffactive.sneak and can_jig() then
		send_command('cancel 71')
	--elseif spell.prefix=="/pet" and pet_moves:contains(spell.name) then
		-- Delay sic/ready moves by 1 second so the proper gear can be equipped
		--cast_delay(1)
	end
	
	retSet = beast_weaponskill_common(spell,set)
	retSet = call_beast_119_weapon(spell, set)

	return retSet
end

function midcast_job_specific(spell,set)
	local retSet = set

	retSet = beast_weaponskill_common(spell,set)
	retSet = call_beast_119_weapon(spell, set)

	return retSet

end

function aftercast_job_specific(spell,set)
	local retSet = set
	
	return retSet

end

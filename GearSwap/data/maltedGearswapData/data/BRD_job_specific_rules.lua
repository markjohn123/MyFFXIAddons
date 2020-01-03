function precast_job_specific(spell,set)
	local retSet = set
	local recasts = windower.ffxi.get_spell_recasts()
	local player = windower.ffxi.get_player()
	-- Cancel sneak before you use Spectral Jig
	-- Don't cancel sneak if spectral jig isn't ready to cast
	if spell.name == 'Spectral Jig' and buffactive.sneak and can_jig() then
		send_command('cancel 71')
	end
	
	
		-- If nightingale is on don't equip precast set
		if table.contains(player.buffs, 347) then
			retSet = nil
		end
		
	return retSet
end

function midcast_job_specific(spell,set)
	local retSet = set
	
	return retSet

end

function aftercast_job_specific(spell,set)
	local retSet = set
	
	return retSet

end

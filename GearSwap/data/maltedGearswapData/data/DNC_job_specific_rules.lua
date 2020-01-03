function precast_job_specific(spell,set)
	local retSet = set
	
	-- Cancel sneak before you use Spectral Jig
	-- Don't cancel sneak if spectral jig isn't ready to cast
	if spell.name == 'Spectral Jig' and buffactive.sneak and can_jig() then
		send_command('cancel 71')
	end
	
	-- Use crit hit damage and dex gear if climactic flourish is up and
	-- the weaponskill is evisceration
	if spell.prefix == '/weaponskill' and spell == 'Evisceration' and buffactive['climactic flourish'] then
		retSet = set_combine(sets['crit hit damage'], T{feet='Horos Shoes +1'}, retSet)
	end
	
	return retSet
end

function midcast_job_specific(spell,set)
	local retSet = set
	
	return retSet

end

function aftercast_job_specific(spell,set)
	local retSet = set
	
	-- If fan dance is active set battle_state to HPDT
	-- And put the HPDT gear on
	if buffactive['fan dance'] and battle_state ~= 'HPDT' then
		battle_state = 'HPDT'
		self_command('equip')
	end
	
	return retSet

end

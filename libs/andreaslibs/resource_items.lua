buffs = require('res/buffs')
job_abilities = require('res/abilities')
spells = require('res/spells')
jobs = require('res/jobs')
items = require('res/items')

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}
item_names = {}

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false,
	['on'] = true,
	['off'] = false,
	['y'] = true,
	['n'] = false,
}


resources = {}

--function init()
	resources["logic"] = logic

	for buffid, buffinfo in pairs(buffs) do
		buff_names[buffinfo.en] = buffid
	end
	
	resources["buff_names"] = buff_names
	
	for spellid, spellinfo in pairs(spells) do
		spell_names[spellinfo.en] = spellid
	end
	
	resources["spell_names"] = spell_names

	for ablilityid, abilityinfo in pairs(job_abilities) do
			job_ability_names[abilityinfo.en] = abilityinfo.recast_id
	end
	
	job_ability_names["BloodPactRage"] = 173
	job_ability_names["BloodPactWard"] = 174
	
	resources["job_ability_names"] = job_ability_names

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.ens] = jobid
	end	

	resources["job_names"] = job_names

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end
	
	resources["item_names"] = item_names
--end

return resources

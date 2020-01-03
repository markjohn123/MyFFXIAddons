-- Lua version of auto_follow
packets = require('packets')
require('luau')
require('tables')
require('logger')
texts = require('texts')
config = require('config')
isbusy = require('isbusy')
require('directions')
buffs = require('res/buffs')
job_abilities = require('res/abilities')
spells = require('res/spells')
jobs = require('res/jobs')

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}

_addon.name = 'Attack Speed'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'attack_speed', 'atts'}

function init()
	for buffid, buffinfo in pairs(buffs) do
		buff_names[buffinfo.en] = buffid
	end
	
	for spellid, spellinfo in pairs(spells) do
		spell_names[spellinfo.en] = spellid
	end
	

	for ablilityid, abilityinfo in pairs(job_abilities) do
			job_ability_names[abilityinfo.en] = abilityinfo.recast_id
	end

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.short] = jobid
	end		
end

lua_loop = nil
windower.register_event('load', function()
	init()
	lua_loop = coroutine.schedule(infinity_loop, 1)
	
	tbAttackSpeed = texts.new('Avg att per second: ')
	tbAttackSpeed.pos(tbAttackSpeed, 80,0)
	texts.visible(tbAttackSpeed, true)

	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
	end
end)

windower.register_event('unload', function()
	if lua_loop then
		coroutine.close(lua_loop)
	end
end)

windower.register_event('status change', function(new, old)
	if new == 1 then
		last_attack_time = os.time()
		avg_att_per_sec = 0
		num_attacks = 0
		total_attacks = 0
		engaged_time = nil
	end
end)

num_attacks = 0
att_per_sec = 0
last_attack_time = os.time()
avg_att_per_sec = 0
total_attacks = 0
engaged_time = 0
windower.register_event('action', function(act)
	local player = windower.ffxi.get_player()
	if player.id == act.actor_id and act.category == 1 then
		for key,value in pairs(act.targets[1].actions) do
			if value.reaction == 8 then
				num_attacks = num_attacks + 1
				total_attacks = total_attacks + 1
			end
		end
		if not engaged_time then
			engaged_time = os.time()
		end
		if os.time() > last_attack_time then
			att_per_sec = num_attacks / (os.time() - last_attack_time)
			avg_att_per_sec = total_attacks / (os.time() - engaged_time)
			last_attack_time = os.time()
			num_attacks = 0
		end
	end
end)

function infinity_loop()
	local temp = math.floor(avg_att_per_sec*100+.5)/100
	while true do
		tbAttackSpeed.name = tostring(temp)
		coroutine.sleep(1)
	end
end

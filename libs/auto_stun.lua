buffs = buffs or require('res/buffs')
job_abilities = job_abilities or require('res/abilities')
spells = spells or require('res/spells')
jobs = jobs or require('res/jobs')
items = items or require('res/items')
monster_abilities = monster_abilities or require('res/monster_abilities')


do_auto_stun = do_auto_stun or false
asspelltype = "asspelltype"
asability=1
asspell=2
asweaponskill=3
ascustom=3
asname="name"
asactions="actions"
asactiontype="actiontype"
astarget="target"
stun_for_job = nil

--[[ Stunlist format:
stun_list['Blind Vortex'] = {
	asspelltype=asability,
	name="Blind Vortex",
	actions={
		{asactiontype=asweaponskill, asspell="Flat Blade",    astarget="<t>"},
		{asasactiontype=spell,       asspell="Sudden Lunge",  astarget="<t>"},
		{actiontype=spell,       asspell="Whirl of Rage", astarget="<t>"},
	}
}
]]

stun_list = stun_list or {}

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {}
item_names = {}
monster_ability_names = {}
monster_spell_names = {}

function init()
	for buffid, buffinfo in pairs(buffs) do
		buff_names[buffinfo.en] = buffid
	end
	
	for spellid, spellinfo in pairs(spells) do
		spell_names[spellinfo.en] = spellid
	end

	for ablilityid, abilityinfo in pairs(job_abilities) do
			if abilityinfo.prefix == '/jobability' then
				job_ability_names[abilityinfo.en] = abilityinfo.recast_id
			end
	end

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.short] = jobid
	end	

	for itemid, iteminfo in pairs(items) do
		item_names[iteminfo.en] = iteminfo.id
	end
	
	for abilityid, abilityinfo in pairs(monster_abilities) do
		-- Check to see if there is already an entry
		-- If there isn't create an array for it.
		if not monster_ability_names[abilityinfo.english] then
			monster_ability_names[abilityinfo.english] = {}
		end
		-- And add the abilityid for this ability name
		monster_ability_names[abilityinfo.english][table.length(monster_ability_names[abilityinfo.english])] = abilityid
	end

	for abilityid, abilityinfo in pairs(monster_abilities) do
		-- Check to see if there is already an entry
		-- If there isn't create an array for it.
		if not monster_ability_names[abilityinfo.english] then
			monster_ability_names[abilityinfo.english] = {}
		end
		-- And add the abilityid for this ability name
		monster_ability_names[abilityinfo.english][table.length(monster_ability_names[abilityinfo.english])] = abilityid
	end

	--validate_stun_list()
end

function auto_stun_custom(act)
	local retVal = false
	
	-- Go through stun list and see if any spelltypes are custom then run their function
	-- the retVal is set to the result and the loop breaks if the retVal is true
	if stun_list and type(stun_list) == 'table' then
		for spell, info in pairs(stun_list) do
			if info[asspelltype] == ascustom then
				if info.actions then
					if type(info.actions) == 'table' then
						for order,action_func in ipairs(info.actions) do
							if type(action_func) == 'function' then
								retVal = action_func(act,spell)
							else
								windower.add_to_chat(5, "Auto Stun 104: A non function was specified for action in spell " .. spell .. ".")
							end
							if retVal then break end
						end
					elseif type(info.actions) == 'function' then
						retVal = info.actions(act, spell)
					else
						windower.add_to_chat(5, "Auto Stun 111: A non function was specified for actions in spell " .. spell .. ".")
					end	
				elseif info.action and type(info.action) == 'function' then
					retVal = info.action(act, spell)
				elseif info.action then
					windower.add_to_chat(5, "Auto Stun 116: A non function was specified for action in spell " .. spell .. ".")
				end
			end
			if retVal then break end
		end
	end
	return retVal
end

function auto_stun(act)
	local retVal = false
	local target = windower.ffxi.get_mob_by_target('t')
	local player = windower.ffxi.get_player()
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts   = windower.ffxi.get_spell_recasts()
	local adjusted_id
	local action
	if not (stun_list and do_auto_stun) then return false end
	if not stun_for_job then
		windower.add_to_chat(5, "stun_for_job not set")
		return
	end
	
	if player.main_job ~= stun_for_job then return end
	
  -- 7 is tp move
  -- 8 is casting or interrupt
  if auto_stun_custom(act) == false and
  	 player and target and
 		 target.id == act.actor_id and
     T{7,8}:contains(act.category) and
     target.is_npc
  then
  	if act.category == 7 then
  		adjustedid = act.targets[1].actions[1].param - 256
  		if monster_abilities[adjustedid] and monster_abilities[adjustedid].english and
  		   table.containskey(stun_list, monster_abilities[adjustedid].english) and
  				stun_list[monster_abilities[adjustedid].english].asspelltype == asability   
  		then
  			-- Go through the actions and execute the fist available
  			for order, actioninfo in ipairs(stun_list[monster_abilities[adjustedid].english].actions) do
  				-- TODO: Check to see if we can even do this action
  				if     actioninfo.asactiontype == asspell   and spell_recasts[spell_names[actioninfo.asspell]] == 0 and isWeather and isWeather() == false then
  					action = 'input /ma "' .. actioninfo.asspell .. '" ' .. actioninfo.astarget
  					break
  				elseif actioninfo.asactiontype == asability and ability_recasts[job_ability_names[actioninfo.asspell]] == 0 then
  					action = 'input /ja "' .. actioninfo.asspell .. '" ' .. actioninfo.astarget
  					break
  				elseif actioninfo.asactiontype == asweaponskill and player.vitals.tp >= 1000 then
  					action = 'input /ws "' .. actioninfo.asspell .. '" ' .. actioninfo.astarget
  					break
  				elseif actioninfo.asactiontype == ascustom then
  					if type(actioninfo.asspell) == 'function' then
  						if actioninfo.asspell(act, stun_list[monster_abilities[adjustedid].english]) then
  							break
  						end
  					else
--  						windower.add_to_chat(5, "Auto Stun 173: A non function was specified for action in spell " .. stun_list[monster_abilities[adjustedid].english] .. ".")
  					end
  				end
  			end 
  		end
  	elseif act.category == 8 then
  		adjustedid = act.targets[1].actions[1].param
  		if spells[adjustedid] and spells[adjustedid].en and
  			table.containskey(stun_list, spells[adjustedid].en) and
  			stun_list[spells[adjustedid].en].asspelltype == asspell
  		then
  			for order, actioninfo in ipairs(stun_list[spells[adjustedid].en].actions) do
 				if     actioninfo.asactiontype == asspell   and spell_recasts[spell_names[actioninfo.asspell]] == 0 and isweather and isWeather() == false then
  					action = 'input /ma "' .. actioninfo.asspell .. '" ' .. actioninfo.astarget
  					break
  				elseif actioninfo.asactiontype == asability and ability_recasts[job_ability_names[actioninfo.asspell]] == 0 then
  					action = 'input /ja "' .. actioninfo.asspell .. '" ' .. actioninfo.astarget
  					break
  				elseif actioninfo.asactiontype == asweaponskill and player.vitals.tp >= 1000 then
  					action = 'input /ws "' .. actioninfo.asspell .. '" ' .. actioninfo.astarget
  					break
  				elseif actioninfo.asactiontype == ascustom then
  					if type(actioninfo.asspell) == 'function' then
  						if actioninfo.asspell(act, stun_list[monster_abilities[adjustedid].english]) then
  							break
  						end
  					else
  						windower.add_to_chat(5, "Auto Stun 200: A non function was specified for action in spell ")
  					end
  				end
  			end
  		end
  		--windower.add_to_chat(5, "Monster is casting spell " .. spells[adjustedid].en	)
  	end
		
		if isbusy['isbusy'] == false and action then
			windower.add_to_chat(5, "(Auto Stun) stunning...")
			windower.send_command(action)
			retVal = true
		end

  end
  
	return retVal
end

function validate_stun_list()
	local complain = ""
	local comma = ""
	
	for monster_spell_name, listinfo in pairs(stun_list) do
		-- Check the monster spell names
		if table.containskey(spell_names, monster_spell_name) == false then
			complain = complain .. comma .. " monster spell name key " .. monster_spell_name .. " is invalid for monster spell name " .. monster_spell_name
			comma = ", "
		end
		
		if table.containskey(spell_names, listinfo.name) == false then
			complain = complain .. comma .. " monster spell name value " .. monster_spell_name .. " is invalid for monster spell name " .. monster_spell_name
			comma = ", "
		end
		
		-- Check that the spelltypes are valid
		if T{spell, ability}:contains(listinfo.spelltype) == false then
			complain = complain .. comma .. " monster spell type is invalid for monster spell name " .. monster_spell_name
			comma = ", "
		end
		
		-- Now check the actions
		
		for act_priority, actioninfo in ipairs(listinfo.actions) do
			-- Check the action type
			if T{spell, ability, weaponskill}:contains(actioninfo.actiontype) == false then
				complain = complain .. " action type priority " .. tostring(act_priority) .. "is invalid for monster spell name " .. monster_spell_name
			comma = ", "
			end
			
			-- Check the spell
			if     actioninfo.actiontype == spell   and table.containskey(spell_names, actioninfo.spell) == false then
				complain = complain .. " action spell priority " .. tostring(act_priority) .. "is invalid for monster spell name " .. monster_spell_name
			comma = ", "
			elseif actioninfo.actiontype == ability and table.containskey(job_ability_names, actioninfo.spell == false )then
				complain = complain .. " action spell priority " .. tostring(act_priority) .. "is invalid for monster spell name " .. monster_spell_name
			comma = ", "
			elseif actioninfo.actiontype == weaponskill then
				
			end
		end
	end
	
	if string.len(complain) > 0 then
		windower.add_to_chat(5, complain)
	end
end

windower.register_event("action", function(act)
	local temp = auto_stun(act)
end)

windower.register_event("load", function()
	init()
	--validate_stun_list()
	
	if stun_for_job == nil then
		windower.add_to_chat(5, 'stun_for_job not set.')
	end
end)


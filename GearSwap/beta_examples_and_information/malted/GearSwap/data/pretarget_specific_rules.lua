-- Note cancel_spell and change target is implemented here.
local hq_jugs = T{}

-- Convert hq_jobs to lowercase
for key,value in pairs(hq_jugs) do
	hq_jugs[key] = string.lower(value)
end

function pretarget_MA_specific(spell)
	-- cancel_spell() stuff goes here too.
	local ability_recasts = windower.ffxi.get_ability_recasts()
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local playera = windower.ffxi.get_player()


	-- In here because of brd's pianissimo
	if playera.main_job == 'BRD' and 
	table.contains(playera.buffs,409) == false and 
	table.contains(buffing_songs, spell.en) then
		change_target('<me>')
	end
	
	-- If the spell is ballad and 
	-- tenuto is not up but 
	-- can be casted, and 
	-- pianissimo is not up or the target is Self, 
	-- then turn on Tenuto to keep ballads on the brd.
	if T{"Mage's Ballad", "Mage's Ballad II", "Mage's Ballad III"}:contains(spell.en) and
		table.contains(playera.buffs,455) ~= true and
		ability_recasts[47] == 0 and
		(table.contains(playera.buffs, 409) == false) then
		cancel_spell()
		send_command('input /ja Tenuto <me>; wait 1.5 ; input /ma "' .. spell.en .. '" <me>')
	end
		
	-- if 2hr soul voice is on and spell is marcato, cancel spell
	if table.contains(playera.buffs, 52) and spell.en == 'Marcato' then
			cancel_spell()
	end
	
	-- Use Divine Emblem before any divine magic spell.
	if player.main_job == 'PLD' and T{'DivineMagic', 'Divine Magic'}:contains(spell.skill)  and spell.en ~= "Enlight II" and
	ability_recasts[80] == 0 then
		cancel_spell()
		send_command('input /ja "divine emblem" <me>; wait 1.5; input /ma "' .. spell.en .. '" ' .. spell.target.raw)
	end


	-- Use saboteur and stymie for enfeebling magic, if it's up..
	if player.main_job == 'RDM' 
		and T{'EnfeeblingMagic', 'Enfeebling Magic'}:contains(spell.skill)  
		and ability_recasts[36] == 0
	then
		cancel_spell()
		send_command('input /ja saboteur <me> ; wait 1.5 ; input /ma "' .. spell.en ..'" ' .. spell.target.raw)
	end

	-- If unbridled learning is ready and the spell is cocoon, cancel it, use unbridled learning,
	-- then cast Harden Shell
	--if player.main_job == "BLU" and spell.en == 'Cocoon' and ability_recasts[81] == 0 then
	--	cancel_spell()
	--	send_command('input /ja "Unbridled Learning" <me>; wait 1.5 ; input /ma "Harden Shell" <me>')
	--end
	
	-- If casting an bluemage UL spell, activate UL first
	if player.main_job == "BLU" 
	   and table.contains(ul_blue_spells,spell.en) 
	   and ability_recasts[81] == 0 
	then
		cancel_spell()
		send_command('input /ja "Unbridled Learning" <me>; wait 1.5 ; input /ma "' .. spell.en ..'" ' .. spell.target.raw)
	end
	
	if player.main_job == 'RDM' and player.main_job_level == 99 then
		if spell.en == 'Refresh' and spell_recasts[473] == 0 and player.mp >=60 then
			cancel_spell()
			send_command('input /ma "Refresh II" ' .. spell.target.raw)
		elseif spell.en == 'Refresh II' and spell_recasts[894] == 0 and player.mp >=80 then
			cancel_spell()
			send_command('input /ma "Refresh III" ' .. spell.target.raw)
		elseif spell.en == 'Haste' and spell_recasts[511] == 0 and player.mp >=80 then
			cancel_spell()
			send_command('input /ma "Haste ii" ' .. spell.target.raw)
		end
	end

	if player.main_job == 'GEO' and player.main_job_level == 99
	   and ability_recasts[247] == 0
	   and string.startswith(spell.en, 'Geo-')
	then
		cancel_spell()
		send_command('input /ja "Blaze of Glory" <me> ; wait 1.5 ; input /ma "' .. spell.en .. '" ' .. spell.target.raw)
	end
	
	if (spell.skill == "Summoning Magic" or spell.skill == 38)
	   and pet and pet.isvalid
	then
		-- Release pet first the cast the summoning magic again
		cancel_spell()
		smn_cancel_release = 1
		send_command('input /pet release <me> ; wait 2 ; input /ma "' .. spell.en .. '" ' .. spell.target.raw)
	end
		
end

function pretarget_JA_specific(spell)
--print(tostring(debug.getinfo(1).currentline))
	if spell.prefix ~= '/jobability' then
--print(tostring(debug.getinfo(1).currentline))
		return 
	end
--print(tostring(debug.getinfo(1).currentline))
 local ability_recasts = windower.ffxi.get_ability_recasts()

 -- For smn; If there is no pet, cancel release
 if player.main_job == 'SMN'
    and spell.en == 'Release'
    and pet and (not pet.isvalid)
 then
 	cancel_spell()
 	return
 end
 
 -- Cancel JA's that try to execute when player is not engaged
 if player.status ~= 1 and T{'Striking Flourish'}:contains(spell.en) then
 	cancel_spell()
 	return
 end
 
 -- Use presto if ready and if there are 2 or less steps active
	if T{'Quickstep', 'Box Step', 'Stutter Step', 'Feather Step'}:contains(spell.en) then
		local step_count = count_finishing_moves()
		if step_count < 3 and canPresto() then
			cancel_spell()
			send_command('input /ja presto <me> ; wait 1 ; input /ja "' .. spell.en .. '" ' .. spell.target.raw)
			return
		end
	end
	
	-- Use Bestial Loyalty instead of call beast if it's up
	if spell.en == "Call Beast" and ability_recasts[94] == 0 then
		cancel_spell()
		send_command('input /ja "Bestial Loyalty" <me>')
		return
	end
	
	-- Cancel spell if you're using Call Beast with an HQ jug
	if spell.en == "Call Beast" and hq_jugs:contains(string.lower(player.equipment.equipammo)) then
		add_to_chat(5, "I refuse to use an HQ jug with 'Call Beast'")
		cancel_spell()
		return
	end
	
	
	
	-- Prevent multiple calls of release
	if player.main_job == 'SMN' and spell.en == 'Release' then
		if smn_cancel_release and smn_cancel_release > 0 then
			smn_cancel_release = smn_cancel_release - 1
		elseif smn_cancel_release and smn_cancel_release < 1 then
			cancel_spell()
			smn_cancel_release = nil
		end
	end
	
	-- Use Deus Ex Automata if Activate is not ready
	if spell.name =="Activate" 
	   and ability_recasts[205] > 0
	   and ability_recasts[115] == 0
	then
		cancel_spell()
		send_command('input /ja "deus ex automata" <me>')
	end
	
end

function pretarget_WS_specific(spell)
	if spell.prefix ~= '/weaponskill' then
		return 
	end
	
	--if player.status ~= 1 then
	--	cancel_spell()
	--	return
	--end

	if player.status ~= 'Engaged' or player.tp < 1000 then 
		cancel_spell()
		return
	end
	
	local ability_recasts = windower.ffxi.get_ability_recasts()
	-- If marches are not on, use boost before h2h ws's ; Boost is 16
	if player.main_job == 'MNK' and buffactive['march'] == nil and ability_recasts[16] == 0 and
		 buffactive['boost'] == nil and table.contains(weaponskills['H2H'], spell.en) 
		 and spell.en ~= 'Shoulder Tackle'
	then
			cancel_spell()
			send_command('input /ja boost <me>')
			coroutine.schedule(function()
						 	if spell and spell.target.raw then
		 		send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
		 	end

			end, 2)
		retSet = nil
--	if spell.prefix == '/weaponskill' and player.status == 1 then
		-- Use assassin's charge before every weaponskill, if it's up...
		-- And bully coupled with sneak attack
	elseif true and player.main_job == 'THF' and ability_recasts[67] == 0 then
		cancel_spell()
		send_command("input /ja \"assassin's Charge\" <me>")
		add_to_chat(5, "(GearSwap) Using Assassin\'s Charge...")
		-- Send the ws command again
		coroutine.schedule(function()
					 	if spell and spell.target.raw then
		 		send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
		 	end

		end, 2)
		retSet = nil
	elseif true and player.main_job == 'THF' and (ability_recasts[240] + ability_recasts[64]) == 0 then
		-- Check to see if bully and sneak attack is ready
		cancel_spell()
		send_command('input /ja "bully" <t>')
		add_to_chat(5, '(GearSwap) Using bully...')
		coroutine.schedule(function()
					 	if spell and spell.target.raw then
		 		send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
		 	end

		end, 3)
		retSet = nil
	elseif true and player.main_job == 'THF' and ability_recasts[64] == 0 and ability_recasts[240] >= 150 then
		-- If bully was recently used (within 30 seconds) use sneak attack
		cancel_spell()
		add_to_chat(5, '(GearSwap) Using Sneak Attack...')
		send_command('input /ja "Sneak Attack" <me>')
		coroutine.schedule(function()
					 	if spell and spell.target.raw then
		 		send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
		 	end

		end, 2)
		retSet = nil
	elseif ability_recasts[2] == 0 and
	  ((player.main_job == 'WAR' and player.main_job_level > 36) or
	  (player.sub_job == 'WAR' and player.sub_job_level > 36)) then
	  -- Don't use warcry for certain weaponskills
	  -- But always use it for war 'cause savagery gives it a tp bonus
	  if (not T{'Flat Blade', 'Sanguine Blade', "Shoulder Tackle","Atonement", "Smash Axe","Cloudsplitter", 
	            "Primal Rend", "Blade: Ei"}:contains(spell.en))
	  	 or player.main_job == "WAR"
	  then
			-- Use warcry before weaponskill is your mainjob or subjob is war and higher than
		   cancel_spell()
		   add_to_chat(5, '(GearSwap) Using Warcry')
		   send_command('input /ja warcry <me>')
		   did_warcry = true
			 coroutine.schedule(function()
			 	if spell and spell.target.raw then
			 		send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
			 	end
			 end, 2)
			retSet = nil
		end
	elseif false
	       and player.main_job == 'SAM' and player.main_job_level == 99
				 and not (buffactive['Meikyo Suishi'] or buffactive['Sekkanoki'])
	       and ability_recasts[54] == 0
	then
		-- Auto Hagakure
		cancel_spell()
		send_command('input /ja Hagakure <me>; wait 2 ; input /ws "' .. spell.en .. '" ' .. spell.target.raw)
	elseif player.main_job == 'DNC' 
	       and count_finishing_moves() > 2 
	       and ability_recasts[222] == 0 
	       and ws_prep
	then
		-- Do building flourish before weaponskill
		cancel_spell()
		add_to_chat(5, '(GearSwap) Using Building Flourish')
		send_command('input /ja "Building Flourish" <me>')
		coroutine.schedule(
					function()
					 	if spell and spell.target.raw then
		 					send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
		 				end
					end, 2)
	elseif player.main_job == 'DNC' 
				 and count_finishing_moves() > 1 
				 and ability_recasts[226] == 0 
				 and ws_prep
	then
	 	-- Do climactic flourish before weaponskill
	 	cancel_spell()
	 	add_to_chat(5,'(GearSwap) Using Climactic Flourish')
	  send_command('input /ja "climactic flourish" <me>')
		coroutine.schedule(
					function()
					 	if spell and spell.target.raw then
		 					send_command('input /ws "' .. spell.en .. '" ' .. spell.target.raw)
		 				end
					end, 2)
		retSet = nil
	end
	if player.main_job == 'DNC' then
		if not ws_prep then
			if not did_warcry then -- Don't reset ws_prep on warcry
				ws_prep = true
				add_to_chat(5, 'ws_prep reset to true')
			end
		end
	end
	did_warcry = false
end

function pretarget_corsair_specific(spell)
	local job_ability_recasts = windower.ffxi.get_ability_recasts()
	local quickdraw_shots = T{"Fire Shot", "Ice Shot", "Wind Shot", "Earth Shot", "Thunder Shot", "Water Shot", "Light Shot", "Dark Shot"}

	-- If the sets.ammo.qickdraw bullet is equipped and the spell is not a quickdraw shot, cancel spell
	if T{'Animikii Bullet', 'Omphalos Bullet'}:contains(player.equipment.ammo) and T{"/range", "/weaponskill"}:contains(spell.prefix) then
		send_command("input /equip ammo")
		cancel_spell()
		add_to_chat(2, 'Animikii Bullet or Omphalos Bullet about to be fired.  Did you run out of ammo?')
	end

	if table.contains(quickdraw_shots, spell.en) ~= true and
	   T{'Animikii Bullet', 'Omphalos Bullet'}:contains(player.equipment.ammo) 
	then
		cancel_spell()
		send_command('input /equip ammo')
		add_to_chat(2, "I refuse to do any JA's or WS's when the " .. player.equipment.ammo .. " is equiped!")
	end

	-- Put triple shot up if it's not up
	if player.main_job == "COR" and spell.prefix == "/range" and job_ability_recasts[84] == 0 then
		cancel_spell()
		add_to_chat(5, '(GearSwap) Using Triple Shot')
		send_command('input /ja "triple shot" <me> ; wait 1.5 ; input /ra ' .. spell.target.raw)
	end

end

function pretarget_pet_specific(spell)
--print(spell.en)
--print(tostring(debug.getinfo(1).currentline))
	if spell.prefix ~= '/pet' then
--print(tostring(debug.getinfo(1).currentline))
		return 
	end
	local ability_recasts = windower.ffxi.get_ability_recasts()
--print(tostring(debug.getinfo(1).currentline))
 -- TODO:  Ad filters for jug pets vs charmed pets when using snarl
 -- Cancel snarl if there is no pet
 if spell.en == "Snarl" and pet.isvalid == false then
 	cancel_spell()
--print(tostring(debug.getinfo(1).currentline))
	elseif false and pet.isvalid and player.main_job == 'SMN' then
		-- Check to make sure the pet move is valid for the pet.
		if table.contains(avatar_spells_list, spell.en)
		   and avatar_spells[pet.name] and (not avatar_spells[pet.name][spell.en])
		then
			add_to_chat(5, "Gearswap debug: Wrong spell for pet")
		end
 	return
 end

	-- Use apogee before bloodpacts
	if false and player.main_job == 'SMN' 
	   and spell and table.contains(avatar_spells_list, spell.en)
	   and ability_recasts[108] == 0
	then
		cancel_spell()
		send_command('input /ja apogee <me> ; wait 2 ; input /pet "' .. spell.en .. '" ' .. spell.target.raw)
	end
end
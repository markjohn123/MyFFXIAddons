require("andreaslibs/resource_functions")

shadows_required = 1
tempcast = false
do_auto_shadows = false
for_job = nil
doautoni = true
doAutoShadows = true

shadows_required = 1

function auto_shadows()
	local player = windower.ffxi.get_player()
	if player and T{player.main_job, player.sub_job}:contains('NIN') ~= true then
		return false
	elseif not player then
		return false
	elseif not doAutoShadows then
		return false
	end
	
	if not for_job then
		windower.add_to_chat(5,'andreaslibs/auto_shadows: for_job not set')
		return false
	end
	
	--if player.main_job ~= for_job then return false end
	
	local retVal = false
	local recasts = windower.ffxi.get_spell_recasts()
	local shadowsAreGood = false
	
	-- Check to make sure shihei is available.
	local has_shihei = true
	if has_item and type(has_item) == 'function' then
		has_shihei = has_item(1179)
	end
	
	--if not has_shihei then return retVal end

	if player ~= nil 
	  and player.status ~= nil 
	  and doAutoShadows == true 
	  and (player.status == 1 or tempcast == true) 
	  and canDoSpells() == true 
	  and (doautoni == true or tempcast == true)
	then
		if tempcast == false then
			if     shadows_required == 5 or shadows_required == 4 then
				shadowsAreGood = (table.hasanyvalue(player.buffs, 446) ~= nil)
				--retVal = table.contains(player.buffs, 446)
			elseif shadows_required == 3 then
				shadowsAreGood = (table.hasanyvalue(player.buffs, 445, 446) ~= nil)
				--retVal = table.contains(player.buffs, 445) or table.contains(player.buffs, 446)
			elseif shadows_required == 2 then
				shadowsAreGood = (table.hasanyvalue(player.buffs, 444, 445, 446) ~= nil)
				--retVal = table.contains(player.buffs, 444) or table.contains(player.buffs, 445) or table.contains(player.buffs, 446)
			elseif shadows_required == 1 then
				shadowsAreGood = (table.hasanyvalue(player.buffs,  66, 444, 445, 446) ~= nil)
				--retVal = table.contains(player.buffs, 66) or table.contains(player.buffs, 444) or table.contains(player.buffs, 445) or table.contains(player.buffs, 446)
			end
		end
		if shadowsAreGood == false then
			-- try to put up shadows
			local spell = 'Utsusemi: ichi'
			--local cancel_shadows = ' ; wait 3.5 ; cancel 66 ; cancel 444 ; cancel 445 ; cancel 446'
			local temp_shadow_counter = 1
			-- See if ni or ichi are ready to be cast
			if recasts[340] == 0 or recasts[339] == 0 or recasts [338] == 0 then
				-- See if we can cast ni
				if player.main_job == 'NIN' and recasts[340] == 0 then
					spell = 'Utsusemi: san'
					temp_shadow_counter = -1
				elseif recasts[339] == 0 then
					spell = 'Utsusemi: ni'
					--cancel_shadows = ''
					temp_shadow_counter = .4
				end
				windower.send_command('input /ma "' .. spell .. '"')
				retVal = true
				--shadow_cancel_count = temp_shadow_counter
				if temp_shadow_counter > 0 then
					coroutine.schedule(shadow_cancel, temp_shadow_counter)
				end
			end
		end		
	end
	tempcast = false
	return retVal
end

shadow_cancel_count = -1

function shadow_cancel()
	windower.send_command('cancel 66 ; cancel 444 ; cancel 445 ; cancel 446')
	windower.add_to_chat(2,'Cancelling shadows')
end

--[[
prerender_count=0
windower.register_event('prerender', function()
	local player = windower.ffxi.get_player()
	if player ~= nil and T{player.main_job, player.sub_job}:contains('NIN') == false then
		return
	end
	
	shadow_cancel()
end)
]]

windower.register_event('addon command', function(...)
	local args = {...}
	local cmd = 'ni'
	
	if table.length(args) > 0 then
		cmd = args[1]
	end
	
	 if cmd == 'ni' then
	 		tempcast = true
	 		auto_shadows()
	 elseif T{'autoni','doautoni','auto_ni','do_auto_ni','doni', 'do_ni'}:contains(cmd) then
	 	if table.length(args) > 1 then
	 		if table.containskey(logic, string.lower(args[2])) then
	 			doautoni = logic[string.lower(args[2])]
	 		else
	 			windower.add_to_chat(5, "auto_shadows: Invalid option '" .. args[2] .."'")
	 		end
	 	else
	 		if doautoni == true then
	 			doautoni = false
	 		else
	 			doautoni = true
	 		end
	 	end
	 	windower.add_to_chat(5, "auto_shadows: doautoni = " .. tostring(doautoni))
	 end
end)

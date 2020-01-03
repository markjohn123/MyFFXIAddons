--[[
	A library to tell whether the client is busy doing something,
	whether, a spell, weaponskill, job ability, etc.
]]

local isbusy = {}
isbusy['myx'] = 0
isbusy['myy'] = 0

_libs = _libs or {}
_libs.isbusy = isbusy

isbusy['isbusy'] = false
isbusy['ismoving'] = false

isbusy['busy_delay'] = 0
isbusy['engage_delay'] = 1
isbusy["is_busy_timeout_delay"] = .5
isbusy['timers'] = {}

function isbusy.set_is_busy(delay)
	if delay > 0 then
		isbusy['isbusy'] = true
		isbusy['busy_delay'] = delay
	end
end

function timer_update(timers)
	-- Timers update
	if timers and type(timers) == 'table' then
--	windower.add_to_chat(5,"isbusy 29:")
		for timer, value in pairs(timers) do
			if type(value) == 'table' then
				timers[timer] = timer_update(value)
			else
				if timers[timer] >= 1 then
					timers[timer] = timers[timer] - 1
				elseif timers[timer] > 0 and timers[timer] < 1 then
					timers[timer] = 0
				end
			end
		end
	end

	return timers
end

function position_update()
	-- Position updates
	player = windower.ffxi.get_mob_by_target('me')
	if player then
	--windower.add_to_chat(5, "(" .. tostring((player.x)) .. "," .. tostring((player.y)) .. ")")
		if isbusy["myx"] ~= player.x or
		   isbusy["myy"] ~= player.y
		then
			isbusy["ismoving"] = true	
			isbusy["myx"] = player.x
			isbusy["myy"] = player.y
		else
			isbusy["ismoving"] = false				
		end
	end
end

function is_busy_timeout()
	-- This loop is initiated when the pluginloads and killed
	-- when the plugin unload.
	-- If it finds that busy_delay > 0 decrement it
	local player
	while  true do
		-- Slower than dogshit.  This should be in the 1/30 second event
		position_update()
		
		isbusy.timers = timer_update(isbusy.timers)
		
		if isbusy['busy_delay'] > 0 then
			isbusy['busy_delay'] = isbusy['busy_delay'] - isbusy["is_busy_timeout_delay"]
		elseif isbusy['isbusy'] then
			isbusy['isbusy'] = false
		end
		coroutine.sleep(isbusy["is_busy_timeout_delay"])
	end
end

windower.register_event('action', function(act)
	local player = windower.ffxi.get_player()
	local start_actions = {7,8,9,12}
	local end_actions   = {2,3,4,5,6,11}
	
	if player.id == act.actor_id then
		if table.contains(start_actions, act.category) == true then
			isbusy['isbusy'] = true
			-- Timeout of 5 seconds if the end action isn't encountered
			if act.param == 28787 then
				isbusy['busy_delay'] = 2 -- For interruption
			else
				isbusy['busy_delay'] = 10 -- Standard delay, just in case
			end
--			windower.add_to_chat(5, "begin: category=" .. act.category .. " ; " .. "act.param=" .. tostring(act.param))
		elseif table.contains(end_actions, act.category) == true then
		  -- We also set isbusy to true because some actions do not have
		  -- start actions; such as /ja's
			isbusy['isbusy'] = true
			-- At least 1 second between actions
			isbusy['busy_delay'] = 2
--			windower.add_to_chat(5, "end: category=" .. act.category .. " ; " .. "act.param=" .. tostring(act.param))
		end
	end
end)

isbusy['isbusyloop'] = nil
windower.register_event('load', function()

	isbusy['isbusyloop'] = coroutine.schedule(is_busy_timeout, 1)
	
	if not isbusy['isbusyloop'] then
		windower.add_to_chat(2, 'Failed to create isbusy loop')
	end

end)

windower.register_event('unload', function()
	if isbusy['isbusyloop'] then
		coroutine.close(isbusy['isbusyloop'])
	end
end)

windower.register_event('status change', function(new, old)
	if status == 1 then
		isbusy["busy_delay"] = isbusy['engage_delay']
		isbusy["isbusy"] = true
	end
end)

windower.register_event('zone change', function(new_id,old_id)
	isbusy["busy_delay"] = 15
	isbusy["isbusy"] = true
end)

return isbusy

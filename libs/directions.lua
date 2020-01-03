--[[
	Handles stuff like getting the direction of your target so you can turn to or away from the target.
	Also tells if you are infrong or behind the target
]]

function direction_to_mob(mob)
	local me_mob = windower.ffxi.get_mob_by_target('me')
	local retVal = nil

	if mob ~= nil and me_mob ~= nil and mob.id ~= me_mob.id then
		retVal = direction_to_coordinates(mob.x,mob.y)
	end
	
	return retVal
end

function direction_to_coordinates(x,y)
	local retVal = -1
	local me_mob = windower.ffxi.get_mob_by_target('me')
	
	-- (x,y) mobs coordinates
	-- (mx,my) self coordinates
	local mx,my = -1,-1,-1,-1
	local quadrant = -1
	local difx = nil
	local dify = nil
	
	
--	if mob ~= nil and me_mob ~= nil and mob.id ~= me_mob.id then
--		x  = mob.x
--		y  = mob.y
		mx = me_mob.x
		my = me_mob.y
		
		-- If both coordinates are the same, then there is no direction
		if mx == x and my == y then return retVal end
		
		--retVal = '(x,y)=(' .. tostring(x) .. ',' .. tostring(y) .. ') ; (mx,my)=(' .. mx .. ',' .. my .. ')' 
	
		local opposite = y - my
		local adjacent = x - mx
		hypoteneuse = math.sqrt( opposite * opposite + adjacent * adjacent )
		
		--retVal = retVal .. '----(opposite, adjacent)=(' .. opposite .. ',' .. adjacent .. ')'
		
		-- Which quadrant is it in?
		diffx = x - mx
		diffy = y - my

		if     diffx > 0 and diffy > 0 then
			quadrant = 1
		elseif diffx > 0 and diffy < 0 then
			quadrant = 4
		elseif diffx < 0 and diffy > 0 then
			quadrant = 2
		elseif diffx < 0 and diffy < 0 then
			quadrant = 3
		end 
		
		retVal = math.asin(opposite / hypoteneuse)

		if  quadrant == 2 then
			retVal = math.pi - retVal
		elseif quadrant == 3 then
			retVal = (retVal + math.pi) * -1
		end
--	end	
	
	retVal = retVal * -1
	
	return retVal
end

function is_infront(mob)
	retVal = false
	
	return retVal
end

function is_behind(mob)
	if is_infront() == true then
		return false
	else
		return true
	end
end

function is_facing(mob)
	retVal = false
	
	return retVal
end

function is_facing_away(mob)
	if is_facing(mob) == true then
		return false
	else
		return true
	end
end

function face(mob)
	local dir = direction_to_mob(mob)
	if dir ~= nil then
		windower.ffxi.turn(dir)
	end
end

function turn_away_from(mob)

end

function go_behind(mob)

end

function go_infront(mob)

end

function run_to(mob)
	windower.ffxi.run(direction_to_mob(mob))
end

function distance_to(mob)
	local retVal = -1
	
	if     mob and type(mob) == 'table'
	   and mob.id and mob.index and mob.distance and mob.distance > 0
	then
		return math.sqrt(mob.distance)
	end
	
	return retVal
end

function distance_between(mob1, mob2)
	local retVal = -1
	
		if mob1 and mob2 and type(mob1) == 'table' and type(mob2) == 'table'
		   and mob1.id and mob2.id and mob1.index and mob2.index and
		   mob1.x and mob2.x and mob1.y and mob2.y
		then
			retVal = math.sqrt(math.pow(mob1.x - mob2.x,2) + math.pow(mob1.y - mob2.y,2))
		end
	
	return retVal
end

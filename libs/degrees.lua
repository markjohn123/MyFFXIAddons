--math = require('maths')

function ffxi_radians_to_radians(ffxiradian)
	-- Converts the retarded ffxi radian for to true radian form.
	-- e is 0/2 pi or 4/2 pi
	-- n is 1/2 pi
	-- w is 2/2 pi
	-- s is 3/2 pi
	
	-- Precision is 13 digits after the decimal
	local retVal = ffxiradian:abs()
	if ffxiradian >= 0 then
		retVal = 2 * math.pi - ffxiradian
	end
	
	return retVal
end

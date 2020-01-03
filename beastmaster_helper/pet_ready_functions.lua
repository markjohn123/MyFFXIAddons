-- Functions to conditional choose which tp move to do
-- Return the actual move to do
function tailblow_or_fireball(default_move)
	local target = windower.ffxi.get_mob_by_target("t")
	local retVal = default_move or "Fireball"
	
	if target and T{"Khimaira", "Khrysokhimaira Elder", "Armored Chariot"}:contains(target.name) then
		retVal = "Tail Blow"
	end
	
	return retVal
end

function frogkick_or_silencegas(default_move)
	local target = windower.ffxi.get_mob_by_target("t")
	local retVal = default_move or "FrogKick"
	local player = windower.ffxi.get_player()
	local pet    = windower.ffxi.get_mob_by_target("pet")
	
	if target and player and player and pet and pet.status == 1 and pet.hpp >= 90 then
		retVal = "Silence Gas"
	end
	
	return retVal
end

function party_needs_healing()
	local retval = false
	local party  = windower.ffxi.get_party()
	local pet    = windower.ffxi.get_mob_by_target('pet') 
	
	for key,value in pairs(party) do
		if string.startswith(key, "p")
		   and key ~= 'p0'
		   and type(value) == 'table' 
		   and value.mob and value.hpp <= 50
		   and distance_between(value.mob,pet) <= 10
		then
			retVal = true
		end
	end
	
	return retVal
end

function dortwinsnextmove(default_move)
	local retVal    = default_move or "Foot Kick"
	local playermob = windower.ffxi.get_mob_by_target("me")
	local pet       = windower.ffxi.get_mob_by_target("pet")
	local heal_party = true
	
	-- Keep charges at 3, just incase we need to heal
	if get_number_of_charges() < 3 then
		retVal = nil
	end
	
	-- Do I or the pet need curing?
	if (playermob and playermob.hpp <= 75 and pet and math.sqrt(pet.distance) <= 10) 
	    or (pet and pet.hpp <=75) 
	    or (heal_party and party_needs_healing())
	then
		retVal = "Wild Carrot"
	end
	
	return retVal
end

function amiablerochesnextmove(default_move)
	local retVal = default_move or "Recoil Dive"
	local target = windower.ffxi.get_mob_by_target("t")
	
	if target.name == "Metalcruncher Worm" then
		retVal = "Water Wall"
	end	
	
	return retVal
end

function generousarthursnextmove(default_value)
	local retVal = default_move or "Corrosive Ooze"
	local target = windower.ffxi.get_mob_by_target("t")
	
	if target.hpp < 90 then
		retVal = "Purulent Ooze"
	end

	return retVal
end

function candisnextmore(default_value)
	local retVal = default_value

	return retVal
end

function snort_timer()
	do_snort = true
end

do_snort = true
function should_i_snort(default_value)
	local retVal = "Sweeping Gouge"
	
	if do_snort then
		coroutine.schedule(snort_timer, 180)
		do_snort = false
		retVal = "Zealous Snort"
	end
	return retVal
end

function ibukis_next_move()
	local retVal = ibukis_default_move or "Swooping Frenzy"
	local player = windower.ffxi.get_player()
	
	-- See if unleash is up
	if table.contains(player.buffs, 498) then
		retVal = "Pentapeck"
	end
	
	return retVal
end
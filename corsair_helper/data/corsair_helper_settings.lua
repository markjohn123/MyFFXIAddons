function load_settngs()
	local char_name
	
	if windower.ffxi.get_info().logged_in then
		char_name = windower.ffxi.get_player().name
		
		if char_name     == "Maltha" then
			do_rolls = false
			do_shots = false
			shot = "Fire Shot"
			do_auto_shoot = false
			-- Set these values in addon_load for Maltha or Maltana
			rolls = { 
				"Fighter's Roll",
				"Hunter's Roll", 
			}
			do_auto_abilities = true
			quickdraw_recast_time = 40

			do_auto_weaponskills = false -- Do automatic weaponskills
			mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
			default_weaponskill_tp = 1000 -- TP to weaponskill at
			weaponskill_distance = 20 -- Distance within to weaponskill
			keep_aftermath_up = false -- Keep aftermath active
			aftermath_level = 3 -- Aftermath leel to maintain
			aftermath_weaponskill = nil -- The aftermath weaponskill
			weaponskills = {"Last Stand"} --List of weaponskill to use
			close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
			weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
		elseif char_name =="Maltana" then
			do_rolls = true
			do_shots = false
			shot = "Fire Shot"
			do_auto_shoot = false
			-- Set these values in addon_load for Maltha or Maltana
			rolls = { 
				"Companion's Roll",
				"Beast Roll", 
			}
			do_auto_abilities = true
			quickdraw_recast_time = 40

			do_auto_weaponskills = false -- Do automatic weaponskills
			mobhp_ws_pct = 100 -- Percent at which to weaponskill for single weaponskills
			default_weaponskill_tp = 1000 -- TP to weaponskill at
			weaponskill_distance = 20 -- Distance within to weaponskill
			keep_aftermath_up = false -- Keep aftermath active
			aftermath_level = 3 -- Aftermath leel to maintain
			aftermath_weaponskill = nil -- The aftermath weaponskill
			weaponskills = {"Wildfire"} --List of weaponskill to use
			close_skillchain = false -- Will attempt to close last chained weaponskill.  This will only work when weaponskills is defined as a table
			weaponskill_anyway = true -- If it can't close the skillchain, then use the first ws
		end
	end
end
include('GS_Common.lua')
-- Change default weapons based on subjob
if T{"DNC", "NIN"}:contains(player.sub_job) ~= true then
	weapon = "axe and shield"
--	gear_command()
end
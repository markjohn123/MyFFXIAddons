	-- Redefine gear to call gs c gear
send_command('alias gear gs c gear')
send_command('alias naked gs equip naked')
send_command('alias naked gs equip naked')

for key,value in pairs(battle_states) do
	send_command('alias ' .. value .. ' gs c battle_state ' .. value)
end

send_command('alias engaged gs c engaged')
send_command('alias idle    gs c idle')

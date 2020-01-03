-- Create some default events like:
-- addon_command
-- and process commands such as:
-- No command - Toggle the addon on/of
-- enable/disable - same as no command
-- load/reload - load settings
-- Will also process user commands if it finds a
-- user_commands table
-- Note, the user_commands table is processed first.
-- Format of the user_commands table is:
-- { ["command"]=function(...),
--   ["command"]=function(...), }
-- Don't include spaces in the command
-- A special key value is ["no_command"] . This function gets
-- executed when no commands are passed to the addon
-- The user_command can optionally return a value.  If it's a string,
-- it will be printed as windower.add_to_chat(5, ...)
function print_addon_command_result(result)
	if type(result) == "string" then
		windower.add_to_chat(5, result)
	end
	
	return result
end

system_commands = {
	["load"]   = function(...) load_settings() ; return "Settings Loaded" end,
	["reload"] = function(...) load_settings() ; return "Settings Loaded" end
}

user_commands = nil
user_commands_flattened = false
windower.register_event("addon command", function(...)
	local args = {...}
	local command = ''
	
	if table.length(args) > 0 then
		command = args[1]
		if user_commands and type(user_commands) == 'table' then
			if not user_commands_flattened then
				local tmp_user_commands = {}
				for command, command_function in pairs(user_commands) do
					tmp_user_commands[command:lower()] = command_function
				end
				user_commands = tmp_user_commands
				user_commands_flattened = true
			end

			if user_commands[command] then
				print_addon_command_result((user_commands[command])(...))
			elseif system_commands[command] then
				print_addon_command_result((system_commands[command])(...))
			end
		end
	elseif user_commands 
				 and user_commands.no_command 
				 and type(user_commands.no_command) == "function"
  then
		print_addon_command_result((user_commands.no_command)(...))
	elseif type(addon_enabled) ~= "nil" and addon_enabled then
		addon_enabled = false
		print_addon_command_result("Default: Addon disabled")
	elseif type(addon_enabled) ~= "nil" and (not addon_enabled) then
		addon_enabled = true
		print_addon_command_result("Default: Addon enabled")
	end
end)
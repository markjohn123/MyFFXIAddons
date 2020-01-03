require('strings')
require('luau')
texts = require('texts')

-- Settings for settings lol
copy_to_global = true -- Whether or not to make a global copy of this setting

if not settings then
	settings = T{}
end

-- Format
-- ["settingg_name"] = value
-- ["Setting Parent Name"]["setting_name"] = value
--
-- An actual setting is a discrete value.
-- A setting folder is an array

function copy_settings_to_global()
	for key, value in pairs(settings) do
		if type(value) == 'table' then
		
		else
				
		end
	end
end

windower.register_event('load', function()
	if copy_to_global then
		copy_settings_to_global()
	end
end
sleep_timeout = 1         -- The infinity loop default timeout
sleep_timeout_success = 2 -- The infinity loop timeout if loop function returns true

city_zones = {
    [32] = {id=32,en="Sealion's Den",ja="??????",de="Seel�wen-H�hle",fr="Antre de l'Otarie"},
    [48] = {id=48,en="Al Zahbi",ja="????",de="Al Zahbi",fr="Al Zahbi"},
    [50] = {id=50,en="Aht Urhgan Whitegate",ja="???????",de="Aht Urhgan-Wei�tor",fr="Portes Blanches"},
    [53] = {id=53,en="Nashmau",ja="????",de="Nashmau",fr="Nashmau"},
    [70] = {id=70,en="Chocobo Circuit",ja="?????????",de="Chocobo-Rennbahn",fr="Chocodrome"},
    [71] = {id=71,en="The Colosseum",ja="?????",de="Das Kolosseum",fr="Colis�e"},
    [80] = {id=80,en="Southern San d'Oria [S]",ja="???????S?",de="S�d-San d'Oria (R)",fr="San d'Oria Sud (R)"},
    [87] = {id=87,en="Bastok Markets [S]",ja="??????????S?",de="Bastok-Markt (R)",fr="March� de Bastok (R)"},
    [94] = {id=94,en="Windurst Waters [S]",ja="?????????S?",de="Windurst-Weiher (R)",fr="Canaux de Windurst (R)"},
    [96] = {id=96,en="Fort Karugo-Narugo [S]",ja="?????????S?",de="Karugo-Narugo-F. (R)",fr="Fort Karugo-Narugo (R)"},
    [99] = {id=99,en="Castle Oztroja [S]",ja="???????S?",de="Oztroja-Schloss (R)",fr="Ch�teau d'Oztroja (R)"},
    [106] = {id=106,en="North Gustaberg",ja="???????",de="Nord-Gustaberg",fr="Gustaberg Nord"},
    [107] = {id=107,en="South Gustaberg",ja="???????",de="S�d-Gustaberg",fr="Gustaberg Sud"},
    [131] = {id=131,en="Mordion Gaol",ja="????????",de="Mordion-Kerker",fr="Prison de Mordion"},
    [223] = {id=223,en="San d'Oria-Jeuno Airship",ja="?????",de="SdO.-Jeu. Luftschiff",fr="A�ronef San d'Oria-Jeuno"},
    [224] = {id=224,en="Bastok-Jeuno Airship",ja="?????",de="Bast.-Jeu. Luftschiff",fr="A�ronef Bastok-Jeuno"},
    [225] = {id=225,en="Windurst-Jeuno Airship",ja="?????",de="Wind.-Jeu. Luftschiff",fr="A�ronef Windurst-Jeuno"},
    [226] = {id=226,en="Kazham-Jeuno Airship",ja="?????",de="Kazh.-Jeu. Luftschiff",fr="A�ronef Kazham-Jeuno"},
    [227] = {id=227,en="Ship bound for Selbina",ja="??:??????",de="Schiff nach Selbina",fr="Ferry pour Selbina"},
    [228] = {id=228,en="Ship bound for Mhaura",ja="??:?????",de="Schiff nach Mhaura",fr="Ferry pour Mhaura"},
    [230] = {id=230,en="Southern San d'Oria",ja="??????",de="S�d-San d'Oria",fr="San d'Oria Sud"},
    [231] = {id=231,en="Northern San d'Oria",ja="??????",de="Nord-San d'Oria",fr="San d'Oria Nord"},
    [232] = {id=232,en="Port San d'Oria",ja="??????",de="San d'Oria-Hafen",fr="Port de San d'Oria"},
    [234] = {id=234,en="Bastok Mines",ja="?????????",de="Bastok-Minen",fr="Mines de Bastok"},
    [235] = {id=235,en="Bastok Markets",ja="?????????",de="Bastok-Markt",fr="March� de Bastok"},
    [236] = {id=236,en="Port Bastok",ja="???????",de="Bastok-Hafen",fr="Port de Bastok"},
    [237] = {id=237,en="Metalworks",ja="???",de="Metallwerke",fr="Forges"},
    [238] = {id=238,en="Windurst Waters",ja="????????",de="Windurst-Weiher",fr="Canaux de Windurst"},
    [239] = {id=239,en="Windurst Walls",ja="????????",de="Windurst-Mauern",fr="Remparts de Windurst"},
    [240] = {id=240,en="Port Windurst",ja="??????",de="Windurst-Hafen",fr="Port de Windurst"},
    [241] = {id=241,en="Windurst Woods",ja="????????",de="Windurst-W�lder",fr="For�t de Windurst"},
    [242] = {id=242,en="Heavens Tower",ja="???",de="Himmelsturm",fr="Tour des cieux"},
    [243] = {id=243,en="Ru'Lude Gardens",ja="?�????",de="Ru'Lude-G�rten",fr="Jardins de Ru'Lude"},
    [244] = {id=244,en="Upper Jeuno",ja="?????",de="Ober-Jeuno",fr="Haut Jeuno"},
    [245] = {id=245,en="Lower Jeuno",ja="?????",de="Unter-Jeuno",fr="Bas Jeuno"},
    [246] = {id=246,en="Port Jeuno",ja="????",de="Jeuno-Hafen",fr="Port de Jeuno"},
    [247] = {id=247,en="Rabao",ja="???",de="Rabao",fr="Rabao"},
    [248] = {id=248,en="Selbina",ja="????",de="Selbina",fr="Selbina"},
    [249] = {id=249,en="Mhaura",ja="???",de="Mhaura",fr="Mhaura"},
    [250] = {id=250,en="Kazham",ja="???",de="Kazham",fr="Kazham"},
    [251] = {id=251,en="Hall of the Gods",ja="????",de="Halle der G�tter",fr="Antichambre des dieux"},
    [252] = {id=252,en="Norg",ja="???",de="Norg",fr="Norg"},
    [256] = {id=256,en="Western Adoulin",ja="??????",de="West-Adoulin",fr="Adoulin Ouest"},
    [257] = {id=257,en="Eastern Adoulin",ja="??????",de="Ost-Adoulin",fr="Adoulin Est"},
    [284] = {id=284,en="Celennia Memorial Library",ja="???????",de="Celennia-Ged�chtnisbibliothek",fr="Biblioth�que Celennia"},
    [285] = {id=285,en="Feretory",ja="????",de="Seelenschrein",fr="Sanctuaire des �mes"},
}

function canDoSpells()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {6,29,7,2,19,14,17,10}
	
	for key, id in pairs(blocking) do
		if table.contains(player.buffs, id) == true then
			retVal = false
		end
	end
	
	return retVal
end

function canDoAbilities()
	local retVal = true
	local player = windower.ffxi.get_player()
	local blocking = {2,10,16,19,28,14,17}
	
	for key, id in pairs(blocking) do
		if table.contains(player.buffs, id) == true then
			retVal = false
		end
	end
	
	return retVal
end


function table.hasanyvalue(tab, ...)
	local values = {...}
	local retVal = nil
	
	--if not tab then
		--wndower.add_to_chat(3, "resource_functions: tab is nil")
	--end
	
	for key, value in pairs(values) do
		if table.contains(tab, value) then
			retVal = value
		end
	end
	
	return retVal
end

function load_settings()
	assert(loadfile(windower.addon_path .. "data/settings.lua"))()
end

function capitalize(me)
	return (string.upper(string.sub(me,1,1)) .. string.lower(string.sub(me, 2)))
end

function has_item(item_id, bagstouse)
	local retVal = false
	local bag_list = (type(bagstouse) == 'table' and bagstouse) 
									 or T{
		                        'inventory',
		                        --"wardrobe",
		                        --'sack',
		                        --'satchel',
		                        --'case',
												}
												
	local bags = windower.ffxi.get_items()
	
	if bags ~= nil then
		for _,bag in pairs(bag_list) do
			for slot,item_info in pairs(bags[bag]) do
				if type(item_info) == 'table' and item_info.id == item_id then
					retVal = true
					break
				end
			end
			if retVal == true then
				break
			end
		end
  end
	
	return retVal
end

-- Entry format
-- functions or tables orders by ordinal keys

infinity_loop_functions = {
	-- Example
	-- function() {local get windower.ffxi.get_player(); local retVal = false ; if player.main_job == 'job' then retVal = true ; end ; return retVal}
}

for_job = nil
function infinity_loop()
	local player
	local result = nil
	
	while true do
		player = windower.ffxi.get_player()
		sleep_timeout = 1
		if for_job and player and for_job == player.main_job and (type(addon_enabled) == 'nil' or addon_enabled ) and isbusy and (not (isbusy["isbusy"])) and type(infinity_loop_functions) == 'table' then
			for ordinal, loop_function in ipairs(infinity_loop_functions) do
				if type(loop_function) == 'function' then
					result = loop_function()
					if result then
						if type(result) == 'number' then
							sleep_timeout = result
							sleep_timeout = sleep_timeout_success
						end
						break
					end
				end
			end
		end
		
		coroutine.sleep(sleep_timeout)
	end
end

function is_in_town()
	local retVal = false
	local ffxi_info = windower.ffxi.get_info()
	local player = windower.ffxi.get_player()
	
	if not (T{0,1}:contains(player.status)) then
		retVal = true
	elseif city_zones[ffxi_info.zone] then
		retVal = true
	end
	
	return retVal
end
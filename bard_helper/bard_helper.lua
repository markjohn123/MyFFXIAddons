--[[
	Notes:
	TODO: Catch when the songs of a player wears off update the player_song_durations table accordingly
]]

require('LuaU')
require('logger')
config = require('config')
require('strings')
require('tables')
texts = require('texts')
isbusy = require('isbusy')
buffs = require('res/buffs')
job_abilities = require('res/abilities')
spells = require('res/spells')
jobs = require('res/jobs')

buff_names = {}
spell_names = {}
song_names = nil
job_ability_names = {}
job_names = {} -- The short version of the jobs.  key is short job name, value is job id

_addon.name = 'Bard Helper'
_addon.author = 'Andreas Sheriff'
_addon.version = '1'
_addon.commands = {'bard_helper', 'bh'}


-- For players that don't have their songs defined below, try to guess which songs to sing for which jobs.
-- The logic below tells which songs to sing
best_guess_songs = true

----------------------

mage_songs={[1]="Mage's Ballad III",[2]="Mage's Ballad II",[3]="Mage's Ballad"}
scholar_songs={["marcato"]="Victory March",[1]="Victory March",[2]="Advancing March",[3]="Mage's Ballad III"}
mele_songs={["marcato"]="Valor Minuet V",[1]="Valor Minuet V",[2]="Victory March",[3]="Advancing March"}
archery_songs={["marcato"]="Archer's Prelude",[1]="Archer's Prelude",[2]="Hunter's Prelude",[3]="Valor Minuet V"}
defense_songs={["marcato"]="Sentinel's Scherzo",[1]="Sentinel's Scherzo",[2]="Knight's Minne V",[3]="Knight's Minne IV"}

best_guess = {
	['WAR']=mele_songs,
	['MNK']=mele_songs,
	['WHM']=mage_songs,
	['BLM']=mage_songs,
	['RDM']=mage_songs,
	['THF']=mele_songs,
	['PLD']=defense_songs,
	['DRK']=mele_songs,
	['RNG']=archery_songs,
	['SAM']=mele_songs,
	['NIN']=mele_songs,
	['DRG']=mele_songs,
	['SMN']=mage_songs,
	['COR']=archery_songs,
	['DNC']=mele_songs,
	['GEO']=mage_songs,
	['BRD']=mage_songs,
	['SAM']=mele_songs,
	['DRG']=mele_songs,
	['BLU']=mele_songs,
	['PUP']=mele_songs,
	['SCH']=mage_songs,
	['RUN']=mele_songs
}


----------------------------------
--[[
Format:
  ["player_name"] = {
	["song name"] = duration,
	["song name"] = duration,
	etc
}

]]

player_song_durations = {}

logic = {
	['true'] = true,
	['false'] = false,
	['yes'] = true,
	['no'] = false
}

function load_settings()
	local funct, err = loadfile(windower.addon_path .. "data/settings.lua")
	if funct then
		funct()
		print("Loaded settings")
	else
		print("Error loading settngs: " .. err)
	end	
end

load_settings()

function isMainEngaged()
	local main_mob windower.ffxi.get_mob_by_name(main)
	local retVal = false
	
	if main_mob and main_mob.status == 1 then
		retVal = true
	end
	
	return retVal
end

function canSingOnMember(member_name)
	local party = windower.ffxi.get_party()
	local player_mob = nil
	local retVal = false
	
	if party then
		for target, party_member_info in pairs(party) do
			if type(party_member_info) == 'table' and string.lower(party_member_info.name) == string.lower(member_name) then
				-- Is the target in my party?
				if string.sub(target, 1,1) ~= 'p' then
					break
				end
				-- Is the target near enough to sing on?
				if party_member_info.mob and party_member_info.mob.distance <= 398 then
					retVal = true
				end			
				break
			end
		end
	end	
	
	return retVal
end

function do_auto_pianasimo_songs()
	local relVal = false
	local spell_recasts = windower.ffxi.get_spell_recasts()
	local job_ability_recasts = windower.ffxi.get_ability_recasts()
	local songcount
	local player = windower.ffxi.get_player()
	local do_break = false 

	-- Debug
local lines = tostring(debug.getinfo(1).currentline)

	if sing_when_main_engaged == true and isMainEngaged() == false then
		return retVal
	end

local lines = tostring(debug.getinfo(1).currentline)
	
	if auto_pianasimo_songs and table.length(auto_pianasimo_songs) > 0 then
		for player_name, songs in pairs(auto_pianasimo_songs) do
			-- Can we sing on this player?
			if canSingOnMember(player_name) then
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline)
				-- Does the song need recasting?
				songcount = 1
				while songs[songcount] do
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline)
					if player_song_durations[player_name] == nil or player_song_durations[player_name][songs[songcount]] == nil then
						-- todo check that player is in range
						
						-- do nightingale and troubadour if it's up
						if     job_ability_recasts[job_ability_names['Marcato']] == 0 and 
						       table.contains(player.buffs, buff_names['Soul Voice']) == false then
							windower.send_command('input /ja marcato <me>')
					    do_break = true
							break
						elseif job_ability_recasts[job_ability_names['Nightingale']] == 0 then
							windower.send_command('input /ja nightingale <me>')
					    do_break = true
							break
						elseif job_ability_recasts[job_ability_names['Troubadour']] == 0 then
							windower.send_command('input /ja troubadour <me>')
					    do_break = true
							break
						end
						-- Can we even cast the song?
						if spell_recasts[song_names[songs[songcount]]] == 0 then
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline) .. "(" .. tostring(song_names[songs[songcount]]) .. ")"
							if table.contains(player.buffs, buff_names.Pianissimo) then
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline)
							-- Sing out song!
							-- If we already have 2 songs on we want to sing paeon instead and give it a short count
								local temp_songname = songs[songcount]
								local temp_songduration = song_duration
								local active_songs = 0
								local paeon_is_on = false
								
								-- Set longer song duration if troubadour is on
								if table.contains(player.buffs, buff_names.Troubadour) == true then
									temp_songduration = nt_song_durations
								end
								
								if player_song_durations[player_name] then
									for key, val in pairs(player_song_durations[player_name]) do
										if val then
											if key == "Army's Paeon" then
												paeon_is_on = true
											end
											active_songs = active_songs + 1
										end
									end
								end
								if active_songs == 2 then
									temp_songname = "Army's Paeon"
									temp_songduration = 10
								elseif active_songs == 3 and paeon_is_on == false then
									-- For you 4 song bards
									temp_songname = "Army's Paeon"
									temp_songduration = 25
								end
								-- Song may have changed to army's paeon.  Check the recasts again
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline) .. "(".. song_names[temp_songname] .. ")"
								if spell_recasts[song_names[temp_songname]] == 0 then
									windower.send_command('input /ma "' .. temp_songname .. '" ' .. player_name)
									-- todo:  Don't set this if the song was interrupted
									if player_song_durations[player_name] == nil then
										player_song_durations[player_name] = {}
									end
									player_song_durations[player_name][temp_songname] = temp_songduration
									retVal = true
								end
								do_break = true
								break
							elseif job_ability_recasts[job_ability_names["Pianissimo"]] == 0 then
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline)
							-- if pianissimo is not up, put it up
								windower.send_command('input /ja pianissimo <me>')
								retVal = true
								do_break = true
								break
							else
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline)
								-- Pianissimo isn't up.  Try the next infinity loop
								do_break = true
								break
							end			
						end
					end
					songcount = songcount + 1
				end
				if do_break == true then
		lines = lines .. " " .. tostring(debug.getinfo(1).currentline)
						break
				end
			end
		end
	else
		-- Do your best to guess songs
	end
debug_lines.text = lines
	--windower.add_to_chat(2, tostring(job_ability_recasts[job_ability_names["Pianissimo"]])
	return retVal
end

function init()
	for buffid, buffinfo in pairs(buffs) do
		buff_names[buffinfo.en] = buffid
	end
	
	for spellid, spellinfo in pairs(spells) do
		if spellinfo.type == 'BardSong' then
			spell_names[spellinfo.en] = spellid
		end
	end
	
	song_names = spell_names

	for ablilityid, abilityinfo in pairs(job_abilities) do
		if abilityinfo.type == "JobAbility" then
			job_ability_names[abilityinfo.en] = abilityinfo.recast_id
		end
	end

	for jobid, jobinfo in pairs(jobs) do
		job_names[jobinfo.short] = jobid
	end
	
end

windower.register_event('login', init)

isbusy_malthar = nil
isbusy_maltha = nil
isbusy_malana = nil
debug_lines = nil
lua_loop = nil
windower.register_event('load', function()
	init()
	lua_loop = coroutine.schedule(infinity_loop, 1)
		
	if not lua_loop then
		windower.add_to_chat(2,'Failed to create infinity loop.')
		return
	end
	
	isbusy_malthar  = texts.new('Malthar: ')	
	texts.pos(isbusy_malthar,  10,400)
	texts.visible(isbusy_malthar, true)

	isbusy_maltha  = texts.new('Maltha: ')	
	texts.pos(isbusy_maltha,  10,420)
	texts.visible(isbusy_maltha, true)

	isbusy_maltana  = texts.new('Maltana: ')	
	texts.pos(isbusy_maltana,  10,440)
	texts.visible(isbusy_maltana, true)
	
	debug_lines  = texts.new(':')	
	texts.pos(debug_lines,  10,460)
	texts.visible(debug_lines, true)
	
end)

windower.register_event('unload', function()
	if lua_loop then
		coroutine.close(lua_loop)
	end
end)

windower.register_event('job change', function(main_job_id,main_job_level,sub_job_id,sub_job_level)
	if main_job_id == job_names('BRD') then
		-- Player switched to bard.  Clear out the player_song_durations
		player_song_durations = {}
	end
end)

commands = {
["start"] = 
function(...)
	addon_enabled = true
end,
["enable"] = 
function(...)
	addon_enabled = true
end,
["sing"] = 
function(...)
	addon_enabled = true
end,
["stop"] =
function(...)
	addon_enabled = false
end,
["disable"] =
function(...)
	addon_enabled = false
end,
["toggle"] =
function(...)
	if addon_enabled == true then
		addon_enabled = false
	else
		addon_enabled = true
	end
end,
["load"] =
function(...)
	load_settings()
end,
["reload"] =
function(...)
	load_settings()
end,
["refresh"] =
function(...)
	load_settings()
end
}

windower.register_event('addon command', function(command, ...)
	local cmd = string.lower(command or "toggle")
	
	if commands[cmd] then
		commands[cmd](...)
	end
end)

function song_duration_countdown()
-- Debug
local lines

	for player_name, songs in pairs(player_song_durations) do
lines=""
		for song_name, duration in pairs(songs) do
lines = lines .. ":" .. song_name
			if duration and duration > 0 then
				player_song_durations[player_name][song_name] = duration - 1
				if player_song_durations[player_name][song_name] == 0 then
					player_song_durations[player_name][song_name] = nil
				end
			end
lines = lines .. "=" .. tostring(player_song_durations[player_name][song_name]) .. " "
		end
--lines = lines .. ") "
--isbusy_txt.text = lines
if player_name == "Malthar" then
	isbusy_malthar.text = lines
elseif player_name == "Maltha" then
	isbusy_maltha.text = lines
elseif player_name == "Maltana" then
	isbusy_maltana.text = lines
end
	end
	
end

function infinity_loop()
	local player
	local temp
	while true do
		player = windower.ffxi.get_player()
		if player and player.main_job == 'BRD' and addon_enabled then
			song_duration_countdown()
			temp = isbusy['isbusy'] or do_auto_pianasimo_songs() -- or do_auto_songs
		end
		coroutine.sleep(1)
	end

end

-- Options -----------
addon_enabled = false
main="Malthar"
sing_when_main_engaged = true
do_auto_pianissimo_songs = true
do_centered_songs = false
do_best_guess_songs = false
song_duration = 212
nt_song_duration = 424

-- Every individual in this list will be pianissimo'd songs
auto_pianasimo_songs = {
	['Malthar'] = mele_songs,
	['Maltha'] = mage_songs,
	['Maltana'] = mele_songs
}

-- Maltha will run up this person and AoE songs, 
-- If she's not singing, she will idle by the _idle_ person
auto_songs = {
	['_idle_'] = "Maltana", 
	['Malthar'] = {
		['enabled'] = true,
		['marcato'] = "Blade Madrigal",
		[1] = "Blade Madrigal",
		[2] = "Victory March",
		[3] = "Advancing March"},
	['Maltana'] = {
		['enabled'] = true,
		['marcato'] = nil,
		[1] = "Mage's Ballad III",
		[2] = "Mage's Ballad II",
		[3] = "Mage's Ballad"},
}

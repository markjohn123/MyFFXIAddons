function get_sets()
	local baseset = 'baseset'
	local PDT     = 'PDT'
	local precast = 'precast'
	local midcast = 'midcast'
	local aftercast='aftercast'
	
	-- Redefine gear to call gs c gear
	send_command('alias gear gs c gear')
	send_command('alias naked gs equip naked')
	

	--  These are the weapons I use
	sets["weapons"] = {}
	
	sets['Idle'] = {
	}
	
	sets['Engaged'] = {
	}
	
	sets['Resting']   = sets.Idle

	local tempIdleset = sets.Idle
	local tempEngagedset = sets.Engaged
	
	
	sets.Idle['NORMAL'] = sets.Idle
	sets.Engaged['NORMAL'] = sets.Engaged
	sets.Resting['NORMAL'] = sets.Resting

	-- PDT and MDT gear
	sets.Idle['ACC'] = tempIdleset
	
	sets.Engaged['ACC'] = {
	}
		
	sets.Idle['PDT'] = {
		baseset=tempIdleset,
			PDT={
		}		
	}
	
	sets.Engaged['PDT'] = {
	}

	sets.Idle['ACCPDT'] = {
		baseset=sets.Idle.PDT,
	}
	
	sets.Engaged['ACCPDT'] = {
	}

	sets.Idle['PDTACC'] = {
		baseset=sets.Idle.PDT,
	}
	
	sets.Engaged['PDTACC'] = {
		baseset=sets.Engaged.PDT,
	}

	sets.Idle['HPDT'] = {
		baseset=sets.Idle.PDT,
		PDT={
		
		}
		
	}
	
	sets.Engaged['HPDT'] = {
		baseset=sets.Engaged.HPDT,
		PDT={
		
		}
		
	}
	
	sets.Idle['MDT'] = {
		baseset=tempIdleset,
				PDT={
				}
	}
	
	sets.Engaged['MDT'] = {
		baseset=tempEngagedset,
				PDT={
				}
	}
	
	sets.Idle['HMDT'] = {
		baseset=sets.Idle.MDT,
		PDT={
		
		}
	}
	
	sets.Engaged['HMDT'] = {
		baseset=sets.Engaged.MDT,
		PDT={
		
		}
	}
	

	sets.Idle['DT'] = {
		baseset=sets.Engaged.PDT,
		PDT={
		}
	}
	
	sets.Engaged['DT'] = {
		baseset=sets.Engaged.PDT,
		PDT={
		}
	}
	
	sets.Idle['TWILIGHT'] = {
		baseset=sets.Idle['PDT'],
		head='Twilight Helm',
		body='Twilight Mail',
		PDT={
			head='Twilight Helm',
			body='Twilight Mail'
		}
	}
	
	sets.Engaged['TWILIGHT'] = {
		baseset=sets.Engaged['PDT'],
		head='Twilight Helm',
		body='Twilight Mail',
		PDT={
			head='Twilight Helm',
			body='Twilight Mail'
		}	
	}
	
	sets['WS'] = {}
	
		
	sets['JA'] = {}
		
	-- Dancer sub
	
	sets.JA['Drain Samba'] = {
	}

	sets.JA['Drain Samba II'] = {
	}

	sets.JA['Aspir Samba'] = {
	}

	sets['waltz'] = {
	}

	sets.JA['Curing Waltz'] = {
	}

	sets.JA['Curing Waltz II'] = {
	}

	sets.JA['Curing Waltz III'] = {
	}

	sets.JA['Healing Waltz'] = {
	}

	sets.JA['Divine Waltz'] = {
	}

	sets.JA['Spectral Jig'] = {
	}

	sets.JA['Haste Samba'] = {
	}

	sets['steps'] = {
		right_ear="Choreia Earring"
	}

	sets.JA['Quickstep'] = {
		baseset=sets.steps
	}

	sets.JA['Box Step'] = {
		baseset=sets.steps
	}

	sets.JA['Stutter Step'] = {
		baseset=sets.steps
	}
	
	sets['flourishes'] = {
	}
	
	sets.JA['Animated Flourish'] = {
	}
	
	sets.JA['Violent Flourish'] = {
	}
	
	sets.JA['Reverse Flourish'] = {
	}
	
	-- Rune Fencer
	sets.JA['Swipe'] = sets.mab
	sets.JA['Lunge'] = sets.mab
	
	sets.JA['Ignis'] = {baseset=sets.enmity}
	sets.JA['Gelus'] = {baseset=sets.enmity}
	sets.JA['Flabra'] = {baseset=sets.enmity}
	sets.JA['Tellus'] = {baseset=sets.enmity}
	sets.JA['Sulpor'] = {baseset=sets.enmity}
	sets.JA['Unda'] = {baseset=sets.enmity}
	sets.JA['Lux'] = {baseset=sets.enmity}
	sets.JA['Tenebrae'] = {baseset=sets.enmity}
	
	sets.JA['Swordplay'] = {baseset=sets.enmity}
	sets.JA['Vallation'] = {baseset=sets.enmity}
	sets.JA['pflug'] = {baseset=sets.enmity}
	
	-- Magic
	
	sets['fast cast'] = {
		precast={
		},
		basesets={sets.Engaged['PDT']}
	}
	
	sets['enmity fast cast'] = {
		baseset=sets['fast cast'],
		precast={
		}
	}
	sets['MA'] = {}
	
	sets.MA['Cocoon'] = sets['enmity fast cast']

	sets.MA['Blank Gaze'] = sets['enmity fast cast']

	sets.MA['Battle Dance'] = sets['enmity fast cast']

	sets.MA['Jettatura'] = sets['enmity fast cast']

	sets.MA['Haste'] = sets['fast cast']

	sets.MA['Refresh'] = sets['fast cast']

	sets.MA['Aquaveil'] = sets['fast cast']


	sets.MA['BlueMagic'] = {
		baseset=sets['fast cast']
	}
	
	sets.MA['Flash'] = {
    basesets={sets.enmity},
	}

	-- NIN sub
	sets.MA['Utsusemi: Ichi'] = {
	
	}
	
	sets.MA['Utsusemi: Ni'] = {
	
	}

	-- Equip this gear when certain buffs are active
	
	sets['buff active'] = {}
	
	sets['ITEM'] = {}
	
	sets.ITEM['Remedy'] = {}
	sets.ITEM['Holy Water'] = {
		left_ring="Ephedra Ring",
		right_ring="Saida Ring"
	}
	
	sets['react'] = {}
	
end
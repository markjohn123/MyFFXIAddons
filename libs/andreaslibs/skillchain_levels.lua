local impaction 		= "Impaction"
local scission  		= "Scission"
local reverberation = "Reverberation"
local induration		= "Induration"
local impaction 		= "Impaction"
local compression		= "Compression"
local liquefaction	= "Liquifaction"
local detonation		= "Detonation"
local transfixtion	= "Transfixion"
local distortion		= "Distortion"
local	gravitation		= "Gravitation"
local	fusion				= "Fusion"
local	fragmentation	= "Fragmentation"
local light					= "Light"
local darkness			= "Darkness"
return {
	[1] = {
		{impaction,			liquefaction,	liquefaction},
		{scission, 			liquefaction,	liquefaction},
		{reverberation,	impaction,		impaction},
		{induration,		impaction,		impaction},
		{impaction,			detonation,		detonation},
		{compression,		detonation,		detonation},
		{scission,			detonation,		detonation},
		{liquefaction,	scission,			scission},
		{detonation,		scission,			scission},
		{transfixion,		reverberation,reverberation},
		{scission,			reverberation,reverberation},
		{reverberation,	induration,		induration},
		{induration,		compression,	compression},
		{transfixion,		compression,	compression},
		{compression,		transfixion,	transfixion},
	},
	[2] = {
		{liquefaction,	impaction,		fusion},
		{distortion,		fusion,				fusion},
		{induration,		reverberation,fragmentation},
		{gravitation,		fragmentation,fragmentation},
		{detonation,		compression,	gravitation},
		{fusion,				gravitation,	gravitation},
		{transfixion,		scission,			distortion},
		{fragmentation,	distortion,		distortion}
	},
	[3] = {
		{fusion,				fragmentaion,	light},
		{fragmentation,	fusion,				light},
		{gravitation,		distortion,		darkness},
		{distortion,		gravitation,	darkness}
	},
	[4] = {
		{light,					light,				light},
		{darkness,			darkness,			darkness}
	}
}

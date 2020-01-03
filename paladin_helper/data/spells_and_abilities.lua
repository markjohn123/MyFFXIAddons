-- Entry types
spell="Spell"
ability="Ability"

name="name"
entrytype="entrytype"
enabled="enabled"
requireengaged="requireengaged"
hasstatus="hasstatus"
requiresub="requiresub"
target="target"


auto_spell_and_abilities = {
	[1] = {
		name="Flash",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=false,
		requiresub=nil,
		target="<t>"
	},
	[2] = {
		name="Sentinel",
		entrytype=ability,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[3] = {
		name="Crusade",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[4] = {
		name="Palisade",
		entrytype=ability,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[5] = {
		name="Defender",
		entrytype=ability,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="WAR",
		target="<me>"
	},
	[6] = {
		name="Reprisal",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[7] = {
		name="Cocoon",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="BLU",
		target="<me>"
	},
	[8] = {
		name="Phalanx",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[9] = {
		name="Protect V",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[10] = {
		name="Shell IV",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[11] = {
		name="Enlight",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[12] = {
		name="Sepulcher",
		entrytype=ability,
		enabled=false,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<t>"
	},
	[13] = {
		name="Holy Circle",
		entrytype=ability,
		enabled=false,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[14] = {
		name="Provoke",
		entrytype=ability,
		enabled=false,
		requireengaged=false,
		hasstatus=false,
		requiresub="WAR",
		target="<t>"
	},
	[15] = {
		name="Rampart",
		entrytype=ability,
		enabled=false,
		requireengaged=false,
		hasstatus=nil,
		requiresub=nil,
		target="<me>"
	},
	[16] = {
		name="Fealty",
		entrytype=ability,
		enabled=false,
		requireengaged=false,
		hasstatus=true,
		requiresub=nil,
		target="<me>"
	},
	[17] = {
		name="Hasso",
		entrytype=ability,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="SAM",
		target="<me>"
	},
	[18] = {
		name="Meditate",
		entrytype=ability,
		enabled=true,
		requireengaged=false,
		hasstatus=false,
		requiresub="SAM",
		target="<me>"
	},
	[19] = {
		name="Third Eye",
		entrytype=ability,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="SAM",
		target="<me>"
	},
	[20] = {
		name="Refresh",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="RDM",
		target="<me>"
	},
	[21] = {
		name="Haste",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="RDM",
		target="<me>"
	},
	[22] = {
		name="Jettatura",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="BLU",
		target="<t>"
	},
	[23] = {
		name="Blank Gaze",
		entrytype=spell,
		enabled=true,
		requireengaged=false,
		hasstatus=true,
		requiresub="BLU",
		target="<t>"
	},
}

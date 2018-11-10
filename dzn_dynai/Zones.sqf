
/* *********** This array defines detailed properties of zones ************************** */
// MAIN BASE
/*

Dynai zones:

EastSiteGuard
MainSiteGuard
WestSiteGuard
RoadPatrol

rhs_vmf_flora_efreitor
rhs_vmf_flora_machinegunner
rhs_vmf_flora_rifleman
rhs_vmf_flora_grenadier
rhs_vmf_flora_RShG2

*/


[	"EastSiteGuard" /* Zone Name */
	,"EAST",true, /* Side, is Active */ [],[]
	/* Groups: */
	,[
		[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_rifleman", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
			]
		]
		,[
			2, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_grenadier", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
			]
		]
		,[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_RShG2", [], ""]
				,["rhs_vmf_flora_machinegunner", [], ""]
			]
		]
	]
	/* Behavior: Speed, Behavior, Combat mode, Formation */
	,["LIMITED","SAFE","YELLOW","COLUMN"]
]

, [	"MainSiteGuard" /* Zone Name */
	,"EAST",true, /* Side, is Active */ [],[]
	/* Groups: */
	,[
		[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_rifleman", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
			]
		]
		,[
			2, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_grenadier", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
			]
		]
		,[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_RShG2", [], ""]
				,["rhs_vmf_flora_machinegunner", [], ""]
			]
		]
	]
	/* Behavior: Speed, Behavior, Combat mode, Formation */
	,["LIMITED","SAFE","YELLOW","COLUMN"]
]
, [	"WestSiteGuard" /* Zone Name */
	,"EAST",true, /* Side, is Active */ [],[]
	/* Groups: */
	,[
		[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_rifleman", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
			]
		]
		,[
			2, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_grenadier", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
			]
		]
		,[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_RShG2", [], ""]
				,["rhs_vmf_flora_machinegunner", [], ""]
			]
		]
	]
	/* Behavior: Speed, Behavior, Combat mode, Formation */
	,["LIMITED","SAFE","YELLOW","COLUMN"]
]
, [	"RoadPatrol" /* Zone Name */
	,"EAST",true, /* Side, is Active */ [],[]
	/* Groups: */
	,[
		[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_rifleman", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
				,["rhs_vmf_flora_RShG2", [], ""]
			]
		]
		,[
			1, /* Groups quantity */
			/* Units */
			[
				["rhs_vmf_flora_grenadier", [], ""]
				,["rhs_vmf_flora_rifleman", [], ""]
				,["rhs_vmf_flora_machinegunner", [], ""]
			]
		]
	]
	/* Behavior: Speed, Behavior, Combat mode, Formation */
	,["LIMITED","SAFE","YELLOW","COLUMN"]
]
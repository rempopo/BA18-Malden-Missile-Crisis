// ***********************************
// Gear Kits 
// ***********************************
// ******** GEAR CLASSES **********
//
//	Maptools		"ACE_MapTools"	["ACE_MapTools",1]
//	Binocular		"Binocular"	["Binocular",1]		
//
// 	Map			"ItemMap"
//	Compass			"ItemCompass"
//	Watch			"ItemWatch"
//	Personal Radio		"ItemRadio"
//
// ******* KIT NAMES FORMAT ********
//  Kit names format:		kit_FACTION_ROLE
//	Platoon Leader / Командир Взвода	->	kit_ussf_pl
//	Squad Leader / Командир отделения	->	kit_ussf_sl
//	Section Leader				->	kit_ussf_sl
//	2IC					->	kit_ussf_2ic
//	Fireteam Leader				->	kit_ussf_ftl
//	Automatic Rifleman			->	kit_ussf_ar
//	Grenadier / Стрелок (ГП)		->	kit_ussf_gr
//	Rifleman / Стрелок			->	kit_ussf_r
//	Экипаж					->	kit_ussf_crew
//	Пулеметчик				->	kit_ussf_mg
//	Стрелок-Гранатометчик			->	kit_ussf_at
//	Стрелок, помощник гранатометчика	->	kit_ussf_aat
//	Старший стрелок				->	kit_ussf_ar / kit_ussf_ss
//	Снайпер					->	kit_ussf_mm
// ****************
//
// ******** USEFUL MACROSES *******
// Maros for Empty weapon
#define EMPTYKIT	[["","","","",""],["","","","",""],["","","","",""],["","","","",""],[],[["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0],["",0]],[["",0],["",0],["",0],["",0],["",0],["",0]],[]]
// Macros for Empty weapon
#define EMPTYWEAPON	"","",["","","",""]
// Macros for the list of items to be chosen randomly
#define RANDOM_ITEM	["H_HelmetB_grass","H_HelmetB"]
// Macros to give the item only if daytime is in given inerval (e.g. to give NVGoggles only at night)
#define NIGHT_ITEM(X)	if (daytime < 9 || daytime > 18) then { X } else { "" }

// ******** ASSIGNED and UNIFORM ITEMS MACRO ********
#define NVG_NIGHT_ITEM		if (daytime < 9 || daytime > 18) then { "NVGoggles_OPFOR" } else { "" }
#define BINOCULAR_ITEM		"Binocular"

#define ASSIGNED_ITEMS		"ItemMap","ItemCompass","ItemWatch","ItemRadio", NVG_NIGHT_ITEM
#define ASSIGNED_ITEMS_L		"ItemMap","ItemCompass","ItemWatch","ItemRadio", NVG_NIGHT_ITEM, BINOCULAR_ITEM

#define UNIFORM_ITEMS		["FirstAidKit",3],["rhs_mag_rdg2_black",1]
#define UNIFORM_ITEMS_L		["FirstAidKit",3],["rhs_mag_rdg2_black",1]
// ****************


kit_ruqrf_default = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_6sh116_flora","","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","","",["","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  "],
	["<UNIFORM ITEMS >> ",[["FirstAidKit",3],["rhs_mag_rdg2_black",1]]],
	["<VEST ITEMS >> ",[]],
	["<BACKPACK ITEMS >> ",[]]
];

/*
	OPFOR -- RU Quick Responce Forces
*/

kit_ruqrf_sl = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_6sh116_vog_flora","tf_mr3000_rhs","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74n_2_gp25","rhs_30Rnd_545x39_7N10_AK",["rhs_acc_dtk","","rhs_acc_1p78",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS_L],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS_L]],
	["<VEST ITEMS >> ",[["PRIMARY MAG",7],["rhs_VOG25P",7],["rhs_GRD40_Red",4],["rhs_GRD40_Green",2],["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",2],["rhs_30Rnd_545x39_AK_green",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ruqrf_crew = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_digi_engineer","","rhs_tsh4_ess",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_aks74u","rhs_45Rnd_545X39_7N10_AK",["rhs_acc_pgs64_74u","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_rgd5",2],["rhs_mag_rdg2_black",2],["PRIMARY MAG",2]]],
	["<BACKPACK ITEMS >> ",[]]
];


kit_ruqrf_gr = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_6sh116_vog_flora","","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m_gp25","rhs_30Rnd_545x39_7N10_AK",["rhs_acc_dtk","","",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_VOG25P",10],["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",2],["rhs_30Rnd_545x39_7N6_AK",3],["PRIMARY MAG",3],["rhs_30Rnd_545x39_7N10_camo_AK",3]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ruqrf_ar = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_6sh116_flora","","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_akm_zenitco01_b33_grip1","rhs_75Rnd_762x39mm",["rhs_acc_dtkakm","","rhs_acc_1p87","rhsusf_acc_rvg_blk"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_30Rnd_762x39mm_bakelite",8],["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",2]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ruqrf_mg = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_digi_rifleman","B_FieldPack_oli","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_pkp","rhs_100Rnd_762x54mmR",["","","rhs_acc_pkas_pkp",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",2]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",3]]]
];

kit_ruqrf_at = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_digi_vydra_3m","rhs_rpg_empty","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m","rhs_30Rnd_545x39_7N10_AK",["rhs_acc_dtk","","rhs_acc_1p63",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rpg7","",["","","rhs_acc_pgo7v2",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",2],["PRIMARY MAG",5],["rhs_30Rnd_545x39_7N6_AK",3]]],
	["<BACKPACK ITEMS >> ",[["rhs_rpg7_PG7V_mag",2],["rhs_rpg7_OG7V_mag",2]]]
];

kit_ruqrf_aat = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_digi_vydra_3m","rhs_rpg_empty","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m","rhs_30Rnd_545x39_7N10_AK",["rhs_acc_dtk","","rhs_acc_1p63",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",2],["PRIMARY MAG",5],["rhs_30Rnd_545x39_7N6_AK",3]]],
	["<BACKPACK ITEMS >> ",[["rhs_rpg7_PG7V_mag",2],["rhs_rpg7_OG7V_mag",2]]]
];

kit_ruqrf_r = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_6sh116_flora","","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_ak74m","rhs_30Rnd_545x39_7N10_AK",["rhs_acc_dtk","","rhs_acc_1p63",""]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_rshg2","rhs_rshg2_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",3],["PRIMARY MAG",5],["rhs_30Rnd_545x39_7N6_AK",5],["SECONDARY MAG",1]]],
	["<BACKPACK ITEMS >> ",[]]
];

kit_ruqrf_mm = [
	["<EQUIPEMENT >>  ","rhs_uniform_emr_patchless","rhs_6b23_6sh116_flora","","rhs_6b27m_digi_ess_bala",""],
	["<PRIMARY WEAPON >>  ","rhs_weap_svds","rhs_10Rnd_762x54mmR_7N1",["","","rhs_acc_pso1m21_svd",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","rhs_weap_makarov_pm","rhs_mag_9x18_8_57N181S",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_rdg2_black",1],["rhs_mag_rgd5",3],["PRIMARY MAG",7],["HANDGUN MAG",3],["rhs_10Rnd_762x54mmR_7N14",7]]],
	["<BACKPACK ITEMS >> ",[]]
];

cargo_kit_o_vehicle = [
	[["rhs_weap_ak74m",1]]
	,[["rhs_30Rnd_545x39_7N10_AK",4],["rhs_100Rnd_762x54mmR",8],["rhs_mag_rdg2_white",2],["rhs_mag_rgd5",6]]
	,[["FirstAidKit",10],["Medikit",1],["ToolKit",1],["rhs_6b27m_digi_ess_bala",2]]
	,[]
];


/*
	BLUFOR Specfor
*/

#define B_ASSIGNED_ITEMS_L		"ItemMap","ItemCompass","ItemWatch","ItemRadio", NVG_NIGHT_ITEM, "Laserdesignator"
#define B_UNIFORM_ITEMS		["FirstAidKit",3],["rhs_mag_an_m8hc",1]

#define B_HEADGEAR	["rhsusf_opscore_ut_pelt","rhsusf_opscore_paint_pelt","rhsusf_opscore_paint_pelt_nsw","rhsusf_opscore_ut_pelt_nsw"]
#define B_FACEWEAR	["rhsusf_oakley_goggles_clr","rhsusf_oakley_goggles_blk","rhsusf_oakley_goggles_ylw","G_Spectacles","rhsusf_shemagh_gogg_tan","rhsusf_shemagh2_gogg_tan","rhsusf_shemagh2_gogg_od","rhsusf_shemagh_gogg_grn","rhsusf_shemagh_grn","rhsusf_shemagh_od","rhsusf_shemagh2_od","rhsusf_shemagh2_grn","G_Lowprofile","G_Bandanna_khk","G_Bandanna_blk","rhs_googles_yellow","rhs_googles_black"]


kit_ussf_sl = [
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spcs_ocp_squadleader","tf_rt1523g",B_HEADGEAR,B_FACEWEAR],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_grip","rhs_mag_30Rnd_556x45_M855A1_Stanag",["rhsusf_acc_nt4_tan","rhsusf_acc_anpeq15A","rhsusf_acc_su230_c","rhsusf_acc_rvg_blk"]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", B_ASSIGNED_ITEMS_L],
	["<UNIFORM ITEMS >> ",[B_UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",1],["SmokeShellBlue",1],["rhs_mag_m67",2],["rhs_mag_m18_yellow",1],["rhs_mag_m18_red",1],["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2],["PRIMARY MAG",6]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",2]]]
];

kit_ussf_ftl = [
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spcs_ocp_teamleader","B_AssaultPack_rgr",B_HEADGEAR,B_FACEWEAR],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_m320","rhs_mag_30Rnd_556x45_M855A1_Stanag",["rhsusf_acc_nt4_tan","rhsusf_acc_anpeq15A","rhsusf_acc_su230a_mrds_c",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[B_UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_m67",2],["PRIMARY MAG",4],["rhs_mag_M433_HEDP",4],["rhs_mag_m713_Red",2],["rhs_mag_m716_yellow",1],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red",2],["SmokeShellPurple",1],["SmokeShellBlue",1]]],
	["<BACKPACK ITEMS >> ",[["rhs_mag_m716_yellow",1],["rhs_mag_m713_Red",1],["PRIMARY MAG",2]]]
];

kit_ussf_gr = [
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spcs_ocp_grenadier","B_AssaultPack_rgr",B_HEADGEAR,B_FACEWEAR],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_m320","rhs_mag_30Rnd_556x45_M855A1_Stanag",["rhsusf_acc_nt4_tan","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552_d",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[B_UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",1],["rhs_mag_m67",2],["PRIMARY MAG",6],["rhs_mag_M433_HEDP",8]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",2]]]
];

kit_ussf_ar = [
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spcs_ocp_saw","B_AssaultPack_rgr",B_HEADGEAR,B_FACEWEAR],
	["<PRIMARY WEAPON >>  ","rhs_weap_m249_pip_S","rhsusf_100Rnd_556x45_soft_pouch",["rhsusf_acc_rotex5_grey","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552",""]],
	["<LAUNCHER WEAPON >>  ","","",["","","",""]],
	["<HANDGUN WEAPON >>  ","hgun_P07_F","16Rnd_9x21_Mag",["muzzle_snds_L","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[B_UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",1],["rhs_mag_m67",2],["PRIMARY MAG",2],["HANDGUN MAG",3]]],
	["<BACKPACK ITEMS >> ",[["PRIMARY MAG",2]]]
];

kit_ussf_r = [
	["<EQUIPEMENT >>  ","rhs_uniform_g3_m81","rhsusf_spcs_ocp_rifleman","rhsusf_assault_eagleaiii_ocp",B_HEADGEAR,B_FACEWEAR],
	["<PRIMARY WEAPON >>  ","rhs_weap_mk18_grip","rhs_mag_30Rnd_556x45_M855A1_Stanag",["rhsusf_acc_nt4_tan","rhsusf_acc_anpeq15A","rhsusf_acc_eotech_552_d","rhsusf_acc_rvg_blk"]],
	["<LAUNCHER WEAPON >>  ","rhs_weap_M136","rhs_m136_mag",["","","",""]],
	["<HANDGUN WEAPON >>  ","","",["","","",""]],
	["<ASSIGNED ITEMS >>  ", ASSIGNED_ITEMS],
	["<UNIFORM ITEMS >> ",[B_UNIFORM_ITEMS]],
	["<VEST ITEMS >> ",[["rhs_mag_an_m8hc",1],["rhs_mag_m67",2],["PRIMARY MAG",9]]],
	["<BACKPACK ITEMS >> ",[["rhsusf_100Rnd_556x45_soft_pouch",2]]]
];


cargo_kit_b_boat = [
	[["rhs_weap_m72a7",1]],
	[["rhs_mag_30Rnd_556x45_M855A1_Stanag",10],["rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan_Tracer_Red",4],["rhs_mag_an_m8hc",4],["rhs_mag_m67",1],["rhs_m72a7_mag",1],["rhsusf_m112_mag",4],["SLAMDirectionalMine_Wire_Mag",2]],
	[["FirstAidKit",2], ["MineDetector", 2]],
	[]
];

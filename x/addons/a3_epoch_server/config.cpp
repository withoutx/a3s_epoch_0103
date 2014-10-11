class CfgPatches {
	class a3_epoch_server {
		units[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {};
		epochVersion = 0.1.0.2;
	};
};

class CfgLootTable {
	class Items {
		items[] = {{"ItemCompass"},{"ItemGPS"},{"ItemMap"},{"EpochRadio0"},{"ItemWatch"},{"FirstAidKit"}};
		itemType = "item";
	};
	
	class Equipment {
		items[] = {{"Binocular"},{"Binocular"},{"Binocular"},{"Binocular"},{"NVG_EPOCH"},{"acc_flashlight"},{"acc_flashlight"},{"acc_flashlight"},{"acc_pointer_IR"},{"acc_pointer_IR"}};
		itemType = "item";
	};
	
	class SniperRifle {
		items[] = {{"srifle_EBR_F"},{"srifle_EBR_F"},{"srifle_GM6_F"},{"srifle_GM6_F"},{"srifle_LRR_F"},{"srifle_DMR_01_F"}};
		itemType = "weapon";
	};
	
	class SniperRifleAmmo {
		items[] = {{"20Rnd_762x51_Mag"},{"5Rnd_127x108_Mag"},{"5Rnd_127x108_APDS_Mag"},{"7Rnd_408_Mag"},{"10Rnd_762x51_Mag"}};
		itemType = "magazine";
	};
	
	class Generic {
		items[] = {{"PaintCanBlk"},{"PaintCanBlu"},{"PaintCanBrn"},{"PaintCanGrn"},{"PaintCanOra"},{"PaintCanPur"},{"PaintCanRed"},{"PaintCanTeal"},{"PaintCanYel"},{"ItemDocument"},{"ItemMixOil"},{"emptyjar_epoch"},{"emptyjar_epoch"},{"FoodBioMeat"},{"ItemSodaOrangeSherbet"},{"ItemSodaOrangeSherbet"},{"ItemSodaRbull"},{"sardines_epoch"},{"meatballs_epoch"},{"scam_epoch"},{"sweetcorn_epoch"},{"Towelette"},{"Towelette"},{"Towelette"},{"Towelette"},{"Towelette"},{"HeatPack"},{"HeatPack"},{"HeatPack"},{"ColdPack"},{"ColdPack"},{"VehicleRepair"}};
		itemType = "magazine";
	};
	
	class GenericBed {
		items[] = {{"PaintCanBlk"},{"PaintCanBlu"},{"PaintCanBrn"},{"PaintCanGrn"},{"PaintCanOra"},{"PaintCanPur"},{"PaintCanRed"},{"PaintCanTeal"},{"PaintCanYel"},{"ItemDocument"},{"ItemMixOil"},{"emptyjar_epoch"},{"emptyjar_epoch"},{"FoodBioMeat"},{"ItemSodaOrangeSherbet"},{"ItemSodaOrangeSherbet"},{"ItemSodaRbull"},{"sardines_epoch"},{"meatballs_epoch"},{"scam_epoch"},{"sweetcorn_epoch"},{"Towelette"},{"Towelette"},{"Towelette"},{"Towelette"},{"Towelette"},{"HeatPack"},{"HeatPack"},{"HeatPack"},{"ColdPack"},{"ColdPack"},{"VehicleRepair"},{"ItemLockbox"}};
		itemType = "magazine";
	};
	
	class GenericLarge {
		items[] = {{"MortarBucket"},{"ItemCorrugated"},{"CinderBlocks"},{"jerrycan_epoch"},{"VehicleRepair"}};
		itemType = "magazine";
	};
	
	class Rifle {
		items[] = {{"arifle_Katiba_F"},{"arifle_Katiba_F"},{"arifle_Katiba_C_F"},{"arifle_Katiba_GL_F"},{"arifle_MXC_F"},{"arifle_MX_F"},{"arifle_MX_F"},{"arifle_MX_GL_F"},{"arifle_MXM_F"},{"arifle_SDAR_F"},{"arifle_TRG21_F"},{"arifle_TRG20_F"},{"arifle_TRG21_GL_F"},{"arifle_Mk20_F"},{"arifle_Mk20C_F"},{"arifle_Mk20_GL_F"},{"arifle_Mk20_plain_F"},{"arifle_Mk20_plain_F"},{"arifle_Mk20C_plain_F"},{"arifle_Mk20_GL_plain_F"},{"SMG_01_F"},{"SMG_02_F"},{"SMG_01_F"},{"SMG_02_F"},{"hgun_PDW2000_F"},{"hgun_PDW2000_F"},{"arifle_MXM_Black_F"},{"arifle_MX_GL_Black_F"},{"arifle_MX_Black_F"},{"arifle_MXC_Black_F"},{"Rollins_F"},{"Rollins_F"},{"Rollins_F"},{"Rollins_F"}};
		itemType = "weapon";
	};
	
	class RifleBoat {
		items[] = {{"arifle_SDAR_F"},{"SMG_02_F"},{"SMG_01_F"},{"SMG_02_F"},{"hgun_PDW2000_F"},{"hgun_PDW2000_F"},{"Rollins_F"},{"Rollins_F"},{"Rollins_F"},{"speargun_epoch"}};
		itemType = "weapon";
	};
	
	class RifleAmmoBoat {
		items[] = {{"20Rnd_556x45_UW_mag"},{"20Rnd_556x45_UW_mag"},{"spear_magazine"},{"spear_magazine"},{"30Rnd_9x21_Mag"},{"30Rnd_9x21_Mag"},{"16Rnd_9x21_Mag"},{"16Rnd_9x21_Mag"},{"16Rnd_9x21_Mag"},{"5Rnd_rollins_mag"},{"5Rnd_rollins_mag"}};
		itemType = "magazine";
	};
	
	class RifleAmmo {
		items[] = {{"30Rnd_65x39_caseless_green"},{"30Rnd_65x39_caseless_green"},{"30Rnd_65x39_caseless_green_mag_Tracer"},{"30Rnd_65x39_caseless_mag"},{"30Rnd_65x39_caseless_mag"},{"30Rnd_65x39_caseless_mag_Tracer"},{"20Rnd_556x45_UW_mag"},{"20Rnd_556x45_UW_mag"},{"30Rnd_556x45_Stanag"},{"30Rnd_556x45_Stanag"},{"30Rnd_556x45_Stanag_Tracer_Red"},{"30Rnd_556x45_Stanag_Tracer_Green"},{"30Rnd_556x45_Stanag_Tracer_Yellow"},{"30Rnd_45ACP_Mag_SMG_01"},{"30Rnd_45ACP_Mag_SMG_01"},{"30Rnd_45ACP_Mag_SMG_01_Tracer_Green"},{"30Rnd_9x21_Mag"},{"30Rnd_9x21_Mag"},{"16Rnd_9x21_Mag"},{"16Rnd_9x21_Mag"},{"16Rnd_9x21_Mag"},{"5Rnd_rollins_mag"},{"5Rnd_rollins_mag"}};
		itemType = "magazine";
	};
	
	class Grenades {
		items[] = {{"UGL_FlareWhite_F"},{"UGL_FlareGreen_F"},{"UGL_FlareRed_F"},{"UGL_FlareYellow_F"},{"UGL_FlareCIR_F"},{"1Rnd_Smoke_Grenade_shell"},{"1Rnd_SmokeRed_Grenade_shell"},{"1Rnd_SmokeGreen_Grenade_shell"},{"1Rnd_SmokeYellow_Grenade_shell"},{"1Rnd_SmokePurple_Grenade_shell"},{"1Rnd_SmokeBlue_Grenade_shell"},{"1Rnd_SmokeOrange_Grenade_shell"},{"3Rnd_HE_Grenade_shell"},{"3Rnd_UGL_FlareWhite_F"},{"3Rnd_UGL_FlareGreen_F"},{"3Rnd_UGL_FlareRed_F"},{"3Rnd_UGL_FlareYellow_F"},{"3Rnd_UGL_FlareCIR_F"},{"3Rnd_Smoke_Grenade_shell"},{"3Rnd_SmokeRed_Grenade_shell"},{"3Rnd_SmokeGreen_Grenade_shell"},{"3Rnd_SmokeYellow_Grenade_shell"},{"3Rnd_SmokePurple_Grenade_shell"},{"3Rnd_SmokeBlue_Grenade_shell"},{"3Rnd_SmokeOrange_Grenade_shell"}};
		itemType = "magazine";
	};
	
	class Machinegun {
		items[] = {{"LMG_Mk200_F"},{"arifle_MX_SW_F"},{"LMG_Zafir_F"},{"arifle_MX_SW_Black_F"}};
		itemType = "weapon";
	};
	
	class MachinegunAmmo {
		items[] = {{"30Rnd_65x39_caseless_mag"},{"30Rnd_65x39_caseless_mag_Tracer"},{"30Rnd_65x39_caseless_mag"},{"30Rnd_65x39_caseless_mag_Tracer"},{"30Rnd_65x39_caseless_mag"},{"30Rnd_65x39_caseless_mag_Tracer"},{"200Rnd_65x39_cased_Box"},{"200Rnd_65x39_cased_Box_Tracer"},{"100Rnd_65x39_caseless_mag_Tracer"},{"100Rnd_65x39_caseless_mag"},{"150Rnd_762x51_Box"},{"150Rnd_762x51_Box_Tracer"}};
		itemType = "magazine";
	};
	
	class Tools {
		items[] = {{"Hatchet"},{"MeleeSledge"},{"ChainSaw"}};
		itemType = "weapon";
	};
	
	class Pistols {
		items[] = {{"Rangefinder"},{"hgun_ACPC2_F"},{"hgun_ACPC2_F"},{"hgun_Rook40_F"},{"hgun_Rook40_F"},{"hgun_Rook40_F"},{"hgun_P07_F"},{"hgun_P07_F"},{"hgun_Pistol_heavy_01_F"},{"hgun_Pistol_heavy_02_F"},{"ruger_pistol_epoch"},{"ruger_pistol_epoch"},{"1911_pistol_epoch"},{"1911_pistol_epoch"},{"hgun_Pistol_Signal_F"},{"Hatchet"},{"MultiGun"}};
		itemType = "weapon";
	};
	
	class PistolAmmo {
		items[] = {{"16Rnd_9x21_Mag"},{"30Rnd_9x21_Mag"},{"9Rnd_45ACP_Mag"},{"11Rnd_45ACP_Mag"},{"6Rnd_45ACP_Cylinder"},{"10rnd_22X44_magazine"},{"16Rnd_9x21_Mag"},{"30Rnd_9x21_Mag"},{"9Rnd_45ACP_Mag"},{"11Rnd_45ACP_Mag"},{"6Rnd_45ACP_Cylinder"},{"10rnd_22X44_magazine"},{"6Rnd_GreenSignal_F"},{"6Rnd_RedSignal_F"},{"9rnd_45X88_magazine"},{"9rnd_45X88_magazine"},{"EnergyPack"}};
		itemType = "item";
	};
	
	class Scopes {
		items[] = {{"optic_Arco"},{"optic_Hamr"},{"optic_Aco"},{"optic_ACO_grn"},{"optic_Aco_smg"},{"optic_ACO_grn_smg"},{"optic_Holosight"},{"optic_Holosight_smg"},{"optic_SOS"},{"optic_MRCO"},{"optic_DMS"},{"optic_Yorris"},{"optic_MRD"},{"optic_LRPS"},{"optic_Arco"},{"optic_Hamr"},{"optic_Aco"},{"optic_ACO_grn"},{"optic_Aco_smg"},{"optic_ACO_grn_smg"},{"optic_Holosight"},{"optic_Holosight_smg"},{"optic_SOS"},{"optic_MRCO"},{"optic_DMS"},{"optic_Yorris"},{"optic_MRD"},{"optic_LRPS"},{"optic_NVS"},{"optic_Nightstalker"},{"optic_tws"},{"optic_tws_mg"}};
		itemType = "item";
	};
	
	class Muzzles {
		items[] = {{"muzzle_snds_H"},{"muzzle_snds_H"},{"muzzle_snds_L"},{"muzzle_snds_L"},{"muzzle_snds_M"},{"muzzle_snds_M"},{"muzzle_snds_B"},{"muzzle_snds_B"},{"muzzle_snds_H_MG"},{"muzzle_snds_acp"},{"Heal_EPOCH"},{"Defib_EPOCH"},{"Repair_EPOCH"}};
		itemType = "item";
	};
	
	class Shipwreak {
		items[] = {{"PartOreGold"},{"PartOreSilver"},{"PartOre"},{"ItemGoldBar"},{"ItemSilverBar"},{"ItemGoldBar10oz"},{"ItemTopaz"},{"ItemObsidian"},{"ItemSapphire"},{"ItemAmethyst"},{"ItemEmerald"},{"ItemCitrine"},{"ItemRuby"},{"ItemKiloHemp"}};
		itemType = "magazine";
	};
	
	class Mine {
		items[] = {{"PartOreGold"},{"PartOreSilver"},{"PartOre"},{"ItemTopaz"},{"ItemObsidian"},{"ItemSapphire"},{"ItemAmethyst"},{"ItemEmerald"},{"ItemCitrine"},{"ItemRuby"}};
		itemType = "magazine";
	};
	
	class Food {
		items[] = {{"FoodBioMeat"},{"ItemSodaOrangeSherbet"},{"ItemSodaOrangeSherbet"},{"ItemSodaOrangeSherbet"},{"ItemSodaRbull"},{"honey_epoch"},{"emptyjar_epoch"},{"sardines_epoch"},{"meatballs_epoch"},{"scam_epoch"},{"sweetcorn_epoch"},{"WhiskeyNoodle"}};
		itemType = "magazine";
	};
	
	class Sheep_random_EPOCH {
		items[] = {{"SheepCarcass_EPOCH"},{"Pelt_EPOCH"}};
		itemType = "magazine";
	};
	
	class Goat_random_EPOCH {
		items[] = {{"GoatCarcass_EPOCH"},{"Pelt_EPOCH"}};
		itemType = "magazine";
	};
	
	class Cock_random_EPOCH {
		items[] = {{"ChickenCarcass_EPOCH"}};
		itemType = "magazine";
	};
	
	class Hen_random_EPOCH {
		items[] = {{"ChickenCarcass_EPOCH"}};
		itemType = "magazine";
	};
	
	class Rabbit_EPOCH {
		items[] = {{"RabbitCarcass_EPOCH"},{"Pelt_EPOCH"}};
		itemType = "magazine";
	};
	
	class Epoch_Sapper_F {
		items[] = {{"ItemGoldBar"},{"ItemSilverBar"},{"ItemKiloHemp"},{"WhiskeyNoodle"},{"HeatPack"},{"HeatPack"},{"ColdPack"},{"ColdPack"},{"Pelt_EPOCH"},{"Pelt_EPOCH"},{"Pelt_EPOCH"},{"Pelt_EPOCH"},{"Pelt_EPOCH"},{"Pelt_EPOCH"},{"Pelt_EPOCH"}};
		itemType = "magazine";
	};
	
	class Epoch_Cloak_F {
		items[] = {{"ItemTopaz"},{"ItemObsidian"},{"ItemSapphire"},{"ItemAmethyst"},{"ItemEmerald"},{"ItemCitrine"},{"ItemRuby"},{"HeatPack"},{"ColdPack"},{"SmokeShell"},{"SmokeShellYellow"},{"SmokeShellGreen"},{"SmokeShellRed"},{"SmokeShellPurple"},{"SmokeShellOrange"},{"SmokeShellBlue"},{"HandGrenade"},{"MiniGrenade"},{"Venom_EPOCH"}};
		itemType = "magazine";
	};
	
	class Snake_random_EPOCH {
		items[] = {{"SnakeCarcass_EPOCH"},{"Venom_EPOCH"}};
		itemType = "magazine";
	};
	
	class SeaFood {
		items[] = {{"ItemTrout"},{"ItemTrout"},{"ItemTrout"},{"ItemTrout"},{"ItemSeaBass"},{"ItemSeaBass"},{"ItemTuna"}};
		itemType = "magazine";
	};
	
	class Hand {
		items[] = {{"SmokeShell"},{"SmokeShellYellow"},{"SmokeShellGreen"},{"SmokeShellRed"},{"SmokeShellPurple"},{"SmokeShellOrange"},{"SmokeShellBlue"},{"Chemlight_green"},{"Chemlight_red"},{"Chemlight_yellow"},{"Chemlight_blue"}};
		itemType = "magazine";
	};
	
	class Explosives {
		items[] = {{"HandGrenade"},{"MiniGrenade"},{"HandGrenade"},{"MiniGrenade"},{"HandGrenade"},{"MiniGrenade"},{"HandGrenade"},{"MiniGrenade"},{"DemoCharge_Remote_Mag"},{"SatchelCharge_Remote_Mag"},{"ATMine_Range_Mag"},{"ClaymoreDirectionalMine_Remote_Mag"},{"APERSMine_Range_Mag"},{"APERSBoundingMine_Range_Mag"},{"SLAMDirectionalMine_Wire_Mag"},{"APERSTripMine_Wire_Mag"}};
		itemType = "magazine";
	};
	
	class Backpack {
		items[] = {{"B_AssaultPack_cbr"},{"B_AssaultPack_dgtl"},{"B_AssaultPack_khk"},{"B_AssaultPack_mcamo"},{"B_AssaultPack_ocamo"},{"B_AssaultPack_rgr"},{"B_AssaultPack_sgg"},{"B_Carryall_cbr"},{"B_Carryall_khk"},{"B_Carryall_mcamo"},{"B_Carryall_ocamo"},{"B_Carryall_oli"},{"B_Carryall_oucamo"},{"B_FieldPack_blk"},{"B_FieldPack_cbr"},{"B_FieldPack_khk"},{"B_FieldPack_ocamo"},{"B_FieldPack_oli"},{"B_FieldPack_oucamo"},{"B_Kitbag_cbr"},{"B_Kitbag_mcamo"},{"B_Kitbag_rgr"},{"B_Kitbag_sgg"},{"B_Parachute"},{"B_TacticalPack_blk"},{"B_TacticalPack_mcamo"},{"B_TacticalPack_ocamo"},{"B_TacticalPack_oli"},{"B_TacticalPack_rgr"},{"smallbackpack_red_epoch"},{"smallbackpack_green_epoch"},{"smallbackpack_teal_epoch"},{"smallbackpack_pink_epoch"}};
		itemType = "backpack";
	};
	
	class Uniforms {
		items[] = {{"U_O_CombatUniform_ocamo"},{"U_O_GhillieSuit"},{"U_O_PilotCoveralls"},{"U_O_Wetsuit"},{"U_OG_Guerilla1_1"},{"U_OG_Guerilla2_1"},{"U_OG_Guerilla2_3"},{"U_OG_Guerilla3_1"},{"U_OG_Guerilla3_2"},{"U_OG_leader"},{"U_C_Poloshirt_stripped"},{"U_C_Poloshirt_blue"},{"U_C_Poloshirt_burgundy"},{"U_C_Poloshirt_tricolour"},{"U_C_Poloshirt_salmon"},{"U_C_Poloshirt_redwhite"},{"U_C_Poor_1"},{"U_C_WorkerCoveralls"},{"U_C_Journalist"},{"U_C_Scientist"},{"U_OrestesBody"},{"U_Wetsuit_uniform"},{"U_Wetsuit_White"},{"U_Wetsuit_Blue"},{"U_Wetsuit_Purp"},{"U_CamoRed_uniform"},{"U_CamoBrn_uniform"},{"U_CamoBlue_uniform"},{"U_Camo_uniform"}};
		itemType = "item";
	};
	
	class Vests {
		items[] = {{"V_1_EPOCH"},{"V_2_EPOCH"},{"V_3_EPOCH"},{"V_4_EPOCH"},{"V_5_EPOCH"},{"V_6_EPOCH"},{"V_7_EPOCH"},{"V_8_EPOCH"},{"V_9_EPOCH"},{"V_10_EPOCH"},{"V_11_EPOCH"},{"V_12_EPOCH"},{"V_13_EPOCH"},{"V_14_EPOCH"},{"V_15_EPOCH"},{"V_16_EPOCH"},{"V_17_EPOCH"},{"V_18_EPOCH"},{"V_19_EPOCH"},{"V_20_EPOCH"},{"V_21_EPOCH"},{"V_22_EPOCH"},{"V_23_EPOCH"},{"V_24_EPOCH"},{"V_25_EPOCH"},{"V_26_EPOCH"},{"V_27_EPOCH"},{"V_28_EPOCH"},{"V_29_EPOCH"},{"V_30_EPOCH"},{"V_31_EPOCH"},{"V_32_EPOCH"},{"V_33_EPOCH"},{"V_34_EPOCH"},{"V_35_EPOCH"},{"V_36_EPOCH"},{"V_37_EPOCH"},{"V_38_EPOCH"},{"V_39_EPOCH"},{"V_40_EPOCH"}};
		itemType = "item";
	};
	
	class Headgear {
		items[] = {{"H_1_EPOCH"},{"H_2_EPOCH"},{"H_3_EPOCH"},{"H_4_EPOCH"},{"H_5_EPOCH"},{"H_6_EPOCH"},{"H_7_EPOCH"},{"H_8_EPOCH"},{"H_9_EPOCH"},{"H_10_EPOCH"},{"H_11_EPOCH"},{"H_12_EPOCH"},{"H_13_EPOCH"},{"H_14_EPOCH"},{"H_15_EPOCH"},{"H_16_EPOCH"},{"H_17_EPOCH"},{"H_18_EPOCH"},{"H_19_EPOCH"},{"H_20_EPOCH"},{"H_21_EPOCH"},{"H_22_EPOCH"},{"H_23_EPOCH"},{"H_24_EPOCH"},{"H_25_EPOCH"},{"H_26_EPOCH"},{"H_27_EPOCH"},{"H_28_EPOCH"},{"H_29_EPOCH"},{"H_30_EPOCH"},{"H_31_EPOCH"},{"H_32_EPOCH"},{"H_33_EPOCH"},{"H_34_EPOCH"},{"H_35_EPOCH"},{"H_36_EPOCH"},{"H_37_EPOCH"},{"H_38_EPOCH"},{"H_39_EPOCH"},{"H_40_EPOCH"},{"H_41_EPOCH"},{"H_42_EPOCH"},{"H_43_EPOCH"},{"H_44_EPOCH"},{"H_45_EPOCH"},{"H_46_EPOCH"},{"H_47_EPOCH"},{"H_48_EPOCH"},{"H_49_EPOCH"},{"H_50_EPOCH"},{"H_51_EPOCH"},{"H_52_EPOCH"},{"H_53_EPOCH"},{"H_54_EPOCH"},{"H_55_EPOCH"},{"H_56_EPOCH"},{"H_57_EPOCH"},{"H_58_EPOCH"},{"H_59_EPOCH"},{"H_60_EPOCH"},{"H_61_EPOCH"},{"H_62_EPOCH"},{"H_63_EPOCH"},{"H_64_EPOCH"},{"H_65_EPOCH"},{"H_66_EPOCH"},{"H_67_EPOCH"},{"H_68_EPOCH"},{"H_69_EPOCH"},{"H_70_EPOCH"},{"H_71_EPOCH"},{"H_72_EPOCH"},{"H_73_EPOCH"},{"H_74_EPOCH"},{"H_75_EPOCH"},{"H_76_EPOCH"},{"H_77_EPOCH"},{"H_78_EPOCH"},{"H_79_EPOCH"},{"H_80_EPOCH"},{"H_81_EPOCH"},{"H_82_EPOCH"},{"H_83_EPOCH"},{"H_84_EPOCH"},{"H_85_EPOCH"},{"H_86_EPOCH"},{"H_87_EPOCH"},{"H_88_EPOCH"},{"H_89_EPOCH"},{"H_90_EPOCH"},{"H_91_EPOCH"},{"H_92_EPOCH"}};
		itemType = "item";
	};
};

class CfgEpoch {
	class Altis {
		telePos[] = {};
		propsPos[] = {{"Land_Pier_F",{14078.5,11556.4,1.97084},231.634},{"Land_Pier_F",{14095.8,11573.6,0.900003},3.38362},{"Land_Factory_Tunnel_F",{14077.1,11558.6,5.3728},232.275},{"Land_LampAirport_F",{14098.9,11561.9,0.751753},0},{"Land_Metal_Shed_F",{14090.2,11575.5,4.67629},183.92},{"BlockConcrete_F",{14099.7,11560.8,-1.2},252.504},{"BlockConcrete_F",{14099.3,11552.8,-1.37554},292.018},{"Land_cargo_addon02_V2_F",{14089.5,11572.5,1.69173},4.7334},{"Land_Metal_Shed_F",{14103.6,11540.6,6.79},294.363},{"Land_Metal_Shed_F",{14107.9,11549.8,5.83804},294.363},{"Land_cargo_addon02_V1_F",{14101.5,11542.4,4.56853},113.396},{"Land_Pier_F",{14104.9,11557,0.300001},293.263},{"Land_Metal_Shed_F",{14100.8,11574.7,4.42175},183.92},{"Land_Metal_Shed_F",{14116,11569.2,5.87861},292.48},{"Land_Metal_Shed_F",{14112,11559.5,4.78596},292.48},{"Land_Metal_Shed_F",{14111.3,11574.1,5.18213},183.92},{"Land_cargo_addon02_V1_F",{14111.8,11570.7,5.25546},4.33349},{"Land_cargo_addon02_V2_F",{14109.8,11560.6,4.54558},113.65},{"Land_cargo_addon01_V2_F",{14106,11550.9,5.09762},112.269},{"Land_cargo_addon01_V2_F",{14100.4,11572.4,2.97914},3.93028},{"Land_MarketShelter_F",{13315.3,14512.4,0.0361125},119.966},{"Land_ScrapHeap_2_F",{13315.9,14499,0.00584948},255.706},{"Land_HBarrier_Big_F",{13313.7,14494.8,0.050712},352.447},{"Land_spp_Mirror_Broken_F",{13303.6,14516.4,0},300.644},{"Land_Mil_WallBig_4m_F",{13309.9,14500.4,0.000857234},58.0228},{"Land_Mil_WallBig_4m_F",{13308.4,14510.6,0.00314641},78.5001},{"Land_Mil_WallBig_4m_F",{13308,14507,0.0178673},112.416},{"Land_Mil_WallBig_4m_F",{13311.2,14517.6,-0.00578284},121.855},{"Land_Mil_WallBig_4m_F",{13308.1,14503.5,0.0163193},66.6886},{"Land_Mil_WallBig_4m_F",{13311.6,14496.9,0.0774074},68.9098},{"Land_Mil_WallBig_4m_F",{13309.1,14514.3,-0.00295639},122.56},{"Land_LampHarbour_F",{13311.4,14507.1,-0.00963879},11.7876},{"Land_LampHarbour_F",{13315,14519.4,-4.76837e-007},114.758},{"Land_CrabCages_F",{13313.8,14507.6,0.0636249},0.0560406},{"Land_JunkPile_F",{13313.8,14515,-0.00780201},297.013},{"Land_WorkStand_F",{13315.9,14511.8,-0.00349522},310.495},{"Land_Garbage_square3_F",{13313.6,14511.6,0.00600243},0.0279988},{"Land_Metal_wooden_rack_F",{13315.9,14518.9,0.00110078},304.348},{"Land_WheelCart_F",{13313.1,14513,0.00185466},117.515},{"Land_HelipadCircle_F",{13314.1,14540.2,0},0},{"Land_spp_Mirror_F",{13309,14521.7,-2.38419e-007},309.358},{"Land_dp_transformer_F",{13313.7,14524,0},333.717},{"Land_CncWall4_F",{13316.5,14530.1,-0.00036478},289.927},{"Land_Mil_WallBig_4m_F",{13319.7,14524.7,-0.0120368},154.164},{"Land_Mil_WallBig_4m_F",{13313.4,14520.5,-0.00267744},136.556},{"Land_Mil_WallBig_4m_F",{13316.4,14522.8,-0.00857091},147.592},{"Land_Garbage_square5_F",{13316.5,14525.7,0.00277591},237.692},{"Land_Garbage_line_F",{13318.9,14523.7,0.0254805},252.492},{"Land_TouristShelter_01_F",{13291.3,14614.9,-9.53674e-007},76.9832},{"Land_Pier_Box_F",{13334.8,14498.2,0.104769},71.6957},{"Land_PartyTent_01_F",{13343.3,14514.7,0.000879049},161.543},{"Land_HBarrier_Big_F",{13321.3,14496.8,0.0973002},349.224},{"Land_Sunshade_04_F",{13329.9,14502.9,0.00681627},0.199829},{"Land_LampHarbour_F",{13339,14500.7,-5.96046e-007},324.419},{"Land_LampHarbour_F",{13328,14501.7,-0.0183594},11.7876},{"Land_CrabCages_F",{13338.9,14503.4,0.0179708},359.976},{"Land_TentDome_F",{13334.2,14503.9,0.0171249},287.115},{"Land_Garbage_line_F",{13336.4,14501.4,-0.0589776},270.921},{"Land_Garbage_square3_F",{13324.3,14502.1,-0.0118027},0.0174958},{"Land_Garbage_square3_F",{13338.7,14505.8,0.00524509},0.0174958},{"Land_Garbage_square3_F",{13333.1,14501.1,-0.00621545},0.0174958},{"Land_Campfire_F",{13328.4,14512.1,-0.0409672},0.0174958},{"Land_GarbageContainer_open_F",{13335.7,14519.3,0.00106692},251.651},{"Land_BagFence_Long_F",{13340.3,14519.6,0.000348806},342.607},{"Land_Sink_F",{13349.6,14518,0.00516319},72.7978},{"Land_CampingTable_F",{13340.8,14518.7,0.000142813},335.017},{"Land_Bench_F",{13331,14512.4,0.000242233},353.009},{"Land_Bench_F",{13326.9,14510.1,0.0057652},124.855},{"Land_Sleeping_bag_brown_F",{13330.5,14503.4,0.0382801},6.17074},{"Land_Sleeping_bag_blue_F",{13329.2,14503.4,0.0390047},0.199829},{"Land_CampingTable_small_F",{13327.4,14514.5,0.00646973},158.107},{"Land_CampingChair_V1_F",{13341.6,14517.3,0.00326729},117.152},{"Land_CampingChair_V2_F",{13325.9,14513.6,0.001086},317.349},{"Land_CampingChair_V2_F",{13329.2,14514.8,3.52859e-005},359.941},{"Land_Pillow_camouflage_F",{13330.3,14504.2,-0.00268662},9.06669},{"Land_Pillow_grey_F",{13329,14504,-0.00269282},9.13059},{"Land_HBarrier_Big_F",{13342.7,14535.4,2.21729e-005},347.07},{"Land_HBarrier_Big_F",{13345.1,14530.8,-0.000231266},253.023},{"Land_HBarrier_Big_F",{13330.9,14531,-2.38419e-007},336.999},{"Land_CncWall4_F",{13327.1,14533.5,-2.38419e-007},229.304},{"Land_CncWall4_F",{13338.2,14530.2,0.000161886},157.719},{"Land_CncWall4_F",{13321.7,14532.4,-0.000200987},344.886},{"Flag_US_F",{13320.7,14524.6,-2.38419e-007},0},{"Land_Mil_WallBig_4m_F",{13334.7,14524.1,0.000475168},247.87},{"Land_Mil_WallBig_4m_F",{13336.1,14520.5,0.000475407},247.907},{"Land_Mil_WallBig_4m_F",{13321.1,14527.6,-0.000753164},78.6046},{"Land_Mil_WallBig_4m_F",{13324.5,14528.4,0.000790119},254.564},{"Land_Mil_WallBig_4m_F",{13327.1,14527.2,0.00105166},163.344},{"Land_Mil_WallBig_4m_F",{13330.8,14528.5,0},157.189},{"Land_Mil_WallBig_4m_F",{13333.1,14527.5,-5.72205e-006},241.672},{"Land_Garbage_square5_F",{13332.5,14530.3,2.6226e-006},310.573},{"Land_Garbage_square5_F",{13329.1,14527.4,0.000170469},0.0174853},{"Land_LampHarbour_F",{13331.7,14523.6,-7.15256e-007},219.543},{"Land_Garbage_line_F",{13331,14533.3,0.000420094},56.4977},{"Land_Garbage_line_F",{13326.3,14529.9,0},0},{"Land_Garbage_line_F",{13329.2,14534.4,0.000157356},153.869},{"Land_Garbage_line_F",{13331.3,14521.7,0.00176883},335.57},{"Land_Garbage_square3_F",{13338.7,14530,0.000244141},0},{"Land_Pallet_MilBoxes_F",{13331.6,14527.6,0},339.477},{"Land_BagFence_Long_F",{13322.6,14529.4,5.00679e-006},342.605},{"Land_BagFence_Long_F",{13343.2,14520.5,9.29832e-005},342.605},{"Land_TablePlastic_01_F",{13322.6,14528.6,-2.38419e-007},345.367},{"Land_PaperBox_open_empty_F",{13329.9,14527.1,7.86781e-006},339.477},{"Land_Graffiti_01_F",{13338.5,14530.9,2.13621},157.817},{"Land_ChairWood_F",{13323.8,14527.9,-1.66893e-006},126.97},{"Land_HBarrier_Big_F",{13359.5,14502.3,0.0664403},55.4318},{"Land_Mil_WallBig_4m_F",{13353.3,14518.3,0.00565863},253.583},{"Land_Mil_WallBig_4m_F",{13356.1,14505.4,0.0153434},67.557},{"Land_Mil_WallBig_4m_F",{13353.3,14514.7,0.00991702},289.908},{"Land_Mil_WallBig_4m_F",{13355.3,14507.7,0.0977246},225.78},{"Land_Mil_WallBig_4m_F",{13352.9,14510.7,0.0773071},248.711},{"Land_Garbage_line_F",{13351,14514.1,-0.026839},296.754},{"Land_ToiletBox_F",{13351,14515.4,0.0014267},38.3472},{"Land_HBarrierTower_F",{13357.5,14530.1,-0.00182509},206.67},{"Land_Grave_rocks_F",{13355.5,14540.3,0},333.404},{"Land_Grave_rocks_F",{13354.6,14542,0},333.404},{"Land_Mound02_8m_F",{6162.68,16812.2,0.0149612},315.554},{"Land_Cargo20_orange_F",{6179.76,16829.7,0.0505295},311.232},{"Land_CncBarrierMedium_F",{6176.92,16830,0.00748444},51.7517},{"Land_HelipadEmpty_F",{6169.49,16821.5,0},359.986},{"Land_Cargo40_grey_F",{6176.53,16833.2,2.63681},53.613},{"Land_Cargo20_sand_F",{6176.11,16837.8,0.0252686},144.241},{"Land_Cargo20_military_green_F",{6177.59,16844.3,0.0136719},113.546},{"Land_CncBarrierMedium_F",{6177.5,16833,0.00309753},51.6071},{"Land_CargoBox_V1_F",{6178.72,16841,0.0587616},250.318},{"Land_CargoBox_V1_F",{6173.7,16834.1,0.0386658},241.477},{"Land_CargoBox_V1_F",{6175.78,16840.3,0.0342102},241.651},{"Land_CncBarrier_stripes_F",{6176.66,16835.2,0.000656128},266.466},{"Land_Grave_dirt_F",{6175.62,16862,0},230.746},{"Land_Grave_forest_F",{6174.19,16860.9,0},232.613},{"Land_Cargo20_grey_F",{6183.96,16827.5,0.0208817},216.529},{"Flag_POWMIA_F",{6185.59,16829.4,0},0},{"Land_Garbage_line_F",{6197.65,16825.8,-0.040535},275.131},{"Land_CncWall1_F",{6186.84,16825.1,0.020401},8.73224},{"Land_CncWall1_F",{6199.79,16824.8,0.0112305},314.427},{"Land_CncWall1_F",{6188.11,16824.7,0.0179138},8.76634},{"Land_CncWall1_F",{6200.97,16826,0.0130386},314.442},{"Land_InvisibleBarrier_F",{6195.92,16823.3,6.00636},0.0314739},{"Land_InvisibleBarrier_F",{6191.93,16823.6,6.12908},0.0420273},{"Land_InvisibleBarrier_F",{6192.48,16823.6,5.09669},0.0420273},{"Land_InvisibleBarrier_F",{6196.23,16823.4,4.86904},359.916},{"Land_Garbage_square3_F",{6187.7,16827.2,0.000137329},0.101566},{"Land_CncBarrier_F",{6188.64,16828.8,0.00197601},276.469},{"Land_CampingTable_F",{6192.76,16829.8,0.00217438},181.885},{"Land_CampingChair_V1_F",{6193.31,16828.4,0.00823212},178.199},{"Land_PartyTent_01_F",{6193.72,16831.7,0.0133286},0.157519},{"Land_Cargo40_grey_F",{6184.39,16851,0.042366},150.893},{"Land_HBarrier_Big_F",{6202.7,16840.1,0.00379181},100.324},{"Land_HBarrier_Big_F",{6194.52,16853.4,0.0065918},7.52855},{"Land_HBarrier_Big_F",{6201.46,16831.1,0.000526428},99.2688},{"Land_HBarrier_Big_F",{6201.1,16848.4,-0.00135803},63.1847},{"Land_Garbage_square5_F",{6199.71,16835.5,0.000144958},0.16451},{"Land_Garbage_line_F",{6192.65,16851.8,-0.0195236},291.183},{"Land_Garbage_line_F",{6188.4,16831.8,-0.0666351},359.934},{"Land_WorkStand_F",{6198.14,16834.3,0.00075531},52.4856},{"Land_ToiletBox_F",{6196.38,16849.9,0.00205231},63.7064},{"Land_WaterTank_F",{6200.39,16841.4,0.00341034},273.366},{"Land_Garbage_square3_F",{6185.6,16849.1,6.10352e-005},0.0209828},{"Land_Campfire_F",{6183.06,16843.3,0.0350647},359.996},{"Land_WoodenTable_large_F",{6185.71,16846.1,0.00247192},151.316},{"Land_Sink_F",{6190.75,16849.5,0.000732422},232.857},{"Land_WoodPile_F",{6198.75,16835.3,0.00598145},0.16451},{"Land_CncBarrier_F",{6195.53,16836.4,0.00226593},0.16802},{"Land_CncBarrier_stripes_F",{6188.69,16834,0.00474548},266.564},{"Land_CncBarrier_stripes_F",{6191.22,16836.5,0.00266266},0.399046},{"Land_WheelCart_F",{6187.45,16847,0.00171661},359.36},{"Land_Bench_F",{6180.3,16843,0.000434875},359.72},{"Land_ShelvesWooden_F",{6198.24,16831.5,0.00237274},1.02574},{"Land_ChairPlastic_F",{6181.8,16846.2,0.00118256},53.9327},{"Land_Axe_F",{6197.86,16835.8,-0.00292969},246.133},{"Land_BarGate_F",{18436.5,14277,0.10347},58.0699},{"Land_HBarrierBig_F",{18440.4,14268.3,0.00117111},60.1274},{"Land_HBarrierBig_F",{18444.9,14261,0.00129318},60.1036},{"Land_Mil_WiredFence_F",{18440.6,14268.7,0.00332832},62.0634},{"Land_Mil_WiredFence_F",{18444.4,14262,0.00336647},60.6549},{"Land_Mil_WiredFence_F",{18449.2,14256.4,0.00034523},35.4755},{"Land_LampShabby_F",{18440.4,14271.3,1.90735e-006},39.7611},{"Land_CncWall1_F",{18438.8,14275.1,-0.00109291},60.6932},{"Land_CncWall1_F",{18437.7,14277.3,-0.00398445},62.128},{"Land_CncWall1_F",{18436.8,14279.5,-0.00417328},63.9977},{"Land_HBarrier_1_F",{18437.7,14272.8,0.000751495},0.0209884},{"MapBoard_seismic_F",{18445.1,14263.8,0.000398636},236.033},{"Land_WoodenTable_small_F",{18440.5,14272.3,-0.014082},359.976},{"Land_Bench_F",{18449.1,14270.4,0.00127792},185.11},{"Land_CampingChair_V1_F",{18441.4,14270.9,0.00442886},194.898},{"Land_HelipadEmpty_F",{18427,14271.2,1.90735e-006},359.885},{"Land_HBarrierBig_F",{18438.9,14283.8,0.000347137},149.02},{"Land_HBarrierBig_F",{18446.5,14285.9,0.00609207},175.83},{"Land_Mil_WiredFence_F",{18445.9,14286,0.00409126},354.943},{"Land_Mil_WiredFence_F",{18439,14283.5,0.000944138},144.943},{"Land_cargo_addon02_V2_F",{18460.6,14258.8,0},330.21},{"Land_HBarrierBig_F",{18470.7,14266.7,0.00342369},93.2859},{"Land_HBarrierBig_F",{18451.4,14255.2,0.00950432},212.484},{"Land_HBarrierBig_F",{18466.7,14259.2,0.0402298},315.017},{"Land_HBarrierBig_F",{18459.5,14254.7,0.0263481},342.966},{"Land_HBarrierBig_F",{18469.4,14274.9,0.00435257},71.0256},{"Land_Mil_WiredFence_F",{18468,14261.2,0.0418205},310.274},{"Land_Mil_WiredFence_F",{18462.6,14256.1,0.0299683},328.217},{"Land_Mil_WiredFence_F",{18469.2,14275,0.0172825},250.01},{"Land_Mil_WiredFence_F",{18470.5,14267.7,0.0156116},271.558},{"Land_Mil_WiredFence_F",{18455.8,14254.1,0.011919},0.620575},{"Land_LampShabby_F",{18454.4,14277.9,-0.0150127},0},{"Land_LampShabby_F",{18469,14264.4,0},323.398},{"Land_LampShabby_F",{18457.2,14256.1,1.90735e-006},0},{"Land_Garbage_square5_F",{18466.9,14266.7,1.71661e-005},359.857},{"Land_Garbage_line_F",{18456.7,14259.8,-0.0267105},117.139},{"Land_JunkPile_F",{18451.7,14257.9,0.00698853},0.737973},{"Land_StallWater_F",{18458,14257,0.00478554},0.0420984},{"Land_Campfire_F",{18452.4,14270.5,0.000808716},359.867},{"Land_GarbageContainer_open_F",{18468,14265.1,0.0781498},284.391},{"Land_Cages_F",{18462.1,14259.4,0.00989532},283.389},{"Land_WoodenTable_large_F",{18459.1,14261.2,0.00582504},236.32},{"Land_Sink_F",{18456.8,14275.2,0.00865936},359.072},{"Oil_Spill_F",{18467.5,14263.8,0.0297527},0.257763},{"Land_Bench_F",{18454.2,14267.7,0.00108147},240.873},{"Land_Tyre_F",{18469,14263.5,-0.00253868},0.460022},{"Land_KartTyre_01_x4_F",{18468.5,14262.8,-0.00620651},2.02641},{"Land_HBarrierBig_F",{18462.3,14287.2,-0.00127792},43.0428},{"Land_HBarrierBig_F",{18454.6,14288.1,0.0716648},161.76},{"Land_Mil_WiredFence_F",{18453.8,14287.5,0.076416},154.537},{"Land_Tank_rust_F",{18459.4,14284.8,0.00293159},242.028},{"Land_CncBarrierMedium4_F",{18464.2,14281.7,0.00330925},62.7671},{"Land_LampShabby_F",{18451.7,14285.3,0},221.564},{"Land_HBarrier_1_F",{18458.1,14290.3,0.0128841},317.438}};
		oneWayTelePos[] = {{{14090.9,11544,1.16816},{13326.5,14515.2,0.16426}},{{14087.5,11541.1,2.75913},{6192.46,16834,0.00154114}},{{14093.9,11546.1,1.0159},{18451.9,14278.1,0.00143814}}};
		staticNpcPos[] = {{"C_Nikos",{14107.1,11541.8,11.3184},255.828},{"C_journalist_F",{14113.1,11556.2,5.80117},329.145},{"C_man_p_fugitive_F",{14108.6,11576.5,5.26916},133.299},{"C_man_hunter_1_F",{14087.1,11577.4,6.79569},95.7614},{"C_man_w_worker_F",{13323.1,14527.3,0.00144649},201.163},{"I_Story_Colonel_F",{13331.2,14524.6,0.00144362},182.606},{"C_Orestes",{13318,14518.3,0},173.189},{"C_man_shorts_4_F_asia",{13349.9,14490.7,0.750791},339.975},{"C_man_hunter_1_F",{6177.13,16835.1,0.0014267},66.2026},{"C_man_p_fugitive_F_afro",{6196.01,16833,0.00157166},310.814},{"C_journalist_F",{18460.6,14259.6,0.00160599},317.76},{"i_survivor_F",{18441.7,14271.7,0.00142479},49.9898}};
		worldSize = 12000;
	};
	class Stratis {
		//fuck stratis no one likes
	};
};
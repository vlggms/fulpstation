
/*
		WELCOME TO THE FULPSTATION CODE Z-LEVEL!


	Any time we want to outright overwrite a variable that is already given a value in a previously defined atom or datum, we
	can overwrite it here!

		WHY DO THIS?

	So we don't have to overwrite the variables defined in TG code.
*/





 	//antag disallowing//

/datum/game_mode/revolution
	restricted_jobs = list("Security Officer", "Warden", "Detective", "AI", "Cyborg","Captain", "Head of Personnel", "Head of Security", "Chief Engineer", "Research Director", "Chief Medical Officer", "Deputy")

/datum/game_mode/clockwork_cult
	restricted_jobs = list("Chaplain", "Captain", "Deputy")

/datum/game_mode/cult
	restricted_jobs = list("Chaplain","AI", "Cyborg", "Security Officer", "Warden", "Detective", "Head of Security", "Captain", "Head of Personnel", "Deputy")

/datum/game_mode/traitor
	restricted_jobs = list("Cyborg", "Deputy")

	//The time for Cobby is Over//	-Love, Sal

/*/datum/reagent/medicine/C2/multiver = /datum/reagent/medicine/CF/charcoal

/datum/chemical_reaction/multiver
	results = list(/datum/reagent/medicine/CF/charcoal = 2)

/datum/chemical_reaction/ichiyuri
	results = list(/datum/reagent/medicine/CF/silver_sulfadiazine = 5)

/datum/chemical_reaction/libital
	results = list(/datum/reagent/medicine/CF/styptic = 3)*/


//obj/item/clothing/accessory
	//worn_icon = 'icons/mob/clothing/accessories.dmi'

//obj/item/clothing/suit/space/hardsuit
	//var/toggle_helmet_sound = 'sound/mecha/mechmove03.ogg'

//*************************************************************************
//** FULPSTATION IMPROVED RECORD SECURITY PR -Surrealistik Oct 2019 BEGINS
//**-----------------------------------------------------------------------
//** -Adds security levels to the security record computer.
//** -Adds arrest logging for security bots.
//*************************************************************************

/mob/living/simple_animal/bot/secbot
	var/list/arrest_cooldown = list() //If you're in the list, we don't log the arrest
	var/weapons_violation //Violation data for records/reporting
	var/id_violation
	var/record_violation
	var/harm_violation

//*************************************************************************
//** FULPSTATION IMPROVED RECORD SECURITY PR -Surrealistik Oct 2019 ENDS
//**-----------------------------------------------------------------------
//** -Adds security levels to the security record computer.
//** -Adds arrest logging for security bots.
//*************************************************************************


//******************************************************
//SEC BODY CAMS by Surrealistik Oct 2019 BEGINS
//******************************************************
/obj/item/clothing/under/rank/security
	var/obj/machinery/camera/builtInCamera = null
	var/registrant
	var/camera_on = TRUE
	var/sound_time_stamp
	req_one_access = list(ACCESS_SECURITY, ACCESS_FORENSICS_LOCKERS)

/obj/machinery/computer/security
	req_one_access = list(ACCESS_SECURITY, ACCESS_FORENSICS_LOCKERS)

/mob/living/simple_animal/bot/secbot
	var/obj/machinery/camera/builtInCamera = null

//******************************************************
//SEC BODY CAMS by Surrealistik Oct 2019 ENDS
//******************************************************

//***********************************************************************
//** FULP PROPER RADIO CHANNELS FOR BORGS by Surrealistik Nov 2019 BEGINS
//**---------------------------------------------------------------------
//** Borgs now have access to appropriate secure radio channels
//***********************************************************************


/obj/item/robot_module/medical/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_MEDICAL)


/obj/item/robot_module/engineering/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_ENGINEERING)


/obj/item/robot_module/security/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SECURITY)

/obj/item/robot_module/peacekeeper/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SECURITY)


/obj/item/robot_module/miner/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SUPPLY)

/obj/item/robot_module/clown/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SERVICE)

/obj/item/robot_module/standard/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SERVICE)

/obj/item/robot_module/janitor/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SERVICE)

/obj/item/robot_module/butler/do_transform_delay()
	..()
	borg_set_radio(RADIO_CHANNEL_SERVICE)


//***********************************************************************
//** FULP PROPER RADIO CHANNELS FOR BORGS by Surrealistik Nov 2019 ENDS
//**---------------------------------------------------------------------
//** Borgs now have access to appropriate secure radio channels
//***********************************************************************

//***************************************************************************
//** FULPSTATION MEDBORG CHANGES by Surrealistik Nov 2019-Feb 2020 BEGINS
//---------------------------------------------------------------------------
//** Adds no-collision holobeds to the medborg. Support for handheld versions
//***************************************************************************

/obj/item/borg/upgrade/beaker_app
	name = "secondary medicine storage apparatus"
	desc = "A supplementary medicine storage apparatus for medical cyborgs."


//***************************************************************************
//** FULPSTATION MEDBORG CHANGES by Surrealistik Nov 2019-Feb 2020 ENDS
//---------------------------------------------------------------------------
//** Adds no-collision holobeds to the medborg. Support for handheld versions
//***************************************************************************


//************************************************************************
//** Airlock Electroadaptive Psuedo Circuit BEGINS - Surrealistik Oct 2019
//************************************************************************

/obj/item/electroadaptive_pseudocircuit
	var/list/accesses = list()
	var/one_access = 0
	var/unres_sides = 0 //unrestricted sides, or sides of the airlock that will open regardless of access
	var/recharge_mod = 3 //allows for faster use of electroadaptive psuedocircuit; higher is slower; no idea why they made this cooldown so slow.

//************************************************************************
//** Airlock Electroadaptive Psuedo Circuit ENDS - Surrealistik Oct 2019
//************************************************************************

//***************************************************************************
//** FULPSTATION SECBORG MODULE UPDATE by Surrealistik Jan 2020 BEGINS
//---------------------------------------------------------------------------
//** Expands the Secborg's module items and upgrades.
//***************************************************************************

/obj/item/robot_module/security //Now has a crowbar to allow it to navigate depowered areas, and a default pepperspray.
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/restraints/handcuffs/cable/zipties,
		/obj/item/melee/baton/loaded,
		/obj/item/gun/energy/e_gun/cyborg,
		/obj/item/reagent_containers/spray/pepper/cyborg,
		/obj/item/clothing/mask/gas/sechailer/cyborg,
		/obj/item/crowbar/cyborg,
		/obj/item/extinguisher/mini
		)
	emag_modules = list() //Instead we unlock lethals for the integrated e_gun


/obj/item/borg/upgrade/pinpointer //Sec borg can now install the crew monitor/pinpointer module.
	module_type = list(/obj/item/robot_module/medical, /obj/item/robot_module/syndicate_medical, /obj/item/robot_module/security)


//***************************************************************************
//** FULPSTATION SECBORG MODULE UPDATE by Surrealistik Jan 2020 BEGINS
//---------------------------------------------------------------------------
//** Expands the Secborg's module items and upgrades.
//***************************************************************************
//*****************************************************************************
//** Engineer Borg Manipulator Improvement by Surrealistik Oct 2019 BEGINS
//** -------------------------------------------------------------------------
//** Engiborgs now start with a manipulator for wall mounted frames and basic
//** electronics which can be upgraded to hold stock parts and circuitboards
//*****************************************************************************

/obj/item/robot_module/engineering
	basic_modules = list(
		/obj/item/assembly/flash/cyborg,
		/obj/item/borg/sight/meson,
		/obj/item/construction/rcd/borg,
		/obj/item/pipe_dispenser,
		/obj/item/extinguisher,
		/obj/item/weldingtool/largetank/cyborg,
		/obj/item/screwdriver/cyborg,
		/obj/item/wrench/cyborg,
		/obj/item/crowbar/cyborg,
		/obj/item/wirecutters/cyborg,
		/obj/item/multitool/cyborg,
		/obj/item/t_scanner,
		/obj/item/analyzer,
		/obj/item/geiger_counter/cyborg,
		/obj/item/assembly/signaler/cyborg,
		/obj/item/areaeditor/blueprints/cyborg,
		/obj/item/electroadaptive_pseudocircuit,
		/obj/item/stack/sheet/metal,
		/obj/item/stack/sheet/glass,
		/obj/item/stack/sheet/rglass/cyborg,
		/obj/item/stack/rods/cyborg,
		/obj/item/stack/tile/plasteel,
		/obj/item/borg/apparatus/circuit,
		/obj/item/stack/cable_coil)

/obj/item/borg/apparatus/circuit
	name = "basic component manipulation apparatus"
	desc = "A special apparatus for carrying and manipulating engineering components like electronics and wall mounted frames. Alt-Z or right-click to drop the stored object."
	var/upgraded = FALSE
	storable = list(/obj/item/wallframe,
				/obj/item/tank,
				/obj/item/electronics)

/obj/item/borg/upgrade/circuit_app
	name = "advanced component manipulation apparatus"
	desc = "An engineering cyborg upgrade that improves the engineering cyborg manipulator, allowing it to manipulate circuitboards and stock parts."

/datum/design/borg_upgrade_circuit_app
	name = "Cyborg Upgrade (Component Manipulator Upgrade)"

//*****************************************************************************
//** Engineer Borg Manipulator Improvement by Surrealistik Oct 2019 ENDS
//*****************************************************************************

//***************************************************************************
//** FULPSTATION SITH STARTER KIT by Surrealistik Jan 2020 BEGINS
//---------------------------------------------------------------------------
//** Adds Sith Starter Kit traitor bundle for the Chaplain
//***************************************************************************

/obj/item/melee/transforming/energy/sword
	var/datum/effect_system/spark_spread/spark_system

//***************************************************************************
//** FULPSTATION SITH STARTER KIT by Surrealistik Jan 2020 ENDS
//---------------------------------------------------------------------------
//** Adds Sith Starter Kit traitor bundle for the Chaplain
//***************************************************************************

//***************************************************************************
//** FULPSTATION SYNDIBORG DISGUISE MENU by Surrealistik March 2020 BEGINS
//---------------------------------------------------------------------------
//** Lets medical and engineering syndiborgs choose a disguise from a list.
//** Also tweaks the medical syndiborg, removing emag and granting more med items
//***************************************************************************
/obj/item/borg_chameleon //List of available disguises
	var/disguise_text //for feedback
	var/default_name //Where we store our initial name.
	var/buffer_name //for RA2 spy style scan of other borgs.
	var/buffer_disguise //for RA2 spy style scan of other borgs.
	var/buffer_disguise_text //for RA2 spy style scan of other borgs.
	actions_types = list(/datum/action/item_action/borg_chameleon)

//***************************************************************************
//** FULPSTATION SYNDIBORG DISGUISE MENU by Surrealistik March 2020 ENDS
//---------------------------------------------------------------------------
//** Lets medical and engineering syndiborgs choose a disguise from a list.
//** Also tweaks the medical syndiborg, removing emag and granting more med items
//***************************************************************************



//************************************************************
//** Improved Sec Starter Gear by Surrealistik Oct 2019 BEGINS
//************************************************************
/datum/outfit/job/security
	backpack_contents = list() //Start with stun baton in belt.
	r_pocket = /obj/item/pda/security
	belt = /obj/item/storage/belt/security/fulp_starter_full
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	box = /obj/item/storage/box/survival/security/improved
	pda_slot = ITEM_SLOT_RPOCKET

/datum/outfit/job/warden
	backpack_contents = list() //Start with stun baton in belt.
	r_pocket = /obj/item/pda/security
	belt = /obj/item/storage/belt/security/fulp_starter_full
	box = /obj/item/storage/box/survival/security/improved
	pda_slot = ITEM_SLOT_RPOCKET

/datum/outfit/job/hos
	backpack_contents = list() //Start with stun baton in belt.
	r_pocket = /obj/item/pda/security
	belt = /obj/item/storage/belt/security/fulp_starter_full
	box = /obj/item/storage/box/survival/security/improved
	pda_slot = ITEM_SLOT_RPOCKET

/obj/machinery/vending/wardrobe/sec_wardrobe
	req_access = list(ACCESS_SECURITY) //We can now vend armor and helmets, so we need to protect the contents.

//************************************************************
//** Improved Sec Starter Gear by Surrealistik Oct 2019 ENDS
//************************************************************

//***********************************************************
//**** Detective Expanded Kit BEGINS - Surrealistik, Oct 2019
//***********************************************************

/datum/outfit/job/detective
	glasses = /obj/item/clothing/glasses/detective

/obj/item/cartridge/detective
	access = CART_SECURITY | CART_MEDICAL | CART_MANIFEST | CART_REAGENT_SCANNER | CART_ATMOS

/datum/techweb_node/integrated_HUDs
	design_ids = list("health_hud", "security_hud", "diagnostic_hud", "scigoggles", "detective_glasses")

/datum/design/detective_scanner
	desc = "Used to remotely scan objects and biomass for DNA and fingerprints, and has an integrated health and reagent analyzer. Can print a report of its findings."

/obj/item/detective_scanner
	desc = "Used to remotely scan objects and biomass for DNA and fingerprints, and has an integrated health and reagent analyzer. Can print a report of its findings."

/obj/item/detective_scanner
	icon = 'icons/Fulpicons/Surreal_stuff/detective_obs.dmi'
	icon_state = "forensicnew-0"
	req_one_access = list(ACCESS_SECURITY, ACCESS_FORENSICS_LOCKERS) //Checked when trying to purge laws or use data disks with the scanner.
	var/mode
	var/advanced = TRUE
	var/print_time_stamp
	var/print_cooldown = 30 //3 second cooldown between prints.


//***********************************************************
//**** Detective Expanded Kit ENDS - Surrealistik, Oct 2019
//***********************************************************

//***********************************************************
//**** Sleepy Pen for ops BEGINS - Glubtok, Jul 2020
//***********************************************************

/datum/uplink_item/stealthy_weapons/sleepy_pen
	name = "Sleepy Pen"
	desc = "A syringe disguised as a functional pen, filled with a potent mix of drugs, including a \
			strong anesthetic and a chemical that prevents the target from speaking. \
			The pen holds one dose of the mixture, and can be refilled with any chemicals. Note that before the target \
			falls asleep, they will be able to move and act."
	item = /obj/item/pen/sleepy
	cost = 4
	exclude_modes = list() //Has to be an empty list to overwrite it since it's already defined in TG's uplink items file.


//***********************************************************
//**** Sleepy Pen for ops ENDS - Glubtok, Jul 2020
//***********************************************************

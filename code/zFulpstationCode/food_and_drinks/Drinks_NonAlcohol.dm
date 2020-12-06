//new//
datum/reagent/consumable/shirley_temple
	name = "Shirley Temple"
	description = "Space-up, Grenadine, and Orange Juice."
	color = "#FFE48C" // rgb: 255, 228, 140
	quality = DRINK_GOOD
	taste_description = "Sweet tonic cherries"
	glass_icon_state = "shirley_temple"
	glass_name = "Shirley Temple"
	glass_desc = "Reminds you of the days restaurants served this to kids..."

	/datum/reagent/consumable/milkshake
	name = "Milkshake"
	description = "Milkshake! makes you crave a truck burger 'n' heap of fries."
	color = "#DFDFDF" // rgb: 223, 223, 223
	taste_description = "sweet and sugary milk"
	glass_icon_state = "milkshake"
	glass_name = "Milkshake"
	glass_desc = "Milkshake! makes you crave a truck burger 'n' heap of fries!"

/datum/chemical_reaction/milkshake
	results = list(/datum/reagent/consumable/milkshake = 15)
	required_reagents = list(/datum/reagent/consumable/milk = 5, /datum/reagent/consumable/ice = 5, /datum/reagent/consumable/cream = 5)

/datum/chemical_reaction/shirley_temple
	results = list(/datum/reagent/consumable/shirley_temple = 5)
	required_reagents = list(/datum/reagent/consumable/space_up = 2, /datum/reagent/consumable/orangejuice = 2, /datum/reagent/consumable/grenadine = 1)
//new//
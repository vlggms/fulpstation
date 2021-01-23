/obj/item/food/tegu
	name = "Tegu Pie"
	icon = 'icons/Fulpicons/fulpitems.dmi'
	icon_state = "sheppie"
	desc = "Made from pure spirit of freedom."
	tastes = list("freedom" = 2, "coding" = 1, "admins" = 1)

/obj/item/food/tegu/sheppie
	name = "shepherd's pie"
	icon_state = "sheppie"
	desc = "Finally, not that store-bought crap!"
	food_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("potatoes" = 2, "meat" = 1, "overcooked corn" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	
	
/datum/crafting_recipe/food/sheppie
	name = "Shepherd's Pie"
	reqs = list(
		/obj/item/food/meat/slab = 1,
		/obj/item/food/grown/corn = 1,
		/obj/item/food/grown/potato = 2,
	)
	result = /obj/item/food/tegu/sheppie
	subcategory = CAT_MEAT

/obj/item/food/tegu/chickenrisotto
	name = "chicken risotto"
	icon_state = "chickenrisotto"
	desc = "Extremely creamy and tasty with lots of spices!"
	food_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("broth" = 2, "rice" = 1, "chicken" = 1)
	foodtypes = GRAIN | MEAT

/datum/crafting_recipe/food/chicken_risotto
	name = "Chicken Risotto"
	reqs = list(
		/obj/item/food/meat/slab/chicken = 1,
		/datum/reagent/consumable/rice = 10,
		/obj/item/food/butter = 1
	)
	result = /obj/item/food/tegu/chickenrisotto
	subcategory = CAT_MEAT

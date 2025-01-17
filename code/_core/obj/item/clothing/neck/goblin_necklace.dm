/obj/item/clothing/neck/goblin_necklace
	name = "Goblin King's necklace"
	icon = 'icons/obj/item/clothing/neck/goblin_necklace.dmi'
	desc = "You monster, stealing from the little green men."
	desc_extended = "The loin is imbued with the life essence of the late Goblin King. Greatly desired by mages."
	worn_layer = LAYER_MOB_CLOTHING_NECK_UNDER

	protected_limbs = list(BODY_TORSO)

	rarity = RARITY_LEGENDARY

	defense_rating = list(
		ARCANE = AP_GREATSWORD,
		HOLY = -AP_GREATSWORD,
		DARK = AP_GREATSWORD
	)

	size = SIZE_1


	value = 1000

	var/cooldown_effect = 0

/obj/item/clothing/neck/goblin_necklace/post_move(atom/old_loc)
	. = ..()
	if(istype(loc, /obj/hud/inventory/organs/neck))
		start_thinking(src)
	else
		stop_thinking(src)

/obj/item/clothing/neck/goblin_necklace/think()
	if(cooldown_effect > world.time)
		return TRUE
	cooldown_effect = world.time + SECONDS_TO_DECISECONDS(1)
	var/turf/T = get_turf(src)
	for(var/mob/living/affectLiving in T)
		if(affectLiving.dead)
			continue
		if(affectLiving.health.get_mana_loss())
			affectLiving.mana_regen_buffer += 3
		CREATE(/obj/effect/temp/healing,affectLiving.loc)
	return TRUE

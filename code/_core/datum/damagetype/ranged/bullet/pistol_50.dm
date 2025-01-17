/damagetype/ranged/bullet/pistol_50
	name = "pistol bullet"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = DAMAGE_CLUB*0.75,
		PIERCE = DAMAGE_CLUB*0.25
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLUNT = AP_CLUB*0.75,
		PIERCE = AP_CLUB*0.25
	)

	falloff = VIEW_RANGE


/damagetype/ranged/bullet/pistol_50/ap
	name = "ap pistol bullet"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		PIERCE = DAMAGE_CLUB*0.75
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		PIERCE = AP_CLUB*3
	)

/damagetype/ranged/bullet/pistol_50/heartbreaker
	name = "heartbreaker pistol bullet"

	//The base attack damage of the weapon. It's a flat value, unaffected by any skills or attributes.
	attack_damage_base = list(
		BLUNT = DAMAGE_GREATSWORD*0.2,
		BLADE = DAMAGE_GREATSWORD*0.5,
		PIERCE = DAMAGE_GREATSWORD*0.15,
	)

	//How much armor to penetrate. It basically removes the percentage of the armor using these values.
	attack_damage_penetration = list(
		BLADE = AP_CLUB*0.5,
		PIERCE = AP_CLUB*2,
		BLUNT = AP_CLUB*0.5
	)

/damagetype/ranged/bullet/pistol_50/surplus
	damage_mod = SURPLUS_MUL
	penetration_mod = SURPLUS_MUL
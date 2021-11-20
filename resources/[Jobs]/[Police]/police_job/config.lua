Config             = {}

Config.jeveuxmarker = true --- true = Oui | false = Non

Config.Nombredeballe = 150 -- Nombre de balle à donner pour chaque arme


Config.Webhookplainte = "https://discord.com/api/webhooks"
Config.Webhookservice = "https://discord.com/api/webhooks"


Config.pos = {
	coffre = {
		position = {x = 467.696350, y = -992.7312, z = 24.920}
	},
	garage = {
		position = {x = 458.9949, y =  -1017.211, z =  28.1608}
	},
	spawnvoiture = {
		position = {x = 454.514, y = -1017.327, z = 28.4331, h = 92.53}
	},
	garageheli = {
		position = {x = 449.4, y = -981.24, z = 43.69}
	},
	spawnheli = {
		position = {x = 449.4, y = -981.24, z = 43.69, h = 351.58}
	},
	boss = {
		position = {x = 447.98126, y = -973.37, z = 30.68}
	},
	blips = {
		position = {x = 423.13, y = -978.85, z = 30.70}
	},
	vestiaire = {
		position = {x = 452.0779, y = -993.3070, z = 30.689}
	},
	plainte = {
		position = {x = 440.950, y = -981.132, z = 30.6895}
	},
	armurerie = {
		position = {x = 452.37, y = -980.1719, z = 30.6895}
	},
}

config = {
serviceWeapons = {
	"weapon_nightstick",
	"weapon_stungun",
	"weapon_combatpistol",
	"weapon_pumpshotgun",
	"weapon_flare",
	"weapon_flashlight",
	"WEAPON_PISTOL",
	"weapon_heavypistol",
	"WEAPON_BZGAS",
	"weapon_assaultsmg",
	"weapon_bullpuprifle_mk2",
	"WEAPON_VINTAGEPISTOL",
	'weapon_fireextinguisher',
	'weapon_smg',
	"weapon_smokegrenade",
	"weapon_specialcarbine"
	}
}

Gpolicevoiture = {
	{nom = "police", modele = "police"},
}

Hpoliceheli = {
	{nom = "Hélicoptère", modele = "polmav"}
}

Config.armurerieofficer = {
	{nom = "MP5", arme = "weapon_smg"},
	{nom = "Extincteur", arme = "weapon_fireextinguisher"},
}

Config.armureriesergeant = {
	{nom = "MP5", arme = "weapon_smg"},
	{nom = "Grenade lacrymogène", arme = "weapon_smokegrenade"},
	{nom = "Extincteur", arme = "weapon_fireextinguisher"},
}

Config.armurerielieutenant = {
	{nom = "MP5", arme = "weapon_smg"},
	{nom = "Fusil à pompe", arme = "weapon_pumpshotgun"},
	{nom = "Gaz lacrymogène", arme = "weapon_smokegrenade"},
	{nom = "Extincteur", arme = "weapon_fireextinguisher"},
}

Config.armurerieboss = {
	{nom = "MP5", arme = "weapon_smg"},
    {nom = "Fusil à pompe", arme = "weapon_pumpshotgun"},
	{nom = "HK G36", arme = "weapon_specialcarbine"},
	{nom = "Gaz lacrymogène", arme = "weapon_smokegrenade"},
	{nom = "Extincteur", arme = "weapon_fireextinguisher"},
}

Config.Uniforms = {
	recruit = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 9,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	officer = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 10,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	sergeant = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 11,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	lieutenant = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 13,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},
	boss = {
		male = {
			tshirt_1 = 122,  tshirt_2 = 0,
			torso_1 = 55,   torso_2 = 0,
			decals_1 = 0,   decals_2 = 0,
			arms = 0,
			pants_1 = 35,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = 46,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		},
		female = {
			tshirt_1 = 2,  tshirt_2 = 0,
			torso_1 = 14,   torso_2 = 15,
			decals_1 = 0,   decals_2 = 0,
			arms = 14,
			pants_1 = 61,   pants_2 = 0,
			shoes_1 = 25,   shoes_2 = 0,
			helmet_1 = -1,  helmet_2 = 0,
			chain_1 = 8,    chain_2 = 0,
			ears_1 = -1,     ears_2 = 0
		}
	},

	bullet_wear = {
		male = {
			bproof_1 = 13,  bproof_2 = 0
		},
		female = {
			bproof_1 = 15,  bproof_2 = 1
		}
	},

	bullet_wearno = {
		male = {
			bproof_1 = 0,  bproof_2 = 0
		},
		female = {
			bproof_1 = 0,  bproof_2 = 0
		}
	},

}
Config             = {}

Config.jeveuxmarker = true --- true = Oui | false = Non

Config.Nombredeballe = 150 -- Nombre de balle à donner pour chaque arme


Config.Webhookplainte = "https://discord.com/api/webhooks/"
Config.Webhookservice = "https://discord.com/api/webhooks/"


Config.pos = {
	coffre = {
		position = {x = -453.570648, y = 6015.173, z = 31.71655}
	},
	garage = {
		position = {x = -461.719, y =  6014.720, z =  31.48976}
	},
	spawnvoiture = {
		position = {x = -467.30261, y = 6018.6689, z =31.340536, h = 300.00}
	},
	garageheli = {
		position = {x = -467.75125, y = 5996.50, z = 31.2625}
	},
	spawnheli = {
		position = {x = -474.990264, y = 5989.006, z = 31.33671, h = 500.00}
	},
	boss = {
		position = {x = -446.2958, y = 6013.55810, z = 36.686}
	},
	blips = {
		position = {x = -442.6779, y = 6017.21, z = 31.711}
	},
	vestiaire = {
		position = {x = -451.6084, y = 6010.56, z = 31.8434}
	},
	plainte = {
		position = {x = -448.47109, y = 6013.7919, z = 31.71652}
	},
	armurerie = {
		position = {x = -430.5124, y = 5999.020, z = 31.7165}
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

Gsheriffvoiture = {
	{nom = "sheriff", modele = "sheriff"},
}

Hsheriffheli = {
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
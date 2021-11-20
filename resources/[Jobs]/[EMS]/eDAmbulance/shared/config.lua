local second = 1000
local minute = 60 * second

EarlyRespawnTimer          = 8 * minute  -- Temp de mort si les ambulancier sont pas venu

ConfigWebhookRendezVousAmbulance = "TONWEBHOOK" -- Metez le webhook de votre salon disocrd configure pour le job ems 

Config = {

	Locale                     = 'fr',

	RespawnPoint = { coords = vector3(361.46710205078, -582.30456542969, 43.284099578857), heading = 162.79 }, -- L'endroit ou tu respawn apers la mort

	EarlyRespawnFine           = false, 
    EarlyRespawnFineAmount     = 5000, 

	RemoveWeaponsAfterRPDeath  = false, -- Supprime les arme sur sois 
    RemoveCashAfterRPDeath     = false, -- Supprime l'argent cash et sale sur sois 
    RemoveItemsAfterRPDeath    = false, -- Supprime tout les item sur sois 

    BleedoutTimer              = 10 * minute, -- Temp de l'effet quand tu respawn 

	ReviveReward               = 150,  -- Price du revive
    AntiCombatLog              = true, -- enable anti-combat logging?

    MarkerType = 22, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 0.3, -- Largeur du marker
    MarkerSizeEpaisseur = 0.3, -- Épaisseur du marker
    MarkerSizeHauteur = 0.3, -- Hauteur du marker
    MarkerDistance = 6.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 69, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 112, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 246, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 180, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = true, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    TextCoffre = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~coffre ~s~!",  -- Text Menu coffre
    TextPharmacie = "Appuyez sur ~b~[E] ~s~pour accèder a la ~b~pharmacie ~s~!",  -- Text Menu Pharamcie
    TextVestaire = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~vestaire ~s~!", -- Text Menu Vestaire
    TextBoss = "Appuyez sur ~b~[E] ~s~pour pour accèder au ~b~action patron ~s~!",  -- Text Menu Boss
    TextGarageVehicule = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Voiture
	TextGarageHeli = "Appuyez sur ~b~[E] ~s~pour accèder au ~b~garage ~s~!",  -- Text Garage Hélico
	TextAscenseur = "Appuyez sur ~b~[E] ~s~pour accèder à ~b~l'étage ~s~!",  -- Text Ascenseur
    TextAccueil = "Appuyez sur ~b~[E] ~s~pour parler a la secrétaire ~s~!",  -- Text Ascenseur
	

AmbuVehiculesAmbulance = { 
	{buttoname = "Ambulance", rightlabel = "→→", spawnname = "ambulance", spawnzone = vector3(333.03616333008, -575.25390625, 28.796836853027), headingspawn = 347.36}, -- Garage Voiture
},

AmbuHelicoAmbulance = { 
	{buttonameheli = "Hélicoptère", rightlabel = "→→", spawnnameheli = "supervolito", spawnzoneheli = vector3(351.62371826172, -587.77081298828, 74.161682128906), headingspawnheli = 22.00}, -- Garage Hélico
},


Pharmacie = {
    {Nom = "Medikit", Item = "medikit"}, -- Item Pour la Pharmacie
    {Nom = "Bandage", Item = "bandage"}, -- Item Pour la Pharmacie
},

Ascenseur = {
	vector3(340.04049682617, -584.81610107422, 28.796867370605), 
	vector3(332.28799438477, -595.75244140625, 43.284046173096), 
    vector3(338.64456176758, -583.72491455078, 74.161796569824), 
},

Position = {
	    Boss = {vector3(334.82543945313, -594.12701416016, 43.284114837646)}, -- Menu boss 
	    Coffre = {vector3(339.2825012207, -595.375, 43.284114837646)}, -- Menu coffre 
        Pharmacie = {vector3(306.90634155273, -601.86676025391, 43.284049987793)}, -- Menu Pharmacie 
        Vestaire = {vector3(298.52624511719, -598.49200439453, 43.284049987793)}, -- Menu Vestaire 
        Accueil = {vector3(308.21548461914, -592.41644287109, 43.284103393555)}, -- Menu Pour Accueil 
        GarageVehicule = {vector3(333.03616333008, -575.25390625, 28.796836853027)}, -- Menu Garage Vehicule
	    GarageHeli = {vector3(351.62371826172, -587.77081298828, 74.161682128906)}, -- Menu Garage Helico
    }
}

AmbuCloak = {
	clothes = {
        specials = {
                [0] = {
                    label = "Tenue Civil",
                    minimum_grade = 0,
                    variations = {male = {}, female = {}},
                    onEquip = function()
                        ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin) TriggerEvent('skinchanger:loadSkin', skin) end)
                        SetPedArmour(PlayerPedId(), 0)
                    end
                },
                [1] = {
                    minimum_grade = 3,
                    label = "Tenue de Directeur",
                    variations = {
                    male = {
                        tshirt_1 = 15,  tshirt_2 = 0,
                        torso_1 = 12,   torso_2 = 0,
                        decals_1 = 0,   decals_2 = 0,
                        arms = 86,
                        pants_1 = 28,   pants_2 = 0,
                        shoes_1 = 40,   shoes_2 = 9,
                        helmet_1 = -1,  helmet_2 = 0,
                        chain_1 = 30,    chain_2 = 2,
                        ears_1 = -1,     ears_2 = 0
                    },
                    female = {
                        tshirt_1 = 39,  tshirt_2 = 0,
                        torso_1 = 90,   torso_2 = 2,
                        decals_1 = 0,   decals_2 = 0,
                        arms = 101,
                        pants_1 = 23,   pants_2 = 0,
                        shoes_1 = 74,   shoes_2 = 1,
                        helmet_1 = -1,  helmet_2 = 0,
                        chain_1 = 96,    chain_2 = 0,
                        ears_1 = -1,     ears_2 = 0
                    }
                },
                onEquip = function()  
                end
                }
            },
            grades = {
                -- @label = Le nom affiché de la tenue de grade
                -- @male = Les composants skinchanger pour les hommes
                -- @female = Les composants skinchanger pour les femmes
                [0] = {
                    label = "Tenue d'Ambulancier",
                    minimum_grade = 0,
                    variations = {
                    male = {
                        bags_1 = 0, bags_2 = 0,
                        tshirt_1 = 15, tshirt_2 = 0,
                        torso_1 = 118, torso_2 = 6,
                        arms = 86,
                        pants_1 = 28, pants_2 = 8,
                        shoes_1 = 51, shoes_2 = 0,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 0, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0,
                    },
                    female = {
                        bags_1 = 0, bags_2 = 0,
                        tshirt_1 = 15, tshirt_2 = 0,
                        torso_1 = 18, torso_2 = 6,
                        arms = 101,
                        pants_1 = 23, pants_2 = 0,
                        shoes_1 = 74, shoes_2 = 1,
                        mask_1 = 0, mask_2 = 0,
                        bproof_1 = 0, bproof_2 = 0,
                        helmet_1 = -1, helmet_2 = 0,
                        chain_1 = 0, chain_2 = 0,
                        decals_1 = 0, decals_2 = 0
                    }
                },
                onEquip = function()
                end
            },
                [1] = {
                    minimum_grade = 0,
                    label = "Tenue Médecin",
                    variations = {
                    male = {
                        tshirt_1 = 15,  tshirt_2 = 0,
                        torso_1 = 118,   torso_2 = 4,
                        decals_1 = 0,   decals_2 = 0,
                        arms = 86,
                        pants_1 = 28,   pants_2 = 8,
                        shoes_1 = 40,   shoes_2 = 9,
                        helmet_1 = -1,  helmet_2 = 0,
                        chain_1 = 30,    chain_2 = 2,
                        ears_1 = -1,     ears_2 = 0
                    },
                    female = {
                        tshirt_1 = 15,  tshirt_2 = 0,
                        torso_1 = 18,   torso_2 = 4,
                        decals_1 = 0,   decals_2 = 0,
                        arms = 101,
                        pants_1 = 23,   pants_2 = 1,
                        shoes_1 = 74,   shoes_2 = 1,
                        helmet_1 = -1,  helmet_2 = 0,
                        chain_1 = 96,    chain_2 = 0,
                        ears_1 = -1,     ears_2 = 0
                    }
                },
                onEquip = function()
                end
            }
        },
    }
}

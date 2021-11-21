Gang = {
    {
        GangName = "Vagos", -- Nom du Gang
        JobGangName = "vagos", -- Nom du set job Gang
        Garage = { -- Garage
        GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès au garage
            PosDeleter = vector3(327.96, -2027.72, 21.07), -- Position du point pour ranger les véhicules
            PosSpawner = vector3(316.47, -2031.82, 20.56), -- Position du point sortir les véhicules
            Vehicule = { -- Vehicule dans le garage
                -- Nom du véhicule / nom de spawn du véhicule / nombre de véhicule que peuvent sortir les personnes / hash du véhicule / couleur du véhicule
                {name = "Sultan", label = "sultan", stock = 2, hash = 970598228, color = {255, 235, 52}},
                {name = "Bf400", label = "bf400", stock = 2, hash = 86520421, color = {255, 235, 52}},
            },
        },
        BossAction = { -- Action Patron
            GradeJobAcces = {"boss"}, -- Grade du job qui a accès aux actions patron
            PosBoss = vector3(343.23, -2028.14, 22.35), -- Position du point action patron
            SocietyAction = "society_vagos", -- Nom de la societe pour l'argent gang
            ArgentType = "black_money", -- Argent à déposer/récupérer du gang (bank/money/black_money)
        },
        Coffre = { -- Coffre
        GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosCoffre = vector3(332.28, -2018.77, 22.35), -- Position du point action patron
            SocietyCoffre = "society_vagos", -- Nom de la societe pour l'argent gang
        },
        Vestiaire = {
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosVestiaire = vector3(325.96, -2050.70, 20.93), -- Position du point action patron
            Tenue = {
                {
                    Name = "Bras Droit",
                    Skin = {
                        Homme = {
                            ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
                            ['torso_1'] = 55,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 25,   ['pants_2'] = 0,
                            ['shoes_1'] = 25,   ['shoes_2'] = 0,
                            ['helmet_1'] = 46,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        },
                        Femme = {
                            ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
                            ['torso_1'] = 48,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 57,
                            ['pants_1'] = 34,   ['pants_2'] = 0,
                            ['shoes_1'] = 27,   ['shoes_2'] = 0,
                            ['helmet_1'] = 45,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        }
                    },
                },
                {
                    Name = "Soldat",
                    Skin = {
                        Homme = {
                            ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
                            ['torso_1'] = 55,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 25,   ['pants_2'] = 0,
                            ['shoes_1'] = 25,   ['shoes_2'] = 0,
                            ['helmet_1'] = 46,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        },
                        Femme = {
                            ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
                            ['torso_1'] = 48,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 57,
                            ['pants_1'] = 34,   ['pants_2'] = 0,
                            ['shoes_1'] = 27,   ['shoes_2'] = 0,
                            ['helmet_1'] = 45,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        }
                    },
                },
            },
        },
    },
    {
        GangName = "Ballas", -- Nom du Gang
        JobGangName = "ballas", -- Nom du set job Gang
        Garage = { -- Garage
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès au garage
            PosDeleter = vector3(89.66, -1966.67, 20.74),-- Position du point pour ranger les véhicules
            PosSpawner = vector3(102.78, -1958.81, 20.78),-- Position du point sortir les véhicules
            Vehicule = { -- Vehicule dans le garage
                -- Nom du véhicule / nom de spawn du véhicule / nombre de véhicule que peuvent sortir les personnes / hash du véhicule / couleur du véhicule
                {name = "Sultan", label = "sultan", stock = 2, hash = 970598228, color = {254, 248, 108}},
                {name = "Bf400", label = "bf400", stock = 2, hash = 86520421, color = {254, 248, 108}},
            },
        },
        BossAction = { -- Action Patron
            GradeJobAcces = {"boss"}, -- Grade du job qui a accès aux actions patron
            PosBoss = vector3(114.28, -1960.90, 21.33), -- Position du point action patron
            SocietyAction = "society_ballas", -- Nom de la societe pour l'argent gang.
            ArgentType = "black_money", -- Argent à déposer/récupérer du gang (bank/money/black_money)
        },
        Coffre = { -- Coffre
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosCoffre = vector3(117.70, -1944.10, 20.64), -- Position du point action patron
            SocietyCoffre = "society_ballas", -- Nom de la societe pour l'argent gang
        },
        Vestiaire = {
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosVestiaire = vector3(325.96, -2050.70, 20.93), -- Position du point action patron
            Tenue = {
                {
                    Name = "OG",
                    Skin = {
                        Homme = {
                            ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
                            ['torso_1'] = 55,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 25,   ['pants_2'] = 0,
                            ['shoes_1'] = 25,   ['shoes_2'] = 0,
                            ['helmet_1'] = 46,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        },
                        Femme = {
                            ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
                            ['torso_1'] = 48,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 57,
                            ['pants_1'] = 34,   ['pants_2'] = 0,
                            ['shoes_1'] = 27,   ['shoes_2'] = 0,
                            ['helmet_1'] = 45,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        }
                    },
                },
            },
        },
    },
    {
        GangName = "marabunta", -- Nom du Gang
        JobGangName = "marabunta", -- Nom du set job Gang
        Garage = { -- Garage
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès au garage
            PosDeleter = vector3(1424.7479248047, -1511.5157470703, 60.99825668335),-- Position du point pour ranger les véhicules
            PosSpawner = vector3(1422.0817871094, -1505.6423339844, 60.952167510986),-- Position du point sortir les véhicules
            Vehicule = { -- Vehicule dans le garage
                -- Nom du véhicule / nom de spawn du véhicule / nombre de véhicule que peuvent sortir les personnes / hash du véhicule / couleur du véhicule
                {name = "Sultan", label = "sultan", stock = 2, hash = 970598228, color = {254, 248, 108}},
                {name = "Bf400", label = "bf400", stock = 2, hash = 86520421, color = {254, 248, 108}},
            },
        },
        BossAction = { -- Action Patron
            GradeJobAcces = {"boss"}, -- Grade du job qui a accès aux actions patron
            PosBoss = vector3(1443.6684570313, -1490.9752197266, 66.622352600098), -- Position du point action patron
            SocietyAction = "society_marabunta", -- Nom de la societe pour l'argent gang.
            ArgentType = "black_money", -- Argent à déposer/récupérer du gang (bank/money/black_money)
        },
        Coffre = { -- Coffre
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosCoffre = vector3(1438.1475830078, -1490.1741943359, 66.619400024414), -- Position du point action patron
            SocietyCoffre = "society_marabunta", -- Nom de la societe pour l'argent gang
        },
        Vestiaire = {
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosVestiaire = vector3(1445.3615722656, -1488.3409423828, 66.619285583496), -- Position du point action patron
            Tenue = {
                {
                    Name = "OG",
                    Skin = {
                        Homme = {
                            ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
                            ['torso_1'] = 55,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 25,   ['pants_2'] = 0,
                            ['shoes_1'] = 25,   ['shoes_2'] = 0,
                            ['helmet_1'] = 46,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        },
                        Femme = {
                            ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
                            ['torso_1'] = 48,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 57,
                            ['pants_1'] = 34,   ['pants_2'] = 0,
                            ['shoes_1'] = 27,   ['shoes_2'] = 0,
                            ['helmet_1'] = 45,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        }
                    },
                },
            },
        },
    },
    {
        GangName = "families", -- Nom du Gang
        JobGangName = "families", -- Nom du set job Gang
        Garage = { -- Garage
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès au garage
            PosDeleter = vector3(-158.78387451172, -1578.5473632813, 34.72819519043),-- Position du point pour ranger les véhicules
            PosSpawner = vector3(-164.44491577148, -1585.5994873047, 34.530830383301),-- Position du point sortir les véhicules
            Vehicule = { -- Vehicule dans le garage
                -- Nom du véhicule / nom de spawn du véhicule / nombre de véhicule que peuvent sortir les personnes / hash du véhicule / couleur du véhicule
                {name = "Sultan", label = "sultan", stock = 2, hash = 970598228, color = {254, 248, 108}},
                {name = "Bf400", label = "bf400", stock = 2, hash = 86520421, color = {254, 248, 108}},
            },
        },
        BossAction = { -- Action Patron
            GradeJobAcces = {"boss"}, -- Grade du job qui a accès aux actions patron
            PosBoss = vector3(-150.32768249512, -1599.6590576172, 35.064331054688), -- Position du point action patron
            SocietyAction = "society_families", -- Nom de la societe pour l'argent gang.
            ArgentType = "black_money", -- Argent à déposer/récupérer du gang (bank/money/black_money)
        },
        Coffre = { -- Coffre
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosCoffre = vector3(-140.96730041504, -1606.4803466797, 35.038139343262), -- Position du point action patron
            SocietyCoffre = "society_families", -- Nom de la societe pour l'argent gang
        },
        Vestiaire = {
            GradeJobAcces = {"habitants", "dealers", "bras", "boss"}, -- Grade du job qui a accès aux actions patron
            PosVestiaire = vector3(-157.45317077637, -1603.458984375, 35.043876647949), -- Position du point action patron
            Tenue = {
                {
                    Name = "OG",
                    Skin = {
                        Homme = {
                            ['tshirt_1'] = 129,  ['tshirt_2'] = 0,
                            ['torso_1'] = 55,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 41,
                            ['pants_1'] = 25,   ['pants_2'] = 0,
                            ['shoes_1'] = 25,   ['shoes_2'] = 0,
                            ['helmet_1'] = 46,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        },
                        Femme = {
                            ['tshirt_1'] = 35,  ['tshirt_2'] = 0,
                            ['torso_1'] = 48,   ['torso_2'] = 0,
                            ['decals_1'] = 0,   ['decals_2'] = 0,
                            ['arms'] = 57,
                            ['pants_1'] = 34,   ['pants_2'] = 0,
                            ['shoes_1'] = 27,   ['shoes_2'] = 0,
                            ['helmet_1'] = 45,  ['helmet_2'] = 0,
                            ['chain_1'] = 0,    ['chain_2'] = 0,
                            ['ears_1'] = 0,     ['ears_2'] = 0,
                            ['mask_1'] = 0,     ['mask_2'] = 0,
                            ['bproof_1'] = 0,  ['bproof_2'] = 0
                        }
                    },
                },
            },
        },
    },
}

BlipsGang = {
    Blip = {
        {pos = vector3(340.63, -2044.76, 21.31), id = 303, scale = 0.8, display = 4, color = 5, name = "Vagos"},
        {pos = vector3(107.03, -1940.77, 20.80), id = 303, scale = 0.8, display = 4, color = 83, name = "Ballas"},
        {pos = vector3(1429.70, -1511.04, 61.54), id = 303, scale = 0.8, display = 4, color = 3, name = "Marabunta"},
        {pos = vector3(-173.68, -1587.35, 34.80), id = 303, scale = 0.8, display = 4, color = 2, name = "Families"},
    },
}

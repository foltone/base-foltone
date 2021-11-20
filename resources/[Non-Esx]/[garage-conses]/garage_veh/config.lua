Config = {
    Blip = true, -- Affichage du blip (true = oui, false = non)
    
    MarkerType = 36, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 1.0, -- Largeur du marker
    MarkerSizeEpaisseur = 1.0, -- Épaisseur du marker
    MarkerSizeHauteur = 1.0, -- Hauteur du marker
    MarkerDistance = 15.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerOpacite = 150, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)

    TextGarage = "Appuyer sur ~g~[E]~s~ pour ~g~sortir un véhicule ~s~!", -- Text écris lors de l'approche du blip voir: https://discord.gg/dkHFBkBBPZ Channel couleur pour changer la couleur du texte 
    TextReturn = "Appuyer sur ~r~[E]~s~ pour ~r~ranger votre véhicule ~s~!", -- Text écris lors de l'approche du blip voir: https://discord.gg/dkHFBkBBPZ Channel couleur pour changer la couleur du texte 
    TextPound = "Appuyer sur ~o~[E]~s~ pour accéder à la ~o~fourrière ~s~!", -- Text écris lors de l'approche du blip voir: https://discord.gg/dkHFBkBBPZ Channel couleur pour changer la couleur du texte 

    Positions = { -- Position du menu astuce sur la map
        Garage = {
            vector3(228.20397949219, -801.15747070313, 30.587280273438), -- PC
            vector3(-336.15, -876.15, 31.07), -- Pôle Emploie
            vector3(117.81, 6611.1, 31.80), -- Paleto
            vector3(501.90795898438, -1336.1114501953, 29.320322036743),
            vector3(-1044.2276611328, -2673.4501953125, 13.830764770508),
            vector3(885.99420166016, 1.2908892631531, 78.764976501465),
            vector3(378.40689086914, 292.96408081055, 103.20001220703),
            vector3(-915.61444091797, -166.38650512695, 41.876399993896),
            vector3(-1532.5205078125, -432.35916137695, 35.442081451416),
            vector3(87.923156738281, -196.86437988281, 54.491607666016),
            vector3(968.27349853516, -1025.1091308594, 40.84627532959),
            vector3(2557.2016601563, 4676.1704101563, 34.079280853271),
            vector3(1707.8607177734, 3762.6306152344, 34.261695861816)
        },
        Pound = {
            vector3(415.61, -1632.47, 29.29),
            vector3(480.93862915039, -1317.7384033203, 29.202816009521)
        },
        Return = {
            vector3(214.55265808105, -792.38275146484, 30.844081878662), -- PC
            vector3(-328.62, -877.3, 31.07), -- Pôle Emploie
            vector3(126.35, 6608.41, 31.85), -- Paleto
            vector3(496.71667480469, -1336.2161865234, 29.326242446899),
            vector3(-1047.8269042969, -2668.7270507813, 13.830763816833),
            vector3(889.06652832031, -0.93629109859467, 78.764976501465),
            vector3(382.73968505859, 291.96786499023, 103.11465454102),
            vector3(-918.32427978516, -167.94088745117, 41.876365661621),
            vector3(-1530.8323974609, -429.51419067383, 35.442111968994),
            vector3(84.509422302246, -195.42170715332, 54.491554260254),
            vector3(967.88629150391, -1020.5685424805, 40.847515106201),
            vector3(2552.3110351563, 4673.65625, 33.9489402771),
            vector3(1704.3980712891, 3764.890625, 34.369110107422)
        },
    } ,
    posblipgarage = {
        vector3(228.20397949219, -801.15747070313, 30.587280273438), -- PC
        vector3(-336.15, -876.15, 31.07), -- Pôle Emploie
        vector3(117.81, 6611.1, 31.80), -- Paleto
        vector3(501.90795898438, -1336.1114501953, 29.320322036743),
        vector3(-1044.2276611328, -2673.4501953125, 13.830764770508),
        vector3(885.99420166016, 1.2908892631531, 78.764976501465),
        vector3(378.40689086914, 292.96408081055, 103.20001220703),
        vector3(-915.61444091797, -166.38650512695, 41.876399993896),
        vector3(-1532.5205078125, -432.35916137695, 35.442081451416),
        vector3(87.923156738281, -196.86437988281, 54.491607666016),
        vector3(968.27349853516, -1025.1091308594, 40.84627532959),
        vector3(2557.2016601563, 4676.1704101563, 34.079280853271),
        vector3(1707.8607177734, 3762.6306152344, 34.261695861816)
    },
}

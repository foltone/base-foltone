
ESX = nil
 open = false
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local coords = false
local namePlayer = false
local playerGroup = nil
local modestaff = false
local InService = false
local inNoClip = false
local IsSpectating = false
local IsInvisible = false
local Reports = {available = {}, taken = {}}
local SelectedReport = {}
local Staffs = {}
local SelectedStaff = {}
local displayBlips = false
local blips = {}
local marker = {}
local PlayerPed = nil
local user_id = 0;
local PtfxPrompt = false
local PtfxNoProp = false
local PlayerParticles = {}
local Selected = {}
local Ptfx = false
local pointing = false
local Players = {}
local LastPos = nil

---Annonce 
local Annonce = 'Ecris ton annonce'
local MeteoAnnonce = "Tempête"
--- Principale
local mainMenu = RageUI.CreateMenu("Menu personnel", "Ton ID est : N°~b~"..GetPlayerServerId(PlayerId()))
local sacados = RageUI.CreateSubMenu(mainMenu,'Sac à Dos', 'Sac à dos')
local vetements = RageUI.CreateSubMenu(mainMenu,'Sac à Dos', 'Sac à dos')
local portefeuille = RageUI.CreateSubMenu(mainMenu,'Porte Feuille', '~b~Porte Feuille')
mespapiers = RageUI.CreateSubMenu(portefeuille,'Mes Papiers', '~b~Mes Papiers')
subfacture = RageUI.CreateSubMenu(portefeuille,'Mes Factures', '~b~Mes Factures')
local inventaire = RageUI.CreateSubMenu(sacados,'Mon inventaire','~b~Mon inventaire')
local inventaireuse = RageUI.CreateSubMenu(inventaire,'Inventaire','~b~Actions disponibles')
local weaponS = RageUI.CreateSubMenu(sacados,'Mes armes','~b~Actions disponibles')
gestentreprise = RageUI.CreateSubMenu(portefeuille,'Gestion entreprise','~b~Actions disponibles')
local weaponUse = RageUI.CreateSubMenu(weaponS,'Mes armes','~b~Actions disponibles')
local setting = RageUI.CreateSubMenu(mainMenu,'Réglage','~b~Réglage')
----
---
----Admin
local admin = RageUI.CreateSubMenu(mainMenu,"Administration","~b~Administration")
local player = RageUI.CreateSubMenu(admin, "Liste des joueurs", "~b~ Liste des joueurs")
local playeruse = RageUI.CreateSubMenu(admin, "Liste des joueurs", "~b~ Actions Disponibles")
local weathers = RageUI.CreateSubMenu(admin,"Météo/Horaire","~b~Météo/Horaire")
local vehicleadmin = RageUI.CreateSubMenu(admin,"Véhicule","~b~Véhicule")
local admindivers = RageUI.CreateSubMenu(admin,"Divers", "~b~Divers")
local adminannonce = RageUI.CreateSubMenu(admin,"Annonce", "~b~Annonce")
local bagplayer =  RageUI.CreateSubMenu(playeruse,"Sac à dos", "~b~Sac à dos")
local inventaireplayer = RageUI.CreateSubMenu(bagplayer,"Inventaire", "~b~Inventaire")
local invplayeruse = RageUI.CreateSubMenu(inventaireplayer,'Inventaire','~b~Actions disponibles')
local weaponplayer = RageUI.CreateSubMenu(inventaireplayer,'Armes','~b~Actions disponibles')
local warn = RageUI.CreateSubMenu(playeruse, "Warn", "~b~ Warn Disponibles")
local kick = RageUI.CreateSubMenu(playeruse, "Kick", "~b~ Kick Disponibles")
local geststaff  = RageUI.CreateSubMenu(admin, "Liste des staffs", "~b~ Staff Disponibles")
local geststaffact = RageUI.CreateSubMenu(admin, "Gestion staffs", "~b~ Staff Disponibles")
local report  = RageUI.CreateSubMenu(admin, " Reports", "~b~ Reports Disponibles")
local reportinfo = RageUI.CreateSubMenu(report, " Reports", "~b~ Actions Disponibles")
----anim

local animation = RageUI.CreateSubMenu(mainMenu,"Animation","~b~Animation")
local walk = RageUI.CreateSubMenu(animation, "Démarches", "~b~Démarches")
local sexe = RageUI.CreateSubMenu(animation, " -18", "~b~-18")
local danse = RageUI.CreateSubMenu(animation, " Danses", "~b~Danses")
local poses = RageUI.CreateSubMenu(animation,"Poses","~b~Poses")
local sit = RageUI.CreateSubMenu(animation,"S'asseoir/Tomber","~b~S'asseoir/Tomber")
local works = RageUI.CreateSubMenu(animation,"Métier","~b~Métier")
local gang = RageUI.CreateSubMenu(animation,"Gang","~b~Gang")
local sport = RageUI.CreateSubMenu(animation,"Sport","~b~Sport")
local mainMenuVeh = RageUI.CreateSubMenu(mainMenu,'Gestion véhicule', "~b~ Gestion véhicule")
local moteur = RageUI.CreateSubMenu(mainMenuVeh,'Gestion véhicule', "~b~ Gestion véhicule") 
local fenetre = RageUI.CreateSubMenu(mainMenuVeh,'Gestion des fenêtres', "~b~ Gestion des fenêtres")
local extra = RageUI.CreateSubMenu(mainMenuVeh,'Gestion des extra', "~b~ Gestion des extra") 
local limit = RageUI.CreateSubMenu(mainMenuVeh,'Gestion du limiteur ', "~b~ Gestion du limiteur ") 

local porte = RageUI.CreateSubMenu(mainMenuVeh,'Gestion des portes', "~b~ Gestion des portes") 
local frap = RageUI.CreateSubMenu(animation,'Frapper', "~b~ Frapper ") 
local actions = RageUI.CreateSubMenu(animation,'Actions', "~b~ Actions ") 
local salue = RageUI.CreateSubMenu(animation,"Salue", "~b~Salue")
local props = RageUI.CreateSubMenu(animation , "Emote avec props", "~b~Emote disponible")

local filterText = ""

mainMenu.Closed = function()
	open = false
	Ptfx = false
end

---Table
foltone = {
	billing = {},
	order = {},
	WeaponData = {},
	societymoney =nil,
	Invisible = false,
	Coords = false,
	Name = false,
	activer = "~g~Activer~s~",
	nameCoord = "~g~Afficher~s~",
	name = "~g~Afficher~s~",
	gamerTags = {},
	JobPlayer = {},
	Job2Player = {},
	inventairePlayer = {},
	weaponPlayer = {},
	pointing = false,
	handsUp = false,
	crouched = false,

	Noclip = false,
	modestaff = false,
	freeze = false,
	freezee = "~g~Freeze~s~",
	spect = "~g~Spectate~s~",
	blipss = false,
	blips = "~g~Activer~s~",
	markerr = false,
	marker = "~g~Activer~s~",
	hud = "~r~Désactiver",
	huds = false,
	maps = false,
	map = "~r~Désactiver",
	maphuds = "~r~Désactiver",
	maphud = false,
	cinematique = "~r~Désactiver",
	cinematiques = false



}

----Fonction qui refresh un peu tout ce qui est pour le joueur
function refresh()
	Citizen.CreateThread(function()

		foltone.WeaponData = ESX.GetWeaponList()

		if ESX ~= nil then 
			if playerGroup == nil then 
				ESX.TriggerServerCallback('foltone:AdmingetUsergroup', function(group) playerGroup = group end)
			end
		end

		for i = 1, #foltone.WeaponData, 1 do
			if foltone.WeaponData[i].name == 'WEAPON_UNARMED' then
				foltone.WeaponData[i] = nil
			else
				foltone.WeaponData[i].hash = GetHashKey(foltone.WeaponData[i].name)
			end
		end


		while open do
			ESX.PlayerData = ESX.GetPlayerData()

			Wait(250)
        end
	end)
end

----Fonction qui permet l'id unique
function refreshIdUnique()
	Citizen.CreateThread(function()
		ESX.TriggerServerCallback('gShop:getOrders', function(data)
			id = data['user_id']
		end)
	end)
end
function OpenMenu()
	if open then
		open = false
		
		RageUI.Visible(mainMenu, false)
		return
	else
		open = true
		RageUI.Visible(mainMenu, true)
		TriggerServerEvent("foltone:getPlayers")
		Citizen.CreateThread(function()
			while open do
				RageUI.IsVisible(mainMenu, function()
					RageUI.Button('Inventaire', false, {RightLabel = ">"}, true, {},sacados)
					RageUI.Button('Porte Feuille', false, {RightLabel = ">"}, true, {
                        onSelected = function()
                            RefreshMoney()
                        end
                    },portefeuille)
					if vehicle.pedinvehicle() then
						RageUI.Button('Gestion du véhicule', false, {RightLabel = ">"}, true, {}, mainMenuVeh)
					else
						RageUI.Button('Gestion du véhicule', "~b~INFORMATION! \n~s~Vous devez être dans un véhicule.", {RightLabel = ">"}, false, {})
					end
					RageUI.Button('Animation', false, {RightLabel = ">"}, true, {},animation)
					RageUI.Button('Option',false , {RightLabel = ">"} , true , {},setting)
					if playerGroup == "superadmin" or playerGroup == "admin" or  playerGroup == "mod" then
						RageUI.Button("Administration", false ,{RightLabel = ">"}, true , {},admin)
					end 

				end)
				RageUI.IsVisible(setting, function()
					RageUI.Checkbox(foltone.cinematique.."~s~ le mode cinématique", false, foltone.cinematiques, {}, {
						onChecked = function()
							foltone.cinematique = "~g~Afficher~s~"
							openCinematique()

						end,
						onUnChecked = function()
							foltone.cinematique = "~r~Désactiver~s~"
							openCinematique()
						end,
						onSelected = function(Index)
							foltone.cinematiques = Index
						end
					})
					--[[RageUI.Checkbox(foltone.hud.."~s~ l'hud", false, foltone.huds, {}, {
						onChecked = function()
							foltone.hud = "~g~Afficher~s~"
							TriggerEvent('ui:toogleUi')

						end,
						onUnChecked = function()
							foltone.hud = "~r~Désactiver~s~"
							TriggerEvent('ui:toogleUi')
						end,
						onSelected = function(Index)
							foltone.huds = Index
						end
					})]]
					RageUI.Checkbox(foltone.map.."~s~ la carte", false, foltone.maps, {}, {
						onChecked = function()
							foltone.map = "~g~Afficher~s~"
							openmap()
						end,
						onUnChecked = function()
							foltone.map = "~r~Désactiver~s~"
							openmap()
						end,
						onSelected = function(Index)
							foltone.maps = Index
						end
					})
					--[[RageUI.Checkbox(foltone.maphuds.."~s~ la carte et l'hud", false, foltone.maphud, {}, {
						onChecked = function()
							foltone.maphuds = "~g~Afficher~s~"
							opentwo()
						end,
						onUnChecked = function()
							foltone.maphuds = "~r~Désactiver~s~"
							opentwo()
						end,
						onSelected = function(Index)
							foltone.maphud = Index
						end
					})]]
				end)

				RageUI.IsVisible(sacados, function()
					RageUI.Button("Gestion d'items", false, {RightLabel = ">"}, true, {},inventaire)
					RageUI.Button("Gestion d'armes", false, {RightLabel = ">"}, true, {},weaponS)
				end)

------Administration			
				RageUI.IsVisible(admin,function()
					RageUI.Checkbox(foltone.activer..' le mode staff', false, foltone.modestaff , {}, {
						onChecked = function()
							foltone.activer = "~r~Desactiver~s~"
							SetInService(true,true)
							modestaff = true
						end,
						onUnChecked = function()
							foltone.activer = "~g~Activer~s~"
							inNoClip = false
							namePlayer = false
							coords = false
							IsInvisible = false
							IsSpectating = false
							modestaff = false
							foltone.freeze = false
							foltone.blipss = false
							foltone.markerr = false
							marker = false
							foltone.modestaff = false
							foltone.Noclip = false
							foltone.Invisible = false
							foltone.Coords = false
							foltone.Name = false
							personal.invisibleplayer(false)
							for k, v in ipairs(ESX.Game.GetPlayers()) do
								RemoveMpGamerTag(foltone.gamerTags[v])
								foltone.gamerTags[v] = nil
							end
							SetInService(false,true)
							displayBlips = false
							for k,v in pairs(blips) do
								RemoveBlip(v)
							end
						end,
						onSelected = function(Index)
							foltone.modestaff = Index
						end
					})
					if modestaff == true then 
						RageUI.Button("Liste des joueurs", false , {RightLabel = ">"} , true , {
							onSelected = function()
								TriggerServerEvent("foltone:Player")
							end
						},player)
						if  playerGroup == 'superadmin' or playerGroup == 'owner' then 
							RageUI.Button("Horaires/Météo", false , {RightLabel = ">"} , true, {},weathers)
						else
							RageUI.Button("Horaires/Météo", false , {RightLabel = ">"} , false, {})
						end
						RageUI.Button("Report", false , {RightLabel = ">"} , true, {},report)
						RageUI.Button("Véhicule", false , {RightLabel = ">"} , true, {},vehicleadmin)
						RageUI.Button("Divers",false, {RightLabel = ">"},true,{},admindivers)
						RageUI.Button("Annonce",false, {RightLabel = ">"},true,{},adminannonce)
						RageUI.Button("Gestion Staff", false , {RightLabel = ">"} , true, {},geststaff)

					end
				end)

				RageUI.IsVisible(geststaff,function()
					GestionStaffMenu()-- body
				end)
				RageUI.IsVisible(geststaffact, function()	
					GestionStaffAction()
				end)
				
				RageUI.IsVisible(report, function()
					RageUI.Separator("~b~↓↓~s~ Mes reports ~b~↓↓~s~")
					for i = 1, #Reports.taken, 1 do
						RageUI.Button(Reports.taken[i].label, Reports.taken[i].text, {}, true, {
							onSelected = function()
								SelectedReport = Reports.taken[i]
							end
						},reportinfo)
					end
					RageUI.Separator("~b~↓↓~s~ Reports disponibles ~b~↓↓~s~")
					for i = 1, #Reports.available, 1 do
						RageUI.Button(Reports.available[i].label, Reports.available[i].text, {}, true, {
							onSelected = function()
								SelectedReport = Reports.available[i]
							end
						},reportinfo)
					end
				end)

				RageUI.IsVisible(reportinfo, function()
					 if not SelectedReport.taken or SelectedReport.taken == nil then
						RageUI.Button('~g~Prendre le report', false, {}, true, {
							onSelected = function()
								local PlayerServerId = GetPlayerServerId(PlayerId())
								TriggerServerEvent('foltone:takeReport', SelectedReport.serverId, SelectedReport.text);
								SelectedReport.taken = PlayerServerId
							end
						},report)
					else
					RageUI.Button("Soigner", false , {RightBadge = RageUI.BadgeStyle.Heart} , true, {
						onSelected = function()
							TriggerServerEvent("foltone:healplayer", SelectedReport.serverId)
						end
					})
					RageUI.Button("Réanimer", false , {RightBadge = RageUI.BadgeStyle.Heart} , true, {
						onSelected = function()
							TriggerServerEvent('ambulance:RevivePlayerStaff', SelectedReport.serverId);			
						end
					})
					RageUI.Button("Se téléporter sur le joueur", false , {} , true, {
						onSelected = function()
							ReportPlayer = GetPlayerPed(GetPlayerFromServerId(SelectedReport.serverId))
							SetEntityCoords(PlayerPedId(), GetEntityCoords(ReportPlayer))

							ESX.ShowNotification("Tu t'es téléporter à ~b~"..SelectedReport.label)
						end
					})
					RageUI.Button("Téléporter le joueur sur moi", false , {} , true, {
						onSelected = function()
							local plyPedCoords = personal.coordped()
							TriggerServerEvent('foltone:bringplayer', SelectedReport.serverId, plyPedCoords)
							ESX.ShowNotification(  "~s~ tu as apporté ~b~".. SelectedReport.label .."~s~ sur toi")
						end
					})
					RageUI.Checkbox(foltone.spect..' le joueur', false, foltone.spec , {}, {
						onChecked = function()	
							foltone.spect = "~r~Quitter le spectate~s~"
							SpectatePlayer(SelectedReport.serverId)
						end,
						onUnChecked = function()
							foltone.spect = "~g~Spectate~s~"
							IsSpectating = false
							IsSpectating = false
							if LastPos == nil then
								LastPos = GetEntityCoords(PlayerPedId())
							end
							TeleportToCoords(LastPos)
	
						end,
						onSelected = function(Index)
							foltone.spec = Index
						end
					})
					RageUI.Checkbox(foltone.freezee..' le joueur', false, foltone.freeze , {}, {
						onChecked = function()	
							foltone.freezee = "~r~Unfreeze~s~"
							TriggerServerEvent("foltone:freezePlayer", SelectedReport.serverId, true)
						end,
						onUnChecked = function()
							foltone.freezee = "~g~Freeze~s~"
							TriggerServerEvent("foltone:freezePlayer", SelectedReport.serverId, false)
						end,
						onSelected = function(Index)
							foltone.freeze = Index
						end
					})
					RageUI.Button("~r~Supprimer le Report", "Pas de retour en arriere prossible !!", {RightBadge = RageUI.BadgeStyle.Alert}, true , {
						onSelected = function()
							TriggerServerEvent('foltone:removeReport', SelectedReport.serverId, SelectedReport.text);
						end
					},report)
				end

				
				end)



				RageUI.IsVisible(player, function()
					RageUI.Button("Rechercher :", nil, { RightLabel = filterText }, true, {
						onSelected = function()
							filterText = KeyboardInput("foltone Admin", "Filtre", "", 100)
							if filterText == nil then
								filterText = ""
							end
						end
					})
					for i = 1, #Players, 1 do
						if not filterText then 
							RageUI.Button(Players[i].label,false, {} , true , {
								onSelected = function()
										menuPlayerId = Players[i].serverId
										menuPlayerName = Players[i].name
										menuPlayer =  GetPlayerPed(GetPlayerFromServerId(menuPlayerId))
										print(menuPlayer)
								end
							},playeruse)
						end
						if string.find(string.lower(Players[i].label), string.lower(filterText)) then
							RageUI.Button(Players[i].label,false, {} , true , {
								onSelected = function()
										menuPlayerId = Players[i].serverId
										menuPlayerName = Players[i].name
										menuPlayer =  GetPlayerPed(GetPlayerFromServerId(menuPlayerId))
										print(menuPlayer)
								end
							},playeruse)
						end
					end
				end)
				
				RageUI.IsVisible(playeruse, function()
					RageUI.Button("Envoyer un message", false , {},true , {
						onSelected = function()
							local msg = KeyboardInput('foltone', "Message" , "" ,200)
							TriggerServerEvent("foltone:SendMsgToPlayer", menuPlayerId, msg)
							TriggerServerEvent("foltone:test", menuPlayerId)
						end
					})
					RageUI.Button("Soigner", false , {RightBadge = RageUI.BadgeStyle.Heart} , true, {
						onSelected = function()
							TriggerServerEvent("foltone:healplayer", menuPlayerId)
						end
					})
					RageUI.Button("Réanimer", false , {RightBadge = RageUI.BadgeStyle.Heart} , true, {
						onSelected = function()
							TriggerServerEvent('ambulance:RevivePlayerStaff', menuPlayerId);			
						end
					})
					RageUI.Button("Sac à dos du joueurs", false , {RightLabel = ">"} , true, {
						onSelected = function()
							RefreshJobPlayer(menuPlayerId)
							RefreshJob2Player(menuPlayerId)
							RefreshLiquideAdmin(menuPlayerId)
							RefreshAccountAdmin(menuPlayerId)
						end
					}, bagplayer)
					RageUI.Button("Se téléporter sur le joueur", false , {} , true, {
						onSelected = function()
							SetEntityCoords(personal.pedId(), GetEntityCoords(menuPlayer))
							ESX.ShowNotification("Tu t'es téléporter à ~b~"..menuPlayerName)
						end
					})
					RageUI.Button("Se téléporter dans la voiture du joueur", false , {RightBadge = RageUI.BadgeStyle.Car} , true, {
						onSelected = function()
							if IsPedSittingInAnyVehicle(menuPlayer) then
								TaskWarpPedIntoVehicle(GetPlayerPed(-1), GetVehiclePedIsIn(menuPlayer), -2)
								ESX.ShowNotification("Tu t'es téléporter dans la voiture de ~b~"..menuPlayerName)
		
							else
								ESX.ShowNotification("~b~" .. menuPlayerName .. "~s~ n'est pas dans un véhicule")
							end
						end
					})
					RageUI.Button("Téléporter le joueur sur moi", false , {} , true, {
						onSelected = function()
							local plyPedCoords = personal.coordped()
							TriggerServerEvent('foltone:bringplayer', menuPlayerId, plyPedCoords)
							ESX.ShowNotification(  "~s~ tu as apporté ~b~".. menuPlayerName .."~s~ sur toi")
						end
					})

					RageUI.Checkbox(foltone.spect..' le joueur', false, foltone.spec , {}, {
						onChecked = function()	
							foltone.spect = "~r~Quitter le spectate~s~"
							SpectatePlayer(menuPlayerId)
						end,
						onUnChecked = function()
							foltone.spect = "~g~Spectate~s~"
							IsSpectating = false
							IsSpectating = false
							if LastPos == nil then
								LastPos = GetEntityCoords(PlayerPedId())
							end
							TeleportToCoords(LastPos)

						end,
						onSelected = function(Index)
							foltone.spec = Index
						end
					})
					RageUI.Checkbox(foltone.freezee..' le joueur', false, foltone.freeze , {}, {
						onChecked = function()	
							foltone.freezee = "~r~Unfreeze~s~"
							TriggerServerEvent("foltone:freezePlayer", menuPlayerId, true)
						end,
						onUnChecked = function()
							foltone.freezee = "~g~Freeze~s~"
							TriggerServerEvent("foltone:freezePlayer", menuPlayerId, false)
						end,
						onSelected = function(Index)
							foltone.freeze = Index
						end
					})
					if playerGroup == "superadmin" or playerGroup == "owner" or playerGroup =='admin' or playerGroup == "mod" then 
						RageUI.Button("~g~Chirurgie",false,{RightBadge = RageUI.BadgeStyle.Heart, Color = {  HightLightColor = { 255, 0, 0 } }},true,{
							onSelected = function()
								sureter  = KeyboardInput('foltone',"tu es sur de refaire une beautée ~s~ à ~b~" ..menuPlayerName,"oui non", 20)
									if sureter == "Oui" or sureter == "o" or sureter == 'oui' then
										TriggerServerEvent("gMenu:registerPlayer", menuPlayerId)
										ESX.ShowNotification('Tu rend un grand service à ~b~'..menuPlayerName.."~s~ il vas devenir ~y~magnifique !") 

									else
										ESX.ShowNotification('Tu as refuser de rendre ~b~'..menuPlayerName.."~y~ MAGNIFIQUE !") 
									end 
							end
						})
					else
						RageUI.Button("~g~Chirurgie","Appelle un supérieur pour utiliser cette fonctionnalitée",{RightLabel = ">"},false,{})

					end
					if playerGroup == "superadmin" or playerGroup == "owner" or playerGroup =='admin' then 
						RageUI.Button("~g~Reset",false,{RightBadge = RageUI.BadgeStyle.Heart, Color = {  HightLightColor = { 255, 0, 0 } }},true,{
							onSelected = function()
								sureter  = KeyboardInput('foltone',"tu es sur de refaire une beautée ~s~ à ~b~" ..menuPlayerName,"oui non", 20)
									if sureter == "Oui" or sureter == "o" or sureter == 'oui' then
										TriggerServerEvent("gMenu:resetPlayer", menuPlayerId)
										ESX.ShowNotification('Tu rend un grand service à ~b~'..menuPlayerName.."~s~ il vas devenir ~y~magnifique !") 

									else
										ESX.ShowNotification('Tu as refuser de rendre ~b~'..menuPlayerName.."~y~ MAGNIFIQUE !") 
									end 
							end
						})
					else
						RageUI.Button("Chirurgie","Appelle un supérieur pour utiliser cette fonctionnalitée",{RightLabel = ">"},false,{})

          end
					RageUI.Separator("~r~↓↓~s~ Sanction ~r~↓↓")

					RageUI.Button("Warn",false,{RightLabel = ">"},true,{},warn)
					RageUI.Button("Kick",false,{RightLabel = ">"},true,{},kick)
					
					--RageUI.Button("Ban","Nous travaillons sur une refonte du ban donc ca arrive bientôt. \n Utiliser la commande comme d'habitude",{RightLabel = ">"},false,{})


				end)

				RageUI.IsVisible(kick,function()
					for k, v in pairs(Kick) do
						if v.name == "Autre ( entrer une raison )" then 
							buttonKickAutre(v.name)
						else 
							buttonKick(v.name)
						end
					end
			
				end)
				RageUI.IsVisible(warn,function()
					for k, v in pairs(Warn) do
						if v.name == "Autre ( entrer une raison )" then 
							buttonWarnAutre(v.name)
						else 
							buttonWarn(v.name)
						end
					end
			
				end)

				RageUI.IsVisible(bagplayer, function()
					RageUI.Button("Inventaire" , false , {RightLabel = ">"} , true, {
						onSelected = function()
							inventaireadmin(menuPlayerId)
						end
					},inventaireplayer)
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
							RageUI.Button("Enlever tout l'inventaire", false,{RightBadge = RageUI.BadgeStyle.Alert},true , {
								onSelected = function ()
									sureter  = KeyboardInput('foltone',"tu es sur de retirer tout l'inventaire ~s~ à ~b~" ..menuPlayerName,"oui non", 20)
									if sureter == "Oui" or sureter == "o" or sureter == 'oui' then
										TriggerServerEvent("foltone:ClearInventory",menuPlayerId)
										ESX.ShowNotification("Tu viens de retirer tout l'inventaire ~s~ à ~b~" ..menuPlayerName)	

									else
										ESX.ShowNotification("Tu as rien retiré ~s~ à ~b~" ..menuPlayerName)	
									end
								end
							})
					else
						RageUI.Button("Enlever tout l'inventaire", "Appelle un supérieur pour utiliser cette fonctionnalitée",{},false , {})
					end
					RageUI.Button("Armes" , false , {RightLabel = ">"} , true, {
						onSelected = function()
							weaponadmin(menuPlayerId)
						end
					},weaponplayer)
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
						RageUI.Button("Enlever toute les armes", false,{RightBadge = RageUI.BadgeStyle.Alert},true , {
							onSelected = function ()
								sureter  = KeyboardInput('foltone',"tu es sur de retirer toute les armes de ~s~ à ~b~" ..menuPlayerName,"oui non", 20)
								if sureter == "Oui" or sureter == "o" or sureter == 'oui' then
									TriggerServerEvent("foltone:ClearLoadout",menuPlayerId)
									ESX.ShowNotification("Tu viens de retirer toutes les armes~s~ à ~b~" ..menuPlayerName)	
								else
									ESX.ShowNotification("Tu as rien retiré ~s~ à ~b~" ..menuPlayerName)	
								end
							end
						})
						else
							RageUI.Button("Enlever toute les armes", "Appelle un supérieur pour utiliser cette fonctionnalitée",{},false , {})
					end

					if foltone.JobPlayer.label ~= nil then 
						RageUI.Button("Métier : ~b~" ..foltone.JobPlayer.label .. "~s~ - ~b~"..foltone.JobPlayer.grade_label , false , {} , true, {})
					end
					if foltone.Job2Player.label ~=nil then 
						RageUI.Button("Organisation : ~b~" ..foltone.Job2Player.label .. "~s~ - ~b~"..foltone.Job2Player.grade_label , false , {} , true, {})
					end
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
						if liquideadmin ~=nil then 
							RageUI.Button("Liquide : ~g~"..liquideadmin .."~s~ €" , "Appuyer sur ~r~ Entrer ~s~ pour pouvoir retirer de l'argent ~g~liquide" , {} , true, {
								onSelected = function()
									SacPlayer.RemoveLiquidePlayer()
								end
							})
						end
					else
						if liquideadmin ~=nil then 
							RageUI.Button("Liquide : ~g~"..liquideadmin .."~s~ €" , "Vous ne pouvez pas retirer de l'argent, appelez un supérieur !" , {} , true, {})
						end
					end
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
							if account ~=nil then
								RageUI.Button("Banque : ~b~".. account[1].money .. "~s~ €" , "Appuyer sur ~r~ Entrer ~s~ pour pouvoir retirer de l'argent en ~b~banque" , {} , true, {
									onSelected = function()
										SacPlayer.RemoveBankPlayer()
										RefreshAccountAdmin(menuPlayerId)
									end
								})
								RageUI.Button("Sale : ~r~".. account[2].money .."~s~ €" , "Appuyer sur ~r~ Entrer ~s~ pour pouvoir retirer de l'argent ~r~sale" , {} , true, {
									onSelected = function()
										SacPlayer.RemoveSalePlayer()
										RefreshAccountAdmin(menuPlayerId)
									end					
								})
							end
						else
							if account ~=nil then
								RageUI.Button("Banque : ~b~".. account[1].money .. "~s~ €" , "Vous ne pouvez pas retirer de l'argent, appelez un supérieur !" , {} , true, {})
								RageUI.Button("Sale : ~r~".. account[2].money .."~s~ €" , "Vous ne pouvez pas retirer de l'argent, appelez un supérieur !"  , {} , true, {})
							end
						end

				end)

				RageUI.IsVisible(weaponplayer, function()
					for k, v in pairs(foltone.weaponPlayer) do
						RageUI.Button(v.label , " Appuyer sur ~r~ Entrer ~s~ pour pouvoir retirer un(e) ~b~" ..v.label , {RightBadge = RageUI.BadgeStyle.Ammo} , true, {
							onSelected = function()
								sureter  = KeyboardInput('foltone',"tu es sur de retirer un(e) "..v.label.. "~s~ à ~b~"..menuPlayerName,"oui non", 20)
								if sureter == "Oui" or sureter == "o" or sureter == "oui" then 
									TriggerServerEvent('foltone:removeweapon', menuPlayerId, v.name)
									weaponadmin(menuPlayerId)
									ESX.ShowNotification("Tu as retirer un(e) ~r~"..v.label.. "~s~ à ~b~"..menuPlayerName)
								else
									ESX.ShowNotification("Tu as rien retiré ~s~ à ~b~" ..menuPlayerName)	
								end
							end
						})
					end
				end)
				RageUI.IsVisible(inventaireplayer, function()	
					SacPlayer.InventoryPlayer()
				end)
				RageUI.IsVisible(weathers, function()
					RageUI.Separator("~b~↓↓~s~ Horaire ~b~↓↓")
					for k, v in pairs(Weather.time) do
						RageUI.Button(v.label, false,{}, true ,{
							onSelected = function()
								TriggerServerEvent('AdminMenu:setTime', v.name)
							end
						})
					end
					RageUI.Separator("~b~↓↓~s~ Météo ~b~↓↓")
					for k, v in pairs(Weather.liste) do
						RageUI.Button(v.label, false,{}, true ,{
							onSelected = function()
								TriggerServerEvent('AdminMenu:setWeather', v.name)
							end
						})
					end

				end)

				RageUI.IsVisible(vehicleadmin, function()
					RageUI.Button("Réparer véhicule", false , {RightBadge = RageUI.BadgeStyle.Tick} , true, {
						onSelected = function()
							if vehicle.pedinvehicle() then 
								AdminVehicle.RepearVehicle()
							else
								ESX.ShowNotification("~r~Vous devez être dans un véhicule")
							end
						end
					})
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
						RageUI.Button("Faire apparaître un véhicule", false , {RightBadge = RageUI.BadgeStyle.Car} , true, {
							onSelected = function()
								if vehicle.pedinvehicle() then 
									ESX.ShowNotification("Vous devez être en dehors du ~r~véhicule")
								else			
									AdminVehicle.SpawnVeh()
								end
							end
						})
					else
						RageUI.Button("Faire apparaître un véhicule", false , {RightBadge = RageUI.BadgeStyle.Car} , false, {})
					end
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
						RageUI.Button("Améliorer le véhicule", false , {RightBadge = RageUI.BadgeStyle.Car} , true, {
								onSelected = function()
									UpVehicle()
								end
							})
					else
						RageUI.Button("Améliorer le véhicule", "Seul les ~r~administrateurs~s~ peuvent utiliser cette fonctionnalitée" , {RightBadge = RageUI.BadgeStyle.Car} , false, {})
					end
					RageUI.Button("Retourner le véhicule", false , {} , true, {
						onSelected = function()
							AdminVehicle.returnveh()
						end
					})
					RageUI.Button("~r~Supprimer le véhicule", false , {RightBadge = RageUI.BadgeStyle.Alert} , true, {
						onSelected = function()
							vehicle.delete(vehicle.currentVehicle())
						end
					})

				end)

				
				RageUI.IsVisible(adminannonce, function()

					RageUI.Separator("~b~↓↓~s~ Annonce ~b~↓↓")
					if playerGroup == 'superadmin' or playerGroup == 'owner' then
						RageUI.Button("Annonce Staff", false , {RightLabel = Annonce}, true , {
							onSelected = function()
								local result = KeyboardInput("foltone","Annonce Staff", "",120)
								Annonce = result
								--TriggerServerEvent('foltone:sendAnnounceStaff', -1, result)
							end
						})
						RageUI.Button("Valider l\'annonce", false , {Color = {  HightLightColor = { 74, 255, 122 } }}, true , {
							onSelected = function()
								announceSurete  = KeyboardInput('foltone',"tu es sur de cette annonce~s~  ~b~" ..Annonce,"oui non", 20)
								if announceSurete == "Oui" or announceSurete == "o" or announceSurete == 'oui' then
								TriggerServerEvent('foltone:sendAnnounceStaff', -1, Annonce)
								end
							end
						})
						RageUI.Button("Annonce Météorologique", false , {RightLabel = MeteoAnnonce}, true , {
							onSelected = function()
								local result = KeyboardInput("foltone","Annonce Météorologique", "",120)
									MeteoAnnonce = result
							end
						})
						RageUI.Button("Valider l\'annonce", false , { Color = {  HightLightColor = { 74, 255, 122 } }}, true , {
							onSelected = function()
								announceSureteMeteo  = KeyboardInput('foltone',"tu es sur de cette annonce~s~  ~b~" ..MeteoAnnonce,"oui non", 20)
								if announceSureteMeteo == "Oui" or announceSureteMeteo == "o" or announceSureteMeteo == 'oui' then
									TriggerServerEvent('foltone:sendAnnounceMétéo', -1, MeteoAnnonce)
								end
							end
						})
					else
						RageUI.Button("Annonce Staff", "Appelle un supérieur pour utiliser cette fonctionnalitée" , {}, false , {})
						RageUI.Button("Annonce Météorologique", "Appelle un supérieur pour utiliser cette fonctionnalitée" , {}, false , {})
					end
				end)


				RageUI.IsVisible(admindivers, function()

					RageUI.Separator("~b~↓↓~s~ Personnage ~b~↓↓")
					RageUI.Checkbox('Noclip', false, foltone.Noclip , {}, {
						onChecked = function()
							ToogleNoClip()
							DrawSub("~g~Noclip  activé.", 5000)
						end,
						onUnChecked = function()
							ToogleNoClip()
							DrawSub("~r~Noclip désactivé.", 5000)
						end,
						onSelected = function(Index)
							foltone.Noclip = Index
						end
					})
					RageUI.Checkbox('Invisibilité', false, foltone.Invisible, {}, {
						onChecked = function()
							personal.invisibleplayer(false)
							DrawSub("~g~Invisibilité activé.", 5000)
						end,
						onUnChecked = function()
							personal.invisibleplayer(true)
							DrawSub("~r~Invisibilité désactivé.", 5000)
						end,

						onSelected = function(Index)
							foltone.Invisible = Index
						end
					})
					RageUI.Separator("~b~↓↓~s~ Divers ~b~↓↓")
					RageUI.Button('Se téléporter au marqueur', false, {}, true, {
						onSelected = function()
							TeleportToWaypoint()
						end
					})
					RageUI.Checkbox(foltone.name..' le nom des joueurs', false, foltone.Name, {}, {
						onChecked = function()
							local PlyCoords = personal.coordped()
							foltone.name = "~r~Cacher~s~"
							namePlayer = true
							Citizen.CreateThread(function()
								while namePlayer do 
									for k, v in ipairs(GetActivePlayers()) do
										local otherPed = GetPlayerPed(v)
										foltone.gamerTags[v] = CreateFakeMpGamerTag(otherPed, ('[%s] %s'):format(GetPlayerServerId(v), GetPlayerName(v)), false, false, '', 0)
									end	
									Wait(0)
								end
							end)
						end,
						onUnChecked = function()
							foltone.name = "~g~Afficher~s~"
							for k, v in ipairs(GetActivePlayers()) do
								RemoveMpGamerTag(foltone.gamerTags[v])
								foltone.gamerTags[v] = nil
							end
							namePlayer = false 
						end,

						onSelected = function(Index)
							foltone.Name = Index
						end
					})
					RageUI.Checkbox(foltone.blips..' les blips', false, foltone.blipss, {}, {
						onChecked = function()
							foltone.blips = "~r~Cacher~s~"
							DisplayPlayersBlips()
						end,
						onUnChecked = function()
							foltone.blips = "~g~Afficher~s~"
							displayBlips = false
							for k,v in pairs(blips) do
								RemoveBlip(v)
							end
						end,
						onSelected = function(Index)
							foltone.blipss = Index
						end
					})

					RageUI.Checkbox(foltone.marker..' le marker vocal', false, foltone.markerr, {}, {
						onChecked = function()
							foltone.marker = "~r~Cacher~s~"
							marker = true
							Citizen.CreateThread(function()
								while marker == true do
									Citizen.Wait(0)
									for k,v in pairs(GetActivePlayers()) do
										if NetworkIsPlayerTalking(v) then
											local pPed = GetPlayerPed(v)
											local pCoords = GetEntityCoords(pPed)
											DrawMarker(1, pCoords.x, pCoords.y, pCoords.z-1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 2.0, 28, 31, 88, 170, 0, 1, 2, 0, nil, nil, 0)
										end
									end
								end
							end)
						end,
						onUnChecked = function()
							foltone.marker = "~g~Afficher~s~"
							marker = false
						end,
						onSelected = function(Index)
							foltone.markerr = Index
						end
					})

					RageUI.Checkbox(foltone.nameCoord..' les coordonnées', false, foltone.Coords, {}, {
						onChecked = function()
							local PlyCoords = personal.coordped()
							foltone.nameCoord = "~r~Cacher~s~"
							coords = true
							Citizen.CreateThread(function()
								while coords do 
									Text('~r~X~s~: ' .. ESX.Math.Round(PlyCoords.x, 2) .. '\n~b~Y~s~: ' .. ESX.Math.Round(PlyCoords.y, 2) .. '\n~g~Z~s~: ' .. ESX.Math.Round(PlyCoords.z, 2).. '\n~y~Angle~s~: ' .. ESX.Math.Round(GetEntityPhysicsHeading(personal.pedId()), 2))
									Wait(0)
								end
							end)
						end,
						onUnChecked = function()
							foltone.nameCoord = "~g~Afficher~s~"

							coords = false 
						end,
						onSelected = function(Index)
							foltone.Coords = Index
						end
					})
				end)
----------------Animation
				RageUI.IsVisible(animation,function()
					RageUI.Button("~r~Annuler l'emote", false, {}, true , {
						onSelected= function()
							Ptfx = false
							local ped = GetPlayerPed(-1)
							if ped then
								DestroyAllProps()
								ClearPedTasksImmediately(ped);
								ResetPedMovementClipset(PlayerPedId())
							end
						end
					})
					RageUI.Button("Emotes avec objet", false, {RightLabel = ">"}, true , {}, props)
					RageUI.Button("Les démarches", false , {RightLabel = ">"} , true , {}, walk)
					RageUI.Button("Danses", false , {RightLabel = ">"} , true , {}, danse)
					RageUI.Button("Action", false , {RightLabel = ">"} , true , {}, actions)
					RageUI.Button("Salue", false , {RightLabel = ">"} , true , {}, salue)
					RageUI.Button("S'asseoir/Tomber", false , {RightLabel = ">"} , true , {}, sit)
					RageUI.Button("Poses", false , {RightLabel = ">"} , true , {}, poses)
					RageUI.Button("Frapper", false , {RightLabel = ">"} , true , {}, frap)
					RageUI.Button("Sport", false , {RightLabel = ">"} , true , {}, sport)
					RageUI.Button("Métier", false , {RightLabel = ">"} , true , {}, works)
					RageUI.Button("Gang", false , {RightLabel = ">"} , true , {}, gang)
					RageUI.Button("+18", false , {RightLabel = ">"} , true , {}, sexe)

				end)
				RageUI.IsVisible(props,function()
					for kCat, vCat in pairs(PropsEmote) do
						for k, v in pairs(vCat.simple) do
							if v.name == "Faite pleuvoir" or v.name == "Caméra" or v.name  == "Spray au champagne"then 
							
								renderanimonePtfs(v.name,v.command ,v.value, v.anim,v.loop,v.Prop,v.PropBone, v.PropPlacement,v.PtfxName,v.PtfxAsset,v.PtfxPlacement)
							else
								
								renderanimoneprops(v.name,v.command ,v.value, v.anim,v.loop,v.Prop,v.PropBone, v.PropPlacement)
							end
						end
					end
				end)
				RageUI.IsVisible(sexe,function()
					for k, v in pairs(Sexe) do
						renderanim(v.name,v.command ,v.value, v.anim,v.loop)
					end
				end)
				RageUI.IsVisible(walk,function()
					for k, v in pairs(Walk) do
						renderwalk(v.label,v.value)
					end

				end)
				RageUI.IsVisible(actions,function()
					for kCat, vCat in pairs(Actions) do
						RageUI.Separator(vCat.type)
						for vAct, vAct in pairs(vCat.actions) do
							if vAct.Prop ~= nil then
								renderanimoneprops(vAct.name,vAct.command ,vAct.value, vAct.anim,vAct.loop,vAct.Prop,vAct.PropBone,vAct.PropPlacement)
							else
								renderanim(vAct.name,vAct.command, vAct.value,vAct.anim, vAct.loop)
							end
						end
					end
				end)
				RageUI.IsVisible(salue,function()
					for kCat, vCat in pairs(Salue) do
						RageUI.Separator(vCat.type)
						for vSal, vSal in pairs(vCat.salue) do
							renderanim(vSal.name,vSal.command,vSal.value,vSal.anim, vSal.loop)
						end
					end
				end)
				RageUI.IsVisible(frap,function()
					for kCat, vCat in pairs(Frapper) do
						RageUI.Separator(vCat.type)
						for vFrap, vFrap in pairs(vCat.frapper) do
							renderanim(vFrap.name,vFrap.command,vFrap.value,vFrap.anim, vFrap.loop)
						end
					end
				end)
				RageUI.IsVisible(danse,function()
					for kCat, vCat in pairs(Musique) do
						RageUI.Separator(vCat.Inst)

						for kInstr, vInstr in pairs(vCat.instruments) do
							if vInstr.name == "Guitare" or vInstr.name == "Guitare 2" or vInstr.name == "Guitare électrique" or vInstr.name == "Guitare électrique 2" then 
								renderanimoneprops(vInstr.name,vInstr.command ,vInstr.value, vInstr.anim,vInstr.loop,vInstr.Prop,vInstr.PropBone,vInstr.PropPlacement)

							else
								renderanim(vInstr.name,vInstr.command,vInstr.value,vInstr.anim, vInstr.loop)
							end
						end
						RageUI.Separator(vCat.type)
						for kDanse, vDanse in pairs(vCat.danses) do
							renderanim(vDanse.name,vDanse.command,vDanse.value,vDanse.anim, vDanse.loop)
						end
						RageUI.Separator(vCat.type2)
						for kDanse, vDanse in pairs(vCat.dansesf) do
							renderanim(vDanse.name,vDanse.command,vDanse.value,vDanse.anim, vDanse.loop)
						end
						RageUI.Separator(vCat.type10)
						for kDanseH, vDanseH in pairs(vCat.horseDanse) do
							renderanimoneprops(vDanseH.name,vDanseH.command ,vDanseH.value, vDanseH.anim,vDanseH.loop,vDanseH.Prop,vDanseH.PropBone,vDanseH.PropPlacement)
						end
						RageUI.Separator(vCat.type11)
						for kDanseGl, vDanseGl in pairs(vCat.glowstickdanse) do
							renderanimtwoprops(vDanseGl.name,vDanseGl.command ,vDanseGl.value, vDanseGl.anim,vDanseGl.loop,vDanseGl.Prop,vDanseGl.PropBone,vDanseGl.PropPlacement,vDanseGl.SecondProp,vDanseGl.SecondPropBone,vDanseGl.SecondPropPlacement)
						end
						RageUI.Separator(vCat.type3)
						for kDanselente, vDanselente in pairs(vCat.danseslente) do
							renderanim(vDanselente.name,vDanselente.command,vDanselente.value,vDanselente.anim, vDanselente.loop)
						end
						RageUI.Separator(vCat.type4)
						for kDanseidiot, vDanseidiot in pairs(vCat.dansesidiot) do
							renderanim(vDanseidiot.name,vDanseidiot.command,vDanseidiot.value,vDanseidiot.anim, vDanseidiot.loop)
						end
						RageUI.Separator(vCat.type5)
						for kDansetimide, vDansetimide in pairs(vCat.dansestimide) do
							renderanim(vDansetimide.name,vDansetimide.command,vDansetimide.value,vDansetimide.anim, vDansetimide.loop)
						end
						RageUI.Separator(vCat.type6)
						for kDansehaut,vDansehaut in pairs(vCat.danseshaut) do 
							renderanim(vDansehaut.name,vDansehaut.command,vDansehaut.value,vDansehaut.anim,vDansehaut.loop)
						end
					end
				end)
				RageUI.IsVisible(poses,function()
					for kCat, vCat in pairs(Poses) do
						RageUI.Separator(vCat.type)
						for kBC, vBC in pairs(vCat.brascroise) do
							renderanim(vBC.name,vBC.command,vBC.value,vBC.anim,vBC.loop)
						end
						RageUI.Separator(vCat.type2)
						for kIna, vIna in pairs(vCat.inactif) do
							renderanim(vIna.name,vIna.command,vIna.value,vIna.anim,vIna.loop)
						end
						RageUI.Separator(vCat.type3)
						for kWait, vWait in pairs(vCat.wait) do
							renderanim(vWait.name,vWait.command,vWait.value,vWait.anim,vWait.loop)
						end
						RageUI.Separator(vCat.type4)
						for kPens, vPens in pairs(vCat.penser) do
							renderanim(vPens.name,vPens.command,vPens.value,vPens.anim,vPens.loop)
						end
						
						RageUI.Separator(vCat.type40)
						for kP, vP in pairs(vCat.ppp) do
							renderanim(vP.name,vP.command,vP.value,vP.anim,vP.loop)
						end
					end
				end)
				RageUI.IsVisible(sit,function()
					for kCat, vCat in pairs(Sits) do
						RageUI.Separator(vCat.type)
						for kSit, vSit in pairs(vCat.sits) do
							if vSit.name == "S'asseoir sur une chaise " then 
								renderscenario(vSit.name,vSit.command,vSit.scenario)
							else
								renderanim(vSit.name,vSit.command,vSit.value,vSit.anim,vSit.loop)
							end
						end
						RageUI.Separator(vCat.type2)
						for kFall, vFall in pairs(vCat.tomber) do
							renderanim(vFall.name,vFall.command,vFall.value,vFall.anim,vFall.loop)
						end
					end
				end)
				RageUI.IsVisible(works,function()
					for kCat, vCat in pairs(Works) do
						RageUI.Separator(vCat.type)
						for kCops, vCops in pairs(vCat.cops) do
							if vCops.name == "Mains sur la ceinture"  then
								renderscenario2(vCops.name,vCops.command,vCops.scenario)
							elseif vCops.name == "Circulation" then 
								renderscenario2(vCops.name,vCops.command,vCops.scenario)
							elseif vCops.name == "Garde" then 
								renderscenario2(vCops.name,vCops.command,vCops.scenario)
							elseif vCops.name == "Balise de flic" then 
								renderscenario2(vCops.name,vCops.command,vCops.scenario)
							elseif vCops.name == "Presse-papiers"  then 
								renderscenario2(vCops.name,vCops.command,vCops.scenario)
							elseif vCops.name == "Jumelle" then
								renderscenario2(vCops.name,vCops.command,vCops.scenario) 
							elseif vCops.name == "Presse-papiers 2" then 
								renderanimoneprops(vCops.name,vCops.command ,vCops.value, vCops.anim,vCops.loop,vCops.Prop,vCops.PropBone, vCops.PropPlacement)
							elseif vCops.name == "Bloc-notes" then 
								renderanimtwoprops(vCops.name,vCops.command ,vCops.value, vCops.anim,vCops.loop,vCops.Prop,vCops.PropBone, vCops.PropPlacement, vCops.SecondProp,vCops.SecondPropBone,vCops.SecondPropPlacement)
							else
								renderanim(vCops.name,vCops.command,vCops.value,vCops.anim,vCops.loop)
							end
						end
						RageUI.Separator(vCat.type2)
						for kMeca, vMeca in pairs(vCat.mechanic) do
							if vMeca.name == "Nettoyer" then 
								renderanimoneprops(vMeca.name,vMeca.command ,vMeca.value, vMeca.anim,vMeca.loop,vMeca.Prop,vMeca.PropBone, vMeca.PropPlacement)

							elseif vMeca.name == "Nettoyer 2" then 
								renderanimoneprops(vMeca.name,vMeca.command ,vMeca.value, vMeca.anim,vMeca.loop,vMeca.Prop,vMeca.PropBone, vMeca.PropPlacement)
							else
								renderanim(vMeca.name,vMeca.command,vMeca.value,vMeca.anim,vMeca.loop)
							end
						end
						RageUI.Separator(vCat.type3)
						for kEms, vEms in pairs(vCat.ems) do
							renderanim(vEms.name,vEms.command,vEms.value,vEms.anim,vEms.loop)
						end
						RageUI.Separator(vCat.type4)
						for kDj, vDj in pairs(vCat.dj) do
							renderanim(vDj.name,vDj.command,vDj.value,vDj.anim,vDj.loop)
						end
					end
				end)

				RageUI.IsVisible(gang,function()					
					for kCat, vCat in pairs(Gang) do
						RageUI.Separator(vCat.type)
						for kGang, vGang in pairs(vCat.gang) do
							renderanim(vGang.name,vGang.command,vGang.value,vGang.anim,vGang.loop)
						end
					end
				end)

				RageUI.IsVisible(sport,function()			
					for kCat, vCat in pairs(Sport) do
						RageUI.Separator(vCat.type)
						for kBoxe, vBoxe in pairs(vCat.box) do
							renderanim(vBoxe.name,vBoxe.command,vBoxe.value,vBoxe.anim,vBoxe.loop)
						end
						RageUI.Separator(vCat.type4)
						for kTK, vTK in pairs(vCat.karate) do
							renderanim(vTK.name,vTK.command,vTK.value,vTK.anim,vTK.loop)
						end
						RageUI.Separator(vCat.type2)
						for kGolf, vGolf in pairs(vCat.golf) do
							renderanim(vGolf.name,vGolf.command,vGolf.value,vGolf.anim,vGolf.loop)
						end
						RageUI.Separator(vCat.type3)
						for kJog, vJog in pairs(vCat.jog) do
							if vJog.name == "Jogging" then 
								renderscenario2(vJog.name,vJog.command,vJog.scenario)
							else
								renderanim(vJog.name,vJog.command,vJog.value,vJog.anim,vJog.loop)
							end
						end
						RageUI.Separator(vCat.type10)
						for kEti, vEti in pairs(vCat.etirement) do
							renderanim(vEti.name,vEti.command,vEti.value,vEti.anim,vEti.loop)
						end

					end
				end)
-----------------------Inventaire
				RageUI.IsVisible(inventaire, function()
					for k,v in pairs(ESX.PlayerData.inventory) do
						if ESX.PlayerData.inventory[k].count > 0 then
						RageUI.Button("[~b~"..v.count.."~s~] - "..v.label, false, {RightLabel = ">"}, true, {
							onSelected = function()
								Item = v
							end
						},inventaireuse)
					end
				end
				end)
				RageUI.IsVisible(inventaireuse, function()
					RageUI.Button("Utiliser l'item", false, {RightBadge = RageUI.BadgeStyle.Heart}, true, {
						onSelected = function()
							Inventaire.useItem()
						end
					})
					RageUI.Button('Donner', false, {RightBadge = RageUI.BadgeStyle.Tick}, true, {
						onSelected = function()
							Inventaire.giveitem()
						end
					})

					RageUI.Button('Jeter', false, {RightBadge = RageUI.BadgeStyle.Alert}, true, {
						onSelected = function()
							Inventaire.dropItem()
						end
					})
				end)
-------------------------Armes
				RageUI.IsVisible(weaponS, function()
					for i = 1, #foltone.WeaponData, 1 do
						if HasPedGotWeapon(personal.pedId(), foltone.WeaponData[i].hash, false) then
							local ammo = GetAmmoInPedWeapon(personal.pedId(), foltone.WeaponData[i].hash)
							RageUI.Button(foltone.WeaponData[i].label, false, {RightLabel = '~b~x'..ammo, RightBadge = RageUI.BadgeStyle.Ammo}, true, {
								onSelected = function()
									Weap = foltone.WeaponData[i]
								end,
							}, weaponUse)
						end
					end
				end)

				RageUI.IsVisible(weaponUse, function()
					RageUI.Button("Donner l'arme", false, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
						onSelected = function()
							WeaponOption.giveweapon()
						end,
					})
					RageUI.Button("Donner des munitions", false, {RightBadge = RageUI.BadgeStyle.Ammo}, true, {
						onSelected = function()
							WeaponOption.giveammo()
						end,
					})


					RageUI.Button("Jeter l'arme", false, {RightBadge = RageUI.BadgeStyle.Gun}, true, {
						onSelected = function()
							WeaponOption.dropweapon()
						end,
					})
				end)


				-- PorteFeuille
				RageUI.IsVisible(portefeuille, function()
					portefeuilles()
				end)

				-- Gestion
				RageUI.IsVisible(gestentreprise, function()
					enterprise()
				end)

------------------------Facture
				RageUI.IsVisible(subfacture, function()
					for i = 1, #foltone.billing, 1 do
						RageUI.Button(foltone.billing[i].label, "Appuyer sur ~r~ Entrer ~s~ pour pouvoir payer la facture", {RightLabel = '[~b~' .. ESX.Math.GroupDigits(foltone.billing[i].amount.."~s~ €]")}, true, {
							onSelected = function()
								RefreshFacture()
								ESX.TriggerServerCallback('esx_billing:payBill', function() -- Hein ? Pourquoi utilisé un callback si tu ne récupère aucune information, autant utilisé un server event
								end, foltone.billing[i].id)
							end
						})
					end
				end)
-----------------------Papier
				RageUI.IsVisible(mespapiers, function()
					license()
				end)
-----------------------veh
				RageUI.IsVisible(mainMenuVeh, function()
					RageUI.Button('Gestion du moteur', false, {RightLabel = ">"}, true, {}, moteur)
					RageUI.Button('Gestion des portes', false, {RightLabel = ">"}, true, {}, porte)
					RageUI.Button('Gestion des fenêtres', false, {RightLabel = ">"}, true, {}, fenetre)
					RageUI.Button('Gestion des extra', false, {RightLabel = ">"}, true, {}, extra)
					RageUI.Button('Gestion du limiteur', false, {RightLabel = ">"}, true, {}, limit)

				end)
-----------------Gestion Moteur
				RageUI.IsVisible(moteur, function()
					carengine()		   
				end)
			
				RageUI.IsVisible(porte, function()
					doorcar()
				end)			
				RageUI.IsVisible(fenetre,function()
					windows()
				end)       
				RageUI.IsVisible(extra,function()
					OpenVehicleExtraMenu()
				end)  
				RageUI.IsVisible(limit,function()
					OpenMenuSpeedLimit()
				end)         
				Wait(0)
			end
		end)
	end
end

-----Debut des commande en jeu
----
-------
Keys.Register('F5', 'F5', 'Menu personnel', function()
	RageUI.CloseAll()
	OpenMenu()
	refresh()
	if id == nil then 
		refreshIdUnique()
	end
	FPtfx()
	
end)
Keys.Register('X', 'X', 'Annuler l\'emote', function()
	Ptfx = false
	local ped = GetPlayerPed(-1)

	if foltone.handsUp then 
		ClearPedSecondaryTask(personal.pedId())
	else	
		DestroyAllProps()
		ClearPedTasks(ped);
		ResetPedMovementClipset(PlayerPedId())
		Ptfx = false

	end
	Ptfx = false
end)
Keys.Register('Y', 'Y', 'Lever les mains', function()
	local plyPed = personal.pedId()

	if (DoesEntityExist(plyPed)) and not (IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
		if foltone.pointing then
			foltone.pointing = false
		end

		foltone.handsUp = not foltone.handsUp

		if foltone.handsUp then
			ESX.Streaming.RequestAnimDict('random@mugging3', function()
				TaskPlayAnim(plyPed, 'random@mugging3', 'handsup_standing_base', 8.0, -8, -1, 49, 0, 0, 0, 0)
				RemoveAnimDict('random@mugging3')
			end)
		else
			ClearPedSecondaryTask(plyPed)
		end
	end
end)


Keys.Register('B', 'B', 'Pointer du doigt', function()
	local plyPed = personal.pedId()
	if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
		if foltone.handsUp then
			foltone.handsUp = false
		end

		foltone.pointing = not foltone.pointing

		if foltone.pointing then
			startPointing(plyPed)
			crouchandpointing(true)
		else
			stopPointing(plyPed)
			crouchandpointing(false)
		end
	end
end)

Keys.Register('LCONTROL', 'LCONTROL', 'S\'accroupir', function()
	local plyPed = PlayerPedId()
	DisableControlAction(1, 36, true)

	if (DoesEntityExist(plyPed)) and (not IsEntityDead(plyPed)) and (IsPedOnFoot(plyPed)) then
		foltone.crouched = not foltone.crouched

		if foltone.crouched then 
			crouchandpointing(true)

			ESX.Streaming.RequestAnimSet('move_ped_crouched', function()
				SetPedMovementClipset(plyPed, 'move_ped_crouched', 0.25)
				RemoveAnimSet('move_ped_crouched')
			end)
		else
			crouchandpointing(false)
			ResetPedMovementClipset(plyPed, 0)
		end
	end
end)


-------
----
-------Fin des commande en jeu

----Fonction de Savoir  si le staff est en service et la tenue du staff
function SetInService(state, inform)
	InService = state;
	
	if state == true then
		-- Se met en service
		local isMen = false
    	if GetEntityModel(GetPlayerPed(-1)) == GetHashKey("mp_m_freemode_01") then
        	isMen = true
    	end

		if isMen then
			for k,v in pairs(Clothes.men) do
				if playerGroup == v.grade then
				 	TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerEvent('skinchanger:loadClothes', skin, v.cloths)
				end)
				end
			end
		else
			for k,v in pairs(Clothes.women) do
				if playerGroup == v.grade then
				 	TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerEvent('skinchanger:loadClothes', skin, v.cloths)
				end)
				end
			end
		end
		
		SetEntityInvincible(personal.pedId(), true)
	
	else
		IsSpectating = false;
		open = false;
		foltone.Noclip = false;
		foltone.Invisible = false;
		foltone.Coords = false;
		foltone.Name = false;
		foltone.nameCoord = "~g~Afficher~s~";
		foltone.Noclip = false;
		foltone.modestaff = false;
		foltone.freeze = false;
		foltone.blipss = false;
		foltone.markerr = false;
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
            TriggerEvent('skinchanger:loadSkin', skin)
	   		FreezeEntityPosition(personal.pedId(), false)
			SetEntityCollision(personal.pedId(), true, true)
			SetEntityVisible(personal.pedId(), true, true)
			SetEveryoneIgnorePlayer(personal.pedId(), false)
			SetPoliceIgnorePlayer(personal.pedId(), false)
			SetEntityInvincible(personal.pedId(), false);
     end)	
	end

	if inform == true then
		TriggerServerEvent('foltone:setInService', state);
	end
end
-------
----
------- Fonction du Noclip
function ToogleNoClip()
	IsNoClip = not IsNoClip

	if IsNoClip then
		-- Start no clip
		Citizen.CreateThread(
			function()
				-- Init NoClip
				local plyPed = PlayerPedId()
				FreezeEntityPosition(plyPed, true)
				SetEntityCollision(plyPed, false, false)
				SetEntityVisible(plyPed, false, false)
				SetEveryoneIgnorePlayer(PlayerId(), true)
				SetPoliceIgnorePlayer(PlayerId(), true)

				-- Start loop for noClip
				while InService and IsNoClip do
					local plyCoords = GetEntityCoords(plyPed, false)
					local camCoords = getCamDirection(plyPed)
					SetEntityVelocity(plyPed, 0.01, 0.01, 0.01)

					local speedMultiplicator = 1

					if IsControlPressed(0, 60) then
						speedMultiplicator = 0.3
					end

					if IsControlPressed(0, 21) then
						speedMultiplicator = 5
					end

					if IsControlPressed(0, 32) then
						plyCoords = plyCoords + (3 * speedMultiplicator * camCoords)
					end

					if IsControlPressed(0, 269) then
						plyCoords = plyCoords - (3 * speedMultiplicator * camCoords)
					end

					SetEntityCoordsNoOffset(plyPed, plyCoords, true, true, true)
					DrawSub("~g~Noclip  activé. ~n~~o~[SHIFT] pour accélérer ~n~~o~[CTRL] pour décélérer", 5000)

					Citizen.Wait(0)
				end
			end
		)
	else
		Citizen.CreateThread(
			function()
				local plyPed = PlayerPedId()
				FreezeEntityPosition(plyPed, false)
				SetEntityCollision(plyPed, true, true)
				SetEntityVisible(plyPed, true, true)
				SetEveryoneIgnorePlayer(PlayerId(), false)
				SetPoliceIgnorePlayer(PlayerId(), false)
			end
		)
	end
end


function getCamDirection(plyPed)
	local heading = GetGameplayCamRelativeHeading() + GetEntityPhysicsHeading(plyPed)
	local pitch = GetGameplayCamRelativePitch()
	local coords =
		vector3(-math.sin(heading * math.pi / 180.0), math.cos(heading * math.pi / 180.0), math.sin(pitch * math.pi / 180.0))
	local len = math.sqrt((coords.x * coords.x) + (coords.y * coords.y) + (coords.z * coords.z))

	if len ~= 0 then
		coords = coords / len
	end

	return coords
end

-------
----
------- Fonction de Spectate le joueur


function SpectatePlayer(playerId)
	ESX.TriggerServerCallback('foltone:getPlayerCoords', function(coords)
		Citizen.CreateThread(function()
			if LastPos == nil then
				LastPos = GetEntityCoords(PlayerPedId());
			end
				
			local plyVeh = GetVehiclePedIsIn(PlayerPedId(), false);
			if plyVeh ~= 0 then
				TaskLeaveVehicle(PlayerPedId(), plyVeh, 16);
			end

			Citizen.Wait(100);

			IsSpectating = true;
			FreezeEntityPosition(PlayerPedId(), true);
			SetEntityCollision(PlayerPedId(), false, false);
			SetEntityVisible(PlayerPedId(), false, false);
			SetEveryoneIgnorePlayer(PlayerId(), true);
			TeleportToCoords(coords);
			
			Citizen.Wait(500);
			
			local targetPed = GetPlayerPed(GetPlayerFromServerId(playerId));
			local text = {
				'Appuyer sur [E] pour quitter le spectate',
				'Appuyer sur [F] pour se TP au joueur'
			};
			while InService and IsSpectating do
				TeleportToCoords(GetEntityCoords(targetPed));
				
				for i, theText in pairs(text) do
					SetTextFont(0)
	                SetTextProportional(1)
    	            SetTextScale(0.0, 0.60)
        	        SetTextDropshadow(0, 0, 0, 0, 255)
            	    SetTextEdge(1, 0, 0, 0, 255)
                	SetTextDropShadow()
	                SetTextOutline()
    	            SetTextEntry("STRING")
        	        AddTextComponentString(theText)
            	    EndTextCommandDisplayText(0.4, 0.75 + (i / 25))
	             end

				if IsControlJustPressed(0, 38) then
					IsSpectating = false;
					TeleportToCoords(LastPos);
				end
				
				if IsControlJustPressed(0, 23) then
					IsInvisible = true;
					IsSpectating = false;
				end

				Citizen.Wait(0);
			end
			FreezeEntityPosition(PlayerPedId(), false);
			SetEntityCollision(PlayerPedId(), true, true);
			
			if not IsInvisible then
				SetEntityVisible(PlayerPedId(), true, true);
			end
			SetEveryoneIgnorePlayer(PlayerId(), false);
			LastPos = nil;
		end)
	end, playerId)
end
-------
----
------- Fonction qui set les reports
function SetReports(reports)
	local PlayerServerId =  GetPlayerServerId(PlayerId())
	Reports.taken = {}
	Reports.available = {};

	for _, report in pairs(reports) do
		if not report.taken or report.taken == nil then
			table.insert(Reports.available, report);
		elseif PlayerServerId == report.taken then
			table.insert(Reports.taken, report)
		end
	end
end


function SetStaffs(staffs)
	Staffs = staffs
end

-------
----
------- Debut des Boutons du gestion staff
function GestionStaffMenu()
	for i = 1, #Staffs, 1 do
		RageUI.Button(Staffs[i].label, nil, { RightLabel = "→" },true, {
			onSelected = function() 
				SelectedStaff = Staffs[i]
			end
		},geststaffact)
	end
end


function GestionStaffAction()
	RageUI.Button("Se téléporter sur le joueur", false , {} , true, {
		onSelected = function()
			BruhPlayer = GetPlayerPed(GetPlayerFromServerId(SelectedStaff.serverId))
			SetEntityCoords(personal.pedId(), GetEntityCoords(BruhPlayer))

			ESX.ShowNotification("Tu t'es téléporter à ~b~"..SelectedStaff.label)
		end
	})
	RageUI.Button("Téléporter le joueur sur moi", false , {} , true, {
		onSelected = function()
			local plyPedCoords = personal.coordped()
			TriggerServerEvent('foltone:bringplayer', SelectedStaff.serverId, plyPedCoords)
			ESX.ShowNotification(  "~s~ tu as apporté ~b~".. SelectedStaff.label .."~s~ sur toi")
		end
	})
	RageUI.Checkbox(foltone.spect..' le joueur', false, foltone.spec , {}, {
		onChecked = function()	
			foltone.spect = "~r~Quitter le spectate~s~"
			SpectatePlayer(SelectedStaff.serverId)
		end,
		onUnChecked = function()
			foltone.spect = "~g~Spectate~s~"
			IsSpectating = false
			if LastPos == nil then
				LastPos = GetEntityCoords(PlayerPedId())
			end
			TeleportToCoords(LastPos)

		end,
		onSelected = function(Index)
			foltone.spec = Index
		end
	})
	RageUI.Checkbox(foltone.freezee..' le joueur', false, foltone.freeze , {}, {
		onChecked = function()	
			foltone.freezee = "~r~Unfreeze~s~"
			TriggerServerEvent("foltone:freezePlayer", SelectedStaff.serverId, true)
		end,
		onUnChecked = function()
			foltone.freezee = "~g~Freeze~s~"
			TriggerServerEvent("foltone:freezePlayer", SelectedStaff.serverId, false)
		end,
		onSelected = function(Index)
			foltone.freeze = Index
		end
	})
		RageUI.Button("Rétrograder", "Attention petit délinquant ce boutton est dangereux donc fait très attention!" , {RightBadge = RageUI.BadgeStyle.Alert} , true, {
			onSelected = function()
				TriggerServerEvent('foltone:removePerm', SelectedStaff.serverId);
			end
		})	
end

RegisterNetEvent('foltone:removePerm')
AddEventHandler('foltone:removePerm', function()
	ESX.ShowNotification("Tes permissions ont ete retire.")
	SetInService(false, true)
end)

-------
----
------- Fin des Boutons du gestion staff
----
----
----Blips des joueurs sur la map 
function DisplayPlayersBlips()
	if displayBlips then
		displayBlips = false
		for k,v in pairs(blips) do
			RemoveBlip(v)
		end
		blips = {}
	else
		displayBlips = true

		Citizen.CreateThread(function()
			while displayBlips do

				for k,v in pairs(GetActivePlayers()) do
					local pPed = GetPlayerPed(v)

					if blips[v] == nil then
						local blip = AddBlipForEntity(pPed)
						SetBlipScale(blip, 0.75)
						SetBlipCategory(blip, 2)
						blips[v] = blip
					else
						local blip = GetBlipFromEntity(pPed)
						RemoveBlip(blip)
						RemoveBlip(blips[v])
						local blip = AddBlipForEntity(pPed)
						SetBlipScale(blip, 0.75)
						SetBlipCategory(blip, 2)
						blips[v] = blip
					end
					SetBlipNameToPlayerName(blips[v], v)
					SetBlipSprite(blips[v], 1)
					SetBlipRotation(blips[v], math.ceil(GetEntityHeading(pPed)))
					

					if IsPedInAnyVehicle(pPed, false) then
						ShowHeadingIndicatorOnBlip(blips[v], false)
						local pVeh = GetVehiclePedIsIn(pPed, false)
						SetBlipRotation(blips[v], math.ceil(GetEntityHeading(pVeh)))

						
						if DecorExistOn(pVeh, "esc_siren_enabled") or IsPedInAnyPoliceVehicle(pPed) then
						--if IsPedInAnyPoliceVehicle(pPed) then
							SetBlipSprite(blips[v], 56)
							SetBlipColour(blips[v], 68)
						else
							SetBlipSprite(blips[v], 227)
							SetBlipColour(blips[v], 0)
						end
					else
						ShowHeadingIndicatorOnBlip(blips[v], true)
						HideNumberOnBlip(blips[v])
					end

				end
				Wait(500)
			end
		end)
	end
end


-------
----
-------Debut des Boutton pour les emotes avec props et fonction ( flash , Spray champagne)
function renderanimonePtfs(label,desc, value, anim,loop, name,bone,PropPlacement, name3,asset,PtfxPlacement)
	RageUI.Button(label, "/e ~b~"..desc, {RightLabel = ""}, true, {
		onSelected = function()
			Ptfx = true	 	
			DestroyAllProps()
			ESX.ShowNotification('Appuyer  ~y~ G ~s~sur utiliser l\'attaque spécial.')
			Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, PtfxScale = table.unpack(PtfxPlacement)
			PtfxAsset = asset
			PtfxName = name3
			PtfxPrompt = true
			PtfxThis(PtfxAsset)
			PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 = table.unpack(PropPlacement)
			AddPropToPlayer(name, bone, PropPl1, PropPl2, PropPl3, PropPl4, PropPl5, PropPl6 )
			startAnim(value, anim,loop)
		end
	})
end

function PtfxStart()
    if PtfxNoProp then
      PtfxAt = PlayerPedId()
    else
      PtfxAt = prop
    end
    UseParticleFxAssetNextCall(PtfxAsset)
    Ptfx = StartNetworkedParticleFxLoopedOnEntityBone(PtfxName, PtfxAt, Ptfx1, Ptfx2, Ptfx3, Ptfx4, Ptfx5, Ptfx6, GetEntityBoneIndexByName(PtfxName, "VFX"), 1065353216, 0, 0, 0, 1065353216, 1065353216, 1065353216, 0)
    SetParticleFxLoopedColour(Ptfx, 1.0, 1.0, 1.0)
    table.insert(PlayerParticles, Ptfx)
end
function PtfxStop()
	for a,b in pairs(PlayerParticles) do
	  StopParticleFxLooped(b, false)
	  table.remove(PlayerParticles, a)
	end
end
function PtfxThis(asset)
	while not HasNamedPtfxAssetLoaded(asset) do
	  RequestNamedPtfxAsset(asset)
	  Wait(10)
	end
	UseParticleFxAssetNextCall(asset)
end

function FPtfx()
	Citizen.CreateThread(function()
		while Ptfx do	
		  if PtfxPrompt then
			if IsControlPressed(1, 47) then
			  PtfxStart()
			  Wait(300)
			  PtfxStop()
			end
		  end
		  Citizen.Wait(1)
		end
	end)
end
-------
----
-------Debut des Boutton pour les emotes avec props et fonction ( flash , Spray champagne)
----
-------
----Fonction pour pointer du doigt et S'accroupir
function startPointing(plyPed)	
	ESX.Streaming.RequestAnimDict('anim@mp_point', function()
		SetPedConfigFlag(plyPed, 36, 1)
		TaskMoveNetworkByName(plyPed, 'task_mp_pointing', 0.5, 0, 'anim@mp_point', 24)
		RemoveAnimDict('anim@mp_point')
	end)
end

function stopPointing()
	local plyPed = personal.pedId()
	RequestTaskMoveNetworkStateTransition(plyPed, 'Stop')

	if not IsPedInjured(plyPed) then
		ClearPedSecondaryTask(plyPed)
	end

	SetPedConfigFlag(plyPed, 36, 0)
	ClearPedSecondaryTask(plyPed)
	pointing = false
end

function crouchandpointing(default)
	Citizen.CreateThread(function()
		while default do
			
			Citizen.Wait(100)
			if foltone.crouched or foltone.handsUp or foltone.pointing then
				if not IsPedOnFoot(PlayerPedId()) then
					ResetPedMovementClipset(plyPed, 0)
					stopPointing()
					foltone.crouched, foltone.handsUp, foltone.pointing = false, false, false
				elseif foltone.pointing then
					local ped = PlayerPedId()
					local camPitch = GetGameplayCamRelativePitch()
	
					if camPitch < -70.0 then
						camPitch = -70.0
					elseif camPitch > 42.0 then
						camPitch = 42.0
					end
	
					camPitch = (camPitch + 70.0) / 112.0
	
					local camHeading = GetGameplayCamRelativeHeading()
					local cosCamHeading = Cos(camHeading)
					local sinCamHeading = Sin(camHeading)
	
					if camHeading < -180.0 then
						camHeading = -180.0
					elseif camHeading > 180.0 then
						camHeading = 180.0
					end
	
					camHeading = (camHeading + 180.0) / 360.0
					local coords = GetOffsetFromEntityInWorldCoords(ped, (cosCamHeading * -0.2) - (sinCamHeading * (0.4 * camHeading + 0.3)), (sinCamHeading * -0.2) + (cosCamHeading * (0.4 * camHeading + 0.3)), 0.6)
					local rayHandle, blocked = GetShapeTestResult(StartShapeTestCapsule(coords.x, coords.y, coords.z - 0.2, coords.x, coords.y, coords.z + 0.2, 0.4, 95, ped, 7))
	
					SetTaskMoveNetworkSignalFloat(ped, 'Pitch', camPitch)
					SetTaskMoveNetworkSignalFloat(ped, 'Heading', (camHeading * -1.0) + 1.0)
					SetTaskMoveNetworkSignalBool(ped, 'isBlocked', blocked)
					SetTaskMoveNetworkSignalBool(ped, 'isFirstPerson', N_0xee778f8c7e1142e2(N_0x19cafa3c87f7c2ff()) == 4)
				end
			end
		end
	end)
end
AddEventHandler("ClearEmote", function()
	EmoteCancel()
end)

function EmoteCancel()
	PtfxPrompt = false
	PtfxStop()
	ClearPedTasks(GetPlayerPed(-1))
	DestroyAllProps()
	ResetPedMovementClipset(PlayerPedId())
end
--------------------------------------------------------------------------------
----
-------
---Set Player
function SetPlayer(players)
	Players = players
end

-------Téléporter sur un Marker

Citizen.CreateThread(function()
	while true do
		if IsControlPressed(1,19) and IsControlJustReleased(1, 38) and IsInputDisabled(2) then
			if playerGroup == 'mod' or playerGroup == 'admin' or playerGroup == 'superadmin' or playerGroup == 'owner' then
				TeleportToWaypoint()
			end
		end
		Wait(1)
	end
end)

RegisterNetEvent('personnalMenu:closeMenu')
AddEventHandler('personnalMenu:closeMenu', function()
    RageUI.Visible(mainMenu, false)
end)





------- Marker quand parle

function ShowMarker()
	local ply = GetPlayerPed(-1)
	local pCoords = GetEntityCoords(ply, true)
    local veh = GetTargetedVehicle(pCoords, ply)
    if veh ~= 0 and GetEntityType(veh) == 2 then
        local coords = GetEntityCoords(veh)
        local x,y,z = table.unpack(coords)
        DrawMarker(2, x, y, z+1.5, 0, 0, 0, 180.0,nil,nil, 0.5, 0.5, 0.5, 0, 0, 255, 120, true, true, p19, true)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if markerr == true then            
            for k,v in pairs(GetActivePlayers()) do
                if NetworkIsPlayerTalking(v) then
                    local pPed = GetPlayerPed(v)
                    local pCoords = GetEntityCoords(pPed)
                    DrawMarker(32, pCoords.x, pCoords.y, pCoords.z+1.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.3, 0.3, 0, 255, 0, 170, 0, 1, 2, 0, nil, nil, 0)
				end
            end
        end
    end
end)

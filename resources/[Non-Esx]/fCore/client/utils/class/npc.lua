Npc = {}
Npc.nps = {}
Npc.entity = {}
Npc.isInDialogue = false

function Npc.AddNpc(name, model, pos, actions, loadDst)
    table.insert(Npc.nps, { name = name, model = model, pos = pos, actions = actions, loadDst = loadDst, id = uuid() })
end

function Npc.GetActionForEntity(entity)
    local actions = {}
    for k, v in pairs(Npc.entity) do
        if v.entity == entity then
            actions = v.actions
            break
        end
    end
    return actions
end

function Npc.GetNameForEntity(entity)
    local name = "Citoyen"
    for k, v in pairs(Npc.entity) do
        if v.entity == entity then
            name = v.name
            break
        end
    end
    return name
end

---Avec Barre noir 
function Npc.StartNpcDialogue(entity)
    if entity == nil then
        return
    end
    TriggerEvent("ToggleCinematicView")
    local pos = GetOffsetFromEntityInWorldCoords(entity, 0.0, 1.3, 0.6)
    local posLook = GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, 0.5)
    Cam.create("DIALOGUE")
    Cam.setFov("DIALOGUE", 35.0)
    Cam.setPos("DIALOGUE", pos)
    Cam.lookAtCoords("DIALOGUE", posLook)
    Cam.setActive("DIALOGUE", true)
    Cam.render("DIALOGUE", true, true, 500)
    Entity.SetAlpha(Player.ped(), 50)
    Npc.isInDialogue = true
end

function Npc.StopNpcDialogue()
    if Npc.isInDialogue then
        Npc.isInDialogue = true
        Cam.render("DIALOGUE", false, true, 500)
        Wait(501) -- 1 more frame just in case 
        Cam.delete("DIALOGUE")
        Entity.ResetAlpha(Player.ped())
        TriggerEvent("ToggleCinematicView")
    end
end

---- Sans les barres noirs
---- Tout ce que j'ajoute est temporaire on les changeras plus tard si il faut 
function Npc.StartDialogue(entity)
    if entity == nil then
        return
    end
    local pos = GetOffsetFromEntityInWorldCoords(entity, 0.0, 1.3, 0.6)
    local posLook = GetOffsetFromEntityInWorldCoords(entity, 0.0, 0.0, 0.5)
    Cam.create("DIALOGUE")
    Cam.setFov("DIALOGUE", 35.0)
    Cam.setPos("DIALOGUE", pos)
    Cam.lookAtCoords("DIALOGUE", posLook)
    Cam.setActive("DIALOGUE", true)
    Cam.render("DIALOGUE", true, true, 500)
    Entity.SetAlpha(Player.ped(), 50)
    Npc.isInDialogue = true
end

function Npc.StopDialogue()
    if Npc.isInDialogue then
        Npc.isInDialogue = true
        Cam.render("DIALOGUE", false, true, 500)
        Wait(501) -- 1 more frame just in case 
        Cam.delete("DIALOGUE")
        Entity.ResetAlpha(Player.ped())
    end
end



-- Update nearest NPC
Citizen.CreateThread(function()
    while true do
        local pPed = Player.ped()
        local pPos = Player.pos()
        for k, v in pairs(Npc.nps) do
            local dst = GetDistanceBetweenCoords(pPos, v.pos.xyz, true)
            if dst <= v.loadDst then
                if Npc.entity[v.id] == nil then
                    LoadModel(v.model)

                    Npc.entity[v.id] = {}
                    Npc.entity[v.id].name = v.name
                    Npc.entity[v.id].actions = v.actions
                    Npc.entity[v.id].entity = CreatePed(1, v.model, v.pos.xyzw, false, false)
                    FreezeEntityPosition(Npc.entity[v.id].entity, true)
                    TaskSetBlockingOfNonTemporaryEvents(Npc.entity[v.id].entity, true)
                    SetBlockingOfNonTemporaryEvents(Npc.entity[v.id].entity, true)
                end
            else
                if Npc.entity[v.id] ~= nil then

                    DeleteEntity(Npc.entity[v.id].entity)
                    Npc.entity[v.id] = nil
                end
            end
        end
        Wait(1000)
    end
end)
-- "simulation" d'une class car Lua n'a pas vraiment de class, c'est juste pratique de faire ça
Cam = {
    cams = {},

    create = function(name)
        local c = CreateCam("DEFAULT_SCRIPTED_CAMERA", 1)
        Cam.cams[name] = c
    end,

    delete = function(name)
        if Cam.cams[name] ~= nil then
            RenderScriptCams(0, 0, 0, 0, 1)
            SetCamActive(Cam.cams[name], false)
            DestroyCam(Cam.cams[name], false)
            ClearFocus()
            Cam.cams[name] = nil
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    setActive = function(name, bool)
        if Cam.cams[name] ~= nil then
            SetCamActive(Cam.cams[name], bool)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    setPos = function(name, pos)
        if Cam.cams[name] ~= nil then
            SetFocusPosAndVel(pos.xyz, 0.0, 0.0, 0.0)
            SetCamCoord(Cam.cams[name], pos.xyz)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    setFov = function(name, fov)
        if Cam.cams[name] ~= nil then
            SetCamFov(Cam.cams[name], fov)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    lookAtCoords = function(name, pos)
        if Cam.cams[name] ~= nil then
            PointCamAtCoord(Cam.cams[name], pos.xyz)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    attachToEntity = function(name, entity, xOffset, yOffset, zOffset, isRelative)
        if Cam.cams[name] ~= nil then
            AttachCamToEntity(Cam.cams[name], entity, xOffset, yOffset, zOffset, isRelative)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    attachToVehicleBone = function(name, vehicle, boneIndex, relativeRotation, rotX, rotY, rotZ, offX, offY, offZ, fixedDirection)
        if Cam.cams[name] ~= nil then
            AttachCamToVehicleBone(Cam.cams[name], vehicle, boneIndex, relativeRotation, rotX, rotY, rotZ, offX, offY, offZ, fixedDirection)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    render = function(name, render, animation, time)
        if Cam.cams[name] ~= nil then
            if render then
                TriggerEvent("InitCamModulePause", true)
            else
                TriggerEvent("InitCamModulePause", false)
            end
            SetCamActive(Cam.cams[name], true)
            RenderScriptCams(render, animation, time, 1, 1)
        else
            print("^2WARNING: ^7La cam " .. name .. " n'éxiste pas !")
        end
    end,

    switchToCam = function(name, newName, time)
        if Cam.cams[name] ~= nil then
            if Cam.cams[newName] ~= nil then
                SetCamActiveWithInterp(Cam.cams[name], Cam.cams[newName], time, 1, 1)
            end
        end
    end,

    rotation = function(name, rotX, rotY, rotZ)
        if Cam.cams[name] ~= nil then
            SetCamRot(Cam.cams[name], rotX, rotY, rotZ, 2)
        end
    end,

}

ESX = nil
PlayerData = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent(Config.SharedObjectName, function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData() == nil do
        Citizen.Wait(0)
    end
    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(0)
    end
    PlayerData = ESX.GetPlayerData()
    createBlip()
end)

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px, py, pz) - vector3(x, y, z))
    local scale = (1 / dist) * 2
    local fov = (1 / GetGameplayCamFov()) * 100
    local scale = scale * fov
    if onScreen then
        SetTextScale(0.0 * scale, 0.35 * scale)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function createBlip()
    if Config.Shop.blip.enable then
        local coords = Config.Shop.boss_action
        local radius = Config.Shop.blip.radius + 0.00
        local blipRd = AddBlipForRadius(coords, radius)
        SetBlipHighDetail(blipRd, true)
        SetBlipColour(blipRd, Config.Shop.blip.radius_color)
        SetBlipAlpha (blipRd, 128)
        SetBlipAsShortRange(blipRd, true)
        local blip = AddBlipForCoord(coords)
        SetBlipHighDetail(blip, true)
        SetBlipSprite (blip, Config.Shop.blip.sprite)
        SetBlipScale (blip, Config.Shop.blip.size)
        SetBlipColour (blip, Config.Shop.blip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.Shop.blip.name)
        EndTextCommandSetBlipName(blip)
    end
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
end)

RegisterNetEvent('ak47_icebox:openbossaction')
AddEventHandler('ak47_icebox:openbossaction', function()
    TriggerEvent('esx_society:openBossMenu', 'icebox', function(data, menu)
        menu.close()
        inBossMenu = false
    end)
    TriggerEvent('society:openBossMenu', 'icebox', function(data, menu)
        menu.close()
        inBossMenu = false
    end)
end)

RegisterNetEvent('ak47_icebox:notify')
AddEventHandler('ak47_icebox:notify', function(msg)
    ESX.ShowNotification(msg)
end)

RegisterNetEvent('ak47_icebox:progress')
AddEventHandler('ak47_icebox:progress', function(msg, time)
    TriggerEvent('inventory:progress', time, msg)
end)

function playAnimProcess(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(GetPlayerPed(-1), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end

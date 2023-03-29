-- Longo Development -- 
print('Created By Longo Development')

local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@" -- The Anim Dict
local anim = "machinic_loop_mechandplayer" -- The anim

-- Display Text
function DisplayText(message, beep, duration)
    AddTextEntry('LD_ALERT', message)
    BeginTextCommandDisplayHelp('LD_ALERT')
    EndTextCommandDisplayHelp(0, false, beep, duration)
end


Citizen.CreateThread(function()
    local bankCoords = Config.bankCoords
    local playerCoords = GetEntityCoords(PlayerPedId())
    while true do
        Citizen.Wait(2)
        for _, bankCoords in pairs(Config.bankCoords) do
            DrawMarker(2, bankCoords.x, bankCoords.y, bankCoords.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, false, true, 2, true, nil, nil, false)
        end
    end
end)

Citizen.CreateThread(function()
    local vaultCoords = Config.vaultCoords
    local playerCoords = GetEntityCoords(PlayerPedId())
    local insideVault = Config.insideVault
    local backMarker = Config.backMarker
    local insideFleeca = Config.insideFleeca
    local outsideFleeca = Config.outsideFleecaVault
    while true do
        Citizen.Wait(3)
        -- Vault Markers
        for _, vaultCoords in pairs(Config.vaultCoords) do
            DrawMarker(2, vaultCoords.x, vaultCoords.y, vaultCoords.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, false, true, 2, true, nil, nil, false)
        end

        for _, insideVault in pairs(Config.insideVault) do
            DrawMarker(2, insideVault.x, insideVault.y, insideVault.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, false, true, 2, true, nil, nil, false)
        end

        for _, backMarker in pairs(Config.backMarker) do
            DrawMarker(2, backMarker.x, backMarker.y, backMarker.z, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 255, 255, 255, false, true, 2, true, nil, nil, false)

        end
    end
end)

-- Marker Functionality
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(4)

        if Vdist(GetEntityCoords(PlayerPedId()), Config.vaultMarker) <= Config.Distance then
            DisplayText("Press ~INPUT_PICKUP~ to go the vault!", true, -1)
            if IsControlJustReleased(0, 38) then
            SetEntityCoords(PlayerPedId(), Config.inside.x, Config.inside.y, Config.inside.z)
            end
        end
        if Vdist(GetEntityCoords(PlayerPedId()), Config.workBack) <= Config.Distance then
            DisplayText("Press ~INPUT_PICKUP~ to teleport out of vault!", true)
            if IsControlJustReleased(0, 38) then
            SetEntityCoords(PlayerPedId(), Config.vaultMarker.x, Config.vaultMarker.y, Config.vaultMarker.z)
            end
         end
        if Vdist(GetEntityCoords(PlayerPedId()), Config.FleecaBank) <= Config.Distance then
            DisplayText("Press ~INPUT_PICKUP~ to rob the bank!", true)
            if IsControlJustReleased(0, 38) then
                TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, 8.0, -1, 0, -1, true, true, true)
                TriggerServerEvent('ld:fleeca')
                Wait(28000) -- Wait 28 Seconds
            end
        end
        if Vdist(GetEntityCoords(PlayerPedId()), Config.PaletoBank) <= Config.Distance then
            DisplayText("Press ~INPUT_PICKUP~ to rob the bank!", true)
            if IsControlJustReleased(0, 38) then
                TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, 8.0, -1, 0, -1, true, true, true)
                TriggerServerEvent('ld:paleto')
                Wait(28000) -- Wait 28 seconds
            end
        end
        if Vdist(GetEntityCoords(PlayerPedId()), Config.insideRobbing) <= Config.Distance then
            DisplayText("Press ~INPUT_PICKUP~ to rob the vault!", true)
            if IsControlJustReleased(0, 38) then
                TaskPlayAnim(PlayerPedId(), animDict, anim, 8.0, 8.0, -1, 0, -1, true, true, true)
                TriggerServerEvent('ld:insidevault')
                Wait(28000) -- Wait 28 seconds
            end
        end
    end
end)

-- Loading Anim
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if not HasAnimDictLoaded(animDict) then
            RequestAnimDict(animDict)
            while not HasAnimDictLoaded(animDict) do
                Wait(1000)
            end
        end
    end
end)
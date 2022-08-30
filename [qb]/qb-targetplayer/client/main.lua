local QBCore = exports['qb-core']:GetCoreObject()

RegisterCommand("stealshoes", function()
    TriggerEvent('tnj-stealshoes:client:TheftShoe')
end)

RegisterNetEvent('tnj-stealshoes:client:TheftShoe', function() -- This could be used in the radialmenu ;)
    local ped = PlayerPedId()
    if not IsPedRagdoll(ped) then
        local player, distance = QBCore.Functions.GetClosestPlayer()
        if player ~= -1 and distance < 1.5 then
            local playerId = GetPlayerServerId(player)
            if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(ped) then
                local oped = GetPlayerPed(player)
                local hasShoes = GetPedDrawableVariation(oped, 6)
                if hasShoes ~= 34 then
                    while not HasAnimDictLoaded("random@domestic") do
                        RequestAnimDict("random@domestic")
                        Wait(1)
                    end
                    TaskPlayAnim(ped, "random@domestic", "pickup_low", 8.00, -8.00, 500, 0, 0.00, 0, 0, 0)
                    TriggerServerEvent("tnj-stealshoes:server:TheftShoe", playerId)
                    SetPedComponentVariation(oped, 6, 34, 0, 2)
                else
                    QBCore.Functions.Notify("No shoes to been stolen!", "error")
                end
            else
                QBCore.Functions.Notify('You can\'t steal shoes in vehicle', "error")
            end
        else
            QBCore.Functions.Notify('No one nearby!', "error")
        end
    end
end)

RegisterNetEvent('tnj-stealshoes:client:StoleShoe', function(playerId)
    local ped = PlayerPedId()
    local hasShoes = GetPedDrawableVariation(ped, 6)
    if hasShoes ~= 34 then
        SetPedComponentVariation(ped, 6, 34, 0, 2)
        QBCore.Functions.Notify("Shoes got robbed lmao", 'primary')
        TriggerServerEvent("tnj-stealshoes:server:Complete", playerId)
    else
        QBCore.Functions.Notify("Someone tried to steal yo feet", 'primary')
    end
end)

if Config.QBTarget then
    exports['qb-target']:AddGlobalPlayer {
        options = {
            {
                type = "client",
                event = "police:client:RobPlayer",
                icon = "fas fa-mask",
                label = "Råna",
            },
            {
                type = "client",
                event = "police:client:EscortPlayer",
                icon = "fas fa-user-friends",
                label = "Eskortera",
            },
            {
                type = "client",
                event = "police:client:KidnapPlayer",
                icon = "fas fa-child",
                label = "Kidnappa",
            },
            {
                type = "client",
                event = "police:client:SearchPlayer",
                icon = "fas fa-search",
                label = "Sök",
                job = "police",
            },
            {
                type = "client",
                event = "police:client:JailPlayer",
                icon = "fas fa-user-lock",
                label = "Fängelse Meny",
                job = "police",
            },
            {
                type = "client",
                event = "hospital:client:RevivePlayer",
                icon = "fas fa-user-md",
                label = "Återuppliva",
                job = "ambulance",
            },
            {
                type = "client",
                event = "hospital:client:TreatWounds",
                icon = "fas fa-band-aid",
                label = "Läk Sår",
                job = "ambulance",
            },
        },
        distance = 2.5,
    }
end

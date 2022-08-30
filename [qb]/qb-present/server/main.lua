local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("openpresent")
AddEventHandler("openpresent", function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem('water_bottle', 2)
    Player.Functions.AddItem('sandwich', 2)
    Player.Functions.AddItem('fishingrod', 2)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['water_bottle'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['sandwich'] , "add")
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['fishingrod'] , "add")
    TriggerClientEvent('QBCore:Notify', src, "Present Öppnat, kolla ditt inventory", "primary", 3500)
end)

QBCore.Functions.CreateUseableItem('present', function(source, item)
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerEvent("openpresent", src, item.name)
    end
end)



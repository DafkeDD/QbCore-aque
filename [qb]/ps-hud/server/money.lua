local QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Commands.Add("cash", "Provjeri stanju u novćaniku", {}, false, function(source, args)
	TriggerClientEvent('hud:client:ShowMoney', source, "cash")
end)

QBCore.Commands.Add("bank", "Provjeri stanje na banci", {}, false, function(source, args)
	TriggerClientEvent('hud:client:ShowMoney', source, "bank")
end)
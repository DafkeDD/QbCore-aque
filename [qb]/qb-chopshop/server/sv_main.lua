if Config.Version == "new" then
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterNetEvent("qb-chopshop:syncchopcars")
AddEventHandler("qb-chopshop:syncchopcars", SyncCars)

function GiveReward(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if data == "wheel1" or data == "wheel2" or data == "wheel3" or data == "wheel4" then
    		Player.Functions.AddItem("carpart_wheel", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_wheel'], "add")

	elseif data == "door" then
    	Player.Functions.AddItem("carpart_door", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_door'], "add")
		
	elseif data == "hood" then
    	Player.Functions.AddItem("carpart_hood", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_hood'], "add")

	elseif data == "trunk" then 
		local randomitem = math.random(1, 3)
		local item = Config.TrunkItems[randomitem]["item"]
		local amount = Config.TrunkItems[randomitem]["amount"]
		Player.Functions.AddItem(item, amount, false, info)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
		TriggerClientEvent('QBCore:Notify', src, "You found "..amount.." "..item.." in the trunk", 'success')
		Citizen.Wait(8500)
		Player.Functions.AddItem("carpart_trunk", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_trunk'], "add")
	end
end

RegisterServerEvent('qb-chopshop:server:callCops')
AddEventHandler('qb-chopshop:server:callCops', function(type, bank, streetLabel, coords)
    local msg = ""
    msg = "Possible Vehicle Robbery"
    local alertData = {
        title = "Chopshop",
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = msg,
    }
    TriggerClientEvent("qb-chopshop:client:robberyCall", -1, type, bank, streetLabel, coords)
    TriggerClientEvent("qb-phone:client:addPoliceAlert", -1, alertData)
end)

RegisterNetEvent("qb-chopshop:server:rewardplayer")
AddEventHandler("qb-chopshop:server:rewardplayer", GiveReward)

function SyncCars(list) 
	TriggerClientEvent('qb-chopshop:carlist', -1,list) 
end

RegisterNetEvent("qb-chopshop:server:chopdoor")
AddEventHandler("qb-chopshop:server:chopdoor", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local door = "carpart_door"
	
	if Player.Functions.GetItemByName(door) ~= nil then
		local randomitem = math.random(1, 5)
		local item = Config.DoorItems[randomitem]["item"]
		local amount = Config.DoorItems[randomitem]["amount"]
		Player.Functions.RemoveItem("carpart_door", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_door'], "remove")
		TriggerClientEvent('qb-chopshop:doorchopanim', src)
		Citizen.Wait(12500)
		Player.Functions.AddItem(item, amount, false, info)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'Du har inga dörrar att skrota..', 'error')
	end
end)

RegisterNetEvent("qb-chopshop:server:chopwheel")
AddEventHandler("qb-chopshop:server:chopwheel", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local wheel = "carpart_wheel"

	if Player.Functions.GetItemByName(wheel) ~= nil then
		local randomitem = math.random(1, 3)
		local item = Config.WheelItems[randomitem]["item"]
		local amount = Config.WheelItems[randomitem]["amount"]
		Player.Functions.RemoveItem("carpart_wheel", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_wheel'], "remove")
		TriggerClientEvent('qb-chopshop:wheelchopanim', src)
		Citizen.Wait(14000)
		Player.Functions.AddItem(item, amount, false, info)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'Du har inga hjul att skrota..', 'error')
	end
end)


RegisterNetEvent("qb-chopshop:server:chophood")
AddEventHandler("qb-chopshop:server:chophood", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local hood = "carpart_hood" 

	if Player.Functions.GetItemByName(hood) ~= nil then
		local randomitem = math.random(1, 5)
		local item = Config.DoorItems[randomitem]["item"]
		local amount = Config.DoorItems[randomitem]["amount"]
		Player.Functions.RemoveItem("carpart_hood", 1)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_hood'], "remove")
		TriggerClientEvent('qb-chopshop:hoodchopanim', src)
		Citizen.Wait(12500)
		Player.Functions.AddItem(item, amount, false, info)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'Du har inga huvor att skrota..', 'error')
	end
end)


RegisterNetEvent("qb-chopshop:server:choptrunk")
AddEventHandler("qb-chopshop:server:choptrunk", function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	local trunk = "carpart_trunk"

	if Player.Functions.GetItemByName(trunk) ~= nil then
		local randomitem = math.random(1, 5)
		local item = Config.DoorItems[randomitem]["item"]
		local amount = Config.DoorItems[randomitem]["amount"]
		Player.Functions.RemoveItem("carpart_trunk", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['carpart_trunk'], "remove")
		TriggerClientEvent('qb-chopshop:trunkchopanim', src)
		Citizen.Wait(12500)
		Player.Functions.AddItem(item, amount, false, info)
		TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add")
	else
		TriggerClientEvent('QBCore:Notify', src, 'Du har inga koffertar att skrota..', 'error')
	end
end)


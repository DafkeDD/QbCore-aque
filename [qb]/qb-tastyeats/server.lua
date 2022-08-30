local QBCore = exports["qb-core"]:GetCoreObject()
TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

QBCore.Functions.CreateCallback('qb-tastyeats:getexperience', function(source, cb, xPlayer)
    local PlayerData = QBCore.Functions.GetPlayer(source)

    local result = exports.ghmattimysql:executeSync('SELECT * FROM inside_jobs WHERE identifier=@identifier AND job=@job', {['@identifier'] = PlayerData.PlayerData.citizenid, ['@job'] = 'tastyeats'})
    if result[1] ~= nil then
        cb(tonumber(result[1].experience)) 
    else
        exports.ghmattimysql:execute('INSERT INTO inside_jobs (identifier, experience, job) VALUES (@identifier, @experience, @job)', {
            ['@identifier'] = PlayerData.PlayerData.citizenid,
            ['@experience'] = 0,
            ['@job'] = 'tastyeats'
        })
    end
end)

QBCore.Functions.CreateCallback('qb-tastyeats:checkMoney', function(source, cb)
	local xPlayer = QBCore.Functions.GetPlayer(source)

	if xPlayer.PlayerData.money.cash >= icfg.DepositForVehiclePrice then
        xPlayer.Functions.RemoveMoney('cash', icfg.DepositForVehiclePrice)
		cb(true)
    elseif xPlayer.PlayerData.money.bank >= icfg.DepositForVehiclePrice then
        xPlayer.Functions.RemoveMoney('bank', icfg.DepositForVehiclePrice)
        cb(true)
	else
		cb(false)
	end
end)

RegisterServerEvent('qb-tastyeats:returnVehicle')
AddEventHandler('qb-tastyeats:returnVehicle', function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	
	xPlayer.Functions.AddMoney("bank", icfg.DepositForVehiclePrice)
end)

QBCore.Functions.CreateCallback('qb-tastyeats:Payout', function(source, cb, xPlayer, level)
	local xPlayer = QBCore.Functions.GetPlayer(source)
    local money = nil
    
    local result = exports.ghmattimysql:executeSync('SELECT * FROM inside_jobs WHERE identifier=@identifier AND job=@job', {['@identifier'] = xPlayer.PlayerData.citizenid, ['@job'] = 'tastyeats'})
    if result[1] ~= nil then
        if result[1].experience >= icfg.Levels.Level5.MinPoints then
            money = math.random(icfg.Levels.Level5.PayoutMin, icfg.Levels.Level5.PayoutMax)
        elseif result[1].experience >= icfg.Levels.Level4.MinPoints and result[1].experience <= icfg.Levels.Level4.MaxPoints then
            money = math.random(icfg.Levels.Level4.PayoutMin, icfg.Levels.Level4.PayoutMax)
        elseif result[1].experience >= icfg.Levels.Level3.MinPoints and result[1].experience <= icfg.Levels.Level3.MaxPoints then
            money = math.random(icfg.Levels.Level3.PayoutMin, icfg.Levels.Level3.PayoutMax)
        elseif result[1].experience >= icfg.Levels.Level2.MinPoints and result[1].experience <= icfg.Levels.Level2.MaxPoints then
            money = math.random(icfg.Levels.Level2.PayoutMin, icfg.Levels.Level2.PayoutMax)
        elseif result[1].experience >= icfg.Levels.Level1.MinPoints and result[1].experience <= icfg.Levels.Level1.MaxPoints then
            money = math.random(icfg.Levels.Level1.PayoutMin, icfg.Levels.Level1.PayoutMax)
        end
        xPlayer.Functions.AddMoney("cash", money)
        cb(money) 
        playerexp = result[1].experience + 1  
        exports.ghmattimysql:execute('UPDATE inside_jobs SET experience=@playerexp WHERE identifier=@identifier AND job=@job', {
            ['@identifier'] = xPlayer.PlayerData.citizenid,
            ['@playerexp'] = playerexp, 
            ['@job'] = 'tastyeats',
        })
    end
end)

RegisterServerEvent('qb-tastyeats:SynchroHookiesFood')
AddEventHandler('qb-tastyeats:SynchroHookiesFood', function()
    TriggerClientEvent('qb-tastyeats:GetHookiesFood', -1)
end)

RegisterServerEvent('qb-tastyeats:SynchroTacoBombFood')
AddEventHandler('qb-tastyeats:SynchroTacoBombFood', function()
    TriggerClientEvent('qb-tastyeats:GetTacoBombFood', -1)
end)

RegisterServerEvent('qb-tastyeats:SynchroCluckinBellFood')
AddEventHandler('qb-tastyeats:SynchroCluckinBellFood', function()
    TriggerClientEvent('qb-tastyeats:GetCluckinBellFood', -1)
end)

RegisterServerEvent('qb-tastyeats:SynchroPizzaThisFood')
AddEventHandler('qb-tastyeats:SynchroPizzaThisFood', function()
    TriggerClientEvent('qb-tastyeats:GetPizzaThisFood', -1)
end)

RegisterServerEvent('qb-tastyeats:SynchroBurgerShotFood')
AddEventHandler('qb-tastyeats:SynchroBurgerShotFood', function()
    TriggerClientEvent('qb-tastyeats:GetBurgerShotFood', -1)
end)
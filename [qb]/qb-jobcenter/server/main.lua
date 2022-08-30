QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("qb-jobcenter:server:setjob")
AddEventHandler("qb-jobcenter:server:setjob", function(jobindex, jobcenteridx)
    local Player = QBCore.Functions.GetPlayer(source)

    if Config.Locations[jobcenteridx] and Config.Locations[jobcenteridx].jobs[jobindex+1] then
        Player.Functions.SetJob(Config.Locations[jobcenteridx].jobs[jobindex+1].name, 0)
        TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "Du ändrade jobbet till " .. Config.Locations[jobcenteridx].jobs[jobindex+1].label)
    end
end)
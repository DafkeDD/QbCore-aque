local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
			for k, v in pairs(Config.JobRoles) do if v == PlayerJob.name then havejob = true end end
			if havejob then TriggerServerEvent("QBCore:ToggleDuty") end end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate') AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty') AddEventHandler('QBCore:Client:SetDuty', function(duty) onDuty = duty end)

AddEventHandler('onResourceStart', function(resource)
    if GetCurrentResourceName() == resource then
		QBCore.Functions.GetPlayerData(function(PlayerData)
			PlayerJob = PlayerData.job
			for k, v in pairs(Config.JobRoles) do if v == PlayerJob.name then havejob = true end end
			if havejob then onDuty = PlayerJob.onduty end end) 
	end
	Wait(500)
end)

Config.Locations = {
	{	label = "mechanic", -- Set this to the required job
		zones = {
		  vector2(-552.84, -943.08),
		  vector2(-547.15, -906.97),
		  vector2(-614.88, -906.5),
		  vector2(-615.43, -945.4)
		},
		blip = vector3(-600.55, -930.1, 23.87),
		bliplabel = "Redline",    -- Gabz LS Tuner Shop
	},
    -- Add a new job like this with location
	-- Check out https://github.com/mkafrin/PolyZone/wiki/Using-the-creation-script for information on how to make polyzones, its really easy
	-- When you have the vectors, copy them into a new zone below and it should work!
	-- The name is the players Job Role eg. "mechanic", if you set Config.JobRequiredForLocation to false, this can be whatever.
    --{	label = "mechanic",
	--	zones = {
	--		vector2(-308.60556030273, -983.15423583984),
	--		vector2(-294.68597412109, -988.24194335938),
	--		vector2(-297.03381347656, -994.37298583984),
	--		vector2(-346.31329345703, -976.38232421875),
	--		vector2(-343.78552246094, -970.34112548828)
	--	}
	--},
	--		
	--SIMPLE BLIP SETUP
	--If blip info is there it will generate a blip
	--If blip label is added (can be removed) it will add the chosen blip name otherwise it will default to "Mechanic Shop"
	--Blip colours can be found here: https://docs.fivem.net/docs/game-references/blips/
	--		blip = vector3(530.48, -1336.1, 29.27),
	--		bliplabel = "Bennys",
	--		blipcolor = 8,
    --},
}
CreateThread(function()
	if Config.LocationRequired then
		for k, v in pairs(Config.Locations) do
			JobLocation = PolyZone:Create(Config.Locations[k].zones, {
				name = Config.Locations[k].label,
				debugPoly = Config.Debug
			})
			JobLocation:onPlayerInOut(function(isPointInside)
				if isPointInside then
					if Config.JobRequiredForLocation then 
						if PlayerJob.name == tostring(Config.Locations[k].label) then
							if onDuty ~= true then TriggerServerEvent("QBCore:ToggleDuty") end
						end
					elseif not Config.JobRequiredForLocation then 
						injob = true
						for k, v in pairs(Config.JobRoles) do
							if v == PlayerJob.name  and onDuty ~= true then TriggerServerEvent("QBCore:ToggleDuty") end
						end
					end
				else
					if Config.JobRequiredForLocation then
						if PlayerJob.name == tostring(Config.Locations[k].label) then
							if onDuty ~= false then TriggerServerEvent("QBCore:ToggleDuty") end
						end
					elseif not Config.JobRequiredForLocation then 
						injob = false
						for k, v in pairs(Config.JobRoles) do
							if v == PlayerJob.name and onDuty ~= false then TriggerServerEvent("QBCore:ToggleDuty") end
						end
					end
				end
			end)		
		end
	end
end)

CreateThread(function()
	if Config.LocationBlips then
		for k, v in pairs(Config.Locations) do
			if Config.Locations[k].blip ~= nil then
				local blip = AddBlipForCoord(Config.Locations[k].blip)
				SetBlipAsShortRange(blip, true)
				SetBlipSprite(blip, 446)
				SetBlipColour(blip, Config.Locations[k].blipcolor)
				SetBlipScale(blip, 0.7)
				SetBlipDisplay(blip, 6)
				BeginTextCommandSetBlipName('STRING')
				if Config.Locations[k].bliplabel ~= nil then AddTextComponentString(Config.Locations[k].bliplabel)
				else AddTextComponentString("Mechanic Shop") end
				EndTextCommandSetBlipName(blip)
			end
		end
	end
end)
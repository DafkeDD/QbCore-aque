QBCore = nil
PlayerData = {}

Citizen.CreateThread(function()
	while QBCore == nil do
		QBCore = exports['qb-core']:GetCoreObject()
		Citizen.Wait(0)
    end
	while QBCore.Functions.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent("QBCore:Client:OnPlayerLoaded")
AddEventHandler("QBCore:Client:OnPlayerLoaded", function()
	PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(job)
	PlayerData.job = job
end)

function MyInvoices()
	QBCore.Functions.TriggerCallback("qb-faktura:GetInvoices", function(invoices)
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'myinvoices',
			invoices = invoices,
			VAT = Config.VATPercentage
		})			
	end)
end

function SocietyInvoices(society)
	QBCore.Functions.TriggerCallback("qb-faktura:GetSocietyInvoices", function(cb, totalInvoices, totalIncome, totalUnpaid, awaitedIncome)
		if json.encode(cb) ~= '[]' then
			SetNuiFocus(true, true)
			SendNUIMessage({
				action = 'societyinvoices',
				invoices = cb,
				totalInvoices = totalInvoices,
				totalIncome = totalIncome,
				totalUnpaid = totalUnpaid,
				awaitedIncome = awaitedIncome,
				VAT = Config.VATPercentage
			})		
		else
			TriggerEvent("QBCore:Notify", "Ditt företag har inga fakturor.", "error")
			SetNuiFocus(false, false)
		end
	end, society)
end

function CreateInvoice(society)
	SetNuiFocus(true, true)
	SendNUIMessage({
		action = 'createinvoice',
		society = society
	})
end

RegisterCommand(Config.InvoicesCommand, function()
	local isAllowed = false
	local jobName = ""
	for k, v in pairs(Config.AllowedSocieties) do
		if v == PlayerData.job.name then
			jobName = v
			isAllowed = true
		end
	end

	if Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss == true and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	elseif Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss ~= true and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = false,
			create = true
		})
	elseif not Config.OnlyBossCanAccessSocietyInvoices and isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = true,
			create = true
		})
	elseif not isAllowed then
		SetNuiFocus(true, true)
		SendNUIMessage({
			action = 'mainmenu',
			society = false,
			create = false
		})
	end
end, false)

RegisterNUICallback("action", function(data, cb)
	if data.action == "close" then
		SetNuiFocus(false, false)
	elseif data.action == "payInvoice" then
		TriggerServerEvent("qb-faktura:PayInvoice", data.invoice_id)
		SetNuiFocus(false, false)
	elseif data.action == "cancelInvoice" then
		TriggerServerEvent("qb-faktura:CancelInvoice", data.invoice_id)
		SetNuiFocus(false, false)
	elseif data.action == "createInvoice" then
		local closestPlayer, playerDistance = QBCore.Functions.GetClosestPlayer()
		target = GetPlayerServerId(closestPlayer)
		data.target = target
		data.society = PlayerData.job.name
		data.society_name = PlayerData.job.label

		if closestPlayer == -1 or playerDistance > 3.0 then
			TriggerEvent("QBCore:Notify", "Det gick inte att skicka fakturan! Det finns ingen nära dig.", "error")
		else
			TriggerServerEvent("qb-faktura:CreateInvoice", data)
			TriggerEvent("QBCore:Notify", "Faktura skickad!", "error")
		end
		
		SetNuiFocus(false, false)
	elseif data.action == "missingInfo" then
		TriggerEvent("QBCore:Notify", "Fyll i alla fält innan du skickar en faktura!", "error")
	elseif data.action == "negativeAmount" then
		TriggerEvent("QBCore:Notify", "Du måste ange ett positivt belopp!", "error")
	elseif data.action == "mainMenuOpenMyInvoices" then
		MyInvoices()
	elseif data.action == "mainMenuOpenSocietyInvoices" then
		for k, v in pairs(Config.AllowedSocieties) do
			if v == PlayerData.job.name then
				if Config.OnlyBossCanAccessSocietyInvoices and PlayerData.job.isboss == true then
					SocietyInvoices(PlayerData.job.label)
				elseif not Config.OnlyBossCanAccessSocietyInvoices then
					SocietyInvoices(PlayerData.job.label)
				elseif Config.OnlyBossCanAccessSocietyInvoices then
					TriggerEvent("QBCore:Notify", "Bara chefen kan komma åt samhällets fakturor.", "error")
				end
			end
		end
	elseif data.action == "mainMenuOpenCreateInvoice" then
		for k, v in pairs(Config.AllowedSocieties) do
			if v == PlayerData.job.name then
				CreateInvoice(PlayerData.job.label)
			end
		end
	end
end)
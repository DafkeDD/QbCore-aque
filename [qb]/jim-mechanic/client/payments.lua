local QBCore = exports['qb-core']:GetCoreObject()

Config.RegisterLocations = {
	--Add your box locations and job name for each payment register and it will add it to the qb-target loop above
	{ coords = vector3(-589.6, -930.46, 23.62), w = 0.4, d = 0.4, heading = 340.0, job = "tuner", img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png width=150px></p>" }, -- Bennys Workshop next to PDM
	{ coords = vector3(547.2, -181.99, 54.49), w = 0.4, d = 0.4, heading = 195.0, job = "mechanic", img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" }, -- LS Tuner Shop
	{ coords = vector3(174.49, -1322.78, 29.36), w = 0.4, d = 0.4, heading = 195.0, job = "pawn", img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/f/f2/GTAV-LSCustoms-Logo.png width=150px></p>" }, -- LS Tuner Shop
}

local till = {}
Citizen.CreateThread(function()
	for k, v in pairs(Config.RegisterLocations) do
		exports['qb-target']:AddBoxZone("MechReceipt: "..k, v.coords, v.w, v.d, { name="MechReceipt: "..k, heading = v.heading, debugPoly=Config.Debug, minZ=v.coords.z-0.1, maxZ=v.coords.z+0.4 }, 
			{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan]["payments"].charge, job = v.job, img = v.img }, },
			  distance = 2.0
		})
		RequestModel(GetHashKey("prop_till_03")) while not HasModelLoaded(GetHashKey("prop_till_03")) do Citizen.Wait(1) end
		till[#till+1] = CreateObject(GetHashKey("prop_till_03"), v.coords.x, v.coords.y, v.coords.z,false,false,false)
		SetEntityHeading(till[#till],v.heading+0.0)
		FreezeEntityPosition(till[#till], true)
	end
end)

AddEventHandler('onResourceStop', function(r) if r == GetCurrentResourceName() then for k, v in pairs(Config.RegisterLocations) do exports['qb-target']:RemoveZone("MechReceipt: "..k) 
for i = 1, #till do DeleteEntity(till[#till]) end end end end)

RegisterNetEvent("jim-mechanic:client:PayPopup", function(amount, biller, billtype)
	exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "🧾 "..PlayerJob.label.." Betalning 🧾", txt = "Do you want accept the payment?" },
		{ isMenuHeader = true, header = "", txt = billtype:gsub("^%l", string.upper).." Betalning:"..amount },
		{ header = "✅ Ja", txt = "", params = { isServer = true, event = "jim-payments:server:PayPopup", args = { accept = true, amount = amount, biller = biller, billtype = billtype } } },
		{ header = "❌ Nej", txt = "", params = { isServer = true, event = "jim-payments:server:PayPopup", args = { accept = false, amount = amount, biller = biller, billtype = billtype } } }, })
end)
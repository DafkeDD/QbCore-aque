
local QBCore = exports['qb-core']:GetCoreObject()

function BoatMenuLaPuerta()
    exports['qb-menu']:openMenu({
        {
            header = "La Puerta Båt Uthyrning",
            isMenuHeader = true
        },
        {
            header = "Båt: "..Config.RentalBoat,
            txt = "Pris: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 1
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function BoatMenuPaletoCove()
    exports['qb-menu']:openMenu({
        {
            header = "Paleto Cove Båt Uthyrning",
            isMenuHeader = true
        },
        {
            header = "Båt: "..Config.RentalBoat,
            txt = "Pris: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 2
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function BoatMenuElGordo()
    exports['qb-menu']:openMenu({
        {
            header = "El Gordo Båt Uthyrning",
            isMenuHeader = true
        },
        {
            header = "Båt: "..Config.RentalBoat,
            txt = "Pris: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 3
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 


function BoatMenuActDam()
    exports['qb-menu']:openMenu({
        {
            header = "Act Dam Båt Uthyrning",
            isMenuHeader = true
        },
        {
            header = "Båt: "..Config.RentalBoat,
            txt = "Pris: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 4
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function BoatMenuAlamoSea()
    exports['qb-menu']:openMenu({
        {
            header = "Alamo Sea Båt Uthyrning",
            isMenuHeader = true
        },
        {
            header = "Båt: "..Config.RentalBoat,
            txt = "Pris: $"..Config.BoatPrice,
            params = {
                event = "doj:client:rentaBoat",
				args = 5
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 
--============================================================== ReturnMenus

function ReturnBoatLaPuerta()
    exports['qb-menu']:openMenu({
		{
            header = "Fiske Båt Uthyrning",
            isMenuHeader = true
        },
		{
            header = "Lämna tillbaks båten",
            txt = "Lämna tillbaks och få $"..math.floor(Config.BoatPrice/2),
            params = {
                event = "doj:client:ReturnBoat",
				args = 1
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function ReturnBoatPaletoCove()
    exports['qb-menu']:openMenu({
		{
            header = "Fiske Båt Uthyrning",
            isMenuHeader = true
        },
		{
            header = "Lämna tillbaks båten",
            txt = "Lämna tillbaks och få $"..math.floor(Config.BoatPrice/2),
            params = {
                event = "doj:client:ReturnBoat",
				args = 2
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function ReturnBoatElGordo()
    exports['qb-menu']:openMenu({
		{
            header = "Fiske Båt Uthyrning",
            isMenuHeader = true
        },
		{
            header = "Lämna tillbaks båten",
            txt = "Lämna tillbaks och få $"..math.floor(Config.BoatPrice/2),
            params = {
                event = "doj:client:ReturnBoat",
				args = 3
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function ReturnBoatActDam()
    exports['qb-menu']:openMenu({
		{
            header = "Fiske Båt Uthyrning",
            isMenuHeader = true
        },
		{
            header = "Lämna tillbaks båten",
            txt = "Lämna tillbaks och få $"..math.floor(Config.BoatPrice/2),
            params = {
                event = "doj:client:ReturnBoat",
				args = 4
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end 

function ReturnBoatAlamoSea()
    exports['qb-menu']:openMenu({
		{
            header = "Fiske Båt Uthyrning",
            isMenuHeader = true
        },
		{
            header = "Lämna tillbaks båten",
            txt = "Lämna tillbaks och få $"..math.floor(Config.BoatPrice/2),
            params = {
                event = "doj:client:ReturnBoat",
				args = 5
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end

--============================================================== Sell/Gear Menus

RegisterNetEvent('doj:client:SellLegalFish')
AddEventHandler('doj:client:SellLegalFish', function()
    exports['qb-menu']:openMenu({
		{
            header = "Pearl's Seafood Restaurant",
            isMenuHeader = true
        },
        {
            header = "Sälj Makrill",
            txt = "Nuvarande pris: $"..Config.mackerelPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 1
            }
        },
        {
            header = "Sälj Codfish",
            txt = "Nuvarande pris: $"..Config.codfishPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 2
            }
        },
		{
            header = "Sälj Bass",
            txt = "Nuvarande pris: $"..Config.bassPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 3 
            }
        },
        {
            header = "Sälj Flounder",
            txt = "Nuvarande pris: $"..Config.flounderPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 4
            }
        },
		{
            header = "Sälj Stingray",
            txt = "Nuvarande pris: $"..Config.stingrayPrice.." each",
            params = {
				isServer = true,
                event = "fishing:server:SellLegalFish",
				args = 5
            }
        },		
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:buyFishingGear')
AddEventHandler('doj:client:buyFishingGear', function() 
    exports['qb-menu']:openMenu({
		{
            header = "Köp fiskeredskap",
            isMenuHeader = true
        },
        {
            header = "Köp Fiskbete",
            txt = "SEK"..Config.fishingBaitPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 1
            }
        },
		{
            header = "Köp Fiskespö",
            txt = "SEK"..Config.fishingRodPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 2
            }
        },
        {
            header = "Köp Båt Ankare",
            txt = "SEK"..Config.BoatAnchorPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 3
            }
        },
        {
            header = "Köpa Fiske Box",
            txt = "SEK"..Config.FishingBoxPrice,
            params = {
				isServer = true,
                event = "fishing:server:BuyFishingGear",
				args = 4
            }
        },
        {
            header = "Stäng",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:SellillegalFish')
AddEventHandler('doj:client:SellillegalFish', function() 
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			local charinfo = QBCore.Functions.GetPlayerData().charinfo
			QBCore.Functions.Notify('Welcome, '..charinfo.firstname..' '..charinfo.lastname)
			exports['qb-menu']:openMenu({
				{
					header = "Pearl's Seafood Restaurant",
					isMenuHeader = true
				},
				{
					header = "Sell Dolphin",
					txt = "Nuvarande pris: $"..Config.dolphinPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 1
					}
				},
				{
					header = "Sell Tiger Shark",
					txt = "Nuvarande pris: $"..Config.sharktigerPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 2
					}
				},
				{
					header = "Sell Hammerhead Shark",
					txt = "Nuvarande pris: $"..Config.sharkhammerPrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 3
					}
				},
				{
					header = "Sell Orca",
					txt = "Nuvarande pris: $"..Config.killerwhalePrice.." each",
					params = {
						isServer = true,
						event = "fishing:server:SellillegalFish",
						args = 4
					}
				},
				{
					header = "Stäng",
					txt = "",
					params = {
						event = "qb-menu:closeMenu"
					}
				},
			})
		else
			QBCore.Functions.Notify('Du kan inte sälja till oss för tillfället, ber om ursäkt för besväret', 'error', 3500)
		end
	end, "pearlscard")
end)

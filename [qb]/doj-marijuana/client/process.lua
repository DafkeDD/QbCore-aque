
local QBCore = exports['qb-core']:GetCoreObject()

-- grand senora desert
exports['qb-target']:AddTargetModel(`a_m_m_farmer_01`, {
    options = {
        {
            event = "doj:client:attemptTrimmer",
            icon = "fas fa-cut", 
            label = "Prata med Trimmer",
        },
    },
    distance = 2.5
})

RegisterNetEvent('doj:client:attemptTrimmer', function()
    -- local ped = PlayerPedId()
    -- QBCore.Functions.Progressbar("knocking", "Knocking..", (math.random(3700, 5000)), false, true, {
	-- 	disableMovement = true,
	-- 	disableCarMovement = true,
	-- 	disableMouse = false,
	-- 	disableCombat = true,
	-- }, {
	-- 	animDict = "timetable@jimmy@doorknock@",
	-- 	anim = "knockdoor_idle",
	-- 	flags = 16,
	-- }, {}, {}, function() -- Done
    --     ClearPedTasks(ped)
    --     if GetClockHours() >= 6 and GetClockHours() <= 21 then
    --         local chance = math.random(100)
    --         if chance <= 50 then
    --             TriggerEvent("doj:client:mainProcessMenu")
    --             QBCore.Functions.Notify('Yo whats up', 'success')
    --         else
    --             QBCore.Functions.Notify('No Response... maby try again', 'primary')
    --         end
    --     else
    --         QBCore.Functions.Notify('Go Away!! Its Too Late!', 'error')
    --     end
        
	-- end, function()
    --     ClearPedTasks(ped)
	-- end)
    TriggerEvent("doj:client:mainProcessMenu")
end)

RegisterNetEvent('doj:client:stopBaggieMenu', function()
    ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('doj:client:baggieMenu', function()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
    exports['qb-menu']:openMenu({
        {
            header = "Kombinera marijuana",
            txt = "Krävs: 1 oz marijuana",
            isMenuHeader = true
        },
        {
            header = "3,5 g låggradig",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuanaBaggies",
                isServer = true,
                args = 1
            }
        },
        {
            header = "3,5 g mellanklass",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuanaBaggies",
                isServer = true,
                args = 2

            }
        },
        {
            header = "3,5 g av hög kvalitet",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuanaBaggies",
                isServer = true,
                args = 3
            }
        },
        {
            header = "Stäng",
            params = {
                event = "doj:client:stopBaggieMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:CombineMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Kombinera marijuana",
            txt = "Krävs: 1 oz marijuana",
            isMenuHeader = true
        },
        {
            header = "3,5 g låggradig",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuana",
                isServer = true,
                args = 1
            }
        },
        {
            header = "3,5 g mellanklass",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuana",
                isServer = true,
                args = 2

            }
        },
        {
            header = "3,5 g av hög kvalitet",
            txt = "",
            params = {
                event = "doj:server:process3.5gMarijuana",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Gå Tillbaka",
            params = {
                event = "doj:client:mainProcessMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:TrimMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Trim & Packa Marijuana",
            txt = "Krävs: 3 skördade grödor",
            isMenuHeader = true
        },
        {
            header = "1 oz låggradig",
            txt = "",
            params = {
                event = "doj:server:process1ozMarijuana",
                isServer = true,
                args = 1
            }
        },
        {
            header = "1 oz mellanklass",
            txt = "",
            params = {
                event = "doj:server:process1ozMarijuana",
                isServer = true,
                args = 2

            }
        },
        {
            header = "1oz högklassig",
            txt = "",
            params = {
                event = "doj:server:process1ozMarijuana",
                isServer = true,
                args = 3
            }
        },
        {
            header = "< Gå Tillbaka",
            params = {
                event = "doj:client:mainProcessMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:mainProcessMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Marijuanatrimmer",
            txt = "Oz's säljer till butiker</p>3,5g's säljer på gatorna",
            isMenuHeader = true
        },
        {
            header = "Trim & Paket",
            txt = "",
            params = {
                event = "doj:client:TrimMenu",
            }
        },
        {
            header = "Combine oz's to 1/8's",
            txt = "",
            params = {
                event = "doj:client:CombineMenu",
            }
        },
        {
            header = "Stäng",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

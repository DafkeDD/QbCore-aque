local QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob = QBCore.Functions.GetPlayerData().job
local shownBossMenu = false

-- UTIL
local function CloseMenuFull()
    exports['qb-menu']:closeMenu()
    exports['qb-core']:HideText()
    shownBossMenu = false
end

local function comma_value(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k == 0) then
            break
        end
    end
    return formatted
end

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerJob = QBCore.Functions.GetPlayerData().job
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)

RegisterNetEvent('qb-bossmenu:client:OpenMenu', function()
    if not PlayerJob.name or not PlayerJob.isboss then return end

    local bossMenu = {
        {
            header = "Boss Menu - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
        {
            header = "📋 Hantera Anställda",
            txt = "Kontrollera din personallista",
            params = {
                event = "qb-bossmenu:client:employeelist",
            }
        },
        {
            header = "💛 Anställ Anställda",
            txt = "Anställ Närmaste Personen",
            params = {
                event = "qb-bossmenu:client:HireMenu",
            }
        },
        {
            header = "🗄️ Tillgång till lagring",
            txt = "Öppna Förrådet",
            params = {
                event = "qb-bossmenu:client:Stash",
            }
        },
        {
            header = "🚪 Outfits",
            txt = "Se Sparade Outfits",
            params = {
                event = "qb-bossmenu:client:Wardrobe",
            }
        },
        {
            header = "💰 Pengarhantering",
            txt = "Kontrollera ditt företagssaldo",
            params = {
                event = "qb-bossmenu:client:SocietyMenu",
            }
        },
        {
            header = "Stäng",
            params = {
                event = "qb-menu:closeMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(bossMenu)
end)

RegisterNetEvent('qb-bossmenu:client:employeelist', function()
    local EmployeesMenu = {
        {
            header = "Hantera anställda - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetEmployees', function(cb)
        for _, v in pairs(cb) do
            EmployeesMenu[#EmployeesMenu + 1] = {
                header = v.name,
                txt = v.grade.name,
                params = {
                    event = "qb-bossmenu:client:ManageEmployee",
                    args = {
                        player = v,
                        work = PlayerJob
                    }
                }
            }
        end
        EmployeesMenu[#EmployeesMenu + 1] = {
            header = "< Tillbaka",
            params = {
                event = "qb-bossmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(EmployeesMenu)
    end, PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:ManageEmployee', function(data)
    local EmployeeMenu = {
        {
            header = "Hantera " .. data.player.name .. " - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
    }
    for k, v in pairs(QBCore.Shared.Jobs[data.work.name].grades) do
        EmployeeMenu[#EmployeeMenu + 1] = {
            header = v.name,
            txt = "Grad: " .. k,
            params = {
                isServer = true,
                event = "qb-bossmenu:server:GradeUpdate",
                args = {
                    cid = data.player.empSource,
                    grade = tonumber(k),
                    gradename = v.name
                }
            }
        }
    end
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "Sparka Anställd",
        params = {
            isServer = true,
            event = "qb-bossmenu:server:FireEmployee",
            args = data.player.empSource
        }
    }
    EmployeeMenu[#EmployeeMenu + 1] = {
        header = "< Tillbaka",
        params = {
            event = "qb-bossmenu:client:OpenMenu",
        }
    }
    exports['qb-menu']:openMenu(EmployeeMenu)
end)

RegisterNetEvent('qb-bossmenu:client:Stash', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "boss_" .. PlayerJob.name, {
        maxweight = 4000000,
        slots = 25,
    })
    TriggerEvent("inventory:client:SetCurrentStash", "boss_" .. PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:Wardrobe', function()
    TriggerEvent('qb-clothing:client:openOutfitMenu')
end)

RegisterNetEvent('qb-bossmenu:client:HireMenu', function()
    local HireMenu = {
        {
            header = "Anställ anställda - " .. string.upper(PlayerJob.label),
            isMenuHeader = true,
        },
    }
    QBCore.Functions.TriggerCallback('qb-bossmenu:getplayers', function(players)
        for _, v in pairs(players) do
            if v and v ~= PlayerId() then
                HireMenu[#HireMenu + 1] = {
                    header = v.name,
                    txt = "MedborgarID: " .. v.citizenid .. " - ID: " .. v.sourceplayer,
                    params = {
                        isServer = true,
                        event = "qb-bossmenu:server:HireEmployee",
                        args = v.sourceplayer
                    }
                }
            end
        end
        HireMenu[#HireMenu + 1] = {
            header = "< Tillbaka",
            params = {
                event = "qb-bossmenu:client:OpenMenu",
            }
        }
        exports['qb-menu']:openMenu(HireMenu)
    end)
end)

RegisterNetEvent('qb-bossmenu:client:SocietyMenu', function()
    QBCore.Functions.TriggerCallback('qb-bossmenu:server:GetAccount', function(cb)
        local SocietyMenu = {
            {
                header = "Pengar: " .. comma_value(cb) .. "KR - " .. string.upper(PlayerJob.label),
                isMenuHeader = true,
            },
            {
                header = "💸 Sätt In",
                txt = "Sätt In Pengar På Kontot",
                params = {
                    event = "qb-bossmenu:client:SocetyDeposit",
                    args = comma_value(cb)
                }
            },
            {
                header = "💸 Ta Ut",
                txt = "Ta Ut Pengar Från Kontor",
                params = {
                    event = "qb-bossmenu:client:SocetyWithDraw",
                    args = comma_value(cb)
                }
            },
            {
                header = "< Tillbaka",
                params = {
                    event = "qb-bossmenu:client:OpenMenu",
                }
            },
        }
        exports['qb-menu']:openMenu(SocietyMenu)
    end, PlayerJob.name)
end)

RegisterNetEvent('qb-bossmenu:client:SocetyDeposit', function(money)
    local deposit = exports['qb-input']:ShowInput({
        header = "Sätt in pengar <br> Tillgängligt saldo:" .. money,
        submitText = "Sätt In",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount'
            }
        }
    })
    if deposit then
        if not deposit.amount then return end
        TriggerServerEvent("qb-bossmenu:server:depositMoney", tonumber(deposit.amount))
    end
end)

RegisterNetEvent('qb-bossmenu:client:SocetyWithDraw', function(money)
    local withdraw = exports['qb-input']:ShowInput({
        header = "Ta ut pengar <br> Tillgängligt saldo: $" .. money,
        submitText = "Ta Ut",
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'Amount'
            }
        }
    })
    if withdraw then
        if not withdraw.amount then return end
        TriggerServerEvent("qb-bossmenu:server:withdrawMoney", tonumber(withdraw.amount))
    end
end)

-- MAIN THREAD
CreateThread(function()
    if Config.UseTarget then
        for job, zones in pairs(Config.BossMenuZones) do
            for index, data in ipairs(zones) do
                exports['qb-target']:AddBoxZone(job.."-BossMenu-"..index, data.coords, data.length, data.width, {
                    name = job.."-BossMenu-"..index,
                    heading = data.heading,
                    -- debugPoly = true,
                    minZ = data.minZ,
                    maxZ = data.maxZ,
                }, {
                    options = {
                        {
                            type = "client",
                            event = "qb-bossmenu:client:OpenMenu",
                            icon = "fas fa-sign-in-alt",
                            label = "Boss Meny",
                            canInteract = function() return job == PlayerJob.name and PlayerJob.isboss end,
                        },
                    },
                    distance = 2.5
                })
            end
        end
    else
        while true do
            local wait = 2500
            local pos = GetEntityCoords(PlayerPedId())
            local inRangeBoss = false
            local nearBossmenu = false
            if PlayerJob then
                wait = 0
                for k, menus in pairs(Config.BossMenus) do
                    for _, coords in ipairs(menus) do
                        if k == PlayerJob.name and PlayerJob.isboss then
                            if #(pos - coords) < 5.0 then
                                inRangeBoss = true
                                if #(pos - coords) <= 1.5 then
                                    nearBossmenu = true
                                    if not shownBossMenu then
                                        exports['qb-core']:DrawText('[E] Öppna Bossmeny', 'left')
                                        shownBossMenu = true
                                    end
                                    if IsControlJustReleased(0, 38) then
                                        exports['qb-core']:HideText()
                                        TriggerEvent("qb-bossmenu:client:OpenMenu")
                                    end
                                end

                                if not nearBossmenu and shownBossMenu then
                                    CloseMenuFull()
                                    shownBossMenu = false
                                end
                            end
                        end
                    end
                end
                if not inRangeBoss then
                    Wait(1500)
                    if shownBossMenu then
                        CloseMenuFull()
                        shownBossMenu = false
                    end
                end
            end
            Wait(wait)
        end
    end
end)

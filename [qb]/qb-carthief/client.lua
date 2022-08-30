local QBCore = exports['qb-core']:GetCoreObject()

local fov_max = 200.0
local fov_min = 5.0
local fov = (fov_max+fov_min)*0.5
local FadeIn = 300
local FadeOut = 800
local PoliceCount = 0
local PlayerData = {}

--TEXTS
AskBossText = nil
BossCarText = nil
BossParkedText = nil
EndWorkingText = nil
cam = nil

--VARIABLES
CarsToSteal = nil
startedErrand = false
wasTalked = false
searchingVehicle = false
hasParked = false
hasComingGarage = false
whatNext = false

--VARIABLES WORKING
startedWork = false
--Car Jack
hasCarJack = false
CarJackLSide = false
CarJackRSide = false
RotCarJack = 0.0
--Wheels
FLW = false
RLW = false
FRW = false
RRW = false
hasWheel = false
WheelsCount = 4
--Car Body
FLD = false
RLD = false
FRD = false
RRD = false
FD = false
RD = false
hasCarBody = false
CarBodyCount = 6
--Engine
Engine = false
hasEngine = false
EngineCount = 1
--Engine Hoist
hasEngineHoist = false

Citizen.CreateThread(function()
	while QBCore == nil do
		TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function()
	PlayerData.job = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    PoliceCount = amount
end)

-- Citizen.CreateThread(function()
--     while true do

--     local sleep = icfg.CopsRefreshTime

--             Citizen.Wait(500)
--             QBCore.Functions.TriggerCallback('qb-carthief:PoliceOnDuty', function(police)
--                 PoliceCount = police
--             end)
--         Citizen.Wait(sleep)
--     end
-- end)

Citizen.CreateThread(function()

	local pedmodel = GetHashKey(icfg.CarThief.Boss.BossPed)
	RequestModel(pedmodel)
	while not HasModelLoaded(pedmodel) do
		Citizen.Wait(1)
	end	
	boss = CreatePed(1, pedmodel, icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z - 1.0, icfg.CarThief.Boss.Pos.h, false, true)
	SetBlockingOfNonTemporaryEvents(boss, true)
	SetPedDiesWhenInjured(boss, false)
	SetPedCanPlayAmbientAnims(boss, true)
	SetPedCanRagdollFromPlayerImpact(boss, false)
	SetEntityInvincible(boss, true)
	FreezeEntityPosition(boss, true)
    PedGuardAnim()

    AskBossText = icfg.CarThief.Boss.AskBossText[math.random(1,#icfg.CarThief.Boss.AskBossText)]
    CarsToSteal = icfg.CarsToSteal[math.random(1,#icfg.CarsToSteal)]
    street = GetStreetNameAtCoord(icfg.CarThief.Boss.GarageSpaceWaypoint.x, icfg.CarThief.Boss.GarageSpaceWaypoint.y, icfg.CarThief.Boss.GarageSpaceWaypoint.z)
    street2 = GetStreetNameFromHashKey(street)
    while true do

    local sleep = 500
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

            if (#(coords - vector3(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z)) < 1.2) then
                sleep = 5
                if not startedErrand then
                    if PoliceCount >= icfg.RequiredCops then
                        if not wasTalked then
                            ShowFloatingHelpNotification('[~g~E~w~] - Prata med Ahmed', vector3(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.9))
                            if IsControlJustReleased(0, Keys["E"]) then
                                DoScreenFadeOut(FadeOut)
                                Citizen.Wait(FadeOut)
                                wasTalked = true
                                SetEntityCoords(ped, icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y + 0.9, icfg.CarThief.Boss.Pos.z - 1.0)
                                SetEntityHeading(ped, 182.16)
                                cam = CreateCam("DEFAULT_SCRIPTED_FLY_CAMERA", true)
                                AttachCamToEntity(cam, ped, 0.0, 0.5, 0.65, true)
                                SetCamRot(cam, 0.0, 0.0, GetEntityHeading(ped))
                                SetCamFov(cam, fov)
                                RenderScriptCams(true, false, 0, 1, 0)
                                FreezeEntityPosition(ped, true)
                                Citizen.Wait(FadeIn)
                                DoScreenFadeIn(FadeIn)
                                RequestAnimDict("special_ped@baygor@michael_1@michael_1b")
                                while (not HasAnimDictLoaded("special_ped@baygor@michael_1@michael_1b")) do
                                    Citizen.Wait(7)
                                end
                                TaskPlayAnim(boss, 'special_ped@baygor@michael_1@michael_1b', 'hey_how_you_doing_1', 8.0, 8.0, -1, 0, 0, false, false, false)
                            end
                        elseif wasTalked then
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.95, 'Ahmed:')
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.90, AskBossText.text)
                            DrawText2Ds(0.5, 0.88, AskBossText.ChooseText, 0.35)
                            if IsControlJustReleased(0, Keys["E"]) then
                                DoScreenFadeOut(FadeOut)
                                Citizen.Wait(FadeOut)
                                ClearPedTasks(boss)
                                PedGuardAnim()
                                BossCarText = icfg.CarThief.Boss.BossCarText[math.random(1,#icfg.CarThief.Boss.BossCarText)]
                                startedErrand = true
                                searchingVehicle = true
                                exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Hitta <b style='color: #3bf5c3;'>" ..CarsToSteal.CarLabel.. "</b> och leverera den till John", timeout = 3000})
                                addBlipParkingSpace()
                                RenderScriptCams(false, false, 0, 1, 0)
                                FreezeEntityPosition(ped, false)
                                Citizen.Wait(FadeIn)
                                DoScreenFadeIn(FadeIn)
                            elseif IsControlJustReleased(0, Keys['B']) then
                                DoScreenFadeOut(FadeOut)
                                Citizen.Wait(FadeOut)
                                ClearPedTasks(boss)
                                PedGuardAnim()
                                wasTalked = false
                                AskBossText = nil
                                AskBossText = icfg.CarThief.Boss.AskBossText[math.random(1,#icfg.CarThief.Boss.AskBossText)]
                                RenderScriptCams(false, false, 0, 1, 0)
                                FreezeEntityPosition(ped, false)
                                Citizen.Wait(FadeIn)
                                DoScreenFadeIn(FadeIn)
                            end
                        end
                    else
                        ShowFloatingHelpNotification("Jag har för närvarande inga beställningar", vector3(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.9))
                    end
                elseif startedErrand then
                    if not hasComingGarage then
                        if not hasParked then
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 1.2, 'John:')
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 1.0, BossCarText.text.. '~g~' ..CarsToSteal.CarLabel.. '~s~' ..BossCarText.text2)
                            DrawText3Ds(coords.x, coords.y, coords.z + 1.0, '~r~[B]~s~ - Avbryt beställning')
                            if IsControlJustReleased(0, Keys['B']) then
                                exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Du avbröt beställningen att stjäla <b style='color: #3bf5c3;'>" ..CarsToSteal.CarLabel.. "</b> fordon!", timeout = 3000})
                                removeBlipParkingSpace()
                                removeBlipGarageSpace()
                                AskBossText = nil
                                BossCarText = nil
                                searchingVehicle = false
                                AskBossText = icfg.CarThief.Boss.AskBossText[math.random(1,#icfg.CarThief.Boss.AskBossText)]
                                wasTalked = false
                                startedErrand = false
                            end
                        elseif hasParked then
                            if whatNext then
                                DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.95, 'John:')
                                DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.90, BossParkedText.text.. '~g~' ..CarsToSteal.CarLabel.. '~s~' ..BossParkedText.text2)
                                DrawText2Ds(0.5, 0.88, BossParkedText.ChooseText, 0.35)
                                if IsControlJustReleased(0, Keys["E"]) then
                                    DoScreenFadeOut(FadeOut)
                                    Citizen.Wait(FadeOut)
                                    FreezeEntityPosition(ped, false)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    Citizen.Wait(FadeIn)
                                    DoScreenFadeIn(FadeIn)
                                    hasComingGarage = true
                                    whatNext = false
                                    BossComingGarageText = icfg.CarThief.Boss.BossComingGarageText[math.random(1,#icfg.CarThief.Boss.BossComingGarageText)]
                                    EndWorkingText = icfg.CarThief.Boss.EndWorkingText[math.random(1,#icfg.CarThief.Boss.EndWorkingText)]
                                    addBlipGarageSpace()
                                    SetNewWaypoint(icfg.CarThief.Boss.GarageSpaceWaypoint.x, icfg.CarThief.Boss.GarageSpaceWaypoint.y)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Ahmed sa åt dig att gå till <b>" ..street2.. "</b> med <b style='color: #3bf5c3;'>" ..CarsToSteal.CarLabel.. "</b>", timeout = 3000})
                                elseif IsControlJustReleased(0, Keys['B']) then
                                    DoScreenFadeOut(FadeOut)
                                    Citizen.Wait(FadeOut)
                                    FreezeEntityPosition(ped, false)
                                    RenderScriptCams(false, false, 0, 1, 0)
                                    SetEntityCoords(ped, icfg.CarThief.Boss.Pos.x - 0.07, icfg.CarThief.Boss.Pos.y + 0.9, icfg.CarThief.Boss.Pos.z - 1.0)
                                    SetEntityHeading(ped, 182.16)
                                    Citizen.Wait(FadeIn)
                                    DoScreenFadeIn(FadeIn)
                                    RequestAnimDict("mp_common")
                                    while (not HasAnimDictLoaded("mp_common")) do
                                        Citizen.Wait(7)
                                    end
                                    TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                    RequestAnimDict("mp_common")
                                    while (not HasAnimDictLoaded("mp_common")) do
                                        Citizen.Wait(7)
                                    end
                                    TaskPlayAnim(boss, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                    Citizen.Wait(2000)
                                    TriggerServerEvent('qb-carthief:Payout', CarsToSteal.Payout, 0.5, CarsToSteal.CarLabel)
                                    ClearPedTasks(ped)
                                    ClearPedTasks(boss)
                                    AskBossText = nil
                                    BossCarText = nil
                                    CarsToSteal = nil
                                    BossParkedText = nil
                                    CarsToSteal = icfg.CarsToSteal[math.random(1,#icfg.CarsToSteal)]
                                    AskBossText = icfg.CarThief.Boss.AskBossText[math.random(1,#icfg.CarThief.Boss.AskBossText)]
                                    wasTalked = false
                                    startedErrand = false
                                    whatNext = false
                                    QBCore.Functions.DeleteVehicle(vehicle)
                                    hasParked = false
                                    for i, v in ipairs(icfg.ParkingSpace) do
                                        v.hasParked = false
                                    end
                                    removeBlipParkingSpace()
                                end
                            elseif not whatNext then
                                ShowFloatingHelpNotification("[~g~E~w~] - Fråga vad som händer härnäst", vector3(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 0.9))
                                if IsControlJustReleased(0, Keys["E"]) then
                                    DoScreenFadeOut(FadeOut)
                                    Citizen.Wait(FadeOut)
                                    FreezeEntityPosition(ped, true)
                                    RequestAnimDict("special_ped@baygor@michael_2@michael_2a")
                                    while (not HasAnimDictLoaded("special_ped@baygor@michael_2@michael_2a")) do
                                        Citizen.Wait(7)
                                    end
                                    TaskPlayAnim(boss, 'special_ped@baygor@michael_2@michael_2a', 'hey_how_you_doing2_0', 8.0, 8.0, -1, 0, 0, false, false, false)
                                    SetEntityCoords(ped, icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y + 0.9, icfg.CarThief.Boss.Pos.z - 1.0)
                                    SetEntityHeading(ped, 182.16)
                                    RenderScriptCams(true, false, 0, 1, 0)
                                    whatNext = true
                                    Citizen.Wait(FadeIn)
                                    DoScreenFadeIn(FadeIn)
                                end
                            end
                        end
                    elseif hasComingGarage then
                        if WheelsCount > 0 and CarBodyCount > 0 and EngineCount > 0 then
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 1.2, 'John:')
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 1.0, BossComingGarageText.text.. "~g~" ..CarsToSteal.CarLabel.. "~s~" ..BossComingGarageText.text2)
                        else
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 1.2, 'John:')
                            DrawText3Ds(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z + 1.0, EndWorkingText.text)
                            DrawText3Ds(coords.x, coords.y, coords.z + 1.0, '~g~[E]~s~ - Få din lönecheck')
                            if IsControlJustReleased(0, Keys["E"]) then
                                SetEntityCoords(ped, icfg.CarThief.Boss.Pos.x - 0.07, icfg.CarThief.Boss.Pos.y + 0.9, icfg.CarThief.Boss.Pos.z - 1.0)
                                SetEntityHeading(ped, 182.16)
                                RequestAnimDict("mp_common")
                                while (not HasAnimDictLoaded("mp_common")) do
                                    Citizen.Wait(7)
                                end
                                TaskPlayAnim(ped, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                RequestAnimDict("mp_common")
                                while (not HasAnimDictLoaded("mp_common")) do
                                    Citizen.Wait(7)
                                end
                                TaskPlayAnim(boss, 'mp_common', 'givetake1_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                Citizen.Wait(2000)
                                TriggerServerEvent('qb-carthief:Payout', CarsToSteal.Payout, 1.0, CarsToSteal.CarLabel)
                                startedWork = false
                                EngineCount = 1
                                WheelsCount = 4
                                CarBodyCount = 6
                                hasComingGarage = false
                                wasTalked = false
                                startedErrand = false
                                EndWorkingText = nil
                                AskBossText = nil
                                AskBossText = icfg.CarThief.Boss.AskBossText[math.random(1,#icfg.CarThief.Boss.AskBossText)]
                                BossComingGarageText = nil
                                CarsToSteal = nil
                                CarsToSteal = icfg.CarsToSteal[math.random(1,#icfg.CarsToSteal)]
                                removeBlipGarageSpace()
                                removeBlipParkingSpace()
                                ClearPedTasks(ped)
                                ClearPedTasks(boss)
                                PedGuardAnim()
                            end
                        end
                    end
                end
            elseif (#(coords - vector3(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z)) < 8.0) then
                sleep = 5
                DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y, icfg.CarThief.Boss.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        vehicle = GetVehiclePedIsIn(ped, true)

            if startedErrand then
                for i, v in ipairs(icfg.ParkingSpace) do
                    if (#(coords - vector3(v.x, v.y, v.z)) < 1.8) then
                        if IsPedInAnyVehicle(ped, false) then
                            local cname = GetEntityModel(GetVehiclePedIsIn(ped))
                            if not v.hasParked then
                                if not hasParked then
                                    sleep = 5
                                    ShowFloatingHelpNotification("[~g~B~w~] - ~g~Parkera~s~ den stulna bilen", vector3(v.x, v.y, v.z + 1.2))
                                    if IsControlJustReleased(0, Keys['B']) then
                                        if cname == GetHashKey(CarsToSteal.CarModel) then
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleEngineOn(vehicle, false, false, true)
                                            v.hasParked = true
                                            hasParked = true
                                            BossParkedText = icfg.CarThief.Boss.BossParkedText[math.random(1,#icfg.CarThief.Boss.BossParkedText)]
                                            exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Gå till Ahmed för att få nästa information", timeout = 3000})
                                        else
                                            exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Det här är inte Ahmeds utsedda fordon", timeout = 3000})
                                        end
                                    end
                                end
                            elseif v.hasParked then
                                ShowFloatingHelpNotification("[~g~B~w~] - ~r~Avparkera~s~ den stulna fordonet", vector3(v.x, v.y, v.z + 1.2))
                                if IsControlJustReleased(0, Keys['B']) then
                                    FreezeEntityPosition(vehicle, false)
                                    SetVehicleEngineOn(vehicle, true, false, true)
                                    hasParked = false
                                    v.hasParked = false
                                end
                            end
                        end
                    elseif (#(coords - vector3(v.x, v.y, v.z)) < 8.0) then
                        if IsPedInAnyVehicle(ped, false) then
                            sleep = 5
                            DrawMarker(icfg.CarThief.Boss.Type, v.x, v.y, v.z - 0.35, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.CarSize.x, icfg.CarThief.Boss.CarSize.y, icfg.CarThief.Boss.CarSize.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local cname = GetEntityModel(GetVehiclePedIsIn(ped))

            if startedErrand then
                if searchingVehicle then
                    sleep = 5
                    DrawText2Ds(0.5, 0.95, 'Själ: ~g~' ..CarsToSteal.CarLabel.. '~s~', 0.40)
                    if IsPedInAnyVehicle(ped, false) then
                        if cname == GetHashKey(CarsToSteal.CarModel) then
                            exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Du hittade <b style='color: #3bf5c3;'>" ..CarsToSteal.CarLabel.. "</b> Ahmed pratade om, berätta det för honom.", timeout = 3000})
                            SetNewWaypoint(icfg.CarThief.Boss.ParkingSpaceWaypoint.x, icfg.CarThief.Boss.ParkingSpaceWaypoint.y)
                            searchingVehicle = false
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

            if hasComingGarage then
                for i, v in ipairs(icfg.GarageSpace) do
                    if not v.GarageParked then
                        if not startedWork then
                            if (#(coords - vector3(v.x, v.y, v.z)) < 2.0) then
                                if IsPedInAnyVehicle(ped, false) then
                                    local cname = GetEntityModel(GetVehiclePedIsIn(ped))
                                    sleep = 5
                                    ShowFloatingHelpNotification("[~g~B~w~] - ~g~Parkera~s~ den stulna fordonet", vector3(v.x, v.y, v.z + 1.2))
                                    if IsControlJustReleased(0, Keys['B']) then
                                        if cname == GetHashKey(CarsToSteal.CarModel) then
                                            FreezeEntityPosition(vehicle, true)
                                            SetVehicleEngineOn(vehicle, false, false, true)
                                            SetEntityHeading(vehicle, 204.59)
                                            LastRotation = GetEntityRotation(vehicle, 0)
                                            exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Du har nått din destination, börja med att plocka isär hjul eller kaross och slutligen demontera motorn", timeout = 5000})
                                            v.GarageParked = true
                                            startedWork = true
                                            vehicle = GetVehiclePedIsIn(ped)
                                            FrontLeftWheel = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.FrontLeftWheelx, CarsToSteal.FrontLeftWheely, CarsToSteal.FrontLeftWheelz)
                                            FrontRightWheel = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.FrontRightWheelx, CarsToSteal.FrontRightWheely, CarsToSteal.FrontRightWheelz)
                                            RearLeftWheel = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.RearLeftWheelx, CarsToSteal.RearLeftWheely, CarsToSteal.RearLeftWheelz)
                                            RearRightWheel = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.RearRightWheelx, CarsToSteal.RearRightWheely, CarsToSteal.RearRightWheelz)
                                            --------------------------------------------------------------------------------------------------------------------------------------------------------------- WHEELS
                                            FrontLeftDoor = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.FrontLeftDoorx, CarsToSteal.FrontLeftDoory, CarsToSteal.FrontLeftDoorz)
                                            FrontRightDoor = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.FrontRightDoorx, CarsToSteal.FrontRightDoory, CarsToSteal.FrontRightDoorz)
                                            RearLeftDoor = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.RearLeftDoorx, CarsToSteal.RearLeftDoory, CarsToSteal.RearLeftDoorz)
                                            RearRightDoor = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.RearRightDoorx, CarsToSteal.RearRightDoory, CarsToSteal.RearRightDoorz)
                                            FrontDoor = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.FrontDoorx, CarsToSteal.FrontDoory, CarsToSteal.FrontDoorz)
                                            RearDoor = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.RearDoorx, CarsToSteal.RearDoory, CarsToSteal.RearDoorz)
                                            --------------------------------------------------------------------------------------------------------------------------------------------------------------- DOORS
                                            LeftSide = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.LeftSidex, CarsToSteal.LeftSidey, CarsToSteal.LeftSidez)
                                            RightSide = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.RightSidex, CarsToSteal.RightSidey, CarsToSteal.RightSidez)
                                            --------------------------------------------------------------------------------------------------------------------------------------------------------------- ENGINE
                                            FrontSide = GetOffsetFromEntityInWorldCoords(vehicle, CarsToSteal.FrontSidex, CarsToSteal.FrontSidey, CarsToSteal.FrontSidez)
                                        else
                                            exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Det här är inte Johns utsedda fordon", timeout = 3000})
                                        end
                                    end
                                end
                            elseif (#(coords - vector3(v.x, v.y, v.z)) < 8.0) then
                                if IsPedInAnyVehicle(ped, false) then
                                    sleep = 5
                                    DrawMarker(icfg.CarThief.Boss.Type, v.x, v.y, v.z - 0.35, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.CarSize.x, icfg.CarThief.Boss.CarSize.y, icfg.CarThief.Boss.CarSize.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                end
                            end
                        end
                    elseif v.GarageParked then
                        if startedWork then
                            if not IsPedInAnyVehicle(ped, false) then
                                sleep = 5
                                if hasWheel or hasCarBody or hasEngine or hasEngineHoist then
                                    DisableControlAction(0, Keys["LEFTSHIFT"], true)
                                    DisableControlAction(0, Keys["F"], true)
                                    DisableControlAction(0, Keys["SPACE"], true)
                                end
                                if hasCarJack then
                                    if not CarJackRSide then -- Left Side
                                        if not CarJackLSide then
                                            if (#(coords - vector3(LeftSide.x, LeftSide.y, LeftSide.z)) < 0.8) then
                                                if not hasWheel and not hasCarBody and not hasEngine and not hasEngineHoist then
                                                    ShowFloatingHelpNotification("[~g~E~w~] - Placera Car Jack under ~g~Fordonet~s~", vector3(LeftSide.x, LeftSide.y, LeftSide.z + 1.3))
                                                    if IsControlJustReleased(0, Keys["E"]) then
                                                        exports.rprogress:Custom({
                                                            Duration = 3500,
                                                            Label = "Du lägger Car Jack under fordonet",
                                                            DisableControls = {
                                                                Mouse = false,
                                                                Player = true,
                                                                Vehicle = true
                                                            }
                                                        })
                                                        Citizen.Wait(3500)
                                                        removeCarJack()
                                                        carjack = CreateObject(GetHashKey('imp_prop_car_jack_01a'), LeftSide.x - 1.0, LeftSide.y, LeftSide.z - 0.4,  true,  true, true)
                                                        SetEntityHeading(carjack, 295.72)
                                                        FreezeEntityPosition(carjack, true)
                                                        CarJackLSide = true
                                                        Citizen.Wait(100)
                                                    end
                                                end
                                            elseif (#(coords - vector3(LeftSide.x, LeftSide.y, LeftSide.z)) < 4.0) then
                                                DrawMarker(icfg.CarThief.Boss.Type, LeftSide.x, LeftSide.y, LeftSide.z - 0.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                            end
                                        elseif CarJackLSide then
                                            if (#(coords - vector3(LeftSide.x, LeftSide.y, LeftSide.z)) < 0.8) then
                                                DrawMarker(icfg.CarThief.Boss.Type, LeftSide.x, LeftSide.y, LeftSide.z - 0.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                                if not hasWheel and not hasCarBody and not hasEngine and not hasEngineHoist then
                                                    if RotCarJack == 0.0 then
                                                        DrawText3Ds(LeftSide.x, LeftSide.y, LeftSide.z + 0.4, '~g~[E]~s~ - Höj fordonet högre | ~r~[H]~s~ - Dra ut Car Jack')
                                                        if IsControlJustReleased(0, Keys["E"]) then
                                                            RotCarJack = RotCarJack + 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        elseif IsControlJustReleased(0, Keys["H"]) then
                                                            CarJackLSide = false
                                                            FreezeEntityPosition(carjack, false)
                                                            DeleteObject(carjack)
                                                            addCarJack()
                                                        end
                                                    elseif RotCarJack > 0.0 and RotCarJack < 5.0 then
                                                        DrawText3Ds(LeftSide.x, LeftSide.y, LeftSide.z + 0.4, '~g~[E]~s~ - Höj fordonet högre | ~g~[B]~s~ - Sänk fordonet')
                                                        if IsControlJustReleased(0, Keys["E"]) then
                                                            RotCarJack = RotCarJack + 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        elseif IsControlJustReleased(0, Keys['B']) then
                                                            RotCarJack = RotCarJack - 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        end
                                                    elseif RotCarJack == 5.0 then
                                                        DrawText3Ds(LeftSide.x, LeftSide.y, LeftSide.z + 0.4, '~g~[B]~s~ - Sänk fordonet')
                                                        if IsControlJustReleased(0, Keys['B']) then
                                                            RotCarJack = RotCarJack - 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        end
                                                    end
                                                end
                                            elseif (#(coords - vector3(LeftSide.x, LeftSide.y, LeftSide.z)) < 4.0) then
                                                DrawMarker(icfg.CarThief.Boss.Type, LeftSide.x, LeftSide.y, LeftSide.z - 0.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                            end
                                        end
                                    end
                                    if not CarJackLSide then -- Right Side
                                        if not CarJackRSide then
                                            if (#(coords - vector3(RightSide.x, RightSide.y, RightSide.z)) < 0.8) then
                                                if not hasWheel and not hasCarBody and not hasEngine and not hasEngineHoist then
                                                    ShowFloatingHelpNotification("[~g~E~w~] - Placera Car Jack under ~g~Fordonet~s~", vector3(RightSide.x, RightSide.y, RightSide.z + 1.3))
                                                    if IsControlJustReleased(0, Keys["E"]) then
                                                        exports.rprogress:Custom({
                                                            Duration = 3500,
                                                            Label = "Du lägger Car Jack under fordonet",
                                                            DisableControls = {
                                                                Mouse = false,
                                                                Player = true,
                                                                Vehicle = true
                                                            }
                                                        })
                                                        Citizen.Wait(3500)
                                                        removeCarJack()
                                                        carjack = CreateObject(GetHashKey('imp_prop_car_jack_01a'), RightSide.x + 1.0, RightSide.y, RightSide.z - 0.4,  true,  true, true)
                                                        SetEntityHeading(carjack, 111.82)
                                                        FreezeEntityPosition(carjack, true)
                                                        CarJackRSide = true
                                                        Citizen.Wait(100)
                                                    end
                                                end
                                            elseif (#(coords - vector3(RightSide.x, RightSide.y, RightSide.z)) < 4.0) then
                                                DrawMarker(icfg.CarThief.Boss.Type, RightSide.x, RightSide.y, RightSide.z - 0.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                            end
                                        elseif CarJackRSide then
                                            if (#(coords - vector3(RightSide.x, RightSide.y, RightSide.z)) < 0.8) then
                                                DrawMarker(icfg.CarThief.Boss.Type, RightSide.x, RightSide.y, RightSide.z - 0.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                                if not hasWheel and not hasCarBody and not hasEngine and not hasEngineHoist then
                                                    if RotCarJack == 0.0 then
                                                        DrawText3Ds(RightSide.x, RightSide.y, RightSide.z + 0.4, '~g~[E]~s~ -Höj fordonet högre | ~r~[H]~s~ - Dra ut Car jack')
                                                        if IsControlJustReleased(0, Keys["E"]) then
                                                            RotCarJack = RotCarJack - 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        elseif IsControlJustReleased(0, Keys["H"]) then
                                                            CarJackRSide = false
                                                            FreezeEntityPosition(carjack, false)
                                                            DeleteObject(carjack)
                                                            addCarJack()
                                                        end
                                                    elseif RotCarJack < 0.0 and RotCarJack > -5.0 then
                                                        DrawText3Ds(RightSide.x, RightSide.y, RightSide.z + 0.4, '~g~[E]~s~ - Höj fordonet högre | ~g~[B]~s~ - Sänk ned fordonet')
                                                        if IsControlJustReleased(0, Keys["E"]) then
                                                            RotCarJack = RotCarJack - 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        elseif IsControlJustReleased(0, Keys['B']) then
                                                            RotCarJack = RotCarJack + 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        end
                                                    elseif RotCarJack == -5.0 then
                                                        DrawText3Ds(RightSide.x, RightSide.y, RightSide.z + 0.4, '~g~[B]~s~ - Sänk ner fordonet')
                                                        if IsControlJustReleased(0, Keys['B']) then
                                                            RotCarJack = RotCarJack + 1.0
                                                            SetEntityRotation(vehicle, LastRotation.x, RotCarJack, LastRotation.z)
                                                        end
                                                    end
                                                end
                                            elseif (#(coords - vector3(RightSide.x, RightSide.y, RightSide.z)) < 4.0) then
                                                DrawMarker(icfg.CarThief.Boss.Type, RightSide.x, RightSide.y, RightSide.z - 0.30, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                            end
                                        end
                                    end
                                end
                                if RotCarJack == 5.0 then
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    if (#(coords - vector3(FrontLeftWheel.x, FrontLeftWheel.y, FrontLeftWheel.z)) < 0.8) then -- Front Left Wheel
                                        if not FLW then
                                            if not hasWheel then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera hjulet", vector3(FrontLeftWheel.x, FrontLeftWheel.y, FrontLeftWheel.z + 0.4))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss hjulet...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 114.92)
                                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleWheelTireColliderSize(vehicle, 0, -5.0)
                                                    FLW = true
                                                    hasWheel = true
                                                    addWheel()
                                                end
                                            elseif hasWheel then
                                                ShowFloatingHelpNotification("Hjul att skruva av", vector3(FrontLeftWheel.x, FrontLeftWheel.y, FrontLeftWheel.z + 0.4))
                                            end
                                        elseif FLW then
                                            ShowFloatingHelpNotification("~r~Hjul demonterad~s~", vector3(FrontLeftWheel.x, FrontLeftWheel.y, FrontLeftWheel.z + 0.4))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(RearLeftWheel.x, RearLeftWheel.y, RearLeftWheel.z)) < 0.8) then -- Rear Left Wheel
                                        if not RLW then
                                            if not hasWheel then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera hjulet", vector3(RearLeftWheel.x, RearLeftWheel.y, RearLeftWheel.z + 0.4))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss hjulet...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 114.92)
                                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleWheelTireColliderSize(vehicle, 2, -5.0)
                                                    RLW = true
                                                    hasWheel = true
                                                    addWheel()
                                                end
                                            elseif hasWheel then
                                                ShowFloatingHelpNotification("Hjul att skruva av", vector3(RearLeftWheel.x, RearLeftWheel.y, RearLeftWheel.z + 0.4))
                                            end
                                        elseif RLW then
                                            ShowFloatingHelpNotification("~r~Hjul demonterad~s~", vector3(RearLeftWheel.x, RearLeftWheel.y, RearLeftWheel.z + 0.4))
                                        end
                                    end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                elseif RotCarJack == -5.0 then
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    if (#(coords - vector3(FrontRightWheel.x, FrontRightWheel.y, FrontRightWheel.z)) < 0.8) then -- Front Right Wheel
                                        if not FRW then
                                            if not hasWheel then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera hjulet", vector3(FrontRightWheel.x, FrontRightWheel.y, FrontRightWheel.z + 0.4))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss hjulet...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 288.25)
                                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleWheelTireColliderSize(vehicle, 1, -5.0)
                                                    FRW = true
                                                    hasWheel = true
                                                    addWheel()
                                                end
                                            elseif hasWheel then
                                                ShowFloatingHelpNotification("Hjul att skruva av", vector3(FrontRightWheel.x, FrontRightWheel.y, FrontRightWheel.z + 0.4))
                                            end
                                        elseif FRW then
                                            ShowFloatingHelpNotification("~r~Hjul demonterad~s~", vector3(FrontRightWheel.x, FrontRightWheel.y, FrontRightWheel.z + 0.4))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(RearRightWheel.x, RearRightWheel.y, RearRightWheel.z)) < 0.8) then -- Rear Right Wheel
                                        if not RRW then
                                            if not hasWheel then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera hjulet", vector3(RearRightWheel.x, RearRightWheel.y, RearRightWheel.z + 0.4))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss hjulet...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 288.25)
                                                    TaskStartScenarioInPlace(ped, 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleWheelTireColliderSize(vehicle, 3, -5.0)
                                                    RRW = true
                                                    hasWheel = true
                                                    addWheel()
                                                end
                                            elseif hasWheel then
                                                ShowFloatingHelpNotification("Hjul att skruva av", vector3(RearRightWheel.x, RearRightWheel.y, RearRightWheel.z + 0.4))
                                            end
                                        elseif RRW then
                                            ShowFloatingHelpNotification("~r~Hjul demonterad~s~", vector3(RearRightWheel.x, RearRightWheel.y, RearRightWheel.z + 0.4))
                                        end
                                    end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                elseif RotCarJack == 0.0 then
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    if (#(coords - vector3(FrontLeftDoor.x, FrontLeftDoor.y, FrontLeftDoor.z)) < 0.8) then -- Front Left Door
                                        if not FLD then
                                            if not hasCarBody then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera dörren", vector3(FrontLeftDoor.x, FrontLeftDoor.y, FrontLeftDoor.z + 0.8))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss dörren...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 114.92)
                                                    RequestAnimDict("amb@prop_human_parking_meter@male@idle_a")
                                                    while (not HasAnimDictLoaded("amb@prop_human_parking_meter@male@idle_a")) do
                                                        Citizen.Wait(7)
                                                    end
                                                    TaskPlayAnim(ped, 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleDoorBroken(vehicle, 0, true)
                                                    hasCarBody = true
                                                    FLD = true
                                                    addDoor()
                                                end
                                            elseif hasCarBody then
                                                ShowFloatingHelpNotification("Dörr att skruva av", vector3(FrontLeftDoor.x, FrontLeftDoor.y, FrontLeftDoor.z + 0.8))
                                            end
                                        elseif FLD then
                                            ShowFloatingHelpNotification("~r~Dörr demonterad~s~", vector3(FrontLeftDoor.x, FrontLeftDoor.y, FrontLeftDoor.z + 0.8))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(RearLeftDoor.x, RearLeftDoor.y, RearLeftDoor.z)) < 0.8) then -- Rear Left Door
                                        if not RLD then
                                            if not hasCarBody then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera dörren", vector3(RearLeftDoor.x, RearLeftDoor.y, RearLeftDoor.z + 0.8))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss dörren...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 114.92)
                                                    RequestAnimDict("amb@prop_human_parking_meter@male@idle_a")
                                                    while (not HasAnimDictLoaded("amb@prop_human_parking_meter@male@idle_a")) do
                                                        Citizen.Wait(7)
                                                    end
                                                    TaskPlayAnim(ped, 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleDoorBroken(vehicle, 2, true)
                                                    hasCarBody = true
                                                    RLD = true
                                                    addDoor()
                                                end
                                            elseif hasCarBody then
                                                ShowFloatingHelpNotification("Dörr att skruva av", vector3(RearLeftDoor.x, RearLeftDoor.y, RearLeftDoor.z + 0.8))
                                            end
                                        elseif RLD then
                                            ShowFloatingHelpNotification("~r~Dörr demonterad~s~", vector3(RearLeftDoor.x, RearLeftDoor.y, RearLeftDoor.z + 0.8))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(FrontRightDoor.x, FrontRightDoor.y, FrontRightDoor.z)) < 0.8) then -- Front Right Door
                                        if not FRD then
                                            if not hasCarBody then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera dörren", vector3(FrontRightDoor.x, FrontRightDoor.y, FrontRightDoor.z + 0.8))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss dörren...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 288.25)
                                                    RequestAnimDict("amb@prop_human_parking_meter@male@idle_a")
                                                    while (not HasAnimDictLoaded("amb@prop_human_parking_meter@male@idle_a")) do
                                                        Citizen.Wait(7)
                                                    end
                                                    TaskPlayAnim(ped, 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleDoorBroken(vehicle, 1, true)
                                                    hasCarBody = true
                                                    FRD = true
                                                    addDoor()
                                                end
                                            elseif hasCarBody then
                                                ShowFloatingHelpNotification("Dörr att skruva av", vector3(FrontRightDoor.x, FrontRightDoor.y, FrontRightDoor.z + 0.8))
                                            end
                                        elseif FRD then
                                            ShowFloatingHelpNotification("~r~Dörr demonterad~s~", vector3(FrontRightDoor.x, FrontRightDoor.y, FrontRightDoor.z + 0.8))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(RearRightDoor.x, RearRightDoor.y, RearRightDoor.z)) < 0.8) then -- Rear Right Door
                                        if not RRD then
                                            if not hasCarBody then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Demontera dörren", vector3(RearRightDoor.x, RearRightDoor.y, RearRightDoor.z + 0.8))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar loss dörren...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 288.25)
                                                    RequestAnimDict("amb@prop_human_parking_meter@male@idle_a")
                                                    while (not HasAnimDictLoaded("amb@prop_human_parking_meter@male@idle_a")) do
                                                        Citizen.Wait(7)
                                                    end
                                                    TaskPlayAnim(ped, 'amb@prop_human_parking_meter@male@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleDoorBroken(vehicle, 3, true)
                                                    hasCarBody = true
                                                    RRD = true
                                                    addDoor()
                                                end
                                            elseif hasCarBody then
                                                ShowFloatingHelpNotification("Dörr att skruva av", vector3(RearRightDoor.x, RearRightDoor.y, RearRightDoor.z + 0.8))
                                            end
                                        elseif RRD then
                                            ShowFloatingHelpNotification("~r~Dörr demonterad~s~", vector3(RearRightDoor.x, RearRightDoor.y, RearRightDoor.z + 0.8))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(FrontDoor.x, FrontDoor.y, FrontDoor.z)) < 0.8) then -- Front Door
                                        if not FD then
                                            if not hasCarBody then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Ta isär motorhuven", vector3(FrontDoor.x, FrontDoor.y, FrontDoor.z + 0.6))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    SetVehicleDoorOpen(vehicle, 4, false, false)
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar av motorhuven...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 21.16)
                                                    RequestAnimDict("mini@repair")
                                                    while (not HasAnimDictLoaded("mini@repair")) do
                                                        Citizen.Wait(7)
                                                    end
                                                    TaskPlayAnim(ped, 'mini@repair', 'fixing_a_ped', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleDoorBroken(vehicle, 4, true)
                                                    hasCarBody = true
                                                    FD = true
                                                    addBonnet()
                                                end
                                            elseif hasCarBody then
                                                ShowFloatingHelpNotification("Motorhuv att skruva av", vector3(FrontDoor.x, FrontDoor.y, FrontDoor.z + 0.6))
                                            end
                                        elseif FD then
                                            ShowFloatingHelpNotification("~r~Motorhuv demonterad~s~", vector3(FrontDoor.x, FrontDoor.y, FrontDoor.z + 0.6))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(RearDoor.x, RearDoor.y, RearDoor.z)) < 0.8) then -- Rear Door
                                        if not RD then
                                            if not hasCarBody then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Ta isär bagageluckan", vector3(RearDoor.x, RearDoor.y, RearDoor.z + 0.6))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    SetVehicleDoorOpen(vehicle, 5, false, false)
                                                    exports.rprogress:Custom({
                                                        Duration = 7000,
                                                        Label = "Du skruvar av bagageluckan...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    SetEntityHeading(ped, 203.97)
                                                    RequestAnimDict("mini@repair")
                                                    while (not HasAnimDictLoaded("mini@repair")) do
                                                        Citizen.Wait(7)
                                                    end
                                                    TaskPlayAnim(ped, 'mini@repair', 'fixing_a_ped', 8.0, -8.0, -1, 2, 0, false, false, false)
                                                    Citizen.Wait(7000)
                                                    ClearPedTasks(ped)
                                                    SetVehicleDoorBroken(vehicle, 5, true)
                                                    hasCarBody = true
                                                    RD = true
                                                    addTrunk()
                                                end
                                            elseif hasCarBody then
                                                ShowFloatingHelpNotification("Bagagelucka att skruva av", vector3(RearDoor.x, RearDoor.y, RearDoor.z + 0.6))
                                            end
                                        elseif RD then
                                            ShowFloatingHelpNotification("~r~Bagagelucka demonterad~s~", vector3(RearDoor.x, RearDoor.y, RearDoor.z + 0.6))
                                        end
                                    -------------------------------------------------------------------------------------------------------------------------------------------------
                                    elseif (#(coords - vector3(FrontSide.x, FrontSide.y, FrontSide.z)) < 0.8) then -- Front Side
                                        if CarBodyCount == 0 and WheelsCount == 0 then
                                            DrawMarker(icfg.CarThief.Boss.Type, FrontSide.x, FrontSide.y, FrontSide.z - 0.15, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x - 0.4, icfg.CarThief.Boss.Size.y - 0.4, icfg.CarThief.Boss.Size.z - 0.4, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                            if not Engine then
                                                if not hasEngine then
                                                    if hasEngineHoist then
                                                        ShowFloatingHelpNotification("[~g~E~w~] - Dra ut motorn", vector3(FrontSide.x - 0.75, FrontSide.y + 1.5, FrontSide.z + 0.6))
                                                        if IsControlJustReleased(0, Keys["E"]) then
                                                            exports.rprogress:Custom({
                                                                Duration = 10000,
                                                                Label = "Du drar ut motorn...",
                                                                DisableControls = {
                                                                    Mouse = false,
                                                                    Player = true,
                                                                    Vehicle = true
                                                                }
                                                            })
                                                            SetEntityHeading(ped, 21.16)
                                                            Citizen.Wait(10000)
                                                            hasEngine = true
                                                            Engine = true
                                                            addEngine()
                                                        end
                                                    end
                                                elseif hasEngine then
                                                    ShowFloatingHelpNotification("Motor att dra ut", vector3(FrontSide.x, FrontSide.y, FrontSide.z + 0.6))
                                                end
                                            elseif Engine then
                                                ShowFloatingHelpNotification("~r~Motor demonterad~s~", vector3(FrontSide.x - 0.75, FrontSide.y + 1.5, FrontSide.z + 0.6))
                                            end
                                        end
                                    end
                                end
                                if CarBodyCount > 0 then
                                    if (#(coords - vector3(icfg.CarThief.CarBodyPlace.Pos.x, icfg.CarThief.CarBodyPlace.Pos.y, icfg.CarThief.CarBodyPlace.Pos.z)) < 1.2) then -- Place to put down Car Body
                                        DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.CarBodyPlace.Pos.x, icfg.CarThief.CarBodyPlace.Pos.y, icfg.CarThief.CarBodyPlace.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                        if hasCarBody then
                                            ShowFloatingHelpNotification("[~g~E~w~] - Lägg ner Carrosseriedelen", vector3(icfg.CarThief.CarBodyPlace.Pos.x, icfg.CarThief.CarBodyPlace.Pos.y, icfg.CarThief.CarBodyPlace.Pos.z + 0.9))
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports.rprogress:Custom({
                                                    Duration = 2500,
                                                    Label = "Du lägger ifrån dig några karossdelar...",
                                                    DisableControls = {
                                                        Mouse = false,
                                                        Player = true,
                                                        Vehicle = true
                                                    }
                                                })
                                                Citizen.Wait(2500)
                                                CarBodyCount = CarBodyCount - 1
                                                hasCarBody = false
                                                removeDoor()
                                                removeTrunk()
                                                removeBonnet()
                                                if CarBodyCount == 0 and WheelsCount > 0 then
                                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Du har briljant demonterat hela bilkarossen, nu är det dags för hjulen! Ta Car Jack från garaget och sätt igång!", timeout = 5000})
                                                elseif CarBodyCount == 0 and WheelsCount == 0 then
                                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Bilen är nästan klar, du har bara motor att demontera", timeout = 5000})
                                                end
                                            end
                                        elseif not hasCarBody then
                                            ShowFloatingHelpNotification("Du har " ..CarBodyCount.. " Kaross Bildelar kvar att demontera", vector3(icfg.CarThief.CarBodyPlace.Pos.x, icfg.CarThief.CarBodyPlace.Pos.y, icfg.CarThief.CarBodyPlace.Pos.z + 0.9))
                                        end
                                    elseif (#(coords - vector3(icfg.CarThief.CarBodyPlace.Pos.x, icfg.CarThief.CarBodyPlace.Pos.y, icfg.CarThief.CarBodyPlace.Pos.z)) < 8.0) then
                                        DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.CarBodyPlace.Pos.x, icfg.CarThief.CarBodyPlace.Pos.y, icfg.CarThief.CarBodyPlace.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                    end
                                end
                                if WheelsCount > 0 then
                                    if (#(coords - vector3(icfg.CarThief.WheelsPlace.Pos.x, icfg.CarThief.WheelsPlace.Pos.y, icfg.CarThief.WheelsPlace.Pos.z)) < 1.2) then -- Place to put down Wheels
                                        DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.WheelsPlace.Pos.x, icfg.CarThief.WheelsPlace.Pos.y, icfg.CarThief.WheelsPlace.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                        if hasWheel then
                                            ShowFloatingHelpNotification("[~g~E~w~] - Lägg ner hjulet", vector3(icfg.CarThief.WheelsPlace.Pos.x, icfg.CarThief.WheelsPlace.Pos.y, icfg.CarThief.WheelsPlace.Pos.z + 0.9))
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports.rprogress:Custom({
                                                    Duration = 2500,
                                                    Label = "Du lägger ner hjulet...",
                                                    DisableControls = {
                                                        Mouse = false,
                                                        Player = true,
                                                        Vehicle = true
                                                    }
                                                })
                                                Citizen.Wait(2500)
                                                WheelsCount = WheelsCount - 1
                                                hasWheel = false
                                                removeWheel()
                                                if WheelsCount == 0 and CarBodyCount > 0 then
                                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Hjul demonterade, nu är det dags för Car Body! Lämna tillbaka Car Jack och börja!", timeout = 5000})
                                                elseif CarBodyCount == 0 and WheelsCount == 0 then
                                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Bilen är nästan klar, du har bara motor att demontera. Lägg tillbaka Car Jack på sin plats och du är redo att börja!", timeout = 5000})
                                                end
                                            end
                                        elseif not hasWheel then
                                            ShowFloatingHelpNotification("Du har " ..WheelsCount.. " Hjul kvar att demontera", vector3(icfg.CarThief.WheelsPlace.Pos.x, icfg.CarThief.WheelsPlace.Pos.y, icfg.CarThief.WheelsPlace.Pos.z + 0.9))
                                        end
                                    elseif (#(coords - vector3(icfg.CarThief.WheelsPlace.Pos.x, icfg.CarThief.WheelsPlace.Pos.y, icfg.CarThief.WheelsPlace.Pos.z)) < 8.0) then
                                        DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.WheelsPlace.Pos.x, icfg.CarThief.WheelsPlace.Pos.y, icfg.CarThief.WheelsPlace.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                    end
                                end
                                if EngineCount > 0 then
                                    if WheelsCount == 0 and CarBodyCount == 0 then
                                        if (#(coords - vector3(icfg.CarThief.EnginePlace.Pos.x, icfg.CarThief.EnginePlace.Pos.y, icfg.CarThief.EnginePlace.Pos.z)) < 1.2) then -- Place to put down Engine
                                            DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.EnginePlace.Pos.x, icfg.CarThief.EnginePlace.Pos.y, icfg.CarThief.EnginePlace.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                            if hasEngine then
                                                ShowFloatingHelpNotification("[~g~E~w~] - Lägg ner motorn", vector3(icfg.CarThief.EnginePlace.Pos.x, icfg.CarThief.EnginePlace.Pos.y, icfg.CarThief.EnginePlace.Pos.z + 0.9))
                                                if IsControlJustReleased(0, Keys["E"]) then
                                                    exports.rprogress:Custom({
                                                        Duration = 5500,
                                                        Label = "Du lägger ner motorn...",
                                                        DisableControls = {
                                                            Mouse = false,
                                                            Player = true,
                                                            Vehicle = true
                                                        }
                                                    })
                                                    Citizen.Wait(5500)
                                                    EngineCount = EngineCount - 1
                                                    hasEngine = false
                                                    removeEngine()
                                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Bra, sätt tillbaka motorlyften på plats", timeout = 5000})
                                                end
                                            elseif not hasEngine then
                                                ShowFloatingHelpNotification("Du tog inte ut motorn", vector3(icfg.CarThief.EnginePlace.Pos.x, icfg.CarThief.EnginePlace.Pos.y, icfg.CarThief.EnginePlace.Pos.z + 0.9))
                                            end
                                        elseif (#(coords - vector3(icfg.CarThief.EnginePlace.Pos.x, icfg.CarThief.EnginePlace.Pos.y, icfg.CarThief.EnginePlace.Pos.z)) < 8.0) then
                                            DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.EnginePlace.Pos.x, icfg.CarThief.EnginePlace.Pos.y, icfg.CarThief.EnginePlace.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                        end
                                    end
                                end
                                if (#(coords - vector3(icfg.CarThief.Hoist.Pos.x, icfg.CarThief.Hoist.Pos.y, icfg.CarThief.Hoist.Pos.z)) < 1.2) then -- Hoist
                                    DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.Hoist.Pos.x, icfg.CarThief.Hoist.Pos.y, icfg.CarThief.Hoist.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                    if not hasCarBody and not hasEngine and not hasWheel and not hasCarJack then
                                        if not hasEngineHoist then
                                            ShowFloatingHelpNotification("[~g~E~w~] - Ta motorlyft", vector3(icfg.CarThief.Hoist.Pos.x, icfg.CarThief.Hoist.Pos.y, icfg.CarThief.Hoist.Pos.z + 0.9))
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports.rprogress:Custom({
                                                    Duration = 3500,
                                                    Label = "Du tar motorlyften...",
                                                    DisableControls = {
                                                        Mouse = false,
                                                        Player = true,
                                                        Vehicle = true
                                                    }
                                                })
                                                Citizen.Wait(3500)
                                                addHoist()
                                                hasEngineHoist = true
                                            end
                                        elseif hasEngineHoist then
                                            ShowFloatingHelpNotification("[~g~E~w~] - Lämna tillbaks motorlyft", vector3(icfg.CarThief.Hoist.Pos.x, icfg.CarThief.Hoist.Pos.y, icfg.CarThief.Hoist.Pos.z + 0.9))
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports.rprogress:Custom({
                                                    Duration = 3500,
                                                    Label = "Du lämnar tillbaka Motorlyften...",
                                                    DisableControls = {
                                                        Mouse = false,
                                                        Player = true,
                                                        Vehicle = true
                                                    }
                                                })
                                                Citizen.Wait(3500)
                                                removeHoist()
                                                hasEngineHoist = false
                                                if EngineCount == 0 then
                                                    exports.pNotify:SendNotification({text = "<b>Ahmed</b></br>Bra jobbat! Gå nu till John för att hämta din lön!", timeout = 5000})
                                                    QBCore.Functions.DeleteVehicle(vehicle)
                                                    v.GarageParked = false
                                                    FLW = false
                                                    RLW = false
                                                    FRW = false
                                                    RRW = false
                                                    FLD = false
                                                    RLD = false
                                                    FRD = false
                                                    RRD = false
                                                    FD = false
                                                    RD = false
                                                    Engine = false
                                                    SetNewWaypoint(icfg.CarThief.Boss.Pos.x, icfg.CarThief.Boss.Pos.y)
                                                end
                                            end
                                        end
                                    end
                                elseif (#(coords - vector3(icfg.CarThief.Hoist.Pos.x, icfg.CarThief.Hoist.Pos.y, icfg.CarThief.Hoist.Pos.z)) < 8.0) then -- Hoist
                                    DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.Hoist.Pos.x, icfg.CarThief.Hoist.Pos.y, icfg.CarThief.Hoist.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                end
                                if (#(coords - vector3(icfg.CarThief.CarJack.Pos.x, icfg.CarThief.CarJack.Pos.y, icfg.CarThief.CarJack.Pos.z)) < 1.2) then -- Car Jack
                                    DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.CarJack.Pos.x, icfg.CarThief.CarJack.Pos.y, icfg.CarThief.CarJack.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                    if not hasCarBody and not hasEngine and not hasWheel and not hasEngineHoist then
                                        if not hasCarJack then
                                            ShowFloatingHelpNotification("[~g~E~w~] - Ta Car Jack", vector3(icfg.CarThief.CarJack.Pos.x, icfg.CarThief.CarJack.Pos.y, icfg.CarThief.CarJack.Pos.z + 0.9))
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports.rprogress:Custom({
                                                    Duration = 2000,
                                                    Label = "Du tar Car Jack...",
                                                    DisableControls = {
                                                        Mouse = false,
                                                        Player = true,
                                                        Vehicle = true
                                                    }
                                                })
                                                Citizen.Wait(2000)
                                                hasCarJack = true
                                                addCarJack()
                                            end
                                        elseif hasCarJack then
                                            ShowFloatingHelpNotification("[~g~E~w~] - Lämna tillbaks Car Jack", vector3(icfg.CarThief.CarJack.Pos.x, icfg.CarThief.CarJack.Pos.y, icfg.CarThief.CarJack.Pos.z + 0.9))
                                            if IsControlJustReleased(0, Keys["E"]) then
                                                exports.rprogress:Custom({
                                                    Duration = 2000,
                                                    Label = "Du lämnar tillbaka Car Jack...",
                                                    DisableControls = {
                                                        Mouse = false,
                                                        Player = true,
                                                        Vehicle = true
                                                    }
                                                })
                                                Citizen.Wait(2000)
                                                hasCarJack = false
                                                removeCarJack()
                                            end
                                        end
                                    end
                                elseif (#(coords - vector3(icfg.CarThief.CarJack.Pos.x, icfg.CarThief.CarJack.Pos.y, icfg.CarThief.CarJack.Pos.z)) < 8.0) then -- Car Jack
                                    DrawMarker(icfg.CarThief.Boss.Type, icfg.CarThief.CarJack.Pos.x, icfg.CarThief.CarJack.Pos.y, icfg.CarThief.CarJack.Pos.z - 0.90, 0.0, 0.0, 0.0, 0, 0.0, 0.0, icfg.CarThief.Boss.Size.x, icfg.CarThief.Boss.Size.y, icfg.CarThief.Boss.Size.z, icfg.CarThief.Boss.Color.r, icfg.CarThief.Boss.Color.g, icfg.CarThief.Boss.Color.b, 100, false, true, 2, false, false, false, false)
                                end
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

function PedGuardAnim()
    RequestAnimDict("amb@world_human_stand_guard@male@idle_a")
    while (not HasAnimDictLoaded("amb@world_human_stand_guard@male@idle_a")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(boss, 'amb@world_human_stand_guard@male@idle_a', 'idle_a', 8.0, -8.0, -1, 2, 0, false, false, false)
end

function addBlipGarageSpace()
    for i, v in ipairs(icfg.GarageSpace) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 289)
        SetBlipDisplay(v.blip, 4)
        SetBlipScale(v.blip, 0.6)
        SetBlipAsShortRange(v.blip, true)
        SetBlipColour(v.blip, 35)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(icfg.CarThief.Boss.BlipGarageLabel)
        EndTextCommandSetBlipName(v.blip)
    end
end

function removeBlipGarageSpace()
    for i, v in ipairs(icfg.GarageSpace) do
        RemoveBlip(v.blip)
    end
end

function addBlipParkingSpace()
    for i, v in ipairs(icfg.ParkingSpace) do
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 289)
        SetBlipDisplay(v.blip, 4)
        SetBlipScale(v.blip, 0.6)
        SetBlipAsShortRange(v.blip, true)
        SetBlipColour(v.blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(icfg.CarThief.Boss.BlipParkingLabel)
        EndTextCommandSetBlipName(v.blip)
    end
end

function removeBlipParkingSpace()
    for i, v in ipairs(icfg.ParkingSpace) do
        RemoveBlip(v.blip)
    end
end

function addDoor()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    doors = CreateObject(GetHashKey('prop_car_door_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(doors, ped, GetPedBoneIndex(ped, 56604), 0.1, 0.40, -0.65, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeDoor()
    local ped = PlayerPedId()

    DeleteObject(doors)
    ClearPedTasks(ped)
end

function addBonnet()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    bonnet = CreateObject(GetHashKey('prop_car_bonnet_02'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(bonnet, ped, GetPedBoneIndex(ped, 56604), 0.0, 1.75, 0.45, -105.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeBonnet()
    local ped = PlayerPedId()

    DeleteObject(bonnet)
    ClearPedTasks(ped)
end

function addTrunk()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    trunk = CreateObject(GetHashKey('imp_prop_impexp_trunk_01a'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(trunk, ped, GetPedBoneIndex(ped, 56604), 0.0, 0.40, 0.1, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeTrunk()
    local ped = PlayerPedId()

    DeleteObject(trunk)
    ClearPedTasks(ped)
end

function addWheel()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    wheel = CreateObject(GetHashKey('prop_wheel_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(wheel, ped, GetPedBoneIndex(ped, 56604), -0.08, 0.30, 0.37, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeWheel()
    local ped = PlayerPedId()

    DeleteObject(wheel)
    ClearPedTasks(ped)
end

function addEngine()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    engine = CreateObject(GetHashKey('prop_car_engine_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(engine, ped, GetPedBoneIndex(ped, 56604), 0.1, 2.5, 0.65, 0.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeEngine()
    local ped = PlayerPedId()

    DeleteObject(engine)
end

function addHoist()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    hoist = CreateObject(GetHashKey('prop_engine_hoist'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(hoist, ped, GetPedBoneIndex(ped, 56604), 0.1, 1.0, -0.75, 0.0, -0.5, 180.0, true, true, false, true, 1, true)
end

function removeHoist()
    local ped = PlayerPedId()

    DeleteObject(hoist)
    ClearPedTasks(ped)
end

function addCarJack()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(ped, "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    carjack = CreateObject(GetHashKey('imp_prop_car_jack_01a'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(carjack, ped, GetPedBoneIndex(ped, 56604), -0.10, 1.15, -0.90, 10.0, 0.0, 180.0, true, true, false, true, 1, true)
end

function removeCarJack()
    local ped = PlayerPedId()

    DeleteObject(carjack)
    ClearPedTasks(ped)
end

function ShowFloatingHelpNotification(msg, coords)
    AddTextEntry('FloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('FloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end

function DrawText2Ds(x, y, text, scale)
    SetTextFont(4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0.0, 0.0, 0.0, 0.0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
	SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.025+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
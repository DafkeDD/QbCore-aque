Keys = {
    ['ESC'] = 322, ['F1'] = 288, ['F2'] = 289, ['F3'] = 170, ['F5'] = 166, ['F6'] = 167, ['F7'] = 168, ['F8'] = 169, ['F9'] = 56, ['F10'] = 57,
    ['~'] = 243, ['1'] = 157, ['2'] = 158, ['3'] = 160, ['4'] = 164, ['5'] = 165, ['6'] = 159, ['7'] = 161, ['8'] = 162, ['9'] = 163, ['-'] = 84, ['='] = 83, ['BACKSPACE'] = 177,
    ['TAB'] = 37, ['Q'] = 44, ['W'] = 32, ['E'] = 38, ['R'] = 45, ['T'] = 245, ['Y'] = 246, ['U'] = 303, ['P'] = 199, ['['] = 39, [']'] = 40, ['ENTER'] = 18,
    ['CAPS'] = 137, ['A'] = 34, ['S'] = 8, ['D'] = 9, ['F'] = 23, ['G'] = 47, ['H'] = 74, ['K'] = 311, ['L'] = 182,
    ['LEFTSHIFT'] = 21, ['Z'] = 20, ['X'] = 73, ['C'] = 26, ['V'] = 0, ['B'] = 29, ['N'] = 249, ['M'] = 244, [','] = 82, ['.'] = 81,
    ['LEFTCTRL'] = 36, ['LEFTALT'] = 19, ['SPACE'] = 22, ['RIGHTCTRL'] = 70,
    ['HOME'] = 213, ['PAGEUP'] = 10, ['PAGEDOWN'] = 11, ['DEL'] = 178,
    ['LEFT'] = 174, ['RIGHT'] = 175, ['TOP'] = 27, ['DOWN'] = 173,
}

icfg = {}
icfg.RequiredCops = 2
icfg.CopsRefreshTime = 30000 --MINIMUM 10000ms!!!
icfg.CarsToSteal = {
    [1] = {CarLabel = "Sultan", CarModel = "sultan", Payout = 1000,
    FrontLeftWheelx = -0.85, FrontLeftWheely = 1.3, FrontLeftWheelz = 0.0,
    FrontRightWheelx = 0.85, FrontRightWheely = 1.3, FrontRightWheelz = 0.0,
    RearLeftWheelx = -0.85, RearLeftWheely = -1.3, RearLeftWheelz = 0.0,
    RearRightWheelx = 0.85, RearRightWheely = -1.3, RearRightWheelz = 0.0,

    FrontLeftDoorx = -0.85, FrontLeftDoory = 0.2, FrontLeftDoorz = 0.0,
    FrontRightDoorx = 0.85, FrontRightDoory = 0.2, FrontRightDoorz = 0.0,
    RearLeftDoorx = -0.85, RearLeftDoory = -0.7, RearLeftDoorz = 0.0,
    RearRightDoorx = 0.85, RearRightDoory = -0.7, RearRightDoorz = 0.0,
    FrontDoorx = 0.0, FrontDoory = 2.3, FrontDoorz = 0.0,
    RearDoorx = 0.0, RearDoory = -2.3, RearDoorz = 0.0,

    LeftSidex = -1.8, LeftSidey = 0.0, LeftSidez = 0.0,
    RightSidex = 1.8, RightSidey = 0.0, RightSidez = 0.0,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = 0.0},

    [2] = {CarLabel = "Mesa", CarModel = "mesa", Payout = 1000,
    FrontLeftWheelx = -0.95, FrontLeftWheely = 1.6, FrontLeftWheelz = 0.0,
    FrontRightWheelx = 0.95, FrontRightWheely = 1.6, FrontRightWheelz = 0.0,
    RearLeftWheelx = -0.95, RearLeftWheely = -1.9, RearLeftWheelz = 0.0,
    RearRightWheelx = 0.95, RearRightWheely = -1.9, RearRightWheelz = 0.0,

    FrontLeftDoorx = -0.95, FrontLeftDoory = -0.2, FrontLeftDoorz = 0.0,
    FrontRightDoorx = 0.95, FrontRightDoory = -0.2, FrontRightDoorz = 0.0,
    RearLeftDoorx = -0.95, RearLeftDoory = -1.1, RearLeftDoorz = 0.0,
    RearRightDoorx = 0.95, RearRightDoory = -1.1, RearRightDoorz = 0.0,
    FrontDoorx = 0.0, FrontDoory = 2.5, FrontDoorz = 0.0,
    RearDoorx = 0.0, RearDoory = -3.0, RearDoorz = 0.0,

    LeftSidex = -1.8, LeftSidey = -0.3, LeftSidez = 0.0,
    RightSidex = 1.8, RightSidey = -0.3, RightSidez = 0.0,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = 0.0},

    [3] = {CarLabel = "Dubsta", CarModel = "dubsta", Payout = 1000,
    FrontLeftWheelx = -0.90, FrontLeftWheely = 1.45, FrontLeftWheelz = 0.0,
    FrontRightWheelx = 0.90, FrontRightWheely = 1.45, FrontRightWheelz = 0.0,
    RearLeftWheelx = -0.90, RearLeftWheely = -1.45, RearLeftWheelz = 0.0,
    RearRightWheelx = 0.90, RearRightWheely = -1.45, RearRightWheelz = 0.0,

    FrontLeftDoorx = -0.90, FrontLeftDoory = 0.25, FrontLeftDoorz = 0.0,
    FrontRightDoorx = 0.90, FrontRightDoory = 0.25, FrontRightDoorz = 0.0,
    RearLeftDoorx = -0.90, RearLeftDoory = -0.65, RearLeftDoorz = 0.0,
    RearRightDoorx = 0.90, RearRightDoory = -0.65, RearRightDoorz = 0.0,
    FrontDoorx = 0.0, FrontDoory = 2.2, FrontDoorz = 0.0,
    RearDoorx = 0.0, RearDoory = -2.4, RearDoorz = 0.0,

    LeftSidex = -1.8, LeftSidey = -0.15, LeftSidez = -0.15,
    RightSidex = 1.8, RightSidey = -0.15, RightSidez = -0.15,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = -0.15},

    [4] = {CarLabel = "Emperor", CarModel = "emperor", Payout = 1000,
    FrontLeftWheelx = -0.80, FrontLeftWheely = 1.35, FrontLeftWheelz = -0.2,
    FrontRightWheelx = 0.80, FrontRightWheely = 1.35, FrontRightWheelz = -0.2,
    RearLeftWheelx = -0.80, RearLeftWheely = -1.35, RearLeftWheelz = -0.2,
    RearRightWheelx = 0.80, RearRightWheely = -1.35, RearRightWheelz = -0.2,

    FrontLeftDoorx = -0.80, FrontLeftDoory = 0.0, FrontLeftDoorz = -0.2,
    FrontRightDoorx = 0.80, FrontRightDoory = 0.0, FrontRightDoorz = -0.2,
    RearLeftDoorx = -0.80, RearLeftDoory = -0.75, RearLeftDoorz = -0.2,
    RearRightDoorx = 0.80, RearRightDoory = -0.75, RearRightDoorz = -0.2,
    FrontDoorx = 0.0, FrontDoory = 2.3, FrontDoorz = -0.3,
    RearDoorx = 0.0, RearDoory = -2.4, RearDoorz = -0.3,

    LeftSidex = -1.8, LeftSidey = -0.15, LeftSidez = -0.2,
    RightSidex = 1.8, RightSidey = -0.15, RightSidez = -0.2,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = -0.2},

    [5] = {CarLabel = "Glendale", CarModel = "glendale", Payout = 1000,
    FrontLeftWheelx = -0.85, FrontLeftWheely = 1.55, FrontLeftWheelz = -0.2,
    FrontRightWheelx = 0.85, FrontRightWheely = 1.55, FrontRightWheelz = -0.2,
    RearLeftWheelx = -0.85, RearLeftWheely = -1.25, RearLeftWheelz = -0.2,
    RearRightWheelx = 0.85, RearRightWheely = -1.25, RearRightWheelz = -0.2,

    FrontLeftDoorx = -0.85, FrontLeftDoory = 0.25, FrontLeftDoorz = -0.2,
    FrontRightDoorx = 0.85, FrontRightDoory = 0.25, FrontRightDoorz = -0.2,
    RearLeftDoorx = -0.85, RearLeftDoory = -0.55, RearLeftDoorz = -0.2,
    RearRightDoorx = 0.85, RearRightDoory = -0.55, RearRightDoorz = -0.2,
    FrontDoorx = 0.0, FrontDoory = 2.2, FrontDoorz = -0.2,
    RearDoorx = 0.0, RearDoory = -2.4, RearDoorz = -0.2,

    LeftSidex = -1.8, LeftSidey = -0.15, LeftSidez = -0.3,
    RightSidex = 1.8, RightSidey = -0.15, RightSidez = -0.3,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = -0.3},

    [6] = {CarLabel = "Baller", CarModel = "baller", Payout = 1000,
    FrontLeftWheelx = -0.90, FrontLeftWheely = 1.45, FrontLeftWheelz = 0.1,
    FrontRightWheelx = 0.90, FrontRightWheely = 1.45, FrontRightWheelz = 0.1,
    RearLeftWheelx = -0.90, RearLeftWheely = -1.45, RearLeftWheelz = 0.1,
    RearRightWheelx = 0.90, RearRightWheely = -1.45, RearRightWheelz = 0.1,

    FrontLeftDoorx = -0.90, FrontLeftDoory = 0.25, FrontLeftDoorz = 0.1,
    FrontRightDoorx = 0.90, FrontRightDoory = 0.25, FrontRightDoorz = 0.1,
    RearLeftDoorx = -0.90, RearLeftDoory = -0.65, RearLeftDoorz = 0.1,
    RearRightDoorx = 0.90, RearRightDoory = -0.65, RearRightDoorz = 0.1,
    FrontDoorx = 0.0, FrontDoory = 2.3, FrontDoorz = 0.1,
    RearDoorx = 0.0, RearDoory = -2.4, RearDoorz = 0.1,

    LeftSidex = -1.8, LeftSidey = -0.15, LeftSidez = 0.0,
    RightSidex = 1.8, RightSidey = -0.15, RightSidez = 0.0,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = 0.0},

    [7] = {CarLabel = "Primo", CarModel = "primo", Payout = 1000,
    FrontLeftWheelx = -0.85, FrontLeftWheely = 1.45, FrontLeftWheelz = 0.0,
    FrontRightWheelx = 0.85, FrontRightWheely = 1.45, FrontRightWheelz = 0.0,
    RearLeftWheelx = -0.85, RearLeftWheely = -1.45, RearLeftWheelz = 0.0,
    RearRightWheelx = 0.85, RearRightWheely = -1.45, RearRightWheelz = 0.0,

    FrontLeftDoorx = -0.85, FrontLeftDoory = 0.2, FrontLeftDoorz = 0.0,
    FrontRightDoorx = 0.85, FrontRightDoory = 0.2, FrontRightDoorz = 0.0,
    RearLeftDoorx = -0.85, RearLeftDoory = -0.7, RearLeftDoorz = 0.0,
    RearRightDoorx = 0.85, RearRightDoory = -0.7, RearRightDoorz = 0.0,
    FrontDoorx = 0.0, FrontDoory = 2.4, FrontDoorz = 0.0,
    RearDoorx = 0.0, RearDoory = -2.55, RearDoorz = 0.0,

    LeftSidex = -1.8, LeftSidey = 0.0, LeftSidez = -0.1,
    RightSidex = 1.8, RightSidey = 0.0, RightSidez = -0.1,
    FrontSidex = 0.0, FrontSidey = 3.5, FrontSidez = -0.1},
}

icfg.ParkingSpace = {
    {x = 899.66, y = 3653.13, z = 32.15, h = 90.58, blip, hasParked},
    {x = 899.70, y = 3649.49, z = 32.15, h = 90.58, blip, hasParked},
    {x = 899.87, y = 3645.94, z = 32.15, h = 90.58, blip, hasParked},
}

icfg.GarageSpace = {
    {x = 2129.82, y = 4780.50, z = 40.66, h = 204.64, blip, GarageParked},
    {x = 2133.97, y = 4782.37, z = 40.66, h = 204.64, blip, GarageParked},
    {x = 2139.50, y = 4784.89, z = 40.66, h = 204.64, blip, GarageParked},
}

icfg.CarThief = {
    Boss = {
		Pos   = {x = 917.52, y = 3655.24, z = 32.48, h = 356.41},
        ParkingSpaceWaypoint = {x = 899.66, y = 3653.13, z = 32.15},
        GarageSpaceWaypoint = {x = 2129.82, y = 4780.50, z = 40.66},
        BlipParkingLabel = "[Biltjuv] Parkeringsplats",
        BlipGarageLabel = "[Biltjuv] Garageplats",
        BossCarPos = {x = 913.04, y = 3658.34, z = 32.01, h = 359.56},
        CarSize = {x = 2.0, y = 2.0, z = 1.0},
		Size  = {x = 1.2, y = 1.2, z = 1.0},
		Color = {r = 78, g = 2453, b = 175},
		Type  = 27,
        BossPed = "a_m_y_gay_01",
        AskBossText = {
            [1] = {text = "Yoo, vill du tjäna lite pengar?", ChooseText = "~g~[E]~s~ - Hej, ja visst\n~r~[G]~s~ - Hej, förlåt men nej"},
            [2] = {text = "Wassup bror, behöver du pengar?", ChooseText = "~g~[E]~s~ - Yoo Wassup, jag behöver verkligen pengar\n~r~[G]~s~ - Yoo Wassup, jag behöver ingenting"},
            [3] = {text = "Hej, jag har ett erbjudande som du inte kan tacka nej till", ChooseText = "~g~[E]~s~ - Hej, vad är det här erbjudandet?\n~r~[G]~s~ - Hej, tyvärr måste jag avslå det"},
            [4] = {text = "Yoo, jag har ett bra förslag till dig", ChooseText = "~g~[E]~s~ - Yoo, vad är det här förslaget?\n~r~[G]~s~ - Yoo, jag har inte mycket tid till förslag"},
        },
        BossCarText = {
            [1] = {text = "Coolt, jag behöver en bil ", text2 = ", ta tag i den och kom tillbaka till mig med den"},
            [2] = {text = "Fantastiskt, jag behöver ", text2 = ", när du hittar honom, ta med honom hit"},
            [3] = {text = "Jag har inte mycket tid, hitta", text2 = " och ta honom hit"},
        },
        BossParkedText = {
            [1] = {text = "Okej, nu måste vi demontera delar från denna ", text2 = ". Om du hjälper mig betalar jag dubbelt till dig", ChooseText = "~g~[E]~s~ - Du övertygade mig\n~r~[G]~s~ - Jag har lite i tankarna"},
            [2] = {text = "Du vill hjälpa mig att demontera några delar från ", text2 = ". Om du hjälper mig betalar jag dubbelt till dig", ChooseText = "~g~[E]~s~ - Okej\n~r~[G]~s~ - Nej tack, betala mig nu"},
        },
        BossComingGarageText = {
            [1] = {text = "Du har inte tagit isär alla delar av ", text2 = " än"},
            [2] = {text = "Du är inte klar med ", text2 = " än"},
        },
        EndWorkingText = {
            [1] = {text = "Bra jobbat, här är den utlovade utbetalningen"},
            [2] = {text = "När du behöver pengar igen, kom över"},
        },
    },
    CarJack = {
        Pos = {x = 2138.00, y = 4772.42, z = 40.99},
    },
    Hoist = {
        Pos = {x = 2140.27, y = 4775.89, z = 40.97},
    },
    CarBodyPlace = {
        Pos = {x = 2145.89, y = 4779.68, z = 40.97},
    },
    WheelsPlace = {
        Pos = {x = 2146.06, y = 4773.96, z = 41.03},
    },
    EnginePlace = {
        Pos = {x = 2142.65, y = 4777.85, z = 40.97},
    },
}
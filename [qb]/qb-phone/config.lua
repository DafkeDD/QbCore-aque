Config = Config or {}
Config.BillingCommissions = { -- This is a percentage (0.10) == 10%
    mechanic = 0.10
}
Config.Linux = true -- True if linux
Config.TweetDuration = 24 -- How many hours to load tweets (12 will load the past 12 hours of tweets)
Config.RepeatTimeout = 2000
Config.CallRepeats = 10
Config.OpenPhone = 288
Config.PhoneApplications = {
    ["details"] = {
        app = "details",
        color = "#ffffff",
        color2 = "#a7a7a7",
        icon = "fas fa-info-circle",
        tooltipText = "Detaljer",
        tooltipPos = "top",
        style = "font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 4,
        Alerts = 0,
    },
    ["phone"] = {
        app = "phone",
        color = "#51da80",
        color2 = "#009436",
        icon = "fas fa-phone-volume",
        tooltipText = "Telefonboken",
        tooltipPos = "top",
        style = "font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 2,
        Alerts = 0,
    },
    ["whatsapp"] = {
        app = "whatsapp",
        color = "#8bfc76",
        color2 = "#18d016",
        icon = "fas fa-comment",
        tooltipText = "Meddelande",
        tooltipPos = "top",
        style = "font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 3,
        Alerts = 0,
    },
    ["settings"] = {
        app = "settings",
        color = "#636e72",
        color2 = "#4c5558",
        icon = "fas fa-cog",
        tooltipText = "Inställningar",
        tooltipPos = "top",
        style = "padding-right: .08vh; font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 1,
        Alerts = 0,
    },
    ["mail"] = {
        app = "mail",
        color = "#ffffff",
        color2 = "#a7a7a7",
        icon = "fas fa-envelope",
        tooltipText = "Gmail",
        style = "font-size: 3vh";
        job = false,
        blockedjobs = {},
        slot = 5,
        Alerts = 0,
    },
    ["advert"] = {
        app = "advert",
        color = "#ececec",
        color2 = "#949494",
        icon = "fas fa-ad",
        tooltipText = "Annonser",
        style = "font-size: 2vh";
        job = false,
        blockedjobs = {},
        slot = 7,
        Alerts = 0,
    },
    ["twitter"] = {
        app = "twitter",
        color = "#2eadf7",
        color2 = "#2a95db",
        icon = "fab fa-twitter",
        tooltipText = "Twitter",
        tooltipPos = "top",
        style = "color: #2cabe0; font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 6,
        Alerts = 0,
    },
    ["garage"] = {
        app = "garage",
        color = "#ff8077",
        color2 = "#bb345d",
        icon = "fas fa-car",
        tooltipText = "Fordon",
        style = "font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 8,
        Alerts = 0,
    },
    ["wenmo"] = {
        app = "wenmo",
        color = "#ececec",
        color2 = "#949494",
        icon = "fas fa-ad",
        tooltipText = "Swish",
        job = false,
        blockedjobs = {},
        slot = 11,
        Alerts = 0,
    },
    ["documents"] = {
        app = "documents",
        color = "#f15ac1",
        color2 = "#aa4edd",
        icon = "fas fa-sticky-note",
        tooltipText = "Anteckningar",
        style = "font-size: 3.3vh";
        job = false,
        blockedjobs = {},
        slot = 9,
        Alerts = 0,
    },
    ["houses"] = {
        app = "houses",
        color = "#42a042",
        color2 = "#3f9e4a",
        icon = "fas fa-house-user",
        tooltipText = "Hus",
        style = "font-size: 3vh";
        job = false,
        blockedjobs = {},
        slot = 10,
        Alerts = 0,
    },
    ["jobcenter"] = {
        app = "jobcenter",
        color = "#151515",
        color2 = "#161616",
        icon = "fas fa-id-badge",
        tooltipText = "Arbetsförmedlingen",
        style = "color: #78bdfd; font-size: 2.7vh";
        job = false,
        blockedjobs = {},
        slot = 12,
        Alerts = 0,
    },
    ["lawyers"] = {
        app = "lawyers",
        color = "#26d4ce",
        color2 = "#1e9c98",
        icon = "fas fa-briefcase",
        tooltipText = "Jobbnummer",
        tooltipPos = "bottom",
        style = "font-size: 3vh";
        job = false,
        blockedjobs = {},
        slot = 13,
        Alerts = 0,
    },
    ["casino"] = {
        app = "casino",
        color = "#000100",
        color2 = "#000100",
        icon = "fas fa-gem",
        tooltipText = "Casino",
        tooltipPos = "bottom",
        style = "font-size: 2.7vh";
        job = false,
        blockedjobs = {},
        slot = 17,
        Alerts = 0,
    },
    ["calculator"] = {
        app = "calculator",
        color = "#c94001",
        color2 = "#9c3100",
        icon = "fas fa-calculator",
        tooltipText = "Kalkylator",
        tooltipPos = "bottom",
        style = "font-size: 2.5vh";
        job = false,
        blockedjobs = {},
        slot = 14,
        Alerts = 0,
    },
    ["gallery"] = {
        app = "gallery",
        color = "#189ec0",
        color2 = "#14819c",
        icon = "fas fa-images",
        tooltipText = "Gallery",
        tooltipPos = "bottom",
        style = "font-size: 2.7vh";
        job = false,
        blockedjobs = {},
        slot = 15,
        Alerts = 0,
    },
    ["bank"] = {
        app = "bank",
        color = "#9c88ff",
        color2 = "#8070d5",
        icon = "fas fa-file-contract",
        tooltipText = "Fakturor",
        style = "font-size: 2.7vh";
        job = false,
        blockedjobs = {},
        slot = 16,
        Alerts = 0,
    },
    ["meos"] = {
        app = "meos",
        color = "#004682",
        color2 = "#00325c",
        icon = "fas fa-ad",
        tooltipText = "Polisen",
        job = "police",
        blockedjobs = {},
        slot = 18,
        Alerts = 0,
    },

    






    -- ["mybank"] = {
    --     app = "mybank",
    --     color = "#a9fd78",
    --     color2 = "#86c95f",
    --     icon = "fas fa-dollar-sign",
    --     tooltipText = "My Bank",
    --     style = "color: black; font-size: 2.7vh";
    --     job = false,
    --     blockedjobs = {},
    --     slot = 20,
    --     Alerts = 0,
    -- },
    -- ["camera"] = {
    --     app = "camera",
    --     color = "#AC1D2C",
    --     color2 = "#25d366",
    --     icon = "fas fa-camera",
    --     tooltipText = "Camera",
    --     tooltipPos = "bottom",
    --     job = false,
    --     blockedjobs = {},
    --     slot = 15,
    --     Alerts = 0,
    -- },
}
Config.MaxSlots = 28

Config.StoreApps = {
    ["territory"] = {
        app = "territory",
        color = "#353b48",
        icon = "fas fa-globe-europe",
        tooltipText = "Territorium",
        tooltipPos = "right",
        style = "";
        job = false,
        blockedjobs = {},
        slot = 17,
        Alerts = 0,
        password = true,
        creator = "QBCore",
        title = "Territory",
    },
}

Config.JobCenter = {
    [1] = {
        job = "trucker",
        label = "Lastbilschaufför",
        Coords = {141.18, -3204.59},
    },
    [2] = {
        job = "taxi",
        label = "Taxichaufför",
        Coords = {909.49, -177.24},
    },
    [3] = {
        job = "garbage",
        label = "Sopgubbe",
        Coords = {-313.85, -1522.82},
    },
}
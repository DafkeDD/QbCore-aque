local Translations = {
    error = {
        no_chemicals = "Du saknar kemikalier!",
        no_trimming_scissors = "Du behöver trimma sax för det!",
        no_coca_leaf = "Du behöver kokainblad!",
        no_bakingsoda_amount = "Du behöver %{value} bakpulver!",
        no_bakingsoda = "Du behöver bakpulver!",
        no_cokain_amount = "Du behöver %{value} kokain!",
        no_cokain = "Du kommer att behöva kokain!",
        not_all_items = "Du har inte de föremål du behöver!",
        already_processing = "Du bearbetar redan något!",
        not_enough_small_bricks = "Du behöver %{value} små paket kokain!",
        no_poppy_resin = "Du har inte vallmoharts!",
        no_lsa = "Du saknar LSA!",
        no_thionyl_chloride = "Du saknar tionylklorid!",
        too_far = "Bearbetningen avbröts eftersom du lämnade området!",
        no_sulfuric_acid = "Du saknar saltsyra!",
        no_hydrochloric_acid = "Du saknar svavelsyra!",
        no_sodium_hydroxide = "Du saknar natriumhydroxid!",
        no_liquidmix = "Du saknar flytande kemisk blandning!",
        no_chemicalvapor = "Du saknar kemiska ångor!",
        no_methtray = "Du saknar en meth-bricka!",
        no_cannabis = "Du saknar cannabis!",
        no_marijuhana = "Du saknar marijuana!",
        enough_temp = "Temperaturen är redan okej!",
        temp_too_low = "Temperaturen var för låg. Blandningen är nu oanvändbar!",
        temp_too_high = "Temperaturen var för hög. Blandningen är nu oanvändbar!",
    },
    success = {
        temp_up = "Höjd temperatur!",
        temp_down = "Sänkt temperatur!",
        hydrochloric_acid = "Saltsyraprocessen var framgångsrik!",
        sodium_hydroxide = "Natriumhydroxidprocessen lyckades!",
        sulfuric_acid = "Svavelsyraprocessen var framgångsrik!",
        lsa = "LSA-processen var framgångsrik!",
        coke = "Kokainblad har bearbetats Lyckas!",
        coke_small_brick = "Kokainpulver har skurits!",
        coke_brick = "Kokainpaket pressat för distribution!",
        heroin = "Heroinet har bearbetats Lyckas!",
        thionyl_chloride = "Tionylklorid har bearbetats Lyckas!",
        meth = "Lyckas gjort meth!",
        chemicals = "Lyckas insamlade kemikalier!",
        coca_leaf = "Framgångsrik insamlad kokablad!",
        poppyresin = "Framgångsrik insamlad opiumvallmo!",
        lsd = "Lyckas producerad LSD!",
        cannabis = "Lyckas samlat in cannabis!",
        marijuana = "Framgångsrik producerad marijuana!",
        joint = "Du har Lyckas rullat en joint!",
    },
    info = {

    },
    progressbar = {
        processing = "Bearbeta...",
        packing = "Packar...",
        collecting = "Samlar......",
        pickup_chemicals = "Plocka upp kemikalier...",
        temp_up = "Höj temperaturen",
        temp_down = "Lägre temperatur",
        rolling_joint = "Rullfog",
    },
    items = {
        saltsyra = "Saltsyra",
        sodium_hydroxide = "Natriumhydroxid",
        sulfuric_acid = "Svavelsyra",
        lsa = "LSA",
        coca_leaf = "Coca leaf",
        trimming_scissors = "Klippsax",
    },
    menu = {
        chemMenuHeader = "Kemi meny",
        chemicals = "x1 Kemikalier",
        close = "Stäng",
        closetxt = "Stäng meny",
    },
    target = {
        process_thionyl_chloride = "Bearbeta tionylklorid",
        talk_to_walter = "Prata med Walter",
        talk_to_draco = "Prata med Draco",
        chemmenu = "Kemiska föreningar",
        methprocess = "Laga något underbart och blått",
        methtempup = "Höj temperaturen",
        methtempdown = "Lägre temperatur",
        bagging = "Förpackning",
        keypad = "Lämna labbet",
        cokeleafproc = "Bearbeta kokablad",
        cokepowdercut = "Förfina",
        weedproces = "Klippning och torkning",
        heroinproces = "Processblandning",
        heroinproc = "Bearbeta vallmofrön",
        pickCocaLeaves = "Samla kokablad",
        pickHeroin = "Samla vallmoharts",
        pickWeed = "Samla cannabis",
        pickSodium = "Plocka upp natriumfat",
        pickSulfuric = "Plocka upp svaveltunnan",
        pickChemicals = "Plocka upp kemisk trumma",
        hydrochloricacid = "Plocka upp saltsyratrumman",
    },
    drawtext = {
        process_lsd = "~g~E~w~ - Bearbeta LSD",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
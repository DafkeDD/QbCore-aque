local Translations = {
    error = {
        license_already = 'Spelaren har redan en licens',
        error_license = 'Spelaren har inte den licensen',
        no_camera = 'Kameran finns inte',
        blood_not_cleared = 'Blod INTE rensat',
        bullet_casing_not_removed = 'Kulhöljen har INTE tagits bort',
        none_nearby = 'Ingen i närheten!',
        canceled = 'Avbrytet..',
        time_higher = 'Tiden måste vara högre än 0',
        amount_higher = 'Beloppet måste vara högre än 0',
        vehicle_cuff = 'Du kan inte bomma någon i ett fordon',
        no_cuff = 'Du har inga handbojor på dig',
        no_impound = 'Det finns inga beslagtagna fordon',
        no_spikestripe = 'Kan inte placera fler spikremsor',
        error_license_type = 'Ogiltig licenstyp',
        rank_license = 'Du är inte tillräckligt hög för att bevilja en licens',
        revoked_license = 'Du har fått en licens återkallad',
        rank_revoke = 'Du är inte tillräckligt hög för att återkalla en licens',
        on_duty_police_only = 'Endast för jourhavande polis',
        vehicle_not_flag = 'Fordonet inte flaggat',
        not_towdriver = 'Inte en bärgningsbilschaufför',
        not_lawyer = 'Personen är inte en advokat',
        no_anklet = 'Den här personen har ingen fotleds på.',
        have_evidence_bag = 'Du måste ha en tom bevispåse med dig',
        no_driver_license = 'Inget körkort',
        not_cuffed_dead = 'Civiler är inte fängslade eller döda',
    },
    success = {
        uncuffed = 'Du har blivit frikopplad',
        granted_license = 'Du har fått en licens',
        grant_license = 'Du har beviljat en licens',
        revoke_license = 'Du återkallade en licens',
        tow_paid = 'Du fick 500 USD betalt',
        blood_clear = 'Blod rensat',
        bullet_casing_removed = 'Kulhöljen har tagits bort...',
        anklet_taken_off = 'Din fotledsspårare har tagits av.',
        Take_anklet_from = 'Du tog bort %{firstname} %{lastname} tracker',
        put_anklet = 'Du sätter på dig en fotledsspårare.',
        put_anklet_on = 'Du sätter på en fotledsspårare på %{firstname} %{lastname}',
        vehicle_flagged = 'Fordon %{plate} har flaggats för %{reason}',
        impound_vehicle_removed = 'Fordon som tagits ur beslag!',
    },
    info = {
        mr = 'Mr.',
        mrs = 'Mrs.',
        impound_price = 'Pris som spelaren betalar för att få fordonet ur beslag (kan vara 0)',
        plate_number = 'Licensskyltnummer',
        flag_reason = 'Skäl till att flagga fordon',
        camera_id = 'Kamera-ID',
        callsign_name = 'Namn på din anropssignal',
        poobject_object = 'Objekttyp att skapa eller \'radera\' att radera',
        player_id = 'Spelarens ID',
        citizen_id = 'Medborgar-ID för spelare',
        dna_sample = 'DNA-prov',
        jail_time = 'Dags de måste vara i fängelse',
        jail_time_no = 'Fängelsetiden måste vara högre än 0',
        license_type = 'Licenstyp (förare/vapen)',
        ankle_location = 'Vristspårningsplats',
        cuff = 'Du har blivit fängslad!',
        cuffed_walk = 'Du är fastlåst, men du kan gå',
        vehicle_flagged = 'Fordonet %{vehicle} är flaggat för: %{reason}',
        unflag_vehicle = 'Fordonet %{vehicle} är inte flaggat',
        tow_driver_paid = 'Du betalade bärgningsbilschauffören',
        paid_lawyer = 'Du betalade en advokat',
        vehicle_taken_depot = 'Fordon som tas till depån för $%{price}',
        vehicle_seized = 'Fordon beslagtagit',
        stolen_money = 'Du har stulit $%{stolen}',
        cash_robbed = 'Du har blivit bestulen på $%{money}',
        driving_license_confiscated = 'Ditt körkort har beslagtagits',
        cash_confiscated = 'Dina kontanter konfiskerades',
        being_searched = 'Du genomsöks',
        cash_found = 'Hittade $%{cash} på den civila',
        sent_jail_for = 'Du skickade personen till fängelse i %{time} månader',
        fine_received = 'Du fick böter på $%{fine}',
        blip_text = 'Polislarm - %{value}',
        jail_time_input = 'Fängelsetid',
        submit = 'Skicka in',
        time_months = 'Tid i månader',
        bill = 'Faktura',
        amount = 'Summa',
        police_plate = 'POLISEN', --Should only be 4 characters long
        vehicle_info = 'Motor: %{value} % | Bränsle: %{value2} %',
        evidence_stash = 'Bevis Förråd | %{värde}',
        slot = 'Förråd nr. (1,2,3)',
        current_evidence = '%{värde} | Låda %{value2}',
        on_duty = '[E] - Gå i tjänst',
        off_duty = '[E] - Gå ut tjänst',
        onoff_duty = '~g~I~s~/~r~Ur~s~ Tjänst',
        stash = 'Förråd %{value}',
        delete_spike = '[~r~E~s~] Ta bort Spike Strip',
        close_camera = 'Stäng kamera',
        bullet_casing = '[~g~G~s~] Bullet Casing %{value}',
        casing = 'Kula hölje',
        blood = 'Blod',
        blood_text = '[~g~G~s~] Blod %{value}',
        fingerprint_text = '[G] Fingeravtryck',
        fingerprint = 'Fingeravtryck',
        store_heli = '[E] Store Helikopter',
        take_heli = '[E] Ta Helikopter',
        impound_veh = '[E] - Beslagta fordon',
        store_veh = '[E] - Butiksfordon',
        armory = 'Skottsäker Väst',
        enter_armory = '[E] Skottsäker Väst',
        finger_scan = 'Fingeravtrycksskanning',
        scan_fingerprint = '[E] Skanna fingeravtryck',
        trash = 'Soptunna',
        trash_enter = '[E] Soptunna',
        stash_enter = '[E] Gå in i skåpet',
        target_location = 'Platsen för %{firstname} %{lastname} är markerad på din karta',
        anklet_location = 'Vistlänkplats',
        new_call = 'Nytt samtal',
        officer_down = 'Officer %{efternamn} | %{callsign} ner'
    },
    evidence = {
        red_hands = 'Röda händer',
        wide_pupils = 'Breda elever',
        red_eyes = 'Röda ögon',
        weed_smell = 'Luktar som ogräs',
        gunpowder = 'Krut i kläder',
        chemicals = 'luktar kemikalier',
        heavy_breathing = 'Andas tungt',
        sweat = 'Svettas mycket',
        handbleed = 'Blod på händerna',
        confused = 'Förvirrad',
        alcohol = 'Luktar alkohol',
        heavy_alcohol = 'Luktar väldigt mycket alkohol',
        agitated = 'Upprörd - tecken på metamvändning',
        serial_not_visible = 'Serienummer syns inte...',
    },
    menu = {
        garage_title = 'Polis Fordon',
        close = '⬅ Stäng',
        impound = 'Beslagta fordon',
        pol_impound = 'Polisen beslagta',
        pol_garage = 'Polisverkstad',
        pol_armory = 'Police Armory',
    },
    email = {
        sender = 'Centrala uppbördsmyndigheten',
        subject = 'Inkasso',
        message = 'Bästa %{value}. %{value2}, <br /><br />Central Judicial Collection Agency (CJCA) debiterade de böter du fått från polisen.<br />Det är <strong>$%{value3}</strong> återkallat från ditt konto.<br /><br />Vänliga hälsningar,<br />Mr. I.K. Graai',
    },
    commands = {
        place_spike = 'Placera Spike Strip (Endast Polis)',
        license_grant = 'Ge en licens till någon',
        license_revoke = 'Återkalla en licens från någon',
        place_object = 'Placera/ta bort ett objekt (Endast Polis)',
        cuff_player = 'Manschettspelare (Endast Polis)',
        escort = 'Escorta person',
        callsign = 'Ge dig själv en anropssignal',
        clear_casign = 'Rensa området från höljen (Endast Polis)',
        jail_player = 'Fängelsespelare (Endast Polis)',
        unjail_player = 'Avsluta spelare (Endast Polis)',
        clearblood = 'Rensa området från blod (Endast Polis)',
        seizecash = 'Beslagta kontanter (Endast Polis)',
        softcuff = 'Mjuk manschett (Endast Polis)',
        camera = 'Visa säkerhetskamera (Endast Polis)',
        flagplate = 'Flagga en skylt (Endast Polis)',
        unflagplate = 'Avflagga en skylt (Endast Polis)',
        plateinfo = 'Kör en plåt (Endast Polis)',
        depot = 'Beslag med pris (Endast Polis)',
        impound = 'Beslagta ett fordon (Endast Polis)',
        paytow = 'Betala bärgningsförare (Endast Polis)',
        paylawyer = 'Löneadvokat (Endast Polis, Domare)',
        anklet = 'Fäst spårningslänk (Endast Polis)',
        ankletlocation = 'Få platsen för en persons fotled',
        removeanklet = 'Ta bort spårningslänk (Endast Polis)',
        drivinglicense = 'Beslagta körkort (Endast Polis)',
        takedna = 'Ta ett DNA-prov från en person (tom bevispåse behövs) (Endast Polisen)',
        police_report = 'Polisrapport',
        message_sent = 'Meddelande som ska skickas',
        civilian_call = 'Medborgar Samtal',
        emergency_call = 'Nytt 112-samtal',
    },
    progressbar = {
        blood_clear = 'Rensar blod...',
        bullet_casing = 'Ta bort kulhöljen..',
        robbing = 'Råna person...',
        place_object = 'Placerar objekt..',
        remove_object = 'Tar bort objekt..',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

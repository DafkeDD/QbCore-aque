local Translations = {
    error = {
        ["cancled"] = "Abryten",
        ["no_truck"] = "Du har inget fordon!",
        ["not_enough"] = "Inte tillräckligt med pengar (%{value} required)",
        ["too_far"] = "Du är för långt bort från avlämningsstället",
        ["early_finish"] = "På grund av tidig avslutning (Slutförd: %{completed} Totalt: %{total}), kommer din insättning inte att returneras.",
        ["never_clocked_on"] = "Du klockade aldrig på!",
    },
    success = {
        ["clear_routes"] = "Rensade användarnas rutter de hade %{value} rutter lagrade",
        ["pay_slip"] = "Du fick $%{total}, din lönebesked %{deposit} har betalats till ditt bankkonto!",
    },
    info = {
        ["payslip_collect"] = "[E] - Lönebesked",
        ["lönebesked"] = "Lönebesked",
        ["not_enough"] = "Du har inte tillräckligt med pengar för insättningen.. Insättningskostnaderna är $%{value}",
        ["deposit_paid"] = "Du har betalat $%{value} insättning!",
        ["no_deposit"] = "Du har ingen deposition betalad på detta fordon..",
        ["truck_returned"] = "Lastbilen återlämnad, hämta din lönebesked för att få din lön och insättningen tillbaka!",
        ["bags_left"] = "Det finns fortfarande %{value} påsar kvar!",
        ["bags_still"] = "Det finns fortfarande %{value} påsar där borta!",
        ["all_bags"] = "Alla soppåsar är klara, fortsätt till nästa plats!",
        ["depot_issue"] = "Det var ett problem vid depån, vänligen återvänd omedelbart!",
        ["done_working"] = "Du har jobbat färdigt! Gå tillbaka till depån.",
        ["started"] = "Du har börjat arbeta, plats markerad på GPS!",
        ["grab_garbage"] = "[E] Ta en sopsäck",
        ["stand_grab_garbage"] = "Stå här för att ta en sopsäck.",
        ["dispose_garbage"] = "[E] Kassera soppåsen",
        ["progressbar"] = "Lägger påsen i trashmaster ..",
        ["garbage_in_truck"] = "Lägg påsen i din lastbil..",
        ["stand_here"] = "Stå här..",
        ["found_crypto"] = "Du hittade en kryptopinne på golvet",
        ["payout_deposit"] = "(+ $%{value} insättning)",
        ["store_truck"] = "[E] - Butikssopbil",
        ["get_truck"] = "[E] - Sopbil",
    },
    warning = {},
}
Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

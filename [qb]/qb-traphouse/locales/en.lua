local Translations = {
    error = {
        not_enough = "Du har inte tillräckligt med kontanter..",
        no_slots = "Det finns inga platser kvar",
        occured = "Fel har uppstått",
        have_keys = "Denna person har redan nycklar",
        p_have_keys = "%{value} Den här personen har redan nycklar",
        not_owner = "Du äger inte en fällstuga eller är inte ägaren",
        not_online = "Denna person är inte i staden",
        no_money = "Det finns inga pengar i skåpet",
        incorrect_code = "Denna kod är felaktig",
        up_to_6 = "Du kan ge upp till 6 personer tillgång till fällhuset!",
        cancelled = "Förvärv inställda",
    },
    success = {
        added = "%{value} Har lagts till i Traphouse!",
    },
    info = {
        enter = "Gå in i Traphouse",
        give_keys = "Ge nycklar till Traphouse",
        pincode = "Traphouse pinkod: %{value}",
        taking_over = "Tar över",
        pin_code_see = "~b~G~w~ - Se pinkod",
        pin_code = "Pinkod: %{value}",
        multikeys = "~b~/multikeys~w~ [id] - Att ge nycklar",
        take_cash = "~b~E~w~ - Ta kontanter (~g~$%{value}~w~)",
        inventory = "~b~H~w~ - Visa Inventory",
        take_over = "~b~E~w~ - Ta över (~g~5000 KR~w~)",
        leave = "~b~E~w~ - Lämna Traphouse",
    },
    targetInfo = {
        options = "Traphouse-alternativ",
        enter = "Gå in i Traphouse",
        give_keys = "Ge nycklar till Traphouse",
        pincode = "Traphouse pinkod: %{value}",
        taking_over = "Ta Över",
        pin_code_see = "Se pinkod",
        pin_code = "Pinkod: %{value}",
        multikeys = "Ge nycklar (använd /multikey [id])",
        take_cash = "Ta kontanter ($%{value})",
        inventory = "Visa Inventory",
        take_over = "Ta Över (5000 KR)",
        leave = "Lämna Traphouse",
        close_menu = "⬅ Stäng Meny",
    }
}

    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })    


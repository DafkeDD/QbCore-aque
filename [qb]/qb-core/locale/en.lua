local Translations = {
    error = {
        not_online = 'Spelaren är inte online',
        wrong_format = 'Felaktigt format',
        missing_args = 'Alla argument har inte angetts (x, y, z)',
        missing_args2 = 'Alla argument måste fyllas i!',
        no_access = 'Inte tillgång till detta kommando',
        company_too_poor = 'Din arbetsgivare är fattig',
        item_not_exist = 'Föremålet finns inte',
        too_heavy = 'Inventory är fullt',
        duplicate_license = 'Duplicate Rockstar License Found',
        no_valid_license  = 'No Valid Rockstar License Found',
        not_whitelisted = 'You\'re not whitelisted for this server'
    },
    success = {},
    info = {
        received_paycheck = 'Du fick din lönecheck på $%{value}',
        job_info = 'Jobb: %{value} | Grad: %{value2} | Tjänst: %{value3}',
        gang_info = 'Gäng: %{value} | Grad: %{value2}',
        on_duty = 'Du är i tjänst!',
        off_duty = 'Du är inte i tjänst!',
        checking_ban = 'Hejsan %s. Vi kollar om du är bannad.',
        join_server = 'Välkommen %s till {Server Name}.',
        checking_whitelisted = 'Hejsan %s. Vi kollar dina behörigheter.'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

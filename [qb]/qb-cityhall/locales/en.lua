local Translations = {
    error = {
        not_in_range = 'För långt bort ifrån Stads Hallen'
    },
    success = {
        recived_license = 'Du har fått din %{value} för 50 KR'
    },
    info = {
        bilp_text = 'Stads Hallen',
        city_services_menu = '~g~E~w~ - Stads Hallen',
        id_card = 'ID Kort',
        driver_license = 'Körkort',
        weaponlicense = 'Vapenlicense',
        new_job = 'Grattis till ditt nya jobb! (%{job})'
    },
    email = {
        mr = 'Mr',
        mrs = 'Mrs',
        sender = 'Township',
        subject = 'Begäran om körlektioner',
        message = 'Hej %{gender} %{efternamn}<br /><br />Vi har precis fått ett meddelande om att någon vill ta körlektioner<br />Om du är villig att undervisa, vänligen kontakta oss:<br />Namn : <strong>%{firstname} %{efternamn}</strong><br />Telefonnummer: <strong>%{phone}</strong><br/><br/>Vänliga hälsningar,<br />Township Los Santos'
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

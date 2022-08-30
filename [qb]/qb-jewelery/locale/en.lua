local Translations = {
    error = {
        fingerprints = 'Du har lämnat ett fingeravtryck på glaset',
        minimum_police = 'Minst %{value} polis behövs',
        wrong_weapon = 'Ditt vapen är inte tillräckligt starkt..',
        to_much = 'Du har för mycket i fickan',
    },
    success = {},
    info = {
        progressbar = 'Slå sönder vitrinen',
    },
    general = {
        target_label = "Krossa vitrinen",
        drawtextui_grab = '[E] Slå sönder displayen',
        drawtextui_broken = 'Vitrinskåpet är trasigt'
    }
}

Lang = Locale:new({phrases = Translations})

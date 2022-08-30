local Translations = {
    error = {
        to_far_from_door = 'Du är för långt bort ifrån dörrklockan',
        nobody_home = 'Det finns ingen hemma...',
        nobody_at_door = 'Det är tyvär ingen vid dörren...'
    },
    success = {
        receive_apart = 'Du fick din lägenhet',
        changed_apart = 'Du flyttade',
    },
    info = {
        at_the_door = 'Någon är utanför dörren!',
    },
    text = {
        options = '[E] Lägenhets Alternativ',
        enter = 'Gå in i Lägenheten',
        ring_doorbell = 'Ring på',
        logout = 'Logga ut',
        change_outfit = 'Byt Outfit',
        open_stash = 'Öppna Förråd',
        move_here = 'Flytta Hit',
        open_door = 'Öppna Dörr',
        leave = 'Lämna Lägenhet',
        close_menu = '⬅ Stäng Meny',
        tennants = 'Hyresgäster',
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

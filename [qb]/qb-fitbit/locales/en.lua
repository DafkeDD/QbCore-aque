local Translations = {
    success = {
        hunger_set = 'Apple Klocka: Hungrig varning suttigt till %{hungervalue}%',
        thirst_set = 'Apple Klocka: Törstig varning suttigt till %{thirstvalue}%',
    },
    warning = {
        hunger_warning = 'Din hunger är %{hunger}%',
        thirst_warning = 'Din törst är %{thirst}%'
    },
    info = {
        fitbit = 'Apple '
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
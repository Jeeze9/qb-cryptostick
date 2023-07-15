local Translations = {
    error = {
        you_dont_have_a_cryptostick = 'You don\'t have a cryptostick',
        cryptostick_malfunctioned = 'Cryptostick malfunctioned'
    },
    success = {
        you_have_exchanged_your_cryptostick_for = 'You have exchanged your Cryptostick for: %{amount} QBit(s)'
    },
    text = {
        enter_usb = '[E] - Enter USB',
        system_is_rebooting = 'System is rebooting - %{rebootInfoPercentage} %',

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})

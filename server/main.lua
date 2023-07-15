local QBCore = exports['qb-core']:GetCoreObject()

--Events
RegisterServerEvent('qb-cryptostick:server:ExchangeFail', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        Player.Functions.RemoveItem("cryptostick", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        TriggerClientEvent('QBCore:Notify', src, Lang:t('error.cryptostick_malfunctioned'), 'error')
    end
end)

RegisterServerEvent('qb-cryptostick:server:Rebooting', function(state, percentage)
    Crypto.Exchange.RebootInfo.state = state
    Crypto.Exchange.RebootInfo.percentage = percentage
end)

RegisterServerEvent('qb-cryptostick:server:GetRebootState', function()
    local src = source
    TriggerClientEvent('qb-cryptostick:client:GetRebootState', src, Crypto.Exchange.RebootInfo)
end)

RegisterServerEvent('qb-cryptostick:server:SyncReboot', function()
    TriggerClientEvent('qb-cryptostick:client:SyncReboot', -1)
end)

RegisterServerEvent('qb-cryptostick:server:ExchangeSuccess', function(LuckChance)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local ItemData = Player.Functions.GetItemByName("cryptostick")

    if ItemData ~= nil then
        local LuckyNumber = math.random(1, 10)
        local DeelNumber = 1000000
        local Amount = (math.random(611111, 1599999) / DeelNumber)
        if LuckChance == LuckyNumber then
            Amount = (math.random(1599999, 2599999) / DeelNumber)
        end

        Player.Functions.RemoveItem("cryptostick", 1)
        exports['qb-phone']:AddCrypto(src, "shung", Amount)
        TriggerClientEvent('QBCore:Notify', src,  "You have exchanged the Cryptostick for some Shungite.", "success", 5000)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["cryptostick"], "remove")
        -- TriggerClientEvent('qb-phone:client:AddTransaction', src, Player, {},  Lang:t('credit.there_are_amount_credited',{amount = Amount}), "Credit")
    end
end)

-- Callbacks

QBCore.Functions.CreateCallback('qb-cryptostick:server:HasSticky', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local Item = Player.Functions.GetItemByName("cryptostick")

    if Item ~= nil then
        cb(true)
    else
        cb(false)
    end
end)


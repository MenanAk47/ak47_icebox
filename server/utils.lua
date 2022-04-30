ESX = nil
TriggerEvent(Config.SharedObjectName, function(obj) ESX = obj end)

TriggerEvent('esx_society:registerSociety', 'icebox', 'icebox', 'society_icebox', 'society_icebox', 'society_icebox', {type = 'private'})
TriggerEvent('society:registerSociety', 'icebox', 'icebox', 'society_icebox', 'society_icebox', 'society_icebox', {type = 'private'})

function AddInventoryItem(xPlayer, item, amount)
    xPlayer.addInventoryItem(item, amount)
end

function PlayerCanPay(xPlayer, price)
    local money = xPlayer.getAccount('bank').money
    if money >= price then
        return true
    else
        return false
    end
end

function PayTheBill(xPlayer, price)
    xPlayer.removeAccountMoney('bank', price)
end

function getSocietyMoney()
    local money = nil
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_icebox', function(account)
       money = account.money
    end)
    while money == nil do Citizen.Wait(0) end
    return money
end

function addSocietyMoney(money)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_icebox', function(account)
       account.addMoney(money)
    end)
end

function removeSocietyMoney(money)
    TriggerEvent('esx_addonaccount:getSharedAccount', 'society_icebox', function(account)
       account.removeMoney(money)
    end)
end

function CanCarryItem(xPlayer, item, count)
    if Config.CheckCanCarryItem then
        if type(xPlayer.canCarryItem) == "table" or type(xPlayer.canCarryItem) == "function" then
            if xPlayer.canCarryItem(item, count) then
                return true
            else
                TriggerClientEvent('ak47_icebox:notify', xPlayer.source, _U('cannot_carry'))
                return false
            end
        else
            local xItem = xPlayer.getInventoryItem(item)
            if xItem.limit ~= -1 and (xItem.count + count) > xItem.limit then
                TriggerClientEvent('ak47_icebox:notify', xPlayer.source, _U('cannot_carry'))
                return false
            else
                return true
            end
        end
    else
        return true
    end
end
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('bts_menu:buy')
AddEventHandler('bts_menu:buy', function(price, item, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)
    		xPlayer.addInventoryItem(item, 1)
        	TriggerClientEvent('esx:showNotification', source, "Vous avez acheté 1 ~g~" .. label .. "~w~ pour ~g~" .. price .. "$ !", "", 1)
     else
          	TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous", "", 1)    
    end
end)




RegisterServerEvent('bts_menu:buyweapon')
AddEventHandler('bts_menu:buyweapon', function(price, weapon, label)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer.getMoney() >= price then
		xPlayer.removeMoney(price)
    	xPlayer.addWeapon(weapon, 120) -- 42 = le nombre de balles donnés
		TriggerClientEvent('esx:showNotification', source, "Vous avez acheté 1 ~g~" .. label .. "~w~ pour ~g~" .. price .. "$ !", "", 1)

    else
		TriggerClientEvent('esx:showNotification', source, "Pas assez ~r~d'argent sur vous", "", 1) 
    end
end)





RegisterServerEvent('astral:uhotenue')
AddEventHandler('astral:uhotenue', function()

	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(200)

end)

ESX.RegisterServerCallback('astral:checkMoney', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.get('money') >= 200 then
		cb(true)
	else
		cb(false)
	end

end)

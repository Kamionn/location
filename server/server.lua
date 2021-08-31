ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Location voiture / moto

RegisterNetEvent('Klocation:blista')
AddEventHandler('Klocation:blista', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(500)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué une voiture pour ~b~500$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:panto')
AddEventHandler('Klocation:panto', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(700)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué une voiture pour ~b~700$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:faggio')
AddEventHandler('Klocation:faggio', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(200)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un scooter pour ~b~200$~w~ Merci et Bon Voyage !")
end)

-- Location Avion

RegisterNetEvent('Klocation:Cuban800')
AddEventHandler('Klocation:Cuban800', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(2500)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un avion pour ~b~2500$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:dodo')
AddEventHandler('Klocation:dodo', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(3500)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un avion pour ~b~3500$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:luxor')
AddEventHandler('Klocation:luxor', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(15000)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un avion pour ~b~15000$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:nimbus')
AddEventHandler('Klocation:nimbus', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(20000)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un avion pour ~b~20000$~w~ Merci et Bon Voyage !")
end)

-- Location Bateau

RegisterNetEvent('Klocation:suntrap')
AddEventHandler('Klocation:suntrap', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(5000)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un bateau pour ~b~5000$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:squalo')
AddEventHandler('Klocation:squalo', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(7000)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un bateau pour ~b~7000$~w~ Merci et Bon Voyage !")
end)

RegisterNetEvent('Klocation:Submersible')
AddEventHandler('Klocation:Submersible', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getMoney()
	xPlayer.removeMoney(12000)
	TriggerClientEvent('esx:showNotification', source, "Vous avez loué un bateau pour ~b~12000$~w~ Merci et Bon Voyage !")
end)

-- By kamion #1323
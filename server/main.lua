local ESX = nil
 
TriggerEvent('esx:getSharedObject', function( obj ) ESX = obj end)
 
-- Removes the Item

RegisterServerEvent('bs_carcolour:removeItem')
AddEventHandler('bs_carcolour:removeItem', function(_source, removedItem)
	local source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	
	print(xPlayer.removeInventoryItem(removedItem, 1))
	xPlayer.showNotification('Used: '.. removedItem .. ' Item')
end)

-- Change the row 'cargreen' to your database item you want to have
 
ESX.RegisterUsableItem('cargreen', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'greencolour')
end)
 
ESX.RegisterUsableItem('carred', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'redcolour')
end)

ESX.RegisterUsableItem('carblue', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'bluecolour')
end)

ESX.RegisterUsableItem('caryellow', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'yellowcolour')
end)

ESX.RegisterUsableItem('carblack', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'blackcolour')
end)

ESX.RegisterUsableItem('carwhite', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'whitecolour')
end)

ESX.RegisterUsableItem('carbrown', function( source )
	local _source  = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
    TriggerClientEvent('bs_carcolour:use', source, 'browncolour')
end)
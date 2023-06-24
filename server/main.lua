local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Removes the Item

RegisterNetEvent('bs_carcolour:removeItem', function(removedItem)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)

	local inList = Config.colors[removedItem] -- Check if the item is in the list (to prevent cheating)
	if not inList then
		print(('bs_carcolour: %s attempted to remove an item that was not in the list!'):format(xPlayer.identifier))
		return
	end
	xPlayer.removeInventoryItem(removedItem, 1)
	xPlayer.showNotification('Used: ' .. removedItem .. ' Item')
end)

-- Change the row 'cargreen' to your database item you want to have

for k, v in pairs(Config.colors) do
	ESX.RegisterUsableItem(v.item, function(source)
		TriggerClientEvent('bs_carcolour:use', source, k)
	end)
end

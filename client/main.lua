local ESX = nil
-- ESX
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)
 
-- ESX, playerloaded
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)
 
 -- Use the Standart Notify System or your one
 
function Notify(text)
	ESX.ShowNotification(text)	
end

--

local prop = nil
function StartAnim()
	local me = PlayerPedId()
	local animDict = LoadAnimDict('amb@world_human_maid_clean@')
	local anim = 'base'
    local model = LoadAnimModel('prop_paint_spray01b')
    local pos = GetEntityCoords(me)
	TaskPlayAnim(me, animDict , anim, 8.0, -8.0, -1,49, 0, true, true, true)
	local playerPed = PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	prop = CreateObject(GetHashKey(model), x, y, z + 0.2, true, true, true)
	local boneIndex = GetPedBoneIndex(playerPed, 6286)
	AttachEntityToEntity(prop, playerPed, boneIndex, 0.07, 0.0, 0.03, 0.0, 90.0, 300.0, true, true, false, true, 1, true)
end

--


-- Use item
function StartEffect()
	local me = PlayerPedId()
	local playerCoords = GetEntityCoords(me)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
	while not HasNamedPtfxAssetLoaded("core") do
		Wait(1)
	end
	end

	UseParticleFxAssetNextCall("core")
	local part = StartParticleFxLoopedAtCoord("exp_grd_grenade_smoke", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	local part2 = StartParticleFxLoopedAtCoord("exp_grd_grenade_smoke", playerCoords.x, playerCoords.y, playerCoords.z, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	StartAnim()
	Wait(4000)
	StopParticleFxLooped( part, me)
	StopParticleFxLooped( part2, me) 
	ClearPedTasks(me)
	ClearPedSecondaryTask(playerPed)
	DeleteObject(prop)
end

function LoadAnimDict(anim)
	while not HasAnimDictLoaded(anim) do Wait(0) RequestAnimDict(anim) end
    Wait(0)
	return anim
end

function LoadAnimModel(model)
	while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
	Wait(0)
	return model
end

--[[ 

Want to change the Colour?
here is the id list:
https://wiki.rage.mp/index.php?title=Vehicle_Colors

]]--


RegisterNetEvent('bs_carcolour:use')
AddEventHandler('bs_carcolour:use', function(colour)
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 15.0, 0, 70)
	if colour == 'greencolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 55, 55) -- You can change the ID Colour to your one
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	elseif colour == 'redcolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 150, 150)
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	elseif colour == 'bluecolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 63, 63)
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	elseif colour == 'yellowcolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 88, 88)
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	elseif colour == 'blackcolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 0, 0)
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	elseif colour == 'whitecolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 111, 111)
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	elseif colour == 'browncolour' then
	if vehicle then
		if DoesEntityExist(vehicle) then
			TaskTurnPedToFaceEntity(ped, vehicle, 1000)
			StartEffect()
			SetVehicleColours(vehicle, 109, 109)
			TriggerServerEvent("bs_carcolour:removeItem", source, 'cargreen')
		else
			Notify("No Vehicle nearby!")
		end
	end
	end
end)


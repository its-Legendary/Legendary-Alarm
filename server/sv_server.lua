local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent('alarm:trigger')
AddEventHandler('alarm:trigger', function()
    TriggerClientEvent('alarm:play', -1) 
end)


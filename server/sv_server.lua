local QBCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent('alarm:trigger')
AddEventHandler('alarm:trigger', function()
    TriggerClientEvent('alarm:play', -1) 
end)

-- Server-side script to check resource name
Citizen.CreateThread(function()
    local expectedScriptName = "Legendary-alarm" -- Replace with the correct script name

    -- Get the current resource name
    local currentResourceName = GetCurrentResourceName()

    -- Check if the resource name is as expected
    if currentResourceName ~= expectedScriptName then
        print("^1[ERROR] Script name mismatch! The script must be named '" .. expectedScriptName .. "'.^0")
        -- Stop the script
        StopResource(currentResourceName)
    else
        print("^2[INFO] Script name is correct. Legendary-alarm is Running as expected.^0")
    end
end)

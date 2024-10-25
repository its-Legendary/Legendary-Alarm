local QBCore = exports[Config.Core]:GetCoreObject()
local alarmSound = Config.AlarmSound

function ShowAlarm()
    TriggerServerEvent('alarm:trigger')
end

function AddAlarmTargetZone()
    exports[Config.Target]:AddBoxZone(Config.AlarmTargetZone.name, Config.AlarmTargetZone.coords, Config.AlarmTargetZone.width, Config.AlarmTargetZone.height, {
        heading = Config.AlarmTargetZone.heading,
        debugPoly = false,
        minZ = Config.AlarmTargetZone.minZ,
        maxZ = Config.AlarmTargetZone.maxZ,
    }, {
        options = {
            {
                type = "client",
                event = "Legendary-alarmmenu:client:openMenu",
                icon = Config.AlarmTargetOptions[1].icon,
                label = Config.AlarmTargetOptions[1].label,
                job = Config.AlarmTargetOptions[1].job,
            }
        },
        distance = 2.5
    })
end

Citizen.CreateThread(function()
    AddAlarmTargetZone()
end)

RegisterNetEvent('alarm:play')
AddEventHandler('alarm:play', function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.AlarmSound, Config.AlarmVolume)
end)

RegisterNetEvent("Legendary-alarmmenu:client:openMenu")
AddEventHandler("Legendary-alarmmenu:client:openMenu", function()
    exports[Config.Menu]:openMenu({
        {
            header = "Emergency Alert System",
            icon = "fas fa-bell",
            isMenuHeader = true,
        },
        {
            header = "Emergency Alarm Activation",
            icon = "fas fa-exclamation-triangle",
            txt = "Activate the emergency alarm and alert everyone.",
            params = {
                event = "alarm:confirm"
            }
        },
        {
            header = "Blackout The City",
            icon = "fas fa-power-off",
            txt = "Cut off the power to the entire city and plunge everything into darkness.",
            params = {
                event = "trigger:blackout",
                blackout = true
            }
        },
        {
            header = "Lift Blackout",
            icon = "fas fa-sun",
            txt = "Lift the blackout and restore normalcy.",
            params = {
                event = "trigger:blackout",
                blackout = false
            }
        },
        {
            header = "Amm Maybe Later..",
            txt = "Here You Can Close the Whole Menu And Come Back Any Time You Want",
            icon = "fa-sharp fa-solid fa-alarm-clock",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent("trigger:blackout")
AddEventHandler("trigger:blackout", function(data)
    ChangeBlackout(data.blackout)
end)

RegisterNetEvent("alarm:confirm")
AddEventHandler("alarm:confirm", function()
    exports[Config.Menu]:openMenu({
        {
            header = "Confirm Alarm Activation",
            icon = "fas fa-exclamation-circle",
            isMenuHeader = true,
        },
        {
            header = "Yes, Activate",
            icon = "fas fa-check",
            txt = "Confirm activation of the emergency alarm.",
            params = {
                event = "alarm:play"
            }
        },
        {
            header = "No, Cancel",
            icon = "fas fa-times",
            txt = "Cancel alarm activation.",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent("alarm:play")
AddEventHandler("alarm:play", function()
    TriggerServerEvent("InteractSound_SV:PlayOnSource", Config.AlarmSound, Config.AlarmVolume)
    TriggerEvent("QBCore:Notify", "Emergency alarm activated! Stay alert!", "success")

    if Config.ChangeWeather then
        if Config.UseEasyTime then
            TriggerServerEvent('cd_easytime:StartTsunamiCountdown', -1, boolean)
        elseif Config.UseWeatherSync then
            TriggerEvent('qb-weathersync:setWeather', 'THUNDER')
        end
    end
end)

function ChangeBlackout(blackout)
    if GetGameBuildNumber() >= 2372 then
        SetArtificialLightsState(blackout)
        SetArtificialLightsStateAffectsVehicles(Config.VehicleBlackoutEffect)
    else
        SetBlackout(blackout)
    end
    if blackout then
        TriggerEvent("QBCore:Notify", "The city is now in blackout!", "error")
    else
        TriggerEvent("QBCore:Notify", "The blackout has been lifted!", "success")
    end
end

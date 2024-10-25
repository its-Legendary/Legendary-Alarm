Config = {} -- Dont Touch


Config.Core = "qb-core" -- Here is where you can but your core name like if he was {"qb-core" and then you changed it to "legendary-core" but it legendary-core} 
Config.Target = "qb-target" -- Same for the Core if you change your target name -- Importnat Script dose not Support others target like ox or else ( we only support qb)
Config.Menu = "qb-menu" -- Here but your menu name if your useing a qb-menu but with another name
Config.EnablePrints = false 

Config.BlackOutEvent = ""

Config.AlarmSound = "alarm" -- Sound used for the alarm
Config.AlarmVolume = 0.1 -- Volume level for the alarm


Config.ChangeWeather = true -- Set to true if you want to change the weather
Config.UseEasyTime = true -- Set to true if you want to use cd_easytime
Config.UseWeatherSync = false -- Set to true if you want to use qb-weathersync


-- Settings for the Duty Clipboard area
Config.AlarmTargetZone = {
    name = "Alarm", -- Unique name for the zone
    coords = vector3(3110.73, 5437.12, 19.59), -- The exact location of the zone
    width = 1.6, -- Width of the interaction zone
    height = 1.0, -- Height of the interaction zone
    heading = 260, -- Direction the zone is facing
    minZ = 16.59, -- Minimum height for interaction
    maxZ = 20.59, -- Maximum height for interaction
}

-- Options for interacting with the Duty Clipboard zone
Config.AlarmTargetOptions = {
    {
        icon = "fas fa-sign-in-alt", -- Icon to display for the interaction
        label = "interact with alarm", -- Text shown to the player for the interaction
        job = "police", -- The job this interaction is linked to
    }
}


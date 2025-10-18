local isLoaded = false
local isEnabled = true

-- ensure shared/functions.lua is executed (without manifest edits)
do
    if not config then
        local resName = GetCurrentResourceName()
        local fn = LoadResourceFile(resName, 'shared/functions.lua')
        if fn then
            local chunk = load(fn, '@shared/functions.lua')
            if chunk then pcall(chunk) end
        end
    end
end

-- uses global `config` from shared/functions.lua
isEnabled = (config and config.defaultEnabled) ~= false

---@param visible boolean
local function setVisibility(visible)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = visible
    })
end

local function sendInitToUi()
    SendNUIMessage({
        type = 'init',
        logo = (config and config.logo) or {}
    })
end

local function toggleWatermark(enable)
    isEnabled = not not enable
    if isEnabled and isLoaded then
        if (config and config.hideWhenPaused) and IsPauseMenuActive() then
            setVisibility(false)
        else
            setVisibility(true)
        end
    else
        setVisibility(false)
    end
end

CreateThread(function()
    while true do
        if ((not config) or (config.hideWhenPaused ~= false)) and IsPauseMenuActive() and isEnabled then
            setVisibility(false)
        else
            if isEnabled and isLoaded then
                setVisibility(true)
            end
        end

        Wait(tonumber(config and config.intervalMs or 200) or 200)
    end
end)

RegisterCommand(tostring((config and config.commandName) or 'watermark'), function(source, args)
    toggleWatermark(not isEnabled)
end)

exports('loadWatermark', function()
    sendInitToUi()
    setVisibility(isEnabled)
    isLoaded = true
end)

exports('showWatermark', function() 
    setVisibility(true)
end)

exports('hideWatermark', function() 
    setVisibility(false)
end)

AddEventHandler('onClientResourceStart', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    sendInitToUi()
    isLoaded = true
    if (config and config.hideWhenPaused) and IsPauseMenuActive() then
        setVisibility(false)
    else
        setVisibility(isEnabled)
    end
end)

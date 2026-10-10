-- VARIABLES
local config = require 'shared.config'
local loaded = false
local enabled = true


-- FUNCTIONS
local function enableDebug(...)
    if config.debug then
        print(...)
    end
end

local function getLib()
    if GetResourceState('ox_lib') == 'started' then
        enableDebug('ox_lib has been loaded')
    else
        enableDebug('no modern library was found')
    end
end

---@param visible boolean
local function setVisibility(visible)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = visible
    })
end

local function toggleWatermark()
    enabled = not enabled
    if enabled then
        setVisibility(enabled)
    else
        setVisibility(enabled)
    end
end


-- THREAD
CreateThread(function()
    while true do
        if IsPauseMenuActive() and enabled then
            setVisibility(false)
        else
            if enabled and not loaded then
                setVisibility(true)
            end
        end

        Wait(200)
    end
end)


-- KEYBIND
lib.addKeybind({
    name = 'watermark',
    description = config.keybind.description,
    defaultKey = config.keybind.defaultKey,
    onPressed = function()
        toggleWatermark()
    end
})


-- HANDLER
AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        getLib()
    end
end)


-- EXPORTS
exports('loadWatermark', function()
    setVisibility(enabled)
    loaded = true
end)

exports('showWatermark', function() 
    setVisibility(true)
end)

exports('hideWatermark', function() 
    setVisibility(false)
end)

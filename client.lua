local loaded = false
local enabled = true

---@param visible boolean
local function setVisibility(visible)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = visible
    })
end

CreateThread(function()
    while true do
        if IsPauseMenuActive() and enabled then
            setVisibility(false)
        else
            if enabled and loaded then
                setVisibility(true)
            end
        end

        Wait(200)
    end
end)

RegisterCommand('watermark', function(source, args)
    enabled = not enabled
    toggleWatermark(enabled)
end)

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

local isWatermarkOn = true

-- If you wish to enable support for qb-core, update the event name to 'QBCore:Client:OnPlayerLoaded'
RegisterNetEvent('esx:playerLoaded', function()
    toggleWatermark(isWatermarkOn)
end)

RegisterCommand('watermark', function(source, args)
    isWatermarkOn = not isWatermarkOn
    toggleWatermark(isWatermarkOn)
end)

-- @param isVisible boolean
function toggleWatermark(isVisible)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = isVisible
    })
end

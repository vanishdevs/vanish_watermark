local isWatermarkOn = true

RegisterNetEvent('esx:playerLoaded', function()
    toggleWatermark(isWatermarkOn)
end)

RegisterCommand('watermark', function(source, args)
    isWatermarkOn = not isWatermarkOn
    toggleWatermark(isWatermarkOn)
end)

function toggleWatermark(isVisible)
    SetNuiFocus(false, false)
    SendNUIMessage({
        status = isVisible
    })
end
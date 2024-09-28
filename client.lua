local isWatermarkOn = true
local playerLoadName

if GetResourceState('es_extended') ~= 'missing' then playerLoadName = 'esx:playerLoaded' end
if GetResourceState('qb-core') ~= 'missing' then playerLoadName = 'QBCore:Client:OnPlayerLoaded' end

RegisterNetEvent(playerLoadName, function() 
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

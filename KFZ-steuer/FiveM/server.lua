local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) 
   ESX = obj 
end)

Citizen.CreateThread(function()
    while true do

        for k, playerid in pairs(GetPlayer()) do
            local xplayer = ESX.GetPlayerFromId(playerid)

            if xPlayer ~= nil then

                local vehicle = MySQL.Sync.fetchScalar("SELECT count(plate) FROM owned_vehicles WHERE owner = @owner", 
                {
                    ['@owner'] = xplayer.identifier
                })

                local tax = vehicle * 500
                xPlayer.removeMoney('bank', tax)

                -- msg
                TriggerClientEvent('tax:picturemsg', xPlayer.source, 'CHAR_LS_CUSTOMS', 'Du hast ~r~', .. tax .. '$ ~s~an ~o~Kfz-Steuer ~s~bezahlt.', 'Finanzamt', 'Gebühren bezahlt')
            end
        end

        Citizen.Wait(10000)
    end

end)
ESX = exports['es_extended']:getSharedObject()

ESX.RegisterServerCallback("tsJobAd:getPlayerJob", function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local jobname = xPlayer.job.name

    cb(jobname)
end)

RegisterServerEvent('tsJobAd:sendPoliceJobAd')
AddEventHandler('tsJobAd:sendPoliceJobAd', function(args)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('tsJobAd:sendNotification', xPlayers[i], 'LSPD', 'Jobad', table.concat(args, " "), 'CHAR_CALL911')
    end
end)

RegisterServerEvent('tsJobAd:sendAmbulanceJobAd')
AddEventHandler('tsJobAd:sendAmbulanceJobAd', function(args)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('tsJobAd:sendNotification', xPlayers[i], 'LSMD', 'Jobad', table.concat(args, " "), 'CHAR_CALL911')
    end
end)

RegisterServerEvent('tsJobAd:sendMechanicJobAd')
AddEventHandler('tsJobAd:sendMechanicJobAd', function(args)
    local xPlayers = ESX.GetPlayers()
    for i = 1, #xPlayers, 1 do
        TriggerClientEvent('tsJobAd:sendNotification', xPlayers[i], 'LSC', 'Jobad', table.concat(args, " "), 'CHAR_LS_CUSTOMS')
    end
end)

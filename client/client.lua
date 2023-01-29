ESX = exports['es_extended']:getSharedObject()

RegisterCommand(Config.CommandName, function(source, args, raw)
    ESX.TriggerServerCallback("tsJobAd:getPlayerJob", function(jobname)
        if jobname == Config.PoliceJobName then
            TriggerServerEvent("tsJobAd:sendPoliceJobAd", args)
        elseif jobname == Config.AmbulanceJobName then
            TriggerServerEvent("tsJobAd:sendAmbulanceJobAd", args)
        elseif jobname == Config.MechanicJobName then
            TriggerServerEvent("tsJobAd:sendMechanicJobAd", args)
        else
            ESX.ShowNotification("You can't send any jobads!")
        end
    end)
end)

RegisterNetEvent('tsJobAd:sendNotification')
AddEventHandler('tsJobAd:sendNotification', function(title, subtitle, msg, icon)
    showPictureNotification(title, subtitle, msg, icon)
end)

function showPictureNotification(title, subtitle, msg, icon)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    SetNotificationMessage(icon, icon, true, 1, title, subtitle)
    DrawNotification(false, true)
end

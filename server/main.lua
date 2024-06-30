QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback('t3_returncar:getOwnedCars', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    MySQL.Async.fetchAll('SELECT vehicle, plate FROM player_vehicles WHERE citizenid = @citizenid', {
        ['@citizenid'] = citizenid
    }, function(vehicles)
        if vehicles then
            cb(vehicles)
        else
            cb({})
        end
    end)
end)

RegisterServerEvent('t3_returncar:returnCar')
AddEventHandler('t3_returncar:returnCar', function(plate)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local playerName = Player.PlayerData.name

    MySQL.Async.execute('UPDATE player_vehicles SET garage = NULL, state = "OUT" WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('QBCore:Notify', src, 'Vehicle returned successfully', 'success')
            SendToDiscord(Config.DiscordWebhook, "Vehicle Returned", "Player **" .. playerName .. "** has returned their vehicle with plate **" .. plate .. "**.")
        else
            TriggerClientEvent('QBCore:Notify', src, 'Failed to return vehicle', 'error')
        end
    end)
end)

function SendToDiscord(webhook, title, message)
    local content = {
        {
            ["color"] = 3447003, -- Blue color
            ["title"] = title,
            ["description"] = message,
            ["footer"] = {
                ["text"] = "Car Return System"
            },
        }
    }
    
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = "Car Return Bot", embeds = content}), { ['Content-Type'] = 'application/json' })
end

QBCore = exports['qb-core']:GetCoreObject()

local returnedCars = {}

CreateThread(function()
    for _, location in pairs(Config.Locations) do
        local pedModel = GetHashKey('s_m_y_dealer_01') -- Change this model as needed
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(1)
        end
        local npc = CreatePed(4, pedModel, location.coords.x, location.coords.y, location.coords.z, location.heading, false, true)
        SetEntityAsMissionEntity(npc, true, true)
        SetEntityInvincible(npc, true)
        TaskStartScenarioInPlace(npc, "WORLD_HUMAN_CLIPBOARD", 0, true)

        exports['qb-target']:AddTargetEntity(npc, {
            options = {
                {
                    type = "client",
                    event = "t3_returncar:client:openMenu",
                    icon = "fas fa-car",
                    label = "Return Car",
                },
            },
            distance = 2.5
        })
    end
end)

RegisterNetEvent('t3_returncar:client:openMenu')
AddEventHandler('t3_returncar:client:openMenu', function()
    QBCore.Functions.TriggerCallback('t3_returncar:getOwnedCars', function(vehicles)
        print('Callback received, opening menu') -- Debug line
        returnedCars = vehicles
        local menu = {
            {
                header = "Return Your Vehicle",
                isMenuHeader = true
            }
        }

        for _, vehicle in pairs(vehicles) do
            menu[#menu + 1] = {
                header = vehicle.vehicle,
                txt = vehicle.plate,
                params = {
                    event = "t3_returncar:client:returnCar",
                    args = {
                        plate = vehicle.plate
                    }
                }
            }
        end

        menu[#menu + 1] = {
            header = "Close Menu",
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }

        exports['qb-menu']:openMenu(menu)
    end)
end)

RegisterNetEvent('t3_returncar:client:returnCar')
AddEventHandler('t3_returncar:client:returnCar', function(data)
    local plate = data.plate
    TriggerServerEvent('t3_returncar:returnCar', plate)
end)

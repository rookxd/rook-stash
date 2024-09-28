QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('rook-stash:depoac', function(id, label, slots, weight, job)
        exports.ox_inventory:RegisterStash(id, label, slots, weight, false, job)
end)

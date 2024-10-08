QBCore = exports['qb-core']:GetCoreObject()


Citizen.CreateThread(function()
    -- Depo
    for k,v in pairs(Config.Depo) do
        v = v[1]
        if Config.Target == 'qb-target' then
        exports['qb-target']:AddCircleZone(v.depo, v.loc, 1.2, {
            name = v.depo,
            debugPoly = Config.DebugPoly,
            useZ = true,
        }, {
            options = {
                {
                    icon = "fas fa-warehouse",
                    label = v.label,
                    action = function()
                        if Config.Inventory == 'qb' then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", v.depo, {
                                maxweight = v.kilo,
                                slots = v.slot,
                            })
                        elseif Config.Inventory == 'ox' then
							local stashId = v.id
							if exports.ox_inventory:openInventory('stash', stashId) == false then
							TriggerServerEvent('rook-stash:depoac', stashId, v.depo, v.slot, v.kilo, v.job)
							exports.ox_inventory:openInventory('stash', stashId)
                        end
					end
                    end,
                    job = v.job
                },
            },
            distance = v.distance
        })
    elseif Config.Target == 'interact' then
        exports.interact:AddInteraction({
            coords = v.loc,
            distance = 5.0,
            interactDst = v.distance, 
            id = v.id, 
            name = v.depo, 
            groups = {
                [v.job] = 0, 
            },
            options = {
                 {
                    label = v.label,
                    action = function()
                        if Config.Inventory == 'qb' then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", v.depo, {
                                maxweight = v.kilo,
                                slots = v.slot,
                            })
                        elseif Config.Inventory == 'ox' then
							local stashId = v.id
							if exports.ox_inventory:openInventory('stash', stashId) == false then
							TriggerServerEvent('rook-stash:depoac', stashId, v.depo, v.slot, v.kilo, v.job)
							exports.ox_inventory:openInventory('stash', stashId)
                        end
					end
                end
                },
            }
        })
    end
end
end)


Citizen.CreateThread(function()
    -- Kişisel Depo
    for k,v in pairs(Config.KisiselDepo) do
        v = v[1]
        local PlayerData = QBCore.Functions.GetPlayerData()
        local kdepo = "Kdepo" .. PlayerData.citizenid
        if Config.Target == 'qb-target' then
        exports['qb-target']:AddCircleZone(kdepo, v.loc, 1.2, {
            name = kdepo,
            debugPoly = Config.DebugPoly,
            useZ = true,
        }, {
            options = {
                {
                    icon = "fas fa-warehouse",
                    label = v.label,
                    action = function()
                        if Config.Inventory == 'qb' then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", kdepo, {
                                maxweight = Config.KisiselKilo,
                                slots = Config.KisiselSlot,
                            })
                        elseif Config.Inventory == 'ox' then
							local stashId2 = 'kdepo'
							if exports.ox_inventory:openInventory('stash', stashId2) == false then
							TriggerServerEvent('rook-stash:depoac', stashId2, kdepo, Config.KisiselSlot, Config.KisiselKilo)
							exports.ox_inventory:openInventory('stash', stashId2)
                        end
					end
                    end,
                },
            },
            distance = v.distance
        })
    elseif Config.Target == 'interact' then
        exports.interact:AddInteraction({
            coords = v.loc,
            distance = 5.0,
            interactDst = v.distance, 
            id = v.id, 
            name = kdepo, 
            options = {
                 {
                    label = v.label,
                    action = function()
                        if Config.Inventory == 'qb' then
                            TriggerServerEvent("inventory:server:OpenInventory", "stash", kdepo, {
                                maxweight = Config.KisiselKilo,
                                slots = Config.KisiselSlot,
                            })
                        elseif Config.Inventory == 'ox' then
							local stashId2 = 'kdepo'
							if exports.ox_inventory:openInventory('stash', stashId2) == false then
							TriggerServerEvent('rook-stash:depoac', stashId2, kdepo, Config.KisiselSlot, Config.KisiselKilo)
							exports.ox_inventory:openInventory('stash', stashId2)
                        end
					end
                end
                },
            }
        })
    end
end

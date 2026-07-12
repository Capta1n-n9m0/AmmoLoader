--- Startup feature flags. Read only during data stage and via settings.startup at runtime.
local features = {}

local function enabled(name, default)
    local setting = settings.startup[name]
    if setting then
        return setting.value
    end
    return default
end

function features.artillery()
    return enabled("ammo_loader_feature_artillery", true)
end

function features.vehicleAmmo()
    return enabled("ammo_loader_feature_vehicle_ammo", true)
end

function features.vehicleFuel()
    return enabled("ammo_loader_feature_vehicle_fuel", true)
end

function features.trainFuel()
    return enabled("ammo_loader_feature_train_fuel", true)
end

function features.burnerStructures()
    return enabled("ammo_loader_feature_burner_structures", true)
end

function features.logistics()
    return enabled("ammo_loader_feature_logistics", true)
end

function features.returnItems()
    return enabled("ammo_loader_feature_return_items", true)
end

function features.upgradeAmmo()
    return enabled("ammo_loader_feature_upgrade_ammo", true)
end

return features

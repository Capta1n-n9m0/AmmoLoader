local names = require("prototypes.names")
local util = require("prototypes.util")
local features = require("prototypes.features")

local function mergePrerequisites(...)
    local merged = {}
    local seen = {}
    for i = 1, select("#", ...) do
        local list = select(i, ...)
        if list then
            for _, name in ipairs(list) do
                if not seen[name] then
                    seen[name] = true
                    table.insert(merged, name)
                end
            end
        end
    end
    return merged
end

-- Factorio requires science-pack technologies as prerequisites; unit ingredients alone do not gate research.
local function sciencePrerequisites(unit)
    local prereqs = {}
    for _, ingredient in ipairs(unit.ingredients) do
        local pack = ingredient[1] or ingredient.name
        if pack and pack ~= "automation-science-pack" and data.raw.technology[pack] then
            table.insert(prereqs, pack)
        end
    end
    return prereqs
end

local function finalizeTech(technology)
    technology.prerequisites = mergePrerequisites(
        technology.prerequisites,
        sciencePrerequisites(technology.unit)
    )
    return technology
end

local tech = {}

tech.loader = {
    type = "technology",
    name = names.tech.loader,
    icon = util.filePath(names.tech.loader, "technology"),
    icon_size = 64,
    order = "az",
    unit = {
        count = 20,
        ingredients = {
            {"automation-science-pack", 1}
        },
        time = 20
    },
    effects = {
        {
            type = "unlock-recipe",
            recipe = names.chests.loader
        }
    },
    prerequisites = {"logistics", "gun-turret"}
}

if features.logistics() then
    tech.requester1 = {
        type = "technology",
        name = names.tech.requester,
        icon = util.filePath(names.tech.requester, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 20
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = names.chests.requester
            },
            {
                type = "unlock-recipe",
                recipe = names.chests.passiveProvider
            }
        },
        prerequisites = {"logistic-system", names.tech.loader}
    }
end

if features.vehicleAmmo() then
    tech.vehicles = {
        type = "technology",
        name = names.tech.vehicles,
        icon = util.filePath(names.tech.vehicles, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 15
        },
        effects = {
            {
                type = "nothing",
                effect_description = {"technology-effect-description.amlo-effect-vehicles"}
            }
        },
        prerequisites = {names.tech.loader, "automobilism"}
    }
end

if features.vehicleFuel() then
    tech.vehicleFuel = {
        type = "technology",
        name = names.tech.vehicleFuel,
        icon = util.filePath(names.tech.vehicleFuel, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 40,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 15
        },
        effects = {
            {
                type = "nothing",
                effect_description = {"technology-effect-description.amlo-effect-vehicle-fuel"}
            }
        },
        prerequisites = {names.tech.loader, "automobilism"}
    }
end

if features.trainFuel() then
    tech.trainFuel = {
        type = "technology",
        name = names.tech.trainFuel,
        icon = util.filePath(names.tech.trainFuel, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 45,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 15
        },
        effects = {
            {
                type = "nothing",
                effect_description = {"technology-effect-description.amlo-effect-train-fuel"}
            }
        },
        prerequisites = {names.tech.loader, "railway"}
    }
end

if features.burnerStructures() then
    tech.burners = {
        type = "technology",
        name = names.tech.burners,
        icon = util.filePath(names.tech.burners, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 35,
            ingredients = {
                {"automation-science-pack", 1}
            },
            time = 20
        },
        effects = {
            {
                type = "nothing",
                effect_description = {"technology-effect-description.amlo-effect-burners"}
            }
        },
        prerequisites = {names.tech.loader}
    }
end

if features.artillery() then
    tech.artillery = {
        type = "technology",
        name = names.tech.artillery,
        icon = util.filePath(names.tech.artillery, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 300,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"chemical-science-pack", 1},
                {"military-science-pack", 1},
                {"utility-science-pack", 1}
            },
            time = 20
        },
        effects = {
            {
                type = "nothing",
                effect_description = {"technology-effect-description.amlo-effect-artillery"}
            }
        },
        prerequisites = {names.tech.loader, "artillery"}
    }
end

if features.returnItems() then
    tech.returnItems = {
        type = "technology",
        name = names.tech.returnItems,
        icon = util.filePath(names.tech.returnItems, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 50,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1}
            },
            time = 15
        },
        effects = {
            {
                type = "unlock-recipe",
                recipe = names.chests.storage
            },
            {
                type = "nothing",
                effect_description = {"technology-effect-description.amlo-effect-return-items"}
            }
        },
        prerequisites = {names.tech.loader}
    }
end

if features.upgradeAmmo() then
    local upgradePrereqs = {names.tech.loader}
    if features.returnItems() then
        table.insert(upgradePrereqs, names.tech.returnItems)
    end

    local upgradeEffects = {
        {
            type = "nothing",
            effect_description = {"technology-effect-description.amlo-effect-upgrade"}
        }
    }
    if not features.returnItems() then
        table.insert(upgradeEffects, 1, {
            type = "unlock-recipe",
            recipe = names.chests.storage
        })
    end

    tech.upgrade = {
        type = "technology",
        name = names.tech.upgrade,
        icon = util.filePath(names.tech.upgrade, "technology"),
        icon_size = 64,
        order = "az",
        unit = {
            count = 100,
            ingredients = {
                {"automation-science-pack", 1},
                {"logistic-science-pack", 1},
                {"military-science-pack", 1}
            },
            time = 20
        },
        effects = upgradeEffects,
        prerequisites = upgradePrereqs
    }
end

for _, t in pairs(tech) do
    data:extend({finalizeTech(t)})
end

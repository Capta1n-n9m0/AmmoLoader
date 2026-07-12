-- require("prototypes.FuelLoaderChest")
-- local startEnabled = settings.startup["ammo_loader_bypass_research"].value
-- data.raw.recipe["ammo-loader-chest"].enabled = startEnabled
-- data.raw.recipe["fuel-loader-chest"].enabled = startEnabled
-- data.raw.recipe["ammo-loader-storage-loader-chest"].enabled = startEnabled
-- data.raw.recipe["logistic-requester-loader-chest"].enabled = false
local Map = require("stdlib.Map")

require("prototypes.entity")
require("prototypes.item")
require("prototypes.recipe")
require("prototypes.technology")
require("prototypes.RangeExtender")

local util = require "util"

local function setTechIcon(techName)
    local tech = data.raw.technology[techName]
    if tech then
        tech.icon_size = 128
        tech.icon = "__ammoloader21__/graphics/icon/technology.png"
    end
end

local function set_robot_door_animation(chest, animation)
    chest.robot_door = chest.robot_door or {}
    chest.robot_door.animation = animation
    chest.animation = nil
    chest.landing_location_offset = nil
    chest.opened_duration = nil
    chest.animation_sound = nil
end

local chest = table.deepcopy(data.raw["container"]["ammo-loader-chest"])
chest.icon = "__ammoloader21__/graphics/icon/chest.png" -- иконка
chest.icon_size = 64                                   -- размер иконки
chest.picture = {
    -- графика
    layers = {
        {
            filename = "__ammoloader21__/graphics/entity/ammo_albedo.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_shadow.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(13, -2),
            scale = 0.4,
            draw_as_shadow = true
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_ao.png",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        }
    }
}
data:extend({ chest })

local chestIt = table.deepcopy(data.raw["item"]["ammo-loader-chest"])
chestIt.icon = "__ammoloader21__/graphics/icon/chest.png" -- иконка
chestIt.icon_size = 64                                   -- размер иконки
data:extend({ chestIt })

setTechIcon("ammo-loader-tech-loader-chest")

--========================СУНДУК ЗАПРОСА=========================--

local chestreq = table.deepcopy(data.raw["logistic-container"]["ammo-loader-chest-requester"])
chestreq.icon = "__ammoloader21__/graphics/icon/chest_b.png" -- иконка
chestreq.icon_size = 64                                     -- размер иконки
set_robot_door_animation(chestreq, {
    -- графика
    layers = {
        {
            filename = "__ammoloader21__/graphics/entity/ammo_albedo_b.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_shadow.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(13, -2),
            scale = 0.4,
            draw_as_shadow = true
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_ao.png",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        }
    }
})
data:extend({ chestreq })

local chestreqIt = table.deepcopy(data.raw["item"]["ammo-loader-chest-requester"])
chestreqIt.icon = "__ammoloader21__/graphics/icon/chest_b.png" -- иконка
chestreqIt.icon_size = 64                                     -- размер иконки
data:extend({ chestreqIt })

setTechIcon("ammo-loader-tech-requester-chest")

--========================СУНДУК ХРАНЕНИЯ=========================--

local cheststor = table.deepcopy(data.raw["logistic-container"]["ammo-loader-chest-storage"])
cheststor.icon = "__ammoloader21__/graphics/icon/chest_y.png" -- иконка
cheststor.icon_size = 64                                     -- размер иконки
set_robot_door_animation(cheststor, {
    -- графика
    layers = {
        {
            filename = "__ammoloader21__/graphics/entity/ammo_albedo_y.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_shadow.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(13, -2),
            scale = 0.4,
            draw_as_shadow = true
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_ao.png",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        }
    }
})
data:extend({ cheststor })

local cheststorIt = table.deepcopy(data.raw["item"]["ammo-loader-chest-storage"])
cheststorIt.icon = "__ammoloader21__/graphics/icon/chest_y.png" -- иконка
cheststorIt.icon_size = 64                                     -- размер иконки
data:extend({ cheststorIt })

setTechIcon("ammo-loader-tech-return-items")

--========================СУНДУК ПАССИВНОГО СНАБЖЕНИЯ=========================--

local chestpassiv = table.deepcopy(data.raw["logistic-container"]["ammo-loader-chest-passive-provider"])
chestpassiv.icon = "__ammoloader21__/graphics/icon/chest_r.png" -- иконка
chestpassiv.icon_size = 64                                     -- размер иконки
set_robot_door_animation(chestpassiv, {
    -- графика
    layers = {
        {
            filename = "__ammoloader21__/graphics/entity/ammo_albedo_r.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_shadow.png",
            priority = "extra-high",
            width = 150,
            height = 150,
            shift = util.by_pixel(13, -2),
            scale = 0.4,
            draw_as_shadow = true
        },
        {
            filename = "__ammoloader21__/graphics/entity/ammo_ao.png",
            width = 150,
            height = 150,
            shift = util.by_pixel(0, -4),
            scale = 0.4
        }
    }
})
data:extend({ chestpassiv })

local chestpassivIt = table.deepcopy(data.raw["item"]["ammo-loader-chest-passive-provider"])
chestpassivIt.icon = "__ammoloader21__/graphics/icon/chest_r.png" -- иконка
chestpassivIt.icon_size = 64                                     -- размер иконки
data:extend({ chestpassivIt })

--========================ТЕХНОЛОГИИ=========================--
setTechIcon("ammo-loader-tech-vehicles")
setTechIcon("ammo-loader-tech-vehicle-fuel")
setTechIcon("ammo-loader-tech-train-fuel")
setTechIcon("ammo-loader-tech-burners")
setTechIcon("ammo-loader-tech-artillery")
setTechIcon("ammo-loader-tech-upgrade")
setTechIcon("ammo-loader-tech-return-items")

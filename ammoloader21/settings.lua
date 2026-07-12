local names = require("prototypes/names")
data:extend {
    {
        type = "bool-setting",
        name = names.settings.bypassResearch,
        setting_type = "startup",
        default_value = false,
        order = "Ammo[features]-a[research]-a"
    },
    {
        type = "bool-setting",
        name = names.settings.featureArtillery,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-a[artillery]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureVehicleAmmo,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-b[vehicle-ammo]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureVehicleFuel,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-c[vehicle-fuel]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureTrainFuel,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-d[train-fuel]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureBurnerStructures,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-e[burners]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureLogistics,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-f[logistics]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureReturnItems,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-g[return]"
    },
    {
        type = "bool-setting",
        name = names.settings.featureUpgradeAmmo,
        setting_type = "startup",
        default_value = true,
        order = "Ammo[features]-b[features]-h[upgrade]"
    },
    {
        type = "bool-setting",
        name = names.settings.crossSurfaces,
        setting_type = "startup",
        default_value = false,
        order = "Ammo[features]-c[prefs]-a[surfaces]"
    },
    {
        type = "bool-setting",
        name = names.settings.useCartridges,
        setting_type = "startup",
        default_value = false,
        hidden = true,
        order = "Ammo[features]-z[hidden]-a"
    },
    {
        type = "int-setting",
        name = names.settings.repairToolStackSize,
        setting_type = "startup",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 10000,
        order = "Ammo[features]-c[ints]-a"
    },
    {
        type = "bool-setting",
        name = names.settings.enabled,
        setting_type = "runtime-global",
        default_value = true,
        order = "Ammo[runtime]-a[bools]-a[enabled]"
    },
    {
        type = "bool-setting",
        name = "ammo_loader_draw_range",
        setting_type = "runtime-per-user",
        default_value = true,
        order = "Ammo[runtime]-a[bools]-ab"
    },
    {
        type = "bool-setting",
        name = names.settings.highlightSlots,
        setting_type = "runtime-per-user",
        default_value = true,
        order = "Ammo[runtime]-a[bools]-ac"
    },
    {
        type = "string-setting",
        name = names.settings.debug,
        setting_type = "runtime-global",
        default_value = names.settings.debugValues.off,
        allowed_values = { names.settings.debugValues.off, names.settings.debugValues.important, names.settings.debugValues.all },
        order = "Ammo[runtime]-z[debugging]-c"
    },
    {
        type = "bool-setting",
        name = "ammo_loader_check_after_research",
        setting_type = "runtime-global",
        default_value = false,
        order = "Ammo[runtime]-y[modCompat]-a[bools]-a"
    },
    {
        type = "double-setting",
        name = "ammo_loader_chest_radius",
        setting_type = "runtime-global",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 1000,
        order = "Ammo[runtime]-b[ints]-a[prefs]"
    },
    {
        type = "int-setting",
        name = names.settings.providedSlotsPerTick,
        setting_type = "runtime-global",
        default_value = 3,
        minimum_value = 1,
        maximum_value = 1000,
        order = "Ammo[runtime]-b[ints]-c[prefs]"
    },
    {
        type = "int-setting",
        name = names.settings.itemFillSize,
        setting_type = "runtime-global",
        default_value = 10,
        minimum_value = 1,
        maximum_value = 255,
        order = "Ammo[runtime]-b[ints]-b[prefs]"
    },
    {
        type = "bool-setting",
        name = names.settings.ignoreLogisticTurrets,
        setting_type = "runtime-global",
        default_value = false,
        order = "Ammo[runtime]-y[modCompat]-a[bools]-b"
    }
}

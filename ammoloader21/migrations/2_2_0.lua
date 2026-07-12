for _, force in pairs(game.forces) do
    local techs = force.technologies
    local burners = techs["ammo-loader-tech-burners"]
    if burners and burners.researched then
        local vehicleFuel = techs["ammo-loader-tech-vehicle-fuel"]
        if vehicleFuel and not vehicleFuel.researched then
            vehicleFuel.researched = true
        end
        local trainFuel = techs["ammo-loader-tech-train-fuel"]
        if trainFuel and not trainFuel.researched then
            trainFuel.researched = true
        end
    end
end


local entity_base = util.table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-mining-drill"])

for x, electric_mining_drill in pairs(electric_mining_drills) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = electric_mining_drill.name    
    entity.icon = "__zombiesextended-machines__/graphics/icons/" .. electric_mining_drill.name .. ".png"
    entity.minable.result = electric_mining_drill.name
    entity.max_health = electric_mining_drill.health
    entity.mining_speed = electric_mining_drill.mining_speed
    entity.energy_usage = electric_mining_drill.energy_con_kw .. "kW"
    entity.resource_searching_radius = electric_mining_drill.mining_area
    entity.energy_source.emissions_per_minute = electric_mining_drill.pollution_per_min
    entity.module_specification.module_slots = electric_mining_drill.module_slots
    entity.next_upgrade = electric_mining_drill.next_upgrade
    
    entity.graphics_set.animation.north.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-N.png"
    entity.graphics_set.animation.north.layers[1].width = 96
    entity.graphics_set.animation.north.layers[1].height = 100

    entity.graphics_set.animation.north.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-N.png"
    entity.graphics_set.animation.north.layers[1].hr_version.width = 190
    entity.graphics_set.animation.north.layers[1].hr_version.height = 198

    entity.graphics_set.animation.north.layers[2].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-N-output.png"
    entity.graphics_set.animation.north.layers[2].width = 32
    entity.graphics_set.animation.north.layers[2].height = 32

    entity.graphics_set.animation.north.layers[2].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-N-output.png"
    entity.graphics_set.animation.north.layers[2].hr_version.width = 60
    entity.graphics_set.animation.north.layers[2].hr_version.height = 66

    entity.graphics_set.animation.east.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-E.png"
    entity.graphics_set.animation.east.layers[1].width = 94
    entity.graphics_set.animation.east.layers[1].height = 94

    entity.graphics_set.animation.east.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-E.png"
    entity.graphics_set.animation.east.layers[1].hr_version.width = 186
    entity.graphics_set.animation.east.layers[1].hr_version.height = 188

    entity.graphics_set.animation.south.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-S.png"
    entity.graphics_set.animation.south.layers[1].width = 92
    entity.graphics_set.animation.south.layers[1].height = 90

    entity.graphics_set.animation.south.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-S.png"
    entity.graphics_set.animation.south.layers[1].hr_version.width = 184
    entity.graphics_set.animation.south.layers[1].hr_version.height = 176

    entity.graphics_set.animation.west.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-W.png"
    entity.graphics_set.animation.west.layers[1].width = 88
    entity.graphics_set.animation.west.layers[1].height = 94

    entity.graphics_set.animation.west.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-W.png"
    entity.graphics_set.animation.west.layers[1].hr_version.width = 180
    entity.graphics_set.animation.west.layers[1].hr_version.height = 188
    
    entity.graphics_set.working_visualisations[7].east_animation.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-E-front.png"
    entity.graphics_set.working_visualisations[7].east_animation.width = 66
    entity.graphics_set.working_visualisations[7].east_animation.height = 74

    entity.graphics_set.working_visualisations[7].east_animation.hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-E-front.png"
    entity.graphics_set.working_visualisations[7].east_animation.hr_version.width = 136
    entity.graphics_set.working_visualisations[7].east_animation.hr_version.height = 148

    entity.graphics_set.working_visualisations[7].south_animation.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-S-output.png"
    entity.graphics_set.working_visualisations[7].south_animation.layers[1].width = 44
    entity.graphics_set.working_visualisations[7].south_animation.layers[1].height = 28
    
    entity.graphics_set.working_visualisations[7].south_animation.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-S-output.png"
    entity.graphics_set.working_visualisations[7].south_animation.layers[1].hr_version.width = 84
    entity.graphics_set.working_visualisations[7].south_animation.layers[1].hr_version.height = 56

    entity.graphics_set.working_visualisations[7].south_animation.layers[2].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-S-front.png"
    entity.graphics_set.working_visualisations[7].south_animation.layers[2].width = 96
    entity.graphics_set.working_visualisations[7].south_animation.layers[2].height = 54

    entity.graphics_set.working_visualisations[7].south_animation.layers[2].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-S-front.png"
    entity.graphics_set.working_visualisations[7].south_animation.layers[2].hr_version.width = 190
    entity.graphics_set.working_visualisations[7].south_animation.layers[2].hr_version.height = 104

    entity.graphics_set.working_visualisations[7].west_animation.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-W-front.png"
    entity.graphics_set.working_visualisations[7].west_animation.width = 68
    entity.graphics_set.working_visualisations[7].west_animation.height = 70

    entity.graphics_set.working_visualisations[7].west_animation.hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-W-front.png"
    entity.graphics_set.working_visualisations[7].west_animation.hr_version.width = 134
    entity.graphics_set.working_visualisations[7].west_animation.hr_version.height = 140


    item.name = electric_mining_drill.name
    item.icon = "__zombiesextended-machines__/graphics/icons/" .. electric_mining_drill.name .. ".png"
    item.place_result = electric_mining_drill.name
    item.order = electric_mining_drill.order
    item.subgroup = "ds-extraction"

    table.insert(data.raw["technology"][electric_mining_drill.technology].effects, { type = "unlock-recipe", recipe = electric_mining_drill.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = electric_mining_drill.name,
            enabled = false,
            ingredients = electric_mining_drill.ingredients,
            result = electric_mining_drill.name
        }
    })
end
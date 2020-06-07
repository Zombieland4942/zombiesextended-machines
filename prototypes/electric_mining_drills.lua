
local entity_base = util.table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-mining-drill"])

for x, electric_mining_drill in pairs(electric_mining_drills) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = electric_mining_drill.name    
    entity.icon = "__darkstar-machines__/graphics/icons/" .. electric_mining_drill.name .. ".png"
    entity.minable.result = electric_mining_drill.name
    entity.max_health = electric_mining_drill.health
    entity.mining_speed = electric_mining_drill.mining_speed
    entity.energy_usage = electric_mining_drill.energy_con_kw .. "kW"
    entity.resource_searching_radius = electric_mining_drill.mining_area
    entity.energy_source.emissions_per_minute = electric_mining_drill.pollution_per_min
    entity.module_specification.module_slots = electric_mining_drill.module_slots
    
    entity.animations.north.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-N.png"
    entity.animations.north.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-N.png"    
    entity.animations.east.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-E.png"
    entity.animations.east.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-E.png"
    entity.animations.south.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-S.png"
    entity.animations.south.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-S.png"
    entity.animations.west.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-W.png"
    entity.animations.west.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-W.png"
    entity.input_fluid_patch_sprites.north.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-N-patch.png"
    entity.input_fluid_patch_sprites.north.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-N-patch.png"
    entity.input_fluid_patch_sprites.east.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-E-patch.png"
    entity.input_fluid_patch_sprites.east.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-E-patch.png"
    entity.input_fluid_patch_sprites.south.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-S-patch.png"
    entity.input_fluid_patch_sprites.south.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-S-patch.png"
    entity.input_fluid_patch_sprites.west.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/electric-mining-drill-W-patch.png"
    entity.input_fluid_patch_sprites.west.hr_version.filename = "__darkstar-machines__/graphics/entity/" .. electric_mining_drill.name .. "/hr-electric-mining-drill-W-patch.png"

    item.name = electric_mining_drill.name
    item.icon = "__darkstar-machines__/graphics/icons/" .. electric_mining_drill.name .. ".png"
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
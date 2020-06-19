
local entity_base = util.table.deepcopy(data.raw["furnace"]["electric-furnace"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-furnace"])

for x, electric_furnace in pairs(electric_furnaces) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = electric_furnace.name    
    entity.icon = "__zombiesextended-machines__/graphics/icons/" .. electric_furnace.name .. ".png"
    entity.minable.result = electric_furnace.name
    entity.max_health = electric_furnace.health
    entity.crafting_speed = electric_furnace.crafting_speed
    entity.energy_usage = electric_furnace.energy_con_kw .. "kW"
    entity.energy_source.drain = electric_furnace.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = electric_furnace.pollution_per_min
    entity.module_specification.module_slots = electric_furnace.module_slots
    
    entity.animation.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. electric_furnace.name .. "/electric-furnace-base.png"
    entity.animation.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. electric_furnace.name .. "/hr-electric-furnace.png"

    item.name = electric_furnace.name
    item.icon = "__zombiesextended-machines__/graphics/icons/" .. electric_furnace.name .. ".png"
    item.place_result = electric_furnace.name
    item.order = electric_furnace.order
    item.subgroup = "ds-assembly-machines-1"

    table.insert(data.raw["technology"][electric_furnace.technology].effects, { type = "unlock-recipe", recipe = electric_furnace.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = electric_furnace.name,
            enabled = false,
            ingredients = electric_furnace.ingredients,
            result = electric_furnace.name
        }
    })
end
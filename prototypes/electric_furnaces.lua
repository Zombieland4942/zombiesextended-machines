
local entity_base = util.table.deepcopy(data.raw["furnace"]["electric-furnace"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-furnace"])

for x, electric_furnace in pairs(electric_furnaces) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = electric_furnace.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. electric_furnace.name .. ".png"
    entity.minable.result = electric_furnace.name
    entity.max_health = electric_furnace.health
    entity.crafting_speed = electric_furnace.crafting_speed
    entity.energy_usage = electric_furnace.energy_con_kw .. "kW"
    entity.energy_source.drain = electric_furnace.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = electric_furnace.pollution_per_min
    entity.module_specification.module_slots = electric_furnace.module_slots
    
    item.name = electric_furnace.name
    --item.icon = "__darkstar-machines__/graphics/icons/" .. electric_furnace.name .. ".png"
    item.place_result = electric_furnace.name
    item.order = electric_furnace.order
    item.subgroup = "ds-smelting"

    data:extend({ entity, item })
end
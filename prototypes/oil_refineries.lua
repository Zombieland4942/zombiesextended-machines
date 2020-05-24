
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["oil-refinery"])
local item_base = util.table.deepcopy(data.raw["item"]["oil-refinery"])

for x, oil_refinerie in pairs(oil_refineries) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = oil_refinerie.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. oil_refinerie.name .. ".png"
    entity.minable.result = oil_refinerie.name
    entity.max_health = oil_refinerie.health
    entity.crafting_speed = oil_refinerie.crafting_speed
    entity.energy_usage = oil_refinerie.energy_con_kw .. "kW"
    entity.energy_source.drain = oil_refinerie.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = oil_refinerie.pollution_per_min
    entity.module_specification.module_slots = oil_refinerie.module_slots
    
    item.name = oil_refinerie.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. oil_refinerie.name .. ".png"
    item.place_result = oil_refinerie.name
    item.order = oil_refinerie.order
    item.subgroup = "ds-assembly-machines"

    data:extend({ entity, item })
end

local entity_base = util.table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
local item_base = util.table.deepcopy(data.raw["item"]["electric-mining-drill"])

for x, electric_mining_drill in pairs(electric_mining_drills) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = electric_mining_drill.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. electric_mining_drill.name .. ".png"
    entity.minable.result = electric_mining_drill.name
    entity.max_health = electric_mining_drill.health
    entity.mining_speed = electric_mining_drill.mining_speed
    entity.energy_usage = electric_mining_drill.energy_con_kw .. "kW"
    entity.resource_searching_radius = electric_mining_drill.mining_area
    entity.energy_source.emissions_per_minute = electric_mining_drill.pollution_per_min
    entity.module_specification.module_slots = electric_mining_drill.module_slots
    
    item.name = electric_mining_drill.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. electric_mining_drill.name .. ".png"
    item.place_result = electric_mining_drill.name
    item.order = electric_mining_drill.order
    item.subgroup = "ds-extraction"

    data:extend({ entity, item })
end
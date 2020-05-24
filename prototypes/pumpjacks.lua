
local entity_base = util.table.deepcopy(data.raw["mining-drill"]["pumpjack"])
local item_base = util.table.deepcopy(data.raw["item"]["pumpjack"])

for x, pumpjack in pairs(pumpjacks) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = pumpjack.name
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. pumpjack.name .. ".png"
    entity.minable.result = pumpjack.name
    entity.max_health = pumpjack.health
    entity.mining_speed = pumpjack.mining_speed
    entity.energy_usage = pumpjack.energy_con_kw .. "kW"
    entity.energy_source.emissions_per_minute = pumpjack.pollution_per_min
    entity.module_specification.module_slots = pumpjack.module_slots
    
    item.name = pumpjack.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. pumpjack.name .. ".png"
    item.place_result = pumpjack.name
    item.order = pumpjack.order
    item.subgroup = "ds-extraction"

    data:extend({ entity, item })
end
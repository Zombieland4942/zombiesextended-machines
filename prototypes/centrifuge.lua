
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
local item_base = util.table.deepcopy(data.raw["item"]["centrifuge"])

for x, centrifuge in pairs(centrifuges) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = centrifuge.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. centrifuge.name .. ".png"
    entity.minable.result = centrifuge.name
    entity.max_health = centrifuge.health
    entity.crafting_speed = centrifuge.crafting_speed
    entity.energy_usage = centrifuge.energy_con_kw .. "kW"
    entity.energy_source.drain = centrifuge.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = centrifuge.pollution_per_min
    entity.module_specification.module_slots = centrifuge.module_slots
    
    item.name = centrifuge.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. centrifuge.name .. ".png"
    item.place_result = centrifuge.name
    item.order = centrifuge.order
    item.subgroup = "ds-assembly-machines"

    data:extend({ entity, item })
end
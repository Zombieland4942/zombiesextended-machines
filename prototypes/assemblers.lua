
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
local item_base = util.table.deepcopy(data.raw["item"]["assembling-machine-3"])

for x, assembler in pairs(assemblers) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = assembler.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. assembler.name .. ".png"
    entity.minable.result = assembler.name
    entity.max_health = assembler.health
    entity.crafting_speed = assembler.crafting_speed
    entity.energy_usage = assembler.energy_con_kw .. "kW"
    entity.energy_source.drain = assembler.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = assembler.pollution_per_min
    entity.module_specification.module_slots = assembler.module_slots
    
    item.name = assembler.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. assembler.name .. ".png"
    item.place_result = assembler.name
    item.order = assembler.order
    item.subgroup = "ds-assembly-machines"

    data:extend({ entity, item })
end
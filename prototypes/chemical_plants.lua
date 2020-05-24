
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
local item_base = util.table.deepcopy(data.raw["item"]["chemical-plant"])

for x, chemical_plant in pairs(chemical_plants) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = chemical_plant.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. chemical_plant.name .. ".png"
    entity.minable.result = chemical_plant.name
    entity.max_health = chemical_plant.health
    entity.crafting_speed = chemical_plant.crafting_speed
    entity.energy_usage = chemical_plant.energy_con_kw .. "kW"
    entity.energy_source.drain = chemical_plant.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = chemical_plant.pollution_per_min
    entity.module_specification.module_slots = chemical_plant.module_slots
    
    item.name = chemical_plant.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. chemical_plant.name .. ".png"
    item.place_result = chemical_plant.name
    item.order = chemical_plant.order
    item.subgroup = "ds-assembly-machines"

    data:extend({ entity, item })
end
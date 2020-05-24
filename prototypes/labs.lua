
local entity_base = util.table.deepcopy(data.raw["lab"]["lab"])
local item_base = util.table.deepcopy(data.raw["item"]["lab"])

for x, lab in pairs(labs) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = lab.name    
    --entity.icon = "__darkstar-machines__/graphics/icons/" .. lab.name .. ".png"
    entity.minable.result = lab.name
    entity.max_health = lab.health
    entity.researching_speed = lab.research_speed
    entity.energy_usage = lab.energy_con_kw .. "kW"
    entity.module_specification.module_slots = lab.module_slots
    
    item.name = lab.name
    --item.icon = "__darkstar-power__/graphics/icons/" .. lab.name .. ".png"
    item.place_result = lab.name
    item.order = lab.order
    item.subgroup = "ds-assembly-machines"

    data:extend({ entity, item })
end
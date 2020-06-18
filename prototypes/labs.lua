
local entity_base = util.table.deepcopy(data.raw["lab"]["lab"])
local item_base = util.table.deepcopy(data.raw["item"]["lab"])

for x, lab in pairs(labs) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = lab.name    
    entity.icon = "__darkstar-machines__/graphics/icons/" .. lab.name .. ".png"
    entity.minable.result = lab.name
    entity.max_health = lab.health
    entity.researching_speed = lab.research_speed
    entity.energy_usage = lab.energy_con_kw .. "kW"
    entity.module_specification.module_slots = lab.module_slots
    
    entity.on_animation.layers[1].filename = "__darkstar-machines__/graphics/entity/" .. lab.name .. "/lab.png"
    entity.on_animation.layers[1].hr_version.filename = "__darkstar-machines__/graphics/entity/" .. lab.name .. "/hr-lab.png"
    entity.off_animation.layers[1].filename = "__darkstar-machines__/graphics/entity/" .. lab.name .. "/lab.png"
    entity.off_animation.layers[1].hr_version.filename = "__darkstar-machines__/graphics/entity/" .. lab.name .. "/hr-lab.png"

    item.name = lab.name
    item.icon = "__darkstar-machines__/graphics/icons/" .. lab.name .. ".png"
    item.place_result = lab.name
    item.order = lab.order
    item.subgroup = "ds-assembly-machines-1"

    table.insert(data.raw["technology"][lab.technology].effects, { type = "unlock-recipe", recipe = lab.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = lab.name,
            enabled = false,
            ingredients = lab.ingredients,
            result = lab.name
        }
    })
end
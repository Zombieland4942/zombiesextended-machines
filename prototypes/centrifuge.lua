
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["centrifuge"])
local item_base = util.table.deepcopy(data.raw["item"]["centrifuge"])

for x, centrifuge in pairs(centrifuges) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = centrifuge.name    
    entity.icon = "__zombiesextended-machines__/graphics/icons/" .. centrifuge.name .. ".png"
    entity.minable.result = centrifuge.name
    entity.max_health = centrifuge.health
    entity.crafting_speed = centrifuge.crafting_speed
    entity.energy_usage = centrifuge.energy_con_kw .. "kW"
    entity.energy_source.drain = centrifuge.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = centrifuge.pollution_per_min
    entity.module_specification.module_slots = centrifuge.module_slots
    entity.next_upgrade = centrifuge.next_upgrade
    
    entity.idle_animation.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. centrifuge.name .. "/centrifuge-C.png"
    entity.idle_animation.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. centrifuge.name .. "/hr-centrifuge-C.png"
    entity.idle_animation.layers[3].filename = "__zombiesextended-machines__/graphics/entity/" .. centrifuge.name .. "/centrifuge-B.png"
    entity.idle_animation.layers[3].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. centrifuge.name .. "/hr-centrifuge-B.png"
    entity.idle_animation.layers[5].filename = "__zombiesextended-machines__/graphics/entity/" .. centrifuge.name .. "/centrifuge-A.png"
    entity.idle_animation.layers[5].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. centrifuge.name .. "/hr-centrifuge-A.png"

    item.name = centrifuge.name
    item.icon = "__zombiesextended-machines__/graphics/icons/" .. centrifuge.name .. ".png"
    item.place_result = centrifuge.name
    item.order = centrifuge.order
    item.subgroup = "ds-assembly-machines-1"
    
    table.insert(data.raw["technology"][centrifuge.technology].effects, { type = "unlock-recipe", recipe = centrifuge.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = centrifuge.name,
            enabled = false,
            ingredients = centrifuge.ingredients,
            result = centrifuge.name
        }
    })
end

local entity_base = util.table.deepcopy(data.raw["mining-drill"]["pumpjack"])
local item_base = util.table.deepcopy(data.raw["item"]["pumpjack"])

for x, pumpjack in pairs(pumpjacks) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = pumpjack.name
    entity.icon = "__darkstar-machines__/graphics/icons/" .. pumpjack.name .. ".png"
    entity.minable.result = pumpjack.name
    entity.max_health = pumpjack.health
    entity.mining_speed = pumpjack.mining_speed
    entity.energy_usage = pumpjack.energy_con_kw .. "kW"
    entity.energy_source.emissions_per_minute = pumpjack.pollution_per_min
    entity.module_specification.module_slots = pumpjack.module_slots
    
    entity.base_picture.sheets[1].filename = "__darkstar-machines__/graphics/entity/" .. pumpjack.name .. "/pumpjack-base.png"
    entity.base_picture.sheets[1].hr_version.filename = "__darkstar-machines__/graphics/entity/" .. pumpjack.name .. "/hr-pumpjack-base.png"

    entity.animations.north.layers[1].filename = "__darkstar-machines__/graphics/entity/" .. pumpjack.name .. "/pumpjack-horsehead.png"
    entity.animations.north.layers[1].hr_version.filename = "__darkstar-machines__/graphics/entity/" .. pumpjack.name .. "/hr-pumpjack-horsehead.png"

    item.name = pumpjack.name
    item.icon = "__darkstar-machines__/graphics/icons/" .. pumpjack.name .. ".png"
    item.place_result = pumpjack.name
    item.order = pumpjack.order
    item.subgroup = "ds-extraction"

    table.insert(data.raw["technology"][pumpjack.technology].effects, { type = "unlock-recipe", recipe = pumpjack.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = pumpjack.name,
            enabled = false,
            ingredients = pumpjack.ingredients,
            result = pumpjack.name
        }
    })
end
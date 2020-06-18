
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
local item_base = util.table.deepcopy(data.raw["item"]["chemical-plant"])

for x, chemical_plant in pairs(chemical_plants) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = chemical_plant.name    
    entity.icon = "__darkstar-machines__/graphics/icons/" .. chemical_plant.name .. ".png"
    entity.minable.result = chemical_plant.name
    entity.max_health = chemical_plant.health
    entity.crafting_speed = chemical_plant.crafting_speed
    entity.energy_usage = chemical_plant.energy_con_kw .. "kW"
    entity.energy_source.drain = chemical_plant.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = chemical_plant.pollution_per_min
    entity.module_specification.module_slots = chemical_plant.module_slots
    
    entity.animation = make_4way_animation_from_spritesheet({ 
        layers =
            {
                {
                    filename = "__darkstar-machines__/graphics/entity/" .. chemical_plant.name .. "/chemical-plant.png",
                    width = 108,
                    height = 148,
                    frame_count = 24,
                    line_length = 12,
                    shift = util.by_pixel(1, -9),
                    hr_version =
                    {
                        filename = "__darkstar-machines__/graphics/entity/" .. chemical_plant.name .. "/hr-chemical-plant.png",
                        width = 220,
                        height = 292,
                        frame_count = 24,
                        line_length = 12,
                        shift = util.by_pixel(0.5, -9),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/chemical-plant/chemical-plant-shadow.png",
                    width = 154,
                    height = 112,
                    repeat_count = 24,
                    frame_count = 1,
                    shift = util.by_pixel(28, 6),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/chemical-plant/hr-chemical-plant-shadow.png",
                        width = 312,
                        height = 222,
                        repeat_count = 24,
                        frame_count = 1,
                        shift = util.by_pixel(27, 6),
                        draw_as_shadow = true,
                        scale = 0.5
                    }
                }
            }
        }
    )

    item.name = chemical_plant.name
    item.icon = "__darkstar-machines__/graphics/icons/" .. chemical_plant.name .. ".png"
    item.place_result = chemical_plant.name
    item.order = chemical_plant.order
    item.subgroup = "ds-assembly-machines-2"

    table.insert(data.raw["technology"][chemical_plant.technology].effects, { type = "unlock-recipe", recipe = chemical_plant.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = chemical_plant.name,
            enabled = false,
            ingredients = chemical_plant.ingredients,
            result = chemical_plant.name
        }
    })
end
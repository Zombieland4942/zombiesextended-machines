
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["oil-refinery"])
local item_base = util.table.deepcopy(data.raw["item"]["oil-refinery"])

for x, oil_refinery in pairs(oil_refineries) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = oil_refinery.name    
    entity.icon = "__darkstar-machines__/graphics/icons/" .. oil_refinery.name .. ".png"
    entity.minable.result = oil_refinery.name
    entity.max_health = oil_refinery.health
    entity.crafting_speed = oil_refinery.crafting_speed
    entity.energy_usage = oil_refinery.energy_con_kw .. "kW"
    entity.energy_source.drain = oil_refinery.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = oil_refinery.pollution_per_min
    entity.module_specification.module_slots = oil_refinery.module_slots
    
    entity.animation = make_4way_animation_from_spritesheet({ 
        layers =
            {
                {
                    filename = "__darkstar-machines__/graphics/entity/" .. oil_refinery.name .. "/oil-refinery.png",
                    width = 337,
                    height = 255,
                    frame_count = 1,
                    shift = {2.515625, 0.484375},
                    hr_version =
                    {
                        filename = "__darkstar-machines__/graphics/entity/" .. oil_refinery.name .. "/hr-oil-refinery.png",
                        width = 386,
                        height = 430,
                        frame_count = 1,
                        shift = util.by_pixel(0, -7.5),
                        scale = 0.5
                    }
                },
                {
                    filename = "__base__/graphics/entity/oil-refinery/oil-refinery-shadow.png",
                    width = 337,
                    height = 213,
                    frame_count = 1,
                    shift = util.by_pixel(82.5, 26.5),
                    draw_as_shadow = true,
                    hr_version =
                    {
                        filename = "__base__/graphics/entity/oil-refinery/hr-oil-refinery-shadow.png",
                        width = 674,
                        height = 426,
                        frame_count = 1,
                        shift = util.by_pixel(82.5, 26.5),
                        draw_as_shadow = true,
                        force_hr_shadow = true,
                        scale = 0.5
                    }

                }
            }
        }
    )

    item.name = oil_refinery.name
    item.icon = "__darkstar-machines__/graphics/icons/" .. oil_refinery.name .. ".png"
    item.place_result = oil_refinery.name
    item.order = oil_refinery.order
    item.subgroup = "ds-assembly-machines"

    table.insert(data.raw["technology"][oil_refinery.technology].effects, { type = "unlock-recipe", recipe = oil_refinery.name })

    data:extend({ entity, item,
        {
            type = "recipe",
            name = oil_refinery.name,
            enabled = false,
            ingredients = oil_refinery.ingredients,
            result = oil_refinery.name
        }
    })
end
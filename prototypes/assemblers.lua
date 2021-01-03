
local entity_base = util.table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
local item_base = util.table.deepcopy(data.raw["item"]["assembling-machine-3"])

for x, assembler in pairs(assemblers) do
    
    entity = util.table.deepcopy(entity_base)
    item = util.table.deepcopy(item_base)

    entity.name = assembler.name    
    entity.icon = "__zombiesextended-machines__/graphics/icons/" .. assembler.name .. ".png"
    entity.minable.result = assembler.name
    entity.max_health = assembler.health
    entity.crafting_speed = assembler.crafting_speed
    entity.energy_usage = assembler.energy_con_kw .. "kW"
    entity.energy_source.drain = assembler.energy_drain_kw .. "kW"
    entity.energy_source.emissions_per_minute = assembler.pollution_per_min
    entity.module_specification.module_slots = assembler.module_slots    
    entity.next_upgrade = assembler.next_upgrade
    
    entity.fluid_boxes[1].pipe_picture.north.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-N.png"
    entity.fluid_boxes[1].pipe_picture.north.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-N.png"
    entity.fluid_boxes[1].pipe_picture.east.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-E.png"
    entity.fluid_boxes[1].pipe_picture.east.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-E.png"
    entity.fluid_boxes[1].pipe_picture.south.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-S.png"
    entity.fluid_boxes[1].pipe_picture.south.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-S.png"
    entity.fluid_boxes[1].pipe_picture.west.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-W.png"
    entity.fluid_boxes[1].pipe_picture.west.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-W.png"

    entity.fluid_boxes[2].pipe_picture.north.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-N.png"
    entity.fluid_boxes[2].pipe_picture.north.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-N.png"
    entity.fluid_boxes[2].pipe_picture.east.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-E.png"
    entity.fluid_boxes[2].pipe_picture.east.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-E.png"
    entity.fluid_boxes[2].pipe_picture.south.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-S.png"
    entity.fluid_boxes[2].pipe_picture.south.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-S.png"
    entity.fluid_boxes[2].pipe_picture.west.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine-pipe-W.png"
    entity.fluid_boxes[2].pipe_picture.west.hr_version.filename  = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine-pipe-W.png"

    entity.animation.layers[1].filename = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/assembling-machine.png"
    entity.animation.layers[1].hr_version.filename = "__zombiesextended-machines__/graphics/entity/" .. assembler.name .. "/hr-assembling-machine.png"

    item.name = assembler.name
    item.icon = "__zombiesextended-machines__/graphics/icons/" .. assembler.name .. ".png"
    item.place_result = assembler.name
    item.order = item.order .. assembler.order

    if settings.startup["zombies-use-seperate-tab"].value == true then
        item.subgroup = "ds-assembly-machines-2"
    end

    table.insert(data.raw["technology"][assembler.technology].effects, { type = "unlock-recipe", recipe = assembler.name })
    data:extend({ entity, item,
        {
            type = "recipe",
            name = assembler.name,
            enabled = false,            
            energy_required = assembler.craft_time,
            ingredients = assembler.ingredients,
            result = assembler.name
        }
    })
end
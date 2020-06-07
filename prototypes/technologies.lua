
for x, technology in pairs(technologies) do
    
    data:extend({
        {
            type = "technology",
            name = technology.name,
            icon_size = 128,
            icon = "__darkstar-machines__/graphics/technology/" .. technology.name .. ".png",
            effects = { },
            unit =
            {
                count = technology.count,
                ingredients = technology.ingredients,
                time = technology.time
            },
            prerequisites = technology.prerequisite,
            order = technology.order
        }
    })
end
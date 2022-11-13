-- Este sistema dibuja

-- Este sistema será clave para poder visualizar que los componentes funcionen como deben

DrawingSystem = class("DrawSystem", System)

-- Lo único que necesitamos es el componente transform
function DrawingSystem:requires()
    return { "transform" }
end

function DrawingSystem:draw()

    for _, entity in pairs(self.targets) do

        -- Puede llegar a ser que la entidad tenga el componente color, si es el caso se pintará con un color
        -- custom através del componente color -> color.r, color.b...
        local color = entity:get("color")

        if color == nil then

            love.graphics.setColor(1, 1, 1, 1)
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)
            love.graphics.setColor(1, 1, 1, 1)

        else
            
            love.graphics.setColor(love.math.colorFromBytes(color.r, color.g, color.b))
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)
            love.graphics.setColor(1, 1, 1, 1)

        end

    end
end

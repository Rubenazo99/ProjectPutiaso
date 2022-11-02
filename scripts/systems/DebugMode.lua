-- Este sistema permite usa herramientas debug ¿Quizás podriamos meter meta mecánicas como arrastrar cajas? A saber...

DebugMode = class("DebugMode", System)

function DebugMode:require()
    return { "transform", "dragableComponent" }
end

function DebugMode:update(dt)

    for _, entity in pairs(self.targets) do
        
        -- Esto maneja el poder agarrar las entidades con el mouse
        -- cuidado de no ponerte por encima de otro objeto mientras agarras uno...

        if entity:get("dragableComponent") ~= nil then

            local mouseClicked, deleteClicked = love.mouse.isDown(1), love.mouse.isDown(2)
            local dragable = entity:get("dragableComponent")
            local transform = entity:get("transform")

            if mouseClicked == true then

                if dragable.enabled == true then
                    
                    if mouseX > transform.x and mouseX < transform.x + transform.width
                    and mouseY > transform.y and mouseY < transform.y + transform.height then
                        
                        dragable.isBeingDragged = true

                    end

                end

                if dragable.isBeingDragged == true then
                    
                    transform.x = mouseX - transform.width / 2
                    transform.y = mouseY - transform.height / 2

                end

            elseif mouseClicked == false and dragable.isBeingDragged == true then

                dragable.isBeingDragged = false

            end
            
            if deleteClicked then

                if mouseX > transform.x and mouseX < transform.x + transform.width
                and mouseY > transform.y and mouseY < transform.y + transform.height then
                    
                    engine:removeEntity(entity)

                end

            end

        end
        
    end

end
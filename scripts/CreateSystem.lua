-- Este sistema hace que haya gravedad

GravitySystem = class("GravitySystem", System)

function GravitySystem:requires()
    return { "transform", "velocity", "acceleration", "collider" }
end

function GravitySystem:update(dt)

    for key, entity in pairs(self.targets) do

        if entity:get("acceleration") ~= nil then

            local transform = entity:get("transform")
            local velocity = entity:get("velocity")
            local acceleration = entity:get("acceleration")
            local collider = entity:get("collider")


            if collider.isColliding == false then

                velocity.y = velocity.y + acceleration.y * dt
                transform.y = transform.y + velocity.y

            end

        end

    end

end

-- Este sistema te permite saltar si estás tocando el suelo

JumpSystem = class("JumpSystem", System)

function JumpSystem:require()
    return { "collider", "velocity", "jump" }
end

function JumpSystem:update(dt)

    for _, entity in pairs(self.targets) do

        if entity:get("jump") ~= nil then
            
            local velocity = entity:get("velocity")
            local jump = entity:get("jump")
            local collider = entity:get("collider")

            if love.keyboard.isDown(jump.jumpKey) and collider.isColliding == true then
                
                velocity.y = jump.force
                collider.isColliding = false

            end

        end

    end

end

-- Este sistema dibuja

DrawingSystem = class("DrawSystem", System)

function DrawingSystem:requires()
    return { "transform" }
end

function DrawingSystem:draw()

    for _, entity in pairs(self.targets) do

        local color = entity:get("color")

        if color == nil then
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)
        else
            love.graphics.setColor(love.math.colorFromBytes(color.r, color.g, color.b))
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)
            love.graphics.setColor(1, 1, 1, 1)
        end

    end
end

-- Este sistema chequea colisiones

CollisionSystem = class("CollisionSystem", System)

function CollisionSystem:requires()
    return { "transform", "collider" }
end

function CollisionSystem:update(dt)

    for _, entityA in pairs(self.targets) do

        local transformA = entityA:get("transform")
        local colliderA = entityA:get("collider")

        if colliderA.isColliding == false then

            for _, entityB in pairs(self.targets) do

                if entityA ~= entityB then

                    local transformB = entityB:get("transform")

                    if (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                        and (transformA.y + transformA.height > transformB.y and transformA.y + transformA.height * 2 < transformB.y + transformB.height * 2) then

                        colliderA.isColliding = true
                        transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height

                    end

                end

                if colliderA.isColliding == true then break end

            end
        end

    end

end
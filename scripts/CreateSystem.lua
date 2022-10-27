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

-- Este sistema te permite moverte si estás tocando el suelo

MovementSystem = class("MovementSystem", System)

function MovementSystem:require()
    return { "transform", "velocity", "movementKeys", "collider" }
end

function MovementSystem:update(dt)

    for _, entity in pairs(self.targets) do

        local transform = entity:get("transform")
        local velocity = entity:get("velocity")
        local movementKeys = entity:get("movementKeys")
        local collider = entity:get("collider")

        if collider.isTouchingWall == false then

            if collider.isColliding == true then

                if love.keyboard.isDown(movementKeys.left) then transform.x = transform.x - velocity.x * dt end
                if love.keyboard.isDown(movementKeys.right) then transform.x = transform.x + velocity.x * dt end

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

                jump.rayActive = false
                velocity.y = jump.force
                collider.isColliding = false

            end

            if jump.rayActive == false then

                if jump.timer < jump.maxTimer then

                    jump.timer = jump.timer + dt

                else

                    jump.timer = 0
                    jump.rayActive = true

                end

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

-- Este sistema chequea colisiones del suelo

GroundCollisionSystem = class("GroundCollisionSystem", System)

function GroundCollisionSystem:requires()
    return { "transform", "collider" }
end

function GroundCollisionSystem:update(dt)

    for _, entityA in pairs(self.targets) do

        if entityA:get("transform").name == "PlayerA" or entityA:get("transform").name == "PlayerB" then

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            for _, entityB in pairs(self.targets) do

                if entityA ~= entityB then

                    if entityA:get("jump").rayActive == true then

                        local transformB = entityB:get("transform")
                        local offset = 15

                        local rayA = { origin = { x = transformA.x, y = transformA.y + transformA.height + 5 },
                            final = { x = transformA.x, y = transformA.y + transformA.height + offset } }

                        local rayACollision = (
                            (rayA.origin.x > transformB.x and rayA.origin.x < transformB.x + transformB.width)
                                and (rayA.final.x > transformB.x and rayA.final.x < transformB.x + transformB.width)) and
                            ((rayA.origin.y > transformB.y and rayA.origin.y < transformB.y + transformB.height) and
                                (rayA.final.y > transformB.y and rayA.final.y < transformB.y + transformB.height))

                        local rayB = { origin = { x = transformA.x + transformA.width,
                            y = transformA.y + transformA.height + 5 },
                            final = { x = transformA.x + transformA.width, y = transformA.y + transformA.height + offset } }

                        local rayBCollision = (
                            (rayB.origin.x > transformB.x and rayB.origin.x < transformB.x + transformB.width)
                                and (rayB.final.x > transformB.x and rayB.final.x < transformB.x + transformB.width)) and
                            ((rayB.origin.y > transformB.y and rayB.origin.y < transformB.y + transformB.height) and
                                (rayB.final.y > transformB.y and rayB.final.y < transformB.y + transformB.height))

                        if rayACollision or rayBCollision then

                            if colliderA.isColliding == false then

                                colliderA.isColliding = true
                                transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height
                                if entityA:get("velocity").y ~= 0 then entityA:get("velocity").y = 0 end

                            end

                        else

                            if colliderA.isColliding == true then
                                colliderA.isColliding = false
                            end

                        end

                    end

                    --if ((transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                    --and (transformA.y + transformA.height > transformB.y and transformA.y + transformA.height * 2 < transformB.y + transformB.height * 2))
                    --and colliderA.isColliding == false then
                    --SE VI
                    --    colliderA.isColliding = true
                    --    entityA:get("velocity").y = 0
                    --   transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height

                end

                if colliderA.isColliding == true then break end

            end
        end

    end

end

-- Este sistema chequea que pares al tocar la pared

WallCollisionSystem = class("WallCollisionSystem", System)

function WallCollisionSystem:require()
    return { "transform", "collider" }
end

function WallCollisionSystem:update(dt)

    for _, entityA in pairs(self.targets) do

        if entityA:get("transform").name == "PlayerA" or entityA:get("transform").name == "PlayerB" then

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            for _, entityB in pairs(self.targets) do

                if entityA ~= entityB then

                    local transformB = entityB:get("transform")
                    local colliderB = entityB:get("collider")

                    

                end

            end

        end

    end

end

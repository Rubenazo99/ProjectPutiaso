-- Este sistema chequea que pares al tocar la pared

-- Este sistema es parecido al de GroundCollisionSystem, aunque la única diferencia
-- es que no estaremos usando raycasts.

WallCollisionSystem = class("WallCollisionSystem", System)

function WallCollisionSystem:require()
    return { "transform", "collider", "direction" }
end

function WallCollisionSystem:update(dt)

    for _, entityA in pairs(self.targets) do

        if entityA:get("hitComponent") ~= nil then

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            for _, entityB in pairs(self.targets) do

                if entityA ~= entityB then

                    local transformB = entityB:get("transform")
                    local direction = entityA:get("direction")

                    --             GGGGGGGGG XXXXXXXXX LLLLLLLLL
                    --             GGGGGGGGG XXXXXXXXX LLLLLLLLL
                    --             GGGGGGGGG XXXXXXXXX LLLLLLLLL
                    --             GGGGGGGGG XXXXXXXXX LLLLLLLLL
                    -- **************************************************
                    --
                    -- G = proyección hacia la izquierda de las coordenadas del jugador
                    -- L = proyección hacia la derecha de las coordenadsa del jugador
                    --
                    -- Lo único malo de esto es que si la plataforma es menos ancha, puede atravesarla
                    --

                    -- Ahora si, acivamos uno o otro dependiendo en qué dirección nos estamos moviendo, y
                    -- desactivamos la proyección opuesta

                    if (direction.left and not direction.right) then

                        if (transformA.x - transformA.width / 2 > transformB.x and transformA.x - transformA.width / 2 < transformB.x + transformB.width )
                        and (transformA.y + 0.2 > transformB.y and transformA.y + 0.2 < transformB.y + transformB.height) 
                        and (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                        and (transformA.y + transformA.height - 0.2 > transformB.y and transformA.y + transformA.height - 0.2 < transformB.y + transformB.height ) then

                            colliderA.isTouchingLeftWall = true
                            transformA.x = transformA.x + (transformB.x + transformB.width) - (transformA.x + transformA.width) + transformA.width + 0.2
                            entityA:get("hitComponent").hit = false
                            entityA:get("jump").rayActive = true
                            -- Obviamente cuando pasa un frame el jugador sigue dentro un poquito, hay que corregir su posición
                            -- para que al dejar de mover esté contra la pared... AUNQUE hay un bug si ocurre por lo que lo movemos ligeramente a un lado

                        else colliderA.isTouchingLeftWall = false end
                    
                    elseif (direction.right and not direction.left) then
                        
                        if (transformA.x + transformA.width * 1.5 > transformB.x and transformA.x + transformA.width * 1.5 < transformB.x + transformB.width) 
                        and (transformA.y + 0.2 > transformB.y and transformA.y + 0.2 < transformB.y + transformB.height) 
                        and (transformA.x + transformA.width > transformB.x and transformA.x + transformA.width < transformB.x + transformB.width) 
                        and (transformA.y + transformA.height - 0.2 > transformB.y and transformA.y + transformA.height - 0.2 < transformB.y + transformB.height) then

                            colliderA.isTouchingRightWall = true
                            transformA.x = transformA.x - (transformA.x - transformB.x) - transformA.width - 0.1
                            entityA:get("hitComponent").hit = false
                            entityA:get("jump").rayActive = true

                        else colliderA.isTouchingRightWall = false end

                    elseif entityA:get("hitComponent").hit == true and entityB:get("velocity") == nil then
                        
                        if (transformA.x - transformA.width / 2 > transformB.x and transformA.x - transformA.width / 2 < transformB.x + transformB.width )
                        and (transformA.y + 0.2 > transformB.y and transformA.y + 0.2 < transformB.y + transformB.height) 
                        and (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                        and (transformA.y + transformA.height - 0.2 > transformB.y and transformA.y + transformA.height - 0.2 < transformB.y + transformB.height ) then

                            transformA.x = transformA.x + (transformB.x + transformB.width) - (transformA.x + transformA.width) + transformA.width + 0.1
                            colliderA.isTouchingLeftWall = true
                            entityA:get("hitComponent").hit = false
                            entityA:get("jump").rayActive = true
                            -- Obviamente cuando pasa un frame el jugador sigue dentro un poquito, hay que corregir su posición
                            -- para que al dejar de mover esté contra la pared... AUNQUE hay un bug si ocurre por lo que lo movemos ligeramente a un lado

                        else colliderA.isTouchingLeftWall = false end

                        if (transformA.x + transformA.width * 1.5 > transformB.x and transformA.x + transformA.width * 1.5 < transformB.x + transformB.width) 
                        and (transformA.y + 0.2 > transformB.y and transformA.y + 0.2 < transformB.y + transformB.height) 
                        and (transformA.x + transformA.width > transformB.x and transformA.x + transformA.width < transformB.x + transformB.width) 
                        and (transformA.y + transformA.height - 0.2 > transformB.y and transformA.y + transformA.height - 0.2 < transformB.y + transformB.height) then

                            transformA.x = transformA.x - (transformA.x - transformB.x) - transformA.width - 0.1
                            colliderA.isTouchingRightWall = true
                            entityA:get("hitComponent").hit = false
                            entityA:get("jump").rayActive = true

                        else colliderA.isTouchingRightWall = false end
                    end
                end
            end
        end
    end
end

function WallRayCast(playerTransform, entityTransform, horizontalOffset, verticalOffset, playerTransformWidth)

    playerTransformWidth = playerTransformWidth or 0

    local rayA = nil
    local rayACollision = false
    local rayB = nil
    local rayBCollision = false

    rayA = { origin = { x = playerTransform.x + playerTransformWidth, y = playerTransform.y + verticalOffset },
        final = { x = playerTransform.x + playerTransformWidth, y = playerTransform.y + verticalOffset } }

    rayACollision = (rayA.origin.x > entityTransform.x and rayA.origin.x < entityTransform.x + entityTransform.width)
        and (rayA.origin.y > entityTransform.y and rayA.origin.y < entityTransform.y + entityTransform.height)
        and (rayA.final.x > entityTransform.x and rayA.final.x < entityTransform.x + entityTransform.width)
        and (rayA.final.y > entityTransform.y and rayA.final.y < entityTransform.y + entityTransform.height)

    rayB = { origin = { x = playerTransform.x + playerTransformWidth + horizontalOffset, y = playerTransform.y + playerTransform.height - verticalOffset },
        final = { x = playerTransform.x + playerTransformWidth + horizontalOffset, y = playerTransform.y + playerTransform.height - verticalOffset } }

    rayBCollision = (rayB.origin.x > entityTransform.x and rayB.origin.x < entityTransform.x + entityTransform.width)
        and (rayB.origin.y > entityTransform.y and rayB.origin.y < entityTransform.y + entityTransform.height)
        and (rayB.final.x > entityTransform.x and rayB.final.x < entityTransform.x + entityTransform.width)
        and (rayB.final.y > entityTransform.y and rayB.final.y < entityTransform.y + entityTransform.height)

    return rayACollision, rayBCollision

end
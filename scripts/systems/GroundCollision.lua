-- Este sistema chequea colisiones del suelo

-- Este sistema trata sobre la colisión en el suelo, sin esto todos los objetos
-- atravesarán el suelo indefinidamente

GroundCollisionSystem = class("GroundCollisionSystem", System)

-- lo único que requeriremos es el transform y el collider
function GroundCollisionSystem:requires()
    return { "transform", "collider" }
end

function GroundCollisionSystem:update(dt)

    -- para poder asegurarnos que solo los jugadores utilizan este código y el suelo no se pone a saltar
    -- comparamos que la entidad A sea un jugador mediante sus nombres, aunque se podría hacer de otra manera
    for _, entityA in pairs(self.targets) do

        if entityA:get("hitComponent") ~= nil then

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            -- Ahora agarramos todas las entidades de nuevo...

            for _, entityB in pairs(self.targets) do

                -- y nos aseguramos que el jugador no colisione consigo mismo de esta forma...
                if entityA ~= entityB then

                    local transformB = entityB:get("transform")

                    -- ahora, ya tenemos la entidad A (jugador) y entidad B (suelo)
                    -- Aquí comparamos que el componente jump.rayActive esté activo, esto
                    -- significa que si está activo tenemos que activar los raycast
                    if entityA:get("jump").rayActive == true then



                        -- Aquí creamos los 2 raycast, rayA, que está a la x dle jugador, y el otro, rayB, que está a su derecha

                        -- **************************************
                        --              C       D
                        --              C       D
                        --              XXXXXXXXX
                        --              XXXXXXXXX
                        --              XXXXXXXXX
                        --              XXXXXXXXX
                        --              A       B
                        --              A       B
                        -- **************************************

                        -- A = rayA, B = rayB, C = rayC, D = rayD

                        -- Con que uno de los dos de true, entonces estará colisionando con el suelo

                        local rayA = nil
                        local rayACollision = false
                        local rayB = nil
                        local rayBCollision = false

                        -- Si no estamos tocando la pared de la izquierda sacamos el rayo de suelo de izquierda

                        if not colliderA.isTouchingLeftWall then
                            rayA = { origin = { x = transformA.x , y = transformA.y + transformA.height + 5 },
                                final = { x = transformA.x, y = transformA.y + transformA.height + offset } }

                            rayACollision = (
                                (rayA.origin.x > transformB.x and rayA.origin.x < transformB.x + transformB.width)
                                    and (rayA.final.x > transformB.x and rayA.final.x < transformB.x + transformB.width)) and
                                ((rayA.origin.y > transformB.y and rayA.origin.y < transformB.y + transformB.height) and
                                    (rayA.final.y > transformB.y and rayA.final.y < transformB.y + transformB.height))
                        end

                        -- Si no estamos tocando la pared de la derecha sacamos el rayo de suelo de derecha

                        if not colliderA.isTouchingRightWall then

                            rayB = { origin = { x = transformA.x + transformA.width,
                                y = transformA.y + transformA.height + 5 },
                                final = { x = transformA.x + transformA.width, y = transformA.y + transformA.height + offset } }

                            rayBCollision = (
                                (rayB.origin.x > transformB.x and rayB.origin.x < transformB.x + transformB.width)
                                    and (rayB.final.x > transformB.x and rayB.final.x < transformB.x + transformB.width)) and
                                ((rayB.origin.y > transformB.y and rayB.origin.y < transformB.y + transformB.height) and
                                    (rayB.final.y > transformB.y and rayB.final.y < transformB.y + transformB.height))

                        end

                        -- Si estamos colisionando entonces hacemos lo siguiente (paramos el golpe, corregimos la pos x del jugador y reseteamos la vel)
                        if rayACollision or rayBCollision then

                            if colliderA.isColliding == false then

                                colliderA.isColliding = true
                                transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height
                                if entityA:get("velocity").y ~= 0 then entityA:get("velocity").y = 0 end
                                entityA:get("hitComponent").hit = false

                            end

                        else

                            if colliderA.isColliding == true then
                                colliderA.isColliding = false
                            end

                        end

                    end

                    -- Estos rayos serán activos las 24 horas pues solo mira que si tocamos el techo bajamos el jugador un poquito

                    if transformB.name ~= "PlayerA" and transformB.name ~= "PlayerB" then

                        local rayC = nil
                        local rayCCollision = false
                        local rayD = nil
                        local rayDCollision = false

                        rayC = { origin = { x = transformA.x, y = transformA.y - 5 },
                            final = { x = transformA.x, y = transformA.y - offset } }

                        rayCCollision = (rayC.origin.x > transformB.x and rayC.origin.x < transformB.x + transformB.width)
                            and (rayC.origin.y < transformB.y + transformB.height and rayC.origin.y > transformB.y) and
                            (rayC.final.x > transformB.x and rayC.final.x < transformB.x + transformB.width)
                            and (rayC.final.y < transformB.y + transformB.height and rayC.final.y > transformB.y)

                        rayD = { origin = { x = transformA.x + transformA.width, y = transformA.y - 5 },
                            final = { x = transformA.x + transformA.width, y = transformA.y - offset } }

                        rayDCollision = (rayD.origin.x > transformB.x and rayD.origin.x < transformB.x + transformB.width)
                            and (rayD.origin.y < transformB.y + transformB.height and rayD.origin.y > transformB.y) and
                            (rayD.final.x > transformB.x and rayD.final.x < transformB.x + transformB.width)
                            and (rayD.final.y < transformB.y + transformB.height and rayD.final.y > transformB.y)

                        if rayCCollision or rayDCollision then

                            --transformA.y = transformA.y + (transformB.y + transformB.height - transformA.y) + transformA.height
                            --entityA:get("jump").rayActive = true
                            entityA:get("velocity").y = 0
                            entityA:get("hitComponent").hit = false

                        end

                    end


                    -- código antiguo DO NOT ENABLE DO NOT TOUCH COMO LO TOQUES TE MATO (con cariño)

                    --if ((transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                    --and (transformA.y + transformA.height > transformB.y and transformA.y + transformA.height * 2 < transformB.y + transformB.height * 2))
                    --and colliderA.isColliding == false then
                    --SE VI
                    --    colliderA.isColliding = true
                    --    entityA:get("velocity").y = 0
                    --   transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height

                end

                -- Aquí simplemente rompemos el for en cuando esté colisionando, no quiero que siga comparando con el resto. ¿Pa qué?
                -- pues para ahorrar recursos puto
                if colliderA.isColliding == true then break end

            end
        end

    end

end

-- Este sistema hace que haya gravedad

-- Creamos el sistema de gravedad, este, mientras no estés moviendote y estes en el aire
-- aplicará gravedad al jugador/es mediante la fórmula del movimiento rectilinio acelerado
GravitySystem = class("GravitySystem", System)

-- Para esto requiereiremos 4 componentes, transform, velocidad, aceleración y collider,
-- para así poder mirar si estoy colisionando no caigo
function GravitySystem:requires()
    return { "transform", "velocity", "acceleration", "collider" }
end

function GravitySystem:update(dt)

    -- Tenemos que asegurarnos que agarramos cada entidad afectada
    -- por dichos requerimientos
    for key, entity in pairs(self.targets) do

        if entity:get("acceleration") ~= nil then

            -- Agarramos las variables
            local transform = entity:get("transform")
            local velocity = entity:get("velocity")
            local acceleration = entity:get("acceleration")
            local collider = entity:get("collider")

            -- Miramos si estamos colisionando previamente
            if collider.isColliding == false then

                -- Si no hacemos la fórmula de MRUA con la velocidad y sumamos eso a la posición del jugador
                -- si no se hace así no funcionará
                velocity.y = velocity.y + acceleration.y * dt
                transform.y = transform.y + velocity.y

            end

        end

    end

end

-- Este sistema te permite moverte si estás tocando el suelo

-- Creamos el sistema de movimiento, este sistema nos permitirá movernos si estamos
-- tocando el suelo
MovementSystem = class("MovementSystem", System)

function MovementSystem:require()
    return { "transform", "velocity", "movementKeys", "collider", "direction" }
end

function MovementSystem:update(dt)

    for _, entity in pairs(self.targets) do

        if entity:get("direction") ~= nil then

            local transform = entity:get("transform")
            local velocity = entity:get("velocity")
            local movementKeys = entity:get("movementKeys")
            local collider = entity:get("collider")
            local direction = entity:get("direction")

            -- Si no estamos tocando la pared ya...
            if collider.isTouchingLeftWall == false and collider.isTouchingRightWall == false then

                -- ... y estamos tocando el suelo...
                if collider.isColliding == true and entity:get("attackComponent").charging == false then

                    -- agarramos las variables de direction left y right y las
                    -- sobrescribimos cada frame con esto
                    direction.left = love.keyboard.isDown(movementKeys.left)
                    direction.right = love.keyboard.isDown(movementKeys.right)

                    -- entonces hacemos dos ifs, porque si llegamos a pulsar las dos
                    -- teclas de mover a la vez, haremos que se quede quieto, es como sumar 1 y -1, te da 0 bro
                    if direction.left then transform.x = transform.x - velocity.x * dt  end
                    if direction.right then transform.x = transform.x + velocity.x * dt end

                end

            end
        end
    end

end

-- Este sistema te permite saltar si estás tocando el suelo

-- Este sistema nos permitirá poder saltar dentro del juego
-- simplemente cambiando el valor de velocidad vertical actual a negativo

JumpSystem = class("JumpSystem", System)

-- Para esto requeriremos los componentes collider, velocidad y salto
function JumpSystem:require()
    return { "collider", "velocity", "jump" }
end

function JumpSystem:update(dt)

    for _, entity in pairs(self.targets) do

        if entity:get("jump") ~= nil then

            local velocity = entity:get("velocity")
            local jump = entity:get("jump")
            local collider = entity:get("collider")

            -- Miramos si estamos presionando la tecla de salto y si estamos en el suelo...
            if love.keyboard.isDown(jump.jumpKey) and collider.isColliding == true then

                -- y si es, desactivaos el raycast del suelo, cambiamos la velocidad actual a la de la fuerza
                -- de salto dentro del componente jump (jump.jumpForce)
                jump.rayActive = false
                velocity.y = jump.force
                collider.isColliding = false

            end

            -- Para evitar que podamos saltar con el sistema de raycast, tenemos que deshabilitar los raycast
            -- de salto durante 0.3 segundos, esto es solo un timer utilizando las variables jump.timer y jump.MaxTimer,
            -- configurables

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

        if entityA:get("transform").name == "PlayerA" or entityA:get("transform").name == "PlayerB" then

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            -- Ahora agarramos todas las entidades de nuevo...

            for _, entityB in pairs(self.targets) do

                -- y nos aseguramos que el jugador no colisione consigo mismo de esta forma...
                if entityA ~= entityB then

                    -- ahora, ya tenemos la entidad A (jugador) y entidad B (suelo)
                    -- Aquí comparamos que el componente jump.rayActive esté activo, esto
                    -- significa que si está activo tenemos que activar los raycast
                    if entityA:get("jump").rayActive == true then

                        local transformB = entityB:get("transform")
                        local offset = 15

                        -- Aquí creamos los 2 raycast, rayA, que está a la x dle jugador, y el otro, rayB, que está a su derecha

                        --              XXXXXXXXX
                        --              XXXXXXXXX
                        --              XXXXXXXXX
                        --              XXXXXXXXX
                        --              O       P
                        --              O       P
                        -- **************************************

                        -- O = rayA, P = rayB

                        -- Con que uno de los dos de true, entonces estará colisionando con el suelo

                        local rayA = nil
                        local rayACollision = false
                        local rayB = nil
                        local rayBCollision = false

                        if not colliderA.isTouchingLeftWall then
                            rayA = { origin = { x = transformA.x , y = transformA.y + transformA.height + 5 },
                                final = { x = transformA.x, y = transformA.y + transformA.height + offset } }

                            rayACollision = (
                                (rayA.origin.x > transformB.x and rayA.origin.x < transformB.x + transformB.width)
                                    and (rayA.final.x > transformB.x and rayA.final.x < transformB.x + transformB.width)) and
                                ((rayA.origin.y > transformB.y and rayA.origin.y < transformB.y + transformB.height) and
                                    (rayA.final.y > transformB.y and rayA.final.y < transformB.y + transformB.height))
                        end

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

                        if rayACollision or rayBCollision then

                            if colliderA.isColliding == false then

                                colliderA.isColliding = true
                                entityA:get("hitComponent").hit = false
                                transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height
                                if entityA:get("velocity").y ~= 0 then entityA:get("velocity").y = 0 end

                            end

                        else

                            if colliderA.isColliding == true then
                                colliderA.isColliding = false
                            end

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

-- Este sistema chequea que pares al tocar la pared

-- Este sistema es parecido al de GroundCollisionSystem, aunque la única diferencia
-- es que no estaremos usando raycasts.

WallCollisionSystem = class("WallCollisionSystem", System)

function WallCollisionSystem:require()
    return { "transform", "collider", "direction" }
end

function WallCollisionSystem:update(dt)

    for _, entityA in pairs(self.targets) do

        if entityA:get("transform").name == "PlayerA" or entityA:get("transform").name == "PlayerB" then

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            for _, entityB in pairs(self.targets) do

                if entityA ~= entityB and entityB:get("transform").name == "Wall" or entityB:get("transform").name == "PlayerA"
                or entityB:get("transform").name == "PlayerB" then

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

                        if (transformA.x - transformA.width > transformB.x and transformA.x - transformA.width < transformB.x + transformB.width)
                            and
                            (transformA.y > transformB.y and transformA.y + transformA.height < transformB.y + transformB.height)
                            and
                            (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                            and
                            (transformA.y > transformB.y and transformA.y + transformA.height < transformB.y + transformB.height)

                        then

                            transformA.x = transformA.x + (transformB.x + transformB.width) - (transformA.x + transformA.width) + transformA.width + 0.1
                            colliderA.isTouchingLeftWall = true
                            -- Obviamente cuando pasa un frame el jugador sigue dentro un poquito, hay que corregir su posición
                            -- para que al dejar de mover esté contra la pared... AUNQUE hay un bug si ocurre por lo que lo movemos ligeramente a un lado


                        else

                            colliderA.isTouchingLeftWall = false

                        end
                    
                    elseif (direction.right and not direction.left) then
                        
                        if (transformA.x + transformA.width * 2 > transformB.x and transformA.x + transformA.width * 2 < transformB.x + transformB.width)
                            and
                            (transformA.y > transformB.y and transformA.y + transformA.height < transformB.y + transformB.height)
                            and
                            (transformA.x + transformA.width > transformB.x and transformA.x + transformA.width < transformB.x + transformB.width)
                            and
                            (transformA.y > transformB.y and transformA.y + transformA.height < transformB.y + transformB.height)

                        then

                            transformA.x = transformA.x - (transformA.x - transformB.x) - transformA.width - 0.1
                            colliderA.isTouchingRightWall = true

                        else

                            colliderA.isTouchingRightWall = false

                        end

                    elseif entityA:get("hitComponent").hit == true then
                        
                        if (
                            transformA.x - transformA.width > transformB.x and
                                transformA.x - transformA.width < transformB.x + transformB.width)
                            and
                            (
                            transformA.y > transformB.y and
                                transformA.y + transformA.height < transformB.y + transformB.height)
                            and
                            (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                            and
                            (
                            transformA.y > transformB.y and
                                transformA.y + transformA.height < transformB.y + transformB.height)

                        then

                            transformA.x = transformA.x + (transformB.x + transformB.width) -
                                (transformA.x + transformA.width) + transformA.width + 0.1
                            colliderA.isTouchingLeftWall = true
                            -- Obviamente cuando pasa un frame el jugador sigue dentro un poquito, hay que corregir su posición
                            -- para que al dejar de mover esté contra la pared... AUNQUE hay un bug si ocurre por lo que lo movemos ligeramente a un lado


                        else

                            colliderA.isTouchingLeftWall = false

                        end


                        if (
                            transformA.x + transformA.width * 2 > transformB.x and
                                transformA.x + transformA.width * 2 < transformB.x + transformB.width)
                            and
                            (
                            transformA.y > transformB.y and
                                transformA.y + transformA.height < transformB.y + transformB.height)
                            and
                            (
                            transformA.x + transformA.width > transformB.x and
                                transformA.x + transformA.width < transformB.x + transformB.width)
                            and
                            (
                            transformA.y > transformB.y and
                                transformA.y + transformA.height < transformB.y + transformB.height)

                        then

                            transformA.x = transformA.x - (transformA.x - transformB.x) - transformA.width - 0.1
                            colliderA.isTouchingRightWall = true

                        else

                            colliderA.isTouchingRightWall = false

                        end



                    end

                end

            end

        end

    end

end

-- Este sistema permite hacer el putiaso

AttackSystem = class("AttackSystem", System)

function AttackSystem:require()
    return { "transform", "collider", "attackComponent", "movementKeys"}
end

function AttackSystem:update(dt)

    for _, entity in pairs(self.targets) do

        if entity:get("transform").name == "PlayerA" or entity:get("transform").name == "PlayerB" then

            local transform = entity:get("transform")
            local collider = entity:get("collider")
            local attackComponent = entity:get("attackComponent")

            if attackComponent.canAttack == true then

                attackComponent.charging = love.keyboard.isDown(attackComponent.key)

                if attackComponent.charging == true and attackComponent.chargingTime < attackComponent.chargingMaxTime then

                    if attackComponent.alreadyScaled == false then

                        transform.x, transform.y = transform.x + attackComponent.minWidth / 2, transform.y + attackComponent.maxWidth - attackComponent.minWidth
                        transform.width, transform.height = attackComponent.minWidth, attackComponent.minHeight
                        attackComponent.alreadyScaled = true

                    end

                    attackComponent.chargingTime = attackComponent.chargingTime + dt
                    attackComponent.angle = Lerp(0, 60, attackComponent.chargingTime / attackComponent.chargingMaxTime)
                    --print("ChargingTime: " .. attackComponent.chargingTime .. ". Angle: " .. attackComponent.angle)

                elseif attackComponent.charging == false and attackComponent.chargingTime > 0 then

                    local playerList = { }

                    for _, targetEntity in pairs(self.targets) do

                        if transform.name ~= targetEntity:get("transform").name and targetEntity:get("attackComponent") ~= nil then
                            table.insert(playerList, targetEntity)
                        end

                    end

                    local closestPlayer = playerList[1]
                    local closestPlayerTransform = closestPlayer:get("transform")

                    -- un bug habrá si al hacerlo justo debajo del otro a lamisma distancia de x hará el choque, hay que añadir la y tambien
                    local playerVector = { x = transform.x + transform.width / 2, y = transform.y + transform.height / 2}
                    local targetVector = { x = closestPlayerTransform.x + closestPlayerTransform.width / 2, y = closestPlayerTransform.y + closestPlayerTransform.height / 2}
                    
                    local closestDistance = CalculateModule(playerVector.x, playerVector.y, targetVector.x, targetVector.y)

                    for index, player in pairs(playerList) do

                        closestPlayer = player
                        closestPlayerTransform = closestPlayer:get("transform")
                        targetVector = { x = closestPlayerTransform.x + closestPlayerTransform.width / 2, y = closestPlayerTransform.y + closestPlayerTransform.height / 2}

                        if CalculateModule(playerVector.x, playerVector.y, targetVector.x, targetVector.y) < closestDistance then
                            
                            closestPlayer = player
                            closestDistance = CalculateModule(playerVector.x, playerVector.y, targetVector.x, targetVector.y)

                        end

                    end

                    if closestDistance < 50 then
                        
                        local jump = closestPlayer:get("jump");

                        closestPlayer:get("collider").isColliding = false
                        jump.rayActive = false

                        local totalForce = jump.force * math.abs(math.sin(math.rad(attackComponent.angle))) * 2

                        if totalForce > -4 then closestPlayer:get("velocity").y = -4
                        else closestPlayer:get("velocity").y = totalForce end
                        closestPlayer:get("hitComponent").hit = true

                        if transform.x >= closestPlayerTransform.x then

                            closestPlayer:get("hitComponent").angle = attackComponent.angle + 180
                            print("He lanzado a " .. closestPlayerTransform.name .. " estando a " .. closestDistance .. " metros de distancia, a un angulo de " .. attackComponent.angle .. " grados a la IZQUIERDA")

                        else

                            closestPlayer:get("hitComponent").angle = attackComponent.angle
                            print("He lanzado a " .. closestPlayerTransform.name .. " estando a " .. closestDistance .. " metros de distancia, a un angulo de " .. attackComponent.angle .. " grados a la DERECHA")

                        end

                    end

                    attackComponent.chargingTime = attackComponent.chargingMaxTime
                    transform.x = transform.x - attackComponent.minWidth / 2
                    transform.width, transform.height = attackComponent.maxWidth, attackComponent.maxHeight
                    transform.y = (transform.y - (transform.y - transform.y)) - transform.height
                    attackComponent.alreadyScaled = false

                    attackComponent.chargingTime = 0

                    attackComponent.canAttack = false
                    attackComponent.cooldownTimer = 0

                end

            else

                if attackComponent.canAttack == false then

                    if (attackComponent.cooldownTimer < attackComponent.cooldownMaxTimer) then

                        attackComponent.cooldownTimer = attackComponent.cooldownTimer + dt
                    else

                        attackComponent.cooldownTimer = attackComponent.cooldownMaxTimer
                        attackComponent.canAttack = true

                    end

                    --print("Cooldown: " .. attackComponent.cooldownTimer .. "/" .. attackComponent.cooldownMaxTimer)

                end

            end


        end

    end

end

-- Este sistema permite recibir el putiaso

RecieveHitSystem = class("RecieveHitSystem", System)

function RecieveHitSystem:require()
    return { "transform", "velocity", "hitComponent"}
end

function RecieveHitSystem:update(dt)

    for _, player in pairs(self.targets) do

        if player:get("hitComponent") ~= nil then

            local transformComponent = player:get("transform")
            local hitComponent = player:get("hitComponent")
            local velocityComponent = player:get("velocity")

            if hitComponent.hit == true then

                transformComponent.x = transformComponent.x + math.cos(math.rad(hitComponent.angle)) * velocityComponent.x * dt

            end

        end

    end

end


-- Functiones random

function Lerp(a, b, t)
    return (1 - t) * a + t * b
end

function CalculateModule(ax, ay, bx, by)
    return math.sqrt((bx - ax)^2 + (by - ay)^2)
end
--[[
   _____  _____   _____  _______  ______  __  __             _____ 
  / ____||_   _| / ____||__   __||  ____||  \/  |    /\     / ____|
 | (___    | |  | (___     | |   | |__   | \  / |   /  \   | (___  
  \___ \   | |   \___ \    | |   |  __|  | |\/| |  / /\ \   \___ \ 
  ____) | _| |_  ____) |   | |   | |____ | |  | | / ____ \  ____) |
 |_____/ |_____||_____/    |_|   |______||_|  |_|/_/    \_\|_____/ 
                                                                   
 Código hecho por Rubén López García

]]

-- Aquí puedes cambiar las variables de multiple cosas, no toques nada abajo --
-- ========================================================================= --

-- Variables que afectan al raycast del jugador --
local offset = 15 -- Déjalo en 15, pero puedes intentar reducirlo si quieres

-- Variables que afectan el sistema de dar golpes --
local minAngle, maxAngle = 0, 80 -- El ángulo mínimo debe ser 0 si o sí, y el máximo 80, si no no funcionará
local distanceFromOther = 50 -- La distancia mínima que tiene que estar el jugador del otro para golpearlo

-- Variables que afectan el sistema de recibir el golpe --
local jumpMultiplier = 1.8 -- Si usas más de 2 saldrá muy disparado, si usas menos de 1 será muy bajo
local horizontalMultiplier = 1.6 -- No he mirado el máximo, pero seguro que con más de 2 lo mandas a la mierda, pls no
local distanceFromWall = 35 -- Esto es sobre el putiaso contra la pared, mira la distancia entre el jugador y la pared más cercana

-- Variables que afectan el sistema de pintar colores --
local defaultColor = { r = 255, g = 255, b = 255 }

-- ========================================================================= --

--[[
  _      ____   _____ _____ _____          
 | |    / __ \ / ____|_   _/ ____|   /\    
 | |   | |  | | |  __  | || |       /  \   
 | |   | |  | | | |_ | | || |      / /\ \  
 | |___| |__| | |__| |_| || |____ / ____ \ 
 |______\____/ \_____|_____\_____/_/    \_\
                                           


]]

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

            if entity:get("hitComponent").hit == false then
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

            love.graphics.setColor(color.r, color.g, color.b, color.a)
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)
            love.graphics.setColor(1, 1, 1, 1)

        else
            
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)

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

                    --if transformB.name ~= "PlayerA" and transformB.name ~= "PlayerB" then

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

                    --end


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

                        if (transformA.x - transformA.width > transformB.x and transformA.x - transformA.width < transformB.x + transformB.width)
                            and
                            (transformA.y > transformB.y and transformA.y + transformA.height < transformB.y + transformB.height)
                            and
                            (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                            and
                            (transformA.y > transformB.y and transformA.y + transformA.height < transformB.y + transformB.height)

                        then

                            colliderA.isTouchingLeftWall = true
                            transformA.x = transformA.x + (transformB.x + transformB.width) - (transformA.x + transformA.width) + transformA.width + 0.4
                            entityA:get("hitComponent").hit = false
                            --entityA:get("jump").rayActive = true

                            if debugMode then print("TouchingLeftWall") end
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

                            colliderA.isTouchingRightWall = true
                            transformA.x = transformA.x - (transformA.x - transformB.x) - transformA.width - 0.4
                            entityA:get("jump").rayActive = true
                            if debugMode then print("TouchingRightWall") end

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
                            entityA:get("hitComponent").hit = false
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

-- Este sistema tiene mucha tela y tiene mucho código, pero básicamente se encarga de golpear
-- al jugador que esté mas cerca, y dependiendo de cuando mantienes el botón de golpear haces
-- que el jugador afectado se mueva más hacia los lados o hacia arriba

AttackSystem = class("AttackSystem", System)

function AttackSystem:require()
    return { "transform", "collider", "attackComponent", "movementKeys"}
end

function AttackSystem:update(dt)

    for _, entity in pairs(self.targets) do

        if entity:get("attackComponent") ~= nil then

            -- Primero agarramos componentes clave del atacante

            local transform = entity:get("transform")
            local collider = entity:get("collider")
            local attackComponent = entity:get("attackComponent")
            local hitComponent = entity:get("hitComponent")
            local jumpComponent = entity:get("jump")
            local velocityComponent = entity:get("velocity")

            -- Miramos si podemos atacar

            if attackComponent.canAttack == true then

                -- Si podemos atacar y pulsamos la llave de atacar, procederemos a atacar...

                attackComponent.charging = love.keyboard.isDown(attackComponent.key)

                -- ... cargando el putiaso, eso si, hay que asegurarse que al atacar el timer está en 0
                -- y que también ya estemos cargando anteriormente, si no se rompería la lógica

                if attackComponent.charging == true and attackComponent.chargingTime < attackComponent.chargingMaxTime then

                    -- Esto solo se ejecutará una vez, esto encoje al jugador, y lo desplaza acorde con la diferencia de estatura que
                    -- el jugador atacante recibe.

                    if attackComponent.alreadyScaled == false then

                        transform.x, transform.y = transform.x + attackComponent.minWidth / 2, transform.y + attackComponent.maxWidth - attackComponent.minWidth
                        transform.width, transform.height = attackComponent.minWidth, attackComponent.minHeight
                        attackComponent.alreadyScaled = true

                    end

                    -- Aquí vamos sumando el tiempo que carga hasta su máximo, una vez llegues a tu máximo, si todavía no has dejado de atacar
                    -- se mantendrá en el máximo

                    attackComponent.chargingTime = attackComponent.chargingTime + dt
                    attackComponent.angle = Lerp(minAngle, maxAngle, attackComponent.chargingTime / attackComponent.chargingMaxTime)
                    
                    if debugMode == true then print("ChargingTime: " .. attackComponent.chargingTime .. ". Angle: " .. attackComponent.angle) end

                elseif attackComponent.charging == false and attackComponent.chargingTime > 0 then

                    if GetNumberOfPlayers() > 1 then

                        -- Si ya no estamos cargando y  el tiempo de carga es mayor que cero, entonces dejamos de
                        -- cargar, pero hacemos lo siguiente: pillamos todos los jugadores en la partida

                        local playerList = { }

                        -- Y por cada jugador aparte del jugador atacante, se mete en la lista playerList

                        for _, targetEntity in pairs(self.targets) do

                            if transform.name ~= targetEntity:get("transform").name and targetEntity:get("attackComponent") ~= nil then
                                table.insert(playerList, targetEntity)
                            end

                        end

                        -- Entonces declaramos ciertas variables, empezando por el jugador más cercano, que se agarra el 1 por defecto,
                        -- agarramos su transform también, y...

                        local closestPlayer = playerList[1]
                        local closestPlayerTransform = closestPlayer:get("transform")

                        -- ... declaramos el vector del jugador y el target, usando el módulo de los dos vectores.

                        local playerVector = { x = transform.x + transform.width / 2, y = transform.y + transform.height / 2}
                        local targetVector = { x = closestPlayerTransform.x + closestPlayerTransform.width / 2, y = closestPlayerTransform.y + closestPlayerTransform.height / 2}
                        
                        -- Y lo calculamos con una pequeña función que he hecho abajo del todo.

                        local closestDistance = CalculateModule(playerVector.x, playerVector.y, targetVector.x, targetVector.y)

                        -- Ahora debemos pillar el jugador más cercano al jugador atacante. Si encuentra a uno más cercano substituye las variables
                        -- closestPlayer y closestDistance, y al acabar mete al más cercano (así es escalable con más jugadores), pero no funcionará si dos
                        -- jugadores están a la vez (como está hecho ahora)

                        for index, player in pairs(playerList) do

                            closestPlayer = player
                            closestPlayerTransform = closestPlayer:get("transform")
                            targetVector = { x = closestPlayerTransform.x + closestPlayerTransform.width / 2, y = closestPlayerTransform.y + closestPlayerTransform.height / 2}

                            if CalculateModule(playerVector.x, playerVector.y, targetVector.x, targetVector.y) < closestDistance then
                                
                                closestPlayer = player
                                closestDistance = CalculateModule(playerVector.x, playerVector.y, targetVector.x, targetVector.y)

                            end

                        end

                        -- Ahora, y antes de lanzarlo, nos aseguramos que está a un mínimo de distancia del jugador, si no podríamos golpearlo incluso si estuviera
                        -- a 3 años luz del jugador atacante

                        if closestDistance < distanceFromOther then
                            
                            -- Agarramos el ocmponente jump del recibiente, pues tiene su valor de salto

                            local jump = closestPlayer:get("jump");

                            -- Cambiamos el isColliding a false y desactivamos el rayo de salto para evitar que se quede pegado en el suelo

                            closestPlayer:get("collider").isColliding = false
                            jump.rayActive = false

                            -- Hacemos un pequeño cálculo matemático sobre la fuerza vertical usando una fórmula que
                            -- me he sacado del culo, pero funciona, no tiene bases científicas, lol

                            local totalForce = jump.force * math.abs(math.sin(math.rad(attackComponent.angle))) * jumpMultiplier

                            -- Si la fuerza es menor a un mínimo (este no se puede modificar, tiene que estar hardcodeado), hace el mínimo,
                            -- pero si es mayor entonces usa esa, no hace falta usar un math.max porque el ángulo ya se capa por si mismo

                            if totalForce > -4 then closestPlayer:get("velocity").y = -4
                            else closestPlayer:get("velocity").y = totalForce end
                            closestPlayer:get("hitComponent").hit = true

                            -- Y ahora modificamos el ángulo dependiendo si está la derecha del
                            -- recibidor del putiaso o a su izquierda

                            if transform.x >= closestPlayerTransform.x then

                                closestPlayer:get("hitComponent").angle = attackComponent.angle + 180
                                if debugMode then print("He lanzado a " .. closestPlayerTransform.name .. " estando a "
                                    .. closestDistance .. " metros de distancia, a un angulo de " .. attackComponent.angle .. " grados a la IZQUIERDA") end

                            else

                                closestPlayer:get("hitComponent").angle = attackComponent.angle
                                if debugMode then print("He lanzado a " .. closestPlayerTransform.name .. " estando a "
                                    .. closestDistance .. " metros de distancia, a un angulo de " .. attackComponent.angle .. " grados a la DERECHA") end

                            end

                        end

                    end

                    -- Finalmente reseteamos variables, como el timer, el width y height del atacante y otros.

                    attackComponent.chargingTime = attackComponent.chargingMaxTime

                    -- pero antes voy a mirar si he colisionado con una pared, eso se hará
                    -- "expandiendo" en la X el jugador y ver si su x choca con la izquierda o derecha

                    transform.x = transform.x - attackComponent.minWidth / 2
                    transform.width, transform.height = attackComponent.maxWidth, attackComponent.maxHeight
                    transform.y = (transform.y - (transform.y - transform.y)) - transform.height

                    if collider.isTouchingLeftWall then transform.x = transform.x + transform.width / 2  
                    elseif collider.isTouchingRightWall then transform.x = transform.x - transform.width / 2 end

                    -- Aquí miramos is estamos cerca de una pared, y si lo és nos empujamos en el lado opuesto
                    
                    local closestWall = nil
                    local distance = 1000

                    for index, wallEntity in pairs(ReturnAllWallEntities()) do
                        
                        local transformWall = wallEntity:get("transform")
                        local newDistance = (transformWall.x + transformWall.width / 2 - (transform.x + transform.width / 2 ))
 
                        if newDistance < distance then 

                            distance = math.abs(newDistance)
                            closestWall = wallEntity

                        end

                    end

                    local closestWallTransform = closestWall:get("transform")

                    if distance < distanceFromWall then
                        
                        local playerOrigin = transform.x + transform.width / 2
                        local wallOrigin = closestWallTransform.x + closestWallTransform.width / 2
                        local totalForce = jumpComponent.force * math.abs(math.sin(math.rad(attackComponent.angle))) * jumpMultiplier
                        hitComponent.hit = true

                        if totalForce > -4 then velocityComponent.y = -4
                        else velocityComponent.y = totalForce end

                        if playerOrigin >= wallOrigin then hitComponent.angle = attackComponent.angle
                        else hitComponent.angle = attackComponent.angle + 180 end

                    end

                    attackComponent.alreadyScaled = false

                    attackComponent.chargingTime = 0

                    attackComponent.canAttack = false
                    attackComponent.cooldownTimer = 0

                end

            else

                -- Si ninguna de estas se cumplen, es porque el jugador está en cooldown, para que no pueda spamear su ataque.

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

        -- Nos aseguramos que los componentes afectados tienen el hitComponent, si no peta.

        if player:get("hitComponent") ~= nil then

            local transformComponent = player:get("transform")
            local hitComponent = player:get("hitComponent")
            local velocityComponent = player:get("velocity")

            -- Mientras esté en true moveremos el personaje, hasta que toque el suelo (en otro sistema)

            if hitComponent.hit == true then

                transformComponent.x = transformComponent.x + math.cos(math.rad(hitComponent.angle)) * velocityComponent.x * horizontalMultiplier * dt

            end

        end

    end

end

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

-- Functiones random

function Lerp(a, b, t)
    return (1 - t) * a + t * b
end

function CalculateModule(ax, ay, bx, by)
    return math.sqrt((bx - ax)^2 + (by - ay)^2)
end
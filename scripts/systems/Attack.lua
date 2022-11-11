-- Este sistema permite hacer el putiaso

-- Este sistema tiene mucha tela y tiene mucho código, pero básicamente se encarga de golpear
-- al jugador que esté mas cerca, y dependiendo de cuando mantienes el botón de golpear haces
-- que el jugador afectado se mueva más hacia los lados o hacia arriba

AttackSystem = class("AttackSystem", System)

function AttackSystem:require()
    return { "transform", "collider", "attackComponent", "movementKeys"}
end

--Tabla de sonidos
SoundTable = {hit1,hit2}


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

                        transform.y = transform.y + attackComponent.maxWidth - attackComponent.minWidth
                        transform.height = attackComponent.minHeight
                        attackComponent.alreadyScaled = true

                        
                    end
                    
                    
                    -- Aquí vamos sumando el tiempo que carga hasta su máximo, una vez llegues a tu máximo, si todavía no has dejado de atacar
                    -- se mantendrá en el máximo
                    
                    attackComponent.chargingTime = attackComponent.chargingTime + dt
                    
                    local total = attackComponent.chargingTime / attackComponent.chargingMaxTime
                    local frameScale = transform.width

                    attackComponent.angle = Lerp(minAngle, maxAngle, total)
                    
                    --[[
                    transform.width = Lerp(attackComponent.maxWidth, attackComponent.minWidth, total)
                    transform.x = transform.x + (frameScale - transform.width) / 2
                    
                    transform.height = Lerp(attackComponent.maxHeight, attackComponent.minHeight, total)
                    ]]

                elseif attackComponent.charging == false and attackComponent.chargingTime > 0 then
                
                    --suena el sonido
                    SoundTable[love.math.random(1, 2)]:play()
                    
                    --ponemos un pitch random, se puede ajusta los maximos y minimos
                    hit1:setPitch(love.math.random(0.8, 1.5))
                    hit2:setPitch(love.math.random(0.8, 1.5))
                    
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

                        if closestDistance < distanceFromOther or
                        hitComponent.hit and closestDistance < distanceFromOther * 4 then
                            
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

                            else

                                closestPlayer:get("hitComponent").angle = attackComponent.angle

                            end

                        end

                    end

                    -- Finalmente reseteamos variables, como el timer, el width y height del atacante y otros.

                    attackComponent.chargingTime = attackComponent.chargingMaxTime

                    -- pero antes voy a mirar si he colisionado con una pared, eso se hará
                    -- "expandiendo" en la X el jugador y ver si su x choca con la izquierda o derecha

                    transform.height = attackComponent.maxHeight
                    transform.y = (transform.y - (transform.y - transform.y)) - attackComponent.maxHeight

                    -- Aquí miramos is estamos cerca de una pared, y si lo és nos empujamos en el lado opuesto
                    
                    local closestWall = nil
                    local distance = 1000
                    local transformWall = nil

                    for index, wallEntity in pairs(ReturnAllWallEntities()) do
                        
                        transformWall = wallEntity:get("transform")
                        local newDistance = math.abs(transformWall.x + transformWall.width / 2 - (transform.x + transform.width / 2 ))
 
                        if newDistance < distance then 

                            if transform.y > transformWall.y and transform.y < transformWall.y + transformWall.height then
                                distance = math.abs(newDistance)
                                closestWall = wallEntity
                            end

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
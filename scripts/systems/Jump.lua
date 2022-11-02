-- Este sistema te permite saltar si estás tocando el suelo

-- Este sistema nos permitirá poder saltar dentro del juego
-- simplemente cambiando el valor de velocidad vertical actual a negativo

JumpSystem = class("JumpSystem", System)

-- Para esto requeriremos los componentes collider, velocidad y salto
function JumpSystem:require()
    return { "collider", "velocity", "jump" }
end

function JumpSystem:update(dt)

    for _, entity in pairs(GetPlayers()) do

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

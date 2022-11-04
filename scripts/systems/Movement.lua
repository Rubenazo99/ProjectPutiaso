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

            --if entity:get("hitComponent").hit == false then
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
           -- end
        end
    end

end

-- Este sistema hace que haya gravedad

-- Creamos el sistema de gravedad, este, mientras no estés moviendote y estes en el aire
-- aplicará gravedad al jugador/es mediante la fórmula del movimiento rectilinio acelerado
GravitySystem = class("GravitySystem", System)

-- Para esto requiereiremos 4 componentes, transform, velocidad, aceleración y collider,
-- para así poder mirar si estoy colisionando no caigo
function GravitySystem:requires()
    return { "transform", "velocity", "acceleration", "collider" }
end

local highestPoint = 100000000000000000000
local currentDt = 0
local currentVel = 0

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

                velocity.y = velocity.y + acceleration.y * dt
                transform.y = transform.y + velocity.y

                -- Si no hacemos la fórmula de MRUA con la velocidad y sumamos eso a la posición del jugador
                -- si no se hace así no funcionará
            end

            if transform.y < highestPoint then
                highestPoint = transform.y
                currentDt = dt
                currentVel = velocity.y
            end
            
            

            if love.keyboard.isDown('t') then
                print("the highest point is "..highestPoint)
                print("delta time in this point is ".. currentDt)
                print("current velocity "..currentVel)
            end


        end

    end

end

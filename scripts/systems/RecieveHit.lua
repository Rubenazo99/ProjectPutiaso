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

-- Este sistema hace que haya gravedad

-- Creamos el sistema de gravedad, este, mientras no estés moviendote y estes en el aire
-- aplicará gravedad al jugador/es mediante la fórmula del movimiento rectilinio acelerado
ResetSytem = class("ResetSytem", System)

-- Para esto requiereiremos 4 componentes, transform, velocidad, aceleración y collider,
-- para así poder mirar si estoy colisionando no caigo
function ResetSytem:requires()
    return { "transform", "resetComponent" }
end

function ResetSytem:update(dt)

    -- Tenemos que asegurarnos que agarramos cada entidad afectada
    -- por dichos requerimientos
    for key, entity in pairs(self.targets) do

        local transform = entity:get("transform")
        local resetComponent = entity:get("resetComponent")

        if transform.y > 6200 then
            
            transform.x = resetComponent.x
            transform.y = resetComponent.y

        end

    end

end

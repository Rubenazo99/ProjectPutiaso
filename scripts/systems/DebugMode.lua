-- Este sistema permite usa herramientas debug ¿Quizás podriamos meter meta mecánicas como arrastrar cajas? A saber...
local alreadyShownPrompt = false

DebugMode = class("DebugMode", System)

function DebugMode:require()
    return { "transform", "dragableComponent" }
end

function DebugMode:update(dt)

    for _, entity in pairs(self.targets) do
        
        if love.keyboard.isDown("p") and alreadyShownPrompt == false then

            os.execute("cls")

            for i, v in pairs (GetPlayers()) do
                
                local transform = v:get("transform")
                local hitComponent = v:get("hitComponent")
                local attackComponent = v:get("attackComponent")
                local directionComponent = v:get("direction")
                local colliderComponent = v:get("collider")

                print(transform.name.."...")
                print("===================")
                print("Is hit? "..tostring(hitComponent.hit))
                print("Is touching ground? "..tostring(colliderComponent.isColliding)..". Is touching walls? Left: "..tostring(colliderComponent.isTouchingLeftWall).." Right: "..tostring(colliderComponent.isTouchingRightWall))
                print("Actual directions: Left -> ".. tostring(directionComponent.left)..". Right -> "..tostring(directionComponent.right))
                print("ChargingTime: " .. attackComponent.chargingTime .. ". Angle: " .. attackComponent.angle)
                print("Current Y Position: "..transform.y)
                print(" ")

            end


            alreadyShownPrompt = true

        elseif love.keyboard.isDown("p") == false and alreadyShownPrompt == true then
            
            alreadyShownPrompt = false

        end
    end

end
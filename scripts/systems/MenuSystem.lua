menuTancat = true

MenuSystem = class("MenuSystem", System)

function MenuSystem:require()
    return {"transform"}
end

function MenuSystem:update()
    for _, entity in pairs(self.targets) do
        if entity:get("transform") ~= nil then
            local transform = entity:get("transform")
            function love.keypressed(key)
                if key == "escape" then
                    GameEngine:toggleSystem("GravitySystem")
                    GameEngine:toggleSystem("MovementSystem")
                    GameEngine:toggleSystem("AttackSystem")
                    GameEngine:toggleSystem("JumpSystem")
                    GameEngine:toggleSystem("RecieveHitSystem")
                    if not menuTancat then --obert
                        --print("dalt")
                        transform.x = -800
                        menuTancat = true
                        print(menuTancat) -- true
                    elseif menuTancat then --tancat
                        transform.x = 100
                        menuTancat = not menuTancat
                        print(menuTancat) --false

                        -- Draws "Hello world!" at position x: 100, y: 200 with the custom font applied.
                        love.graphics.print("Space to exit", 100, 600)
                    --print("baix")
                    end
                end
                if (key == "space") and not menuTancat then
                    love.event.quit()
                end
            end
        end
        -- if entity:get("textMenu") ~= nil then
        --     local transform = entity:get("transform")

        -- end    
    end
end

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
                        transform.x = -800
                        love.audio.play(music)
                        menuTancat = true
                    elseif menuTancat then --tancat
                        transform.x = 100
                        --parem la musica
                        love.audio.pause(music)
                        menuTancat = not menuTancat
                    end
                end
                if (key == "space") and not menuTancat then
                    love.event.quit()
                end
            end
        end
    end
    if not music:isPlaying() then
        love.audio.play(music)
    end
end

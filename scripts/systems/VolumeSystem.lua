local w, h = love.graphics.getDimensions()
local modVolumen = 0.025
local actual = 1
VolumeSystem = class("VolumeSystem", System)

function VolumeSystem:require()
    return {"transform"}
end
function VolumeSystem:update(dt)
    for _, entity in pairs(self.targets) do
        if entity:get("transform") ~= nil then
            local transform = entity:get("transform")
            if menuTancat then
                transform.x = -700
            end
            if not menuTancat then
                transform.x = 100
                if (love.keyboard.isDown("a") or love.keyboard.isDown("left")) and transform.width > 0 then
                    transform.width = transform.width - 10
                    actual = actual - modVolumen --lower music
                end
                if (love.keyboard.isDown("d") or love.keyboard.isDown("right")) and transform.width < w - 200 then
                    transform.width = transform.width + 10
                    actual = actual + modVolumen --subele a la radio
                end
            end
            music:setVolume(actual) --0, 1
            if actual < 0.16 then
                music:setVolume(0) -- si el volumen esta molt baix pero no es zero exacte, ho hardcodeem
            end
        end
    end
end

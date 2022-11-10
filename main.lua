local lovetoys = require('lovetoys')
lovetoys.initialize({ globals = true, debug = true })

camera = camera or require("lib/camera")
Cam = camera()


local blockCreated = false

-- Activa las funciones debug! --
debugMode = true

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    mainFont = love.graphics.newFont("Minecraft.ttf", 20)
    sli = require("lib/sti")
    gameMap = sli("maps/testmapGraphics.lua")

    dofile("scripts/CreateComponents.lua")
    dofile("scripts/CreateSystem.lua")
    dofile("scripts/CreatePlayers.lua")
    dofile("scripts/CreateLevel.lua")
    dofile("scripts/CreateCamera.lua")
    dofile("scripts/CreateEngine.lua")
    dofile("scripts/CreateMenu.lua")
    dofile("scripts/CreateMenuEngine.lua")
end


function love.update(dt)
    
    GameEngine:update(dt)
    LevelEngine:update(dt)
    MenuEngine:update(dt)

    if (love.keyboard.isDown("escape")) then love.event.quit() end
    

end

function love.draw()
    -- this is needed for the camera to be able to render everything
    love.graphics.setFont(mainFont)
    Cam:attach()
     GameEngine:draw()
     gameMap:drawLayer(gameMap.layers[1])
    Cam:detach()
    MenuEngine:draw()
end

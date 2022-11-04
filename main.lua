local lovetoys = require('lovetoys')
lovetoys.initialize({ globals = true, debug = true })

local blockCreated = false

-- Activa las funciones debug! --
debugMode = true

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()

    sli = require("lib/sti")
    gameMap = sli("maps/testmapGraphics.lua")

    dofile("scripts/CreateComponents.lua")
    dofile("scripts/CreateSystem.lua")
    dofile("scripts/CreatePlayers.lua")
    dofile("scripts/CreateLevel.lua")
    dofile("scripts/CreateEngine.lua")

end

function love.update(dt)
    
    GameEngine:update(dt)
    LevelEngine:update(dt)

    if (love.keyboard.isDown("escape")) then love.event.quit() end
    

end

function love.draw()

    GameEngine:draw()
    gameMap:draw()

end
local lovetoys = require('lovetoys')
lovetoys.initialize({ globals = true, debug = true })

local w, h = love.graphics.getDimensions()

-- Activa las funciones debug! --
debugMode, blockCreated = true, false

function love.load()

    dofile("scripts/CreateComponents.lua")
    dofile("scripts/CreatePlayers.lua")
    dofile("scripts/CreateLevel.lua")
    dofile("scripts/CreateSystem.lua")
    dofile("scripts/CreateEngine.lua")

end

function love.update(dt)

    engine:update(dt)

    if (love.keyboard.isDown("escape")) then love.event.quit() end

    

end

function love.draw()

    engine:draw()

end
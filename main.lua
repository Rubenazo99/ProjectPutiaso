local lovetoys = require('lovetoys')
lovetoys.initialize({ globals = true, debug = true })

local w, h = love.graphics.getDimensions()

function love.load()

    dofile("scripts/CreateComponents.lua")
    dofile("scripts/CreatePlayers.lua")
    dofile("scripts/CreateLevel.lua")
    dofile("scripts/CreateSystem.lua")
    dofile("scripts/CreateEngine.lua")

end

function love.update(dt)

    engine:update(dt)

end

function love.draw()

    engine:draw()

end

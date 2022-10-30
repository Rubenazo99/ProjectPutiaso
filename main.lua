local lovetoys = require('lovetoys')
lovetoys.initialize({ globals = true, debug = true })

local w, h = love.graphics.getDimensions()
local blockCreated = false

-- Activa las funciones debug! --
debugMode = false

function love.load()

    dofile("scripts/CreateComponents.lua")
    dofile("scripts/CreatePlayers.lua")
    dofile("scripts/CreateLevel.lua")
    dofile("scripts/CreateSystem.lua")
    dofile("scripts/CreateEngine.lua")

end

function love.update(dt)
    
    mouseX, mouseY = love.mouse.getPosition()

    engine:update(dt)

    if (love.keyboard.isDown("escape")) then love.event.quit() end
    CreateBlocks()
    

end

function love.draw()

    engine:draw()

end

function CreateBlocks()

    if blockCreated == false then

        if love.keyboard.isDown("1") then
        
            local newEntity = Entity()

            newEntity:initialize()
            newEntity:add(Transform(mouseX, mouseY, 0, 1, 1, 200, 60, "Ground"))
            newEntity:add(Collider(false))
            newEntity:add(DragableComponent(true, false))

            engine:addEntity(newEntity)

            blockCreated = true

            elseif love.keyboard.isDown("2") then

            local newEntity = Entity()

            newEntity:initialize()
            newEntity:add(Transform(mouseX, mouseY, 0, 1, 1, 60, 200, "Wall"))
            newEntity:add(Collider(false))
            newEntity:add(DragableComponent(true, false))

            engine:addEntity(newEntity)

            blockCreated = true

        end

    elseif blockCreated == true then

        if love.keyboard.isDown("1") == false then blockCreated = false
        elseif love.keyboard.isDown("2") == false then blockCreated = false end

    end
end
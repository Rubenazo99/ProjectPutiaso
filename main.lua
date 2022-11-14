local lovetoys = require("lovetoys")
lovetoys.initialize({globals = true, debug = true})

camera = camera or require("lib/camera")
Cam = camera()
local tick = require ('lib/tick')

local blockCreated = false
local timepassed = 0

-- Activa las funciones debug! --
debugMode = true

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    tick.framerate = 30
    
    --Cargamos los sonidos
    music = love.audio.newSource("music.wav", "stream")
    hit1 = love.audio.newSource("hit1.wav", "static")
    hit2 = love.audio.newSource("hit2.wav", "static")

    mainFont = love.graphics.newFont("Minecraft.ttf", 35)
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

    -- if (love.keyboard.isDown("escape")) then
    --     love.event.quit()
    -- end

    if menuTancat then
        love.audio.play(music)
    end
end

function love.draw()
    -- this is needed for the camera to be able to render everything
    love.graphics.setFont(mainFont)
    Cam:attach()
    GameEngine:draw()
    gameMap:drawLayer(gameMap.layers[5])
    Cam:detach()
    MenuEngine:draw()
    if not menuTancat then
        --parem la musica 
        love.audio.pause(music)

        --printem el text per a sortir
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print("Space to EXIT", 110, 600) 
        love.graphics.setColor(255, 255, 255, 1)
    end
end

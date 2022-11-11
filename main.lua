local w, h = love.graphics.getDimensions()
local lovetoys = require("lovetoys")
lovetoys.initialize({globals = true, debug = true})

camera = camera or require("lib/camera")
Cam = camera()

local blockCreated = false
local timepassed = 0

-- Activa las funciones debug! --
debugMode = true

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    --Cargamos los sonidos
    music = love.audio.newSource("music.wav", "stream")
    --music:setVolume(0.5)
    --Sonidos de hit
    hit1 = love.audio.newSource("hit1.wav", "static")
    hit2 = love.audio.newSource("hit2.wav", "static")
    --Sonidos voz
    FraseRuben1 = love.audio.newSource("Audios/FraseRuben1.mp3", "static")
    
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
        --printem el text per a sortir
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print("Space to EXIT", 110, h / 2)
        love.graphics.setColor(255, 255, 255, 1)
        if not music:isPlaying() then
            love.audio.play(music)
        end
    end
end

local w, h = love.graphics.getDimensions()
local lovetoys = require("lovetoys")
lovetoys.initialize({globals = true, debug = true})

camera = camera or require("lib/camera")
Cam = camera()
local tick = require ('lib/tick')

local blockCreated = false
local timepassed = 0

w, h = love.graphics.getDimensions()

-- Activa las funciones debug! --
debugMode = true

love.graphics.setDefaultFilter("nearest", "nearest")

function love.load()
    tick.framerate = 30
    
    --cargamos las imagenes del tuto
    arrowKeys = love.graphics.newImage("ArrowKeys.png")
    wasdKeys = love.graphics.newImage("WASDKeys.png")
    --Cargamos los sonidos
    music = love.audio.newSource("music.wav", "stream")
    --Sonidos de hit
    hit1 = love.audio.newSource("hit1.wav", "static")
    hit2 = love.audio.newSource("hit2.wav", "static")
    --Sonidos voz
    FraseRuben1 = love.audio.newSource("Audios/FraseRuben1.mp3", "static")
    FraseRuben2 = love.audio.newSource("Audios/AudioRuben3.wav", "static")
    FraseRuben3 = love.audio.newSource("Audios/AudioRuben2.wav", "static")
    FrasePau1 = love.audio.newSource("Audios/AudioPau.wav", "static")
    
    mainFont = love.graphics.newFont("Minecraft.ttf", 35)
    secundaryFont = love.graphics.newFont("Minecraft.ttf", 20)
    sli = require("lib/sti")
    gameMap = sli("maps/testmapGraphics.lua")

    love.filesystem.load("scripts/CreateComponents.lua")()
    love.filesystem.load("scripts/CreateSystem.lua")()
    love.filesystem.load("scripts/CreatePlayers.lua")()
    love.filesystem.load("scripts/CreateLevel.lua")()
    love.filesystem.load("scripts/CreateCamera.lua")()
    love.filesystem.load("scripts/CreateEngine.lua")()
    love.filesystem.load("scripts/CreateMenuEngine.lua")()
    love.filesystem.load("scripts/CreateVolume.lua")()
    love.filesystem.load("scripts/CreateVolumeEngine.lua")()
end

function love.update(dt)
    GameEngine:update(dt)
    LevelEngine:update(dt)
    MenuEngine:update(dt)
    VolumeEngine:update(dt)

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
    VolumeEngine:draw()
    if not menuTancat then
        --printem el text per a sortir
        love.graphics.setColor(0, 0, 0, 1)
        love.graphics.print("Space to EXIT", 110, h / 2)
        love.graphics.print("  <          >", 100, 300) --2 y 10 ESPACIOS

        love.graphics.setColor(255, 255, 255, 1)
    end
    drawTuto()
end

-- function drawTuto() 
--     love.graphics.print("  W", 55, 750) 
--     love.graphics.print("A S D", 51, 800) --hardcoded no digo que no, pero el 2n valor de este debe ser 4 menos que el de arriba
-- end
--[[
   _____  _____   _____  _______  ______  __  __             _____ 
  / ____||_   _| / ____||__   __||  ____||  \/  |    /\     / ____|
 | (___    | |  | (___     | |   | |__   | \  / |   /  \   | (___  
  \___ \   | |   \___ \    | |   |  __|  | |\/| |  / /\ \   \___ \ 
  ____) | _| |_  ____) |   | |   | |____ | |  | | / ____ \  ____) |
 |_____/ |_____||_____/    |_|   |______||_|  |_|/_/    \_\|_____/ 
                                                                   
 Código hecho por Rubén López García

]]

-- Aquí puedes cambiar las variables de multiple cosas, no toques nada abajo --
-- ========================================================================= --

-- Variables que afectan al raycast del jugador --
offset = 15 -- Déjalo en 15, pero puedes intentar reducirlo si quieres

-- Variables que afectan el sistema de dar golpes --
minAngle, maxAngle = 0, 70 -- El ángulo mínimo debe ser 0 si o sí, y el máximo 80, si no no funcionará
distanceFromOther = 40 -- La distancia mínima que tiene que estar el jugador del otro para golpearlo

-- Variables que afectan el sistema de recibir el golpe --
jumpMultiplier = 1.8 -- Si usas más de 2 saldrá muy disparado, si usas menos de 1 será muy bajo
horizontalMultiplier = 1.15 -- No he mirado el máximo, pero seguro que con más de 2 lo mandas a la mierda, pls no   --1.2 
distanceFromWall = 39 -- Esto es sobre el putiaso contra la pared, mira la distancia entre el jugador y la pared más cercana

-- Variables que afectan el sistema de pintar colores --
defaultColor = { r = 255, g = 255, b = 255 }

-- ========================================================================= --

--[[
  _      ____   _____ _____ _____          
 | |    / __ \ / ____|_   _/ ____|   /\    
 | |   | |  | | |  __  | || |       /  \   
 | |   | |  | | | |_ | | || |      / /\ \  
 | |___| |__| | |__| |_| || |____ / ____ \ 
 |______\____/ \_____|_____\_____/_/    \_\
                                           


]]

love.filesystem.load("scripts/systems/Attack.lua")()
love.filesystem.load("scripts/systems/RecieveHit.lua")()
love.filesystem.load("scripts/systems/Gravity.lua")()
love.filesystem.load("scripts/systems/Movement.lua")()
love.filesystem.load("scripts/systems/Jump.lua")()
love.filesystem.load("scripts/systems/WallCollision.lua")()
love.filesystem.load("scripts/systems/GroundCollision.lua")()
love.filesystem.load("scripts/systems/Drawing.lua")()
love.filesystem.load("scripts/systems/MenuSystem.lua")()
love.filesystem.load("scripts/systems/Reset.lua")()
love.filesystem.load("scripts/systems/DebugMode.lua")()
love.filesystem.load("scripts/systems/VolumeSystem.lua")()

-- Funciones random

function Lerp(a, b, t)
    return (1 - t) * a + t * b
end

function CalculateModule(ax, ay, bx, by)
    return math.sqrt((bx - ax)^2 + (by - ay)^2)
end


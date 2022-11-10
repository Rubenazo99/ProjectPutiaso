LevelEngine = Engine()

local w, h = love.graphics.getDimensions()

-- Declaramos la lista de suelos y paredes que tendremos
-- en nuestro juego

local platformGroundList = { }
local platformWallList = { }

-- Y creamos, solo para las paredes
-- la misma lista pero para entidades

local platformWallEntities = { }

-- Por cada valor en el index encontrado en testmap.lua (.layers[en el índice 2], objects)
-- agarro el objeto y lo meto en la lista

for index, wallObject in pairs(require('maps/testmapGraphics').layers[2].objects) do
    
    table.insert(platformWallList, wallObject)

end

-- Después por cada pared en esa lista creamos una entidad,
-- agarramos sus valores, y los introducimos a los componentes necesarios
-- creamos la plataforma, la isnsertamos en la lista.

for index, wall in pairs(platformWallList) do
    
    local wallPlatform = Entity()
    table.insert(platformWallEntities, wallPlatform)

    wallPlatform:initialize()

    wallPlatform:add(Transform(wall.x, wall.y, 0, 1, 1, wall.width, wall.height, "Wall"))
    wallPlatform:add(Collider())
    LevelEngine:addEntity(wallPlatform)

end

-- Lo mismo para los suelos, localizado en el valor [3] de layers

for index, object in pairs(require('maps/testmapGraphics').layers[3].objects) do
    
    table.insert(platformGroundList, object)

end

for index, ground in pairs(platformGroundList) do
    
    local groundPlatform = Entity()
    groundPlatform:initialize()

    groundPlatform:add(Transform(ground.x, ground.y, 0, 1, 1, ground.width, ground.height, "Ground"))
    groundPlatform:add(Collider())
    LevelEngine:addEntity(groundPlatform)

end

-- Una vez tenemos todas añadimos las referencias a los jugadores

for index, player in pairs(GetPlayers()) do

    LevelEngine:addEntity(player)

end

-- Y finalmente añadimos los sistemas

LevelEngine:addSystem(WallCollisionSystem())
LevelEngine:addSystem(GroundCollisionSystem())

-- Si en algún momento de el código, necesito una referencia de las paredes,
-- uso esta función que me dice en modo debug la cantidad de entidades que hay,
-- y independientemente de debug o no me devuelve la tabla de las paredes (entidades)

function ReturnAllWallEntities()

    return platformWallEntities
    
end

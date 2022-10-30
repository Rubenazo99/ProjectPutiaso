LevelEngine = Engine()

local w, h = love.graphics.getDimensions()

local wallList = { }

for index, object in pairs(require('maps/testmap').layers[1].objects) do
    
    table.insert(wallList, object)

end

for index, wall in pairs(wallList) do
    
    local wallPlatform = Entity()
    wallPlatform:initialize()

    wallPlatform:add(Transform(wall.x, wall.y, 0, 1, 1, wall.width, wall.height, "Wall"))
    wallPlatform:add(Collider())
    LevelEngine:addEntity(wallPlatform)

end

local platformList = { }

for index, object in pairs(require('maps/testmap').layers[2].objects) do
    
    table.insert(platformList, object)

end

for index, ground in pairs(platformList) do
    
    local groundPlatform = Entity()
    groundPlatform:initialize()

    groundPlatform:add(Transform(ground.x, ground.y, 0, 1, 1, ground.width, ground.height, "Ground"))
    groundPlatform:add(Collider())
    LevelEngine:addEntity(groundPlatform)

end

LevelEngine:addEntity(player)
LevelEngine:addEntity(player2)
LevelEngine:addSystem(WallCollisionSystem())
LevelEngine:addSystem(GroundCollisionSystem())



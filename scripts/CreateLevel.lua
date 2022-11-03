LevelEngine = Engine()

local w, h = love.graphics.getDimensions()

local platformGroundList = { }
local platformWallList = { }

local platformWallEntities = { }


for index, wallObject in pairs(require('maps/testmap').layers[2].objects) do
    
    table.insert(platformWallList, wallObject)

end

for index, wall in pairs(platformWallList) do
    
    local wallPlatform = Entity()
    table.insert(platformWallEntities, wallPlatform)

    wallPlatform:initialize()

    wallPlatform:add(Transform(wall.x, wall.y, 0, 1, 1, wall.width, wall.height, "Wall"))
    wallPlatform:add(Collider())
    LevelEngine:addEntity(wallPlatform)

end

for index, object in pairs(require('maps/testmap').layers[3].objects) do
    
    table.insert(platformGroundList, object)

end

for index, ground in pairs(platformGroundList) do
    
    local groundPlatform = Entity()
    groundPlatform:initialize()

    groundPlatform:add(Transform(ground.x, ground.y, 0, 1, 1, ground.width, ground.height, "Ground"))
    groundPlatform:add(Collider())
    LevelEngine:addEntity(groundPlatform)

end

for index, player in pairs(GetPlayers()) do

    LevelEngine:addEntity(player)

end

LevelEngine:addSystem(WallCollisionSystem())
LevelEngine:addSystem(GroundCollisionSystem())


function ReturnAllWallEntities()

    if debugMode == true then
        
        local count = 0

        for i, v in pairs(platformWallEntities) do
            
            count = count + 1    

        end

        print(count)

    end

    return platformWallEntities
    
end


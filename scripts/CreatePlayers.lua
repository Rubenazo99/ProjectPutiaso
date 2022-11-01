local playerList = { }

for index, player in pairs(require('maps/testmap').layers[1].objects) do
    
    local newPlayer = Entity()
    local properties = player.properties

    newPlayer:initialize()

    newPlayer:add(Transform(player.x, player.y, 0, 0, 1, player.width, player.height, player.name))
    newPlayer:add(Velocity(300, 1))
    newPlayer:add(Acceleration(1, 30))
    newPlayer:add(Collider())
    newPlayer:add(Jump(properties.jumpKey, -6, false, 0, 0.13))

    newPlayer:add(AttackComponent(12, 12, 24, 24, true, false, 0, 1, 0, 0, 0.4, properties.attackKey, false))
    newPlayer:add(HitComponent())

    newPlayer:add(Direction())
    newPlayer:add(MovementKeys(properties.leftMovementKey, properties.rightMovementKey))

    newPlayer:add(Color(properties.colorR, properties.colorG, properties.colorB, 1))

    table.insert(playerList, newPlayer)

end

function GetNumberOfPlayers()

    local count = 0

    for i, v in pairs(playerList) do
        
        count = count + 1

    end

    return count

end

function GetPlayers()
    return playerList
end
    playerList = { } -- ruben perdoon la he puesto en global porque no se como funciona la funcion get players ya que me dice que no es global (porfi no me mates)

--[[

Ahora para crear players he quitado la versión hardcodeada, y he creado una versión
que crea de manera dinámica la cantidad de jugadores que queramos, usando el testMap de *tiled*

Como sé que los jugadores están en la layer[1] agarro las tablas de jugadores,
agarro sus propiedades, y las paso acorde con las propiedades customizadas en los objetos
de tiled.

]]

for index, player in pairs(require('maps/testmapGraphics').layers[1].objects) do
    
    local newPlayer = Entity()
    local properties = player.properties

    newPlayer:initialize()

    newPlayer:add(Transform(player.x, player.y, 0, 0, 1, player.width, player.height, player.name))
    newPlayer:add(Velocity(300, 1))
    newPlayer:add(Acceleration(1, 30))
    newPlayer:add(Collider())
    newPlayer:add(Jump(properties.jumpKey, -9.5, false, 0, 0.13))

    newPlayer:add(AttackComponent(12, 12, 24, 24, true, false, 0, 1, 0, 0, 0.13, properties.attackKey, false))
    newPlayer:add(HitComponent())

    newPlayer:add(Direction())
    newPlayer:add(MovementKeys(properties.leftMovementKey, properties.rightMovementKey))

    newPlayer:add(Color(properties.colorR, properties.colorG, properties.colorB, 1))
    newPlayer:add(ResetComponent(player.x, player.y))

    table.insert(playerList, newPlayer)
end

-- Esta es una función global que te permite agarrar el número de jugadores

function GetNumberOfPlayers()

    local count = 0

    for i, v in pairs(playerList) do
        count = count + 1
    end

    return count

end

-- Esta función te permite agarrar la referencia de la tabla con todos los jugadores actuales.

function GetPlayers()
    return playerList
end
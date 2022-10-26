local w, h = love.graphics.getDimensions()

player = Entity()
player:initialize()

player:add(Transform(w / 2 - 25 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "PlayerA"))
player:add(Velocity(300, 1))
player:add(Acceleration(1, 30))

player:add(Collider(false))

player:add(Jump("w", -6))
player:add(MovementKeys("a", "d"))

player:add(Color(200, 0, 0, 1))

-------------------------------

player2 = Entity()
player2:initialize()

player2:add(Transform(w / 2 + 25 * 3 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "PlayerB"))
player2:add(Velocity(300, 1))
player2:add(Acceleration(1, 30))

player2:add(Collider(false))

player2:add(Jump("up", -6))
player2:add(MovementKeys("left", "right"))

player2:add(Color(0, 200, 0, 1))
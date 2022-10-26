local w, h = love.graphics.getDimensions()

player = Entity()
player:initialize()

player:add(Transform(w / 2 - 25 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "playerA"))
player:add(Velocity(1, 1))
player:add(Acceleration(1, 10))
player:add(Collider(false))
player:add(Jump("w", -8))
player:add(Color(200, 0, 0, 1))


player2 = Entity()
player2:initialize()

player2:add(Transform(w / 2 - 25 * 3 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "playerA"))
player2:add(Velocity(1, 1))
player2:add(Acceleration(1, 20))
player2:add(Collider(false))
player2:add(Jump("o", -9))
player2:add(Color(0, 0, 200, 1))
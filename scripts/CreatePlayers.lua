local w, h = love.graphics.getDimensions()

player = Entity()
player:initialize()

player:add(Transform(w / 2 - 25 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "PlayerA"))
player:add(Velocity(300, 1))
player:add(Acceleration(1, 30))

player:add(Collider())

player:add(Jump("w", -6))
player:add(AttackComponent())

player:add(HitComponent())

player:add(Direction())
player:add(MovementKeys("a", "d"))

player:add(Color(200, 0, 0, 1))

-------------------------------

player2 = Entity()
player2:initialize()

player2:add(Transform(w / 2 + 25 * 3 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "PlayerB"))
player2:add(Velocity(300, 1))
player2:add(Acceleration(1, 30))

player2:add(Collider())

player2:add(Jump("up", -6))
player2:add(AttackComponent(12, 12, 25, 25, true, false, 0, 1, 0, 0, 2, "p", false))

player2:add(HitComponent())

player2:add(Direction())
player2:add(MovementKeys("left", "right"))

player2:add(Color(0, 200, 0, 1))

-------------------------------

player3 = Entity()
player3:initialize()

player3:add(Transform(w / 2 + 25 * 3 / 2, h / 2 - 80, 0, 1, 1, 25, 25, "PlayerB"))
player3:add(Velocity(300, 1))
player3:add(Acceleration(1, 30))

player3:add(Collider(false))

player3:add(Jump("m", -6))
player3:add(MovementKeys("k", "l"))

player3:add(Color(0, 0, 200, 1))
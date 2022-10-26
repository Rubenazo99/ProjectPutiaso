engine = Engine()

engine:addEntity(ground)
engine:addEntity(player)
--engine:addEntity(player2)
engine:addSystem(GravitySystem())
engine:addSystem(JumpSystem())
engine:addSystem(CollisionSystem())
engine:addSystem(DrawingSystem(), "draw")
engine:addSystem(MovementSystem())
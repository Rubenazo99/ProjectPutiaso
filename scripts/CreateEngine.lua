engine = Engine()

engine:addEntity(ground)

engine:addEntity(player)
engine:addEntity(player2)
--engine:addEntity(player3)
engine:addSystem(GravitySystem())
engine:addSystem(MovementSystem())
engine:addSystem(AttackSystem())
engine:addSystem(JumpSystem())
engine:addSystem(WallCollisionSystem())
engine:addSystem(GroundCollisionSystem())
engine:addSystem(RecieveHitSystem())

if debugMode == true then engine:addSystem(DebugMode()) end

engine:addSystem(DrawingSystem(), "draw")

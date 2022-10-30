GameEngine = Engine()

GameEngine:addEntity(player)
GameEngine:addEntity(player2)
GameEngine:addSystem(GravitySystem())
GameEngine:addSystem(MovementSystem())
GameEngine:addSystem(AttackSystem())
GameEngine:addSystem(JumpSystem())
GameEngine:addSystem(RecieveHitSystem())

if debugMode == true then GameEngine:addSystem(DebugMode()) end

GameEngine:addSystem(DrawingSystem(), "draw")

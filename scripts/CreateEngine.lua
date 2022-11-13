GameEngine = Engine()

for index, player in pairs(GetPlayers()) do

    GameEngine:addEntity(player)

end

GameEngine:addSystem(GravitySystem())
GameEngine:addSystem(MovementSystem())
GameEngine:addSystem(AttackSystem())
GameEngine:addSystem(JumpSystem())
GameEngine:addSystem(RecieveHitSystem())

if debugMode == true then GameEngine:addSystem(DebugMode()) end

GameEngine:addSystem(DrawingSystem(), "draw")

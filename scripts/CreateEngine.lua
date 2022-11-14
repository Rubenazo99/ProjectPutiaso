GameEngine = Engine()

for index, player in pairs(GetPlayers()) do

    GameEngine:addEntity(player)

end

GameEngine:addSystem(CameraSystem())
GameEngine:addSystem(JumpSystem())
GameEngine:addSystem(GravitySystem())
GameEngine:addSystem(MovementSystem())
GameEngine:addSystem(RecieveHitSystem())
GameEngine:addSystem(AttackSystem())
GameEngine:addSystem(ResetSytem())

if debugMode == true then GameEngine:addSystem(DebugMode()) end

GameEngine:addSystem(DrawingSystem(), "draw")

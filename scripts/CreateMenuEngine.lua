MenuEngine = Engine()

MenuEngine:addEntity(BackGround)
MenuEngine:addEntity(ExitButton)

--MenuEngine:addSystem(MovementSystem())
MenuEngine:addSystem(MenuSystem())
--MenuEngine:addSystem(GravitySystem())
MenuEngine:addSystem(DrawingSystem(), "draw")


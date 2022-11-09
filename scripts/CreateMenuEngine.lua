MenuEngine = Engine()

MenuEngine:addEntity(BackGround)

--MenuEngine:addSystem(MovementSystem())
MenuEngine:addSystem(MenuSystem())
MenuEngine:addSystem(DrawingSystem(), "draw")

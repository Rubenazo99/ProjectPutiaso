MenuEngine = Engine()

MenuEngine:addEntity(BackGround)
MenuEngine:addEntity(ExitButton)

MenuEngine:addSystem(MenuSystem())
MenuEngine:addSystem(DrawingSystem(), "draw")


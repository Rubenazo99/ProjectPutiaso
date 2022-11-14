local w, h = love.graphics.getDimensions()


local BackGround = Entity() --Si es local peta y no se perque

BackGround:initialize()

BackGround:add(Transform(-800, 100, 0, 0, 1, w - 200, h - 200, "backGround"))
BackGround:add(Color(255, 0, 0))

------------------

local ExitButton = Entity()

ExitButton:initialize()

ExitButton:add(Transform(-700, h/2, 0, 0, 1, w-200, h - 900, "exitButton")) -- "x", "y", "rotation", "scaleX", "scaleY", "width", "height", "name"
ExitButton:add(Color(0, 0, 233,1))

MenuEngine = Engine()

MenuEngine:addEntity(BackGround)
MenuEngine:addEntity(ExitButton)

MenuEngine:addSystem(MenuSystem())
MenuEngine:addSystem(DrawingSystem(), "draw")

-- code by edu
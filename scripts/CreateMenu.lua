local w, h = love.graphics.getDimensions()


BackGround = Entity() --Si es local peta i no se perque

BackGround:initialize()

BackGround:add(Transform(-800, 100, 0, 0, 1, w - 200, h - 200, "backGround"))
BackGround:add(Color(255, 255, 255, 1))



ExitButton = Entity()

ExitButton:initialize()

ExitButton:add(Transform(-700, h/2, 0, 0, 1, w-200, h - 900, "exitButton")) -- "x", "y", "rotation", "scaleX", "scaleY", "width", "height", "name"
ExitButton:add(Color(1, 0, 233, 1))


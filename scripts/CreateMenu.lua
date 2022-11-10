local w, h = love.graphics.getDimensions()

--for index, player in pairs(require("maps/testmap").layers[4].objects) do
    BackGround = Entity() --Si es local peta i no se perque

    BackGround:initialize()

    BackGround:add(Transform(-800, 100, 0, 0, 1, w - 200, h - 200, "hi"))
    BackGround:add(Color(255, 255, 255, 1))
    BackGround:add(Collider())
    --BackGround:add(Velocity(300, 1))
--end

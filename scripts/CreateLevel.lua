local w, h = love.graphics.getDimensions()

ground = Entity()
ground:initialize()

ground:add(Transform(0, h / 2, 0, 1, 1, w, 80))
ground:add(Collider(false))
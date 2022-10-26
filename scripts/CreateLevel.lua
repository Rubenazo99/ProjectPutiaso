local w, h = love.graphics.getDimensions()

ground = Entity()
ground:initialize()

ground:add(Transform(w / 2 - w / 4, h / 2, 0, 1, 1, w / 2, 80, "Ground"))
ground:add(Collider(false))
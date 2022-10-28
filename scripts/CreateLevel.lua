local w, h = love.graphics.getDimensions()

ground = Entity()

ground:initialize()

ground:add(Transform(w / 2 - w / 4, h / 2, 0, 1, 1, w / 2, 80, "Ground"))
ground:add(Collider(false))

--------------

ground2 = Entity()

ground2:initialize()

ground2:add(Transform(200, h / 2 - 200, 0, 1, 1, 80, h / 2, "Wall"))
ground2:add(Collider(false))

---------------

ground3 = Entity()

ground3:initialize()

ground3:add(Transform(w - 200, h / 2 - 200, 0, 1, 1, 80, h / 2, "Wall"))
ground3:add(Collider(false))
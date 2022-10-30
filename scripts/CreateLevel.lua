local w, h = love.graphics.getDimensions()

ground = Entity()

ground:initialize()

ground:add(Transform(w / 2 - 150, 100, 0, 1, 1, 300, 60, "Ground"))
ground:add(Collider(false))
ground:add(DragableComponent())

--------------

local w, h = love.graphics.getDimensions()

ground = Entity()

ground:initialize()

ground:add(Transform(w / 2 - w / 4, 100, 0, 1, 1, w / 2, 60, "Ground"))
ground:add(Collider(false))
ground:add(DragableComponent())

--------------

ground2 = Entity()

ground2:initialize()

ground2:add(Transform(w / 2 - w / 4, 200, 0, 1, 1, w / 2, 60, "Ground"))
ground2:add(Collider(false))
ground2:add(DragableComponent())

------------------

ground3 = Entity()

ground3:initialize()

ground3:add(Transform(w / 2 - w / 4, 200, 0, 1, 1, 80, w / 2, "Ground"))
ground3:add(Collider(false))
ground3:add(DragableComponent())

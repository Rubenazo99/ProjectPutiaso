Transform = Component.create("transform", { "x", "y", "rotation", "scaleX", "scaleY", "width", "height", "name"},
    { x = 0, y = 0, rotation = 0, scaleX = 1, scaleY = 1, width = 10, height = 10, name = "Default"})
Collider = Component.create("collider", { "isTrigger", "isColliding", "isTouchingWall" }, { isTrigger = false, isColliding = false, isTouchingWall = false })
Velocity = Component.create("velocity", { "x", "y" }, { x = 1, y = 1 })
Acceleration = Component.create("acceleration", { "x", "y" }, { x = 0, y = 0 })
Color = Component.create("color", { "r", "g", "b", "a" }, { r = 255, g = 255, b = 255, a = 1 })
Jump = Component.create("jump", { "jumpKey", "force", "rayActive", "timer", "maxTimer" }, { jumpKey = "w", force = -8, rayActive = true, timer = 0, maxTimer = 0.3 })
MovementKeys = Component.create("movementKeys", { "left", "right" }, { left = "a", right = "d" })

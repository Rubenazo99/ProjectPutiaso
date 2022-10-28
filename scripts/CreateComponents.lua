Transform = Component.create("transform", { "x", "y", "rotation", "scaleX", "scaleY", "width", "height", "name"},
    { x = 0, y = 0, rotation = 0, scaleX = 1, scaleY = 1, width = 10, height = 10, name = "Default"})
Collider = Component.create("collider", { "isTrigger", "isColliding", "isTouchingWall" }, { isTrigger = false, isColliding = false, isTouchingWall = false })
Velocity = Component.create("velocity", { "x", "y" }, { x = 1, y = 1 })
Acceleration = Component.create("acceleration", { "x", "y" }, { x = 0, y = 0 })
Color = Component.create("color", { "r", "g", "b", "a" }, { r = 255, g = 255, b = 255, a = 1 })
Jump = Component.create("jump", { "jumpKey", "force", "rayActive", "timer", "maxTimer" }, { jumpKey = "w", force = -8, rayActive = true, timer = 0, maxTimer = 0.3 })
MovementKeys = Component.create("movementKeys", { "left", "right" }, { left = "a", right = "d" })
Direction = Component.create("direction", { "left", "right" }, { left = false, right = true })


--[[

-- GUÍA --

Transform -> Almacena lo básico de lo básico, la posición, rotación, escala, altura y anchura y su nombre.
Collider -> La que gestiona los colliders, tiene isTrigger por si queremos hacer que lo atraviess igualmente (perfecto para eventos, sin implementar todavía)
                    después isColliding para el suelo, y isTouchingWall para las parades, todos en true o false
Velocity -> Almacena la velocidad actual del jugador tanto en x o y
Acceleration -> Se encarga de guardar la aceleración tanto de x o y individualmente de la velocidad, se podría modificar para hacer los saltos más crunchy
Color -> Guarda las 3 variables r g b y la alpha en bytes (0 - 255)
Jump -> Contiene las variables jumpKey (tecla para saltar), force (la fuerza del salto), rayActive (true o false) y desactiva o activa los raycasts del suelo, y timer y maxtimer (explicadas en sistemas)
MovementKeys -> Contiene las teclas que se usarán para moverte
Direction -> Almacena la dirección del jugador, está atada con movement keys-


]]
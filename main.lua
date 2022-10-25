local lovetoys = require('lovetoys')
lovetoys.initialize({ globals = true, debug = true })

local w, h = love.graphics.getDimensions()

function love.load()

    CreateComponents()
    CreateEntities()
    CreateSystem()
    CreateEngine()

end

function love.update(dt)

    playerEngine:update(dt)
    levelEngine:update(dt)

end

function love.draw()

    playerEngine:draw()
    levelEngine:draw()

end

function CreateComponents()

    Transform = Component.create("transform", { "x", "y", "rotation", "scaleX", "scaleY", "width", "height" },
        { x = 0, y = 0, rotation = 0, scaleX = 1, scaleY = 1, width = 10, height = 10 })
    Collider = Component.create("collision", { "isTrigger" }, { isTrigger = false })
    Velocity = Component.create("velocity", { "x", "y" }, { x = 1, y = 1 })
    Acceleration = Component.create("acceleration", { "x", "y" }, { x = 0, y = 0 })

end

function CreateEntities()

    player = Entity()
    player:initialize()

    player:add(Transform(w / 2 - 25 / 2, h / 2 - 80, 0, 1, 1, 25, 25))
    player:add(Velocity(1, 1))
    player:add(Acceleration(1, 1))
    player:add(Collider(false))

    ground = Entity()
    ground:initialize()

    ground:add(Transform(0, h / 2, 0, 1, 1, w, 20))
    ground:add(Collider(false))

end

function CreateSystem()

    GravitySystem = class("GravitySystem", System)

    function GravitySystem:requireS()
        return { "transform", "velocity", "acceleration" }
    end

    function GravitySystem:update(dt)

        for key, entity in pairs(self.targets) do

            local transform = entity:get("transform")
            local velocity = entity:get("velocity")
            local acceleration = entity:get("acceleration")

            velocity.y = velocity.y + acceleration.y * dt
            transform.y = transform.y + velocity.y

            if love.keyboard.isDown("space") then velocity.y = -1 end

        end

    end

    DrawingSystem = class("DrawSystem", System)

    function DrawingSystem:requires()
        return { "transform" }
    end

    function DrawingSystem:draw()
        for _, entity in pairs(self.targets) do
            love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                entity:get("transform").width, entity:get("transform").height)
        end
    end


end

function CreateEngine()

    playerEngine = Engine()
    playerEngine:addEntity(player)
    playerEngine:addSystem(GravitySystem())
    playerEngine:addSystem(DrawingSystem(), "draw")

    levelEngine = Engine()
    levelEngine:addEntity(ground)
    levelEngine:addSystem(DrawingSystem(), "draw")

end

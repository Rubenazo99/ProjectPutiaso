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

    engine:update(dt)

end

function love.draw()

    engine:draw()


end

function CreateComponents()

    Transform = Component.create("transform", { "x", "y", "rotation", "scaleX", "scaleY", "width", "height" },
        { x = 0, y = 0, rotation = 0, scaleX = 1, scaleY = 1, width = 10, height = 10 })
    Collider = Component.create("collider", { "isTrigger", "isColliding" }, { isTrigger = false, isColliding = false })
    Velocity = Component.create("velocity", { "x", "y" }, { x = 1, y = 1 })
    Acceleration = Component.create("acceleration", { "x", "y" }, { x = 0, y = 0 })
    Color = Component.create("color", { "r", "g", "b", "a" }, { r = 255, g = 255, b = 255, a = 1 })

end

function CreateEntities()

    player = Entity()
    player:initialize()

    player:add(Transform(w / 2 - 25 / 2, h / 2 - 80, 0, 1, 1, 25, 25))
    player:add(Velocity(1, 1))
    player:add(Acceleration(1, 50))
    player:add(Collider(false))
    player:add(Color(200, 0, 0, 1))

    ground = Entity()
    ground:initialize()

    ground:add(Transform(0, h / 2, 0, 1, 1, w, 80))
    ground:add(Collider(false))

end

function CreateSystem()

    -- Este sistema hace que haya gravedad

    GravitySystem = class("GravitySystem", System)

    function GravitySystem:requireS()
        return { "transform", "velocity", "acceleration", "collider" }
    end

    function GravitySystem:update(dt)

        for key, entity in pairs(self.targets) do

            if entity:get("acceleration") ~= nil then

                local transform = entity:get("transform")
                local velocity = entity:get("velocity")
                local acceleration = entity:get("acceleration")
                local collider = entity:get("collider")


                if collider.isColliding == false then

                    velocity.y = velocity.y + acceleration.y * dt
                    transform.y = transform.y + velocity.y

                else
                    if love.keyboard.isDown('w') then
                        
                        collider.isColliding = false
                        velocity.y = -10

                    end

                end

            end

        end

    end

    -- Este sistema dibuja

    DrawingSystem = class("DrawSystem", System)

    function DrawingSystem:requires()
        return { "transform" }
    end

    function DrawingSystem:draw()

        for _, entity in pairs(self.targets) do

            local color = entity:get("color")

            if color == nil then
                love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                    entity:get("transform").width, entity:get("transform").height)
            else
                love.graphics.setColor(love.math.colorFromBytes(color.r, color.g, color.b))
                love.graphics.rectangle("fill", entity:get("transform").x, entity:get("transform").y,
                    entity:get("transform").width, entity:get("transform").height)
                love.graphics.setColor(1, 1, 1, 1)
            end

        end
    end

    -- Este sistema chequea colisiones

    CollisionSystem = class("CollisionSystem", System)

    function CollisionSystem:requires()
        return { "transform", "collider" }
    end

    function CollisionSystem:update(dt)

        for _, entityA in pairs(self.targets) do

            local transformA = entityA:get("transform")
            local colliderA = entityA:get("collider")

            if colliderA.isColliding == false then

                for _, entityB in pairs(self.targets) do

                    if entityA ~= entityB then

                        local transformB = entityB:get("transform")

                        if (transformA.x > transformB.x and transformA.x < transformB.x + transformB.width)
                            and (transformA.y + transformA.height > transformB.y and transformA.y + transformA.height * 2 < transformB.y + transformB.height * 2) then

                            colliderA.isColliding = true
                            transformA.y = (transformA.y - (transformA.y - transformB.y)) - transformA.height

                        end

                    end

                    if colliderA.isColliding == true then break end

                end
            end

        end

    end

end

function CreateEngine()

    engine = Engine()

    engine:addEntity(ground)
    engine:addEntity(player)
    engine:addSystem(GravitySystem())
    engine:addSystem(CollisionSystem())
    engine:addSystem(DrawingSystem(), "draw")


end

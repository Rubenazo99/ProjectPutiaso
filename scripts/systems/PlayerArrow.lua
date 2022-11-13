-- PlayerArrowSystem = class("PlayerArrowSystem", System)

-- function PlayerArrowSystem:initialize()
-- end

-- local w, h = love.graphics.getWidth(), love.graphics.getHeight()

-- playerArrow = Entity()

-- playerArrow:initialize()

-- playerArrow:add(Transform(w / 2))
-- playerArrow:add(ImageComponent(love.graphics.newImage("image/arrow.png")))
-- playerArrow:add(ShowComponent())

-- local transform = playerArrow:add(Transform())
-- local imageComponent = playerArrow:add(ImageComponent())
-- local showComponent = playerArrow:add(ShowComponent())

-- local offset = 10
-- local travelDistance = 20

-- local currentDistance = 0
-- local travelSpeed = 10

-- function PlayerArrowSystem:requires()
--     return {"transform", "ImageComponent", "ShowComponent"}
-- end

-- function showArrow(show)
--     if show ~= nil then
--         showComponent = show
--     end
-- end

-- function PlayerArrowSystem:update(dt)
--     if showComponent then
--         bottom = getCameraBottom()

--         if currentDistance < 1 then
--             currentDistance = currentDistance + travelSpeed * dt
--         else
--             if currentDistance > travelDistance then
--                 currentDistance = currentDistance - travelSpeed * dt
--             end
--             transform.y = bottom - offset - currentDistance
--         end
--     end
-- end


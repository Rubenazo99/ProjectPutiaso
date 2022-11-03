-- CAMERA SYSTEM SCRIPT ECT................................

--------------------------- REQUIREMENTS FROM TILED (lo que tiene que leer sergio y teo) ----------------

-- the order of the camera goes from bottom to top inside of tiled

-- X position (is created when you place the camera in tiled)
-- Y position (is created when you place the camera in tiled)
-- changeThreshold (set the *percentage* of the camera you need to exit to go to the next camera)

--------------------------- Extra info about camera (para los gigaHead programadores)---------------------------------





-- change this to change the zoom of the camera
local alternativeThreshold = 75 -- change this to change all non modified threshold values

local cameraZoom

local currentPosX, currentPosY -- current position of the camera

local id = 0 -- current camera id

local cameraStates = {} -- save all the information about the camera such as its position or its threshold

CameraSystem = class("CameraSystem", System) -- the system that makes the camera work

for i, camera in pairs(require('maps/testmap').layers[4].objects) do
    table.insert(cameraStates, camera)
end

for j, position in pairs(cameraStates) do
    print(cameraStates[j].x)
end    

Cam:lookAt(cameraStates[1].x, cameraStates[1].y)

print (Cam:position())

function CameraSystem:update(dt)

end

function love.keypressed(key)
    nextSection()
end
function getCameraPosition()
    return currentPosX, currentPosY
end

function getCameraId()
    return id
end

-- function to change to next section
function nextSection()
    id = id + 1
    currentPosX = cameraStates[id].x
    currentPosY = cameraStates[id].y

    Cam:lookAt(currentPosX, currentPosY)
end

-- function to change to the previous section
function prevSection()
    id = id - 1
    currentPosX = cameraStates[id].x
    currentPosY = cameraStates[id].y

    Cam:lookAt(currentPosX, currentPosY)
end

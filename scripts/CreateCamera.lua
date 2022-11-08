-- CAMERA SYSTEM SCRIPT ECT................................

--------------------------- REQUIREMENTS FROM TILED (lo que tiene que leer sergio y teo) ----------------

-- the order of the camera goes from bottom to top inside of tiled

-- X position (is created when you place the camera in tiled)
-- Y position (is created when you place the camera in tiled)
-- changeThreshold (set the *percentage* of the camera you need to exit to go to the next camera)
-- if you dont set a threshold then alternativeThreshold will be the default value

--------------------------- Extra info about camera (para los gigaHead programadores)---------------------------------


local alternativeThreshold = 75 -- change this to change all non modified threshold values

local cameraZoom -- change this to change the zoom of the camera

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

print(Cam:position())

function CameraSystem:update(dt)

end

function playerPositionCamera(camera) -- return the position of the player inside the camera

end

function isPlayerInsideCamera(player) -- insert a player to know if he currently is inside the camera


    return boolean
end

function love.keypressed(key)
    if key == "p" then
        nextSection()
    end
    for i, v in pairs(playerList) do
        if playerList[i] then
            print(playerList[i].X)
        end
    end
end

function getCameraPosition()
    return currentPosX, currentPosY
end

function getCameraId()
    return id
end

-- function to change to next section
function nextSection()

    if cameraStates[id + 1] then -- checks if the next level is null or not
        id = id + 1
        currentPosX = cameraStates[id].x
        currentPosY = cameraStates[id].y
    end

    Cam:lookAt(currentPosX, currentPosY)
end

-- function to change to the previous section
function prevSection()

    if cameraStates[id - 1] then -- checks if the previous level is null or not
        id = id - 1
        currentPosX = cameraStates[id].x
        currentPosY = cameraStates[id].y
    end

    Cam:lookAt(currentPosX, currentPosY)
end

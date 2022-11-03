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

local id -- current camera id

local cameraPositions = {} -- all the list of camera positions
local cameraThresholds = {} -- all the list of exit threshold values

CameraSystem = class("CameraSystem", System) -- the system that makes the camera work


-- Here i will go through all the camera positions and saving them in cameraPositions
for i, pos in pairs(require("maps/testmap").layers["Camera"]) do -- change the name of the map to the final map
    table.insert(cameraPositions, { X=pos.x, Y=pos.y })
end

-- Go through all the camera positions and save their thresholds
for i, thresh in pairs(require("maps/testmap").layers["Camera"]) do -- change the name of the map to the final map
    table.insert(cameraThresholds, thresh.threshold or alternativeThreshold)
end


---------  TO-DO LIST --------------------------------
-- [ ] the inserts inside each table should be tables instead of just values
-- [x] read exactly how the camera works
--   camera:lookAt
--   camera:position
-- [ ] implement camera functions

function CameraSystem:update(dt)

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
    currentPosX, currentPosY = cameraPositions[id]

    cam:lookAt(currentPosX, currentPosY)
end

-- function to change to the previous section
function prevSection()
    id = id - 1
    currentPosX, currentPosY = cameraPositions[id]

    cam:lookAt(currentPosX,currentPosY)
end


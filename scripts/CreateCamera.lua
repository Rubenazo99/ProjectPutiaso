-- Here you will find anything related to the camera

--------------------------- REQUIREMENTS FROM TILED -----------------------------------------------------

-- X position (is created when you place the camera in tiled)
-- Y position (is created when you place the camera in tiled)
-- id (sets the order of the camera)
-- changeThreshold (set the *percentage* of the camera you need to exit to go to the next camera)

---------------------------------------------------------------------------------------------------------

-- change this to change the zoom of the camera
local cameraZoom

local currentPosX, currentPosY -- current position of the camera

local currentId -- current id of the camera

local cameraPositions = {} -- all the list of camera positions
local cameraTThresholds = {} -- all the list of exit threshold values

CameraSystem = class("CameraSystem", System) -- the system that makes the camera work


-- Here i will go through all the camera positions ans saving them in cameraPositions
for i, pos in pairs(require("maps/testmap")) do -- change the name of the map to the final map

end

function CameraSystem:update(dt)

end

function getCameraPosition()
    return currentPosX, currentPosY 
end

-- function to change to next section 
function nextSection()

end

-- fcuntion to change to the previous section
function prevSection()

end










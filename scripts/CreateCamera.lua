-- CAMERA SYSTEM SCRIPT ECT................................

--------------------------- REQUIREMENTS FROM TILED (lo que tiene que leer sergio y teo) ----------------

-- the order of the camera goes from bottom to top inside of tiled

-- X position (is created when you place the camera in tiled)
-- Y position (is created when you place the camera in tiled)
-- changeThreshold (set the *percentage* of the camera you need to exit to go to the next camera)
-- if you dont set a threshold then alternativeThreshold will be the default value

--------------------------- Extra info about camera (para los gigaHead programadores)---------------------------------

CameraEngine = Engine()

local alternativeThreshold = 75 -- change this to change all non modified threshold values

local currentPosX, currentPosY -- current position of the camera

local currentThreshold -- current threshold value of the cameraState

local id = 1 -- current camera id

local cameraStates = {} -- save all the information about the camera such as its position or its threshold

local camWidth, camHeight = love.graphics.getWidth(), love.graphics.getHeight()

CameraSystem = class("CameraSystem", System) -- the system that makes the camera work


-- here we load all the requirements

for i, camera in pairs(require('maps/testmapGraphics').layers[4].objects) do
    table.insert(cameraStates, camera)
end


for j, position in pairs(cameraStates) do
    print(cameraStates[j].x)
end

currentPosX = cameraStates[1].x
currentPosY = cameraStates[1].y

Cam:lookAt(currentPosX, currentPosY)

local cameraTop = currentPosY - (camHeight / 2) -- The top position of the camera
local cameraBottom = currentPosY + (camHeight / 2) -- Then bottom position of the camera

if cameraStates[id].threshold then
    currentThreshold = cameraStates[id].threshold
else
    currentThreshold = alternativeThreshold
end

currentThreshold = (100 - currentThreshold)

--- requirements finished


function CameraSystem:update(dt)
    -- Checks if you are meeting the conditions to go up a level
    local playerPassed = {}
    for j, i in pairs(playerList) do -- makes sure both players are inside the camera
        if isPlayerInsideCamera(i) then
            for k, v in pairs(playerList) do -- checks if both players are above the threshold
                if playerThresholdInCamera(v) < currentThreshold then
                    playerPassed[k] = true
                else
                    playerPassed[k] = false
                end
            end
            if playerPassed[1] == true and playerPassed[2] == true then
                nextSection() -- if both playZers are above the threshold then go up a level
            end
        end
    end


    -- Checks if you are meeting the conditions to go down a level
    local playerFallen = {}
    for j,i in pairs(playerList) do -- both players are not inside the camera
        if not isPlayerInsideCamera(i) then 
            playerFallen[j] = true
        end
    end
    if playerFallen[1] == true and playerFallen[2] == true then
        prevSection() 
    end
end

function love.keypressed(key)
    -- Enable for debug purposes

    -- if key == 'i' then
    --     nextSection()
    -- end

    -- if key == 'c' then
    --     for i, v in pairs(playerList) do
    --         print(isPlayerInsideCamera(v))
    --     end
    -- end

    -- if key == 'o' then
    --     prevSection()
    -- end
end

function playerThresholdInCamera(player) -- return the position of the player inside the camera as a percentage
    if isPlayerInsideCamera(player) then -- only executes if the player is inside the camera
        local playerPositionInCamera = player:get("transform").y - cameraTop
        local percentageInCam = (playerPositionInCamera * 100) / camHeight
        return percentageInCam
    else
        if player:get("transform").y < cameraTop then
            return 101 -- this means the player is above the camer
        else
            return -1 -- this means the player is below the camera
        end
    end
end

function isPlayerInsideCamera(player) -- insert a player to know if he currently is inside the camera

    if player:get("transform").y >= cameraTop and player:get("transform").y <= cameraBottom then --  checks if the player is between those two positions
        return true
    else
        return false
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

        if cameraStates[id].threshold then
            currentThreshold = cameraStates[id].threshold
        else
            currentThreshold = alternativeThreshold
        end
        currentThreshold = (100 - currentThreshold)
    end

    Cam:lookAt(currentPosX, currentPosY)

    cameraBottom = currentPosY + (camHeight / 2) -- Then bottom position of the camera
    cameraTop = currentPosY - (camHeight / 2) -- The top position of the camera
end

-- function to change to the previous section
function prevSection()


    if cameraStates[id - 1] then -- checks if the previous level is null or not
        id = id - 1
        currentPosX = cameraStates[id].x
        currentPosY = cameraStates[id].y

        if cameraStates[id].threshold then
            currentThreshold = cameraStates[id].threshold
        else
            currentThreshold = alternativeThreshold
        end
        currentThreshold = (100 - currentThreshold)
    end

    Cam:lookAt(currentPosX, currentPosY)

    cameraBottom = currentPosY + (camHeight / 2) -- Then bottom position of the camera
    cameraTop = currentPosY - (camHeight / 2) -- The top position of the camera
end

CameraEngine:addSystem(CameraSystem())

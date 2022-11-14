local w, h = love.graphics.getDimensions()

VolumeBar = Entity() --Si es local peta i no se perque

VolumeBar:initialize()

VolumeBar:add(Transform(-700, 300, 0, 0, 1, w-200, h - 900, "volumeBar")) -- "x", "y", "rotation", "scaleX", "scaleY", "width", "height
VolumeBar:add(Color(255, 255, 255, 1))




VolumeEngine = Engine()

VolumeEngine:addEntity(VolumeBar)

VolumeEngine:addSystem(VolumeSystem())
VolumeEngine:addSystem(DrawingSystem(), "draw")
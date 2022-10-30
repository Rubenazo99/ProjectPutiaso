
function love.conf(t)

    t.window.title = "Project Putiaso"         -- The window title (string)
    t.window.icon = nil                 -- Filepath to an image to use as the window's icon (string)
    t.window.width = 108 * 5             -- The window width (number)
    t.window.height = 192 * 5               -- The window height (number)
    t.window.borderless = false         -- Remove all border visuals from the window (boolean)
    t.window.resizable = false          -- Let the window be user-resizable (boolean)
    t.window.fullscreen = false         -- Enable fullscreen (boolean)
    t.window.fullscreentype = "desktop" -- Choose between "desktop" fullscreen or "exclusive" fullscreen mode (string)
    t.window.vsync = 1

end
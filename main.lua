anim8 = require 'libraries/anim8'
wf = require 'libraries/windfield'
camera = require 'libraries/hump-master/camera'
gs = require 'libraries/hump-master/gamestate'
sti = require 'libraries/sti'
Timer = require "libraries/hump-master/timer"

require 'src/Utilities/helper'
require 'src/Utilities/global'
require 'src/Utilities/controls'
require 'src/Utilities/shaders'


require 'src/Stages/game'
require 'src/Stages/tutorial'

require 'src/Objects/apple'
require 'src/Objects/cauldron'
require 'src/Objects/Elderberries'
require 'src/Objects/Crickets'
require 'src/Objects/vines'

require 'src/UI/healthbar'

require 'src/Menus/TitleScreen'
require 'src/Menus/Credits'
require 'src/Menus/PauseScreen'
require 'src/Menus/alchemychoice'
require 'src/Menus/alchemy'

function love.load()
    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
    
    gameFont = love.graphics.newFont(GAME_FONT_SIZE)
    textFont = love.graphics.newFont(TEXT_FONT_SIZE)
    SelectedButton = 1

    cam = camera(10,490,CAMERA_ZOOM)

    world = wf.newWorld(0, 800, false)
    add_col_classes(world)

    --TODO: Find a way to put these at the top with the other imports...
    require 'src/player'
    

    gs.switch(TitleScreen)
    love.mouse.setVisible(false)

    alchemy:load()

end

function love.update(dt)
    shaders:update(dt)
    if gs.current() == PauseScreen then 
        PauseScreen:update(dt)
    elseif gs.current() == alchemy then 
        alchemy:update(dt)
    elseif gs.current() ~= TitleScreen and gs.current() ~= Credits then
        love.mouse.setVisible(false)
        game:update(dt)
    end
end

function love.draw()
    if gs.current() == TitleScreen then 
        TitleScreen:draw()
    elseif gs.current() == Credits then
        Credits:draw()
    else
        game:draw()
    end
end

-- KEYBOARD and Controller keypresses

function love.keypressed(key) handleKeyPress(key, false) end
function love.keyreleased(key) handleKeyRelease(key, false) end

function love.gamepadpressed(joystick, button) handleKeyPress(button, true) end
function love.gamepadreleased(joystick, button) handleKeyRelease(button, true) end

function handleKeyPress(key, gamepad)
    if gs.current() == TitleScreen then 
        TitleScreen:keypressed(key, gamepad)
    elseif gs.current() == PauseScreen then 
        PauseScreen:keypressed(key,gamepad)
    elseif gs.current() == Credits then
        Credits:keypressed(key, gamepad)
    elseif gs.current() == alchemy then 
        alchemy:keypressed(key, gamepad)
    else 
        game:keypressed(key, gamepad)
    end
end

function handleKeyRelease(key, gamepad)
    if gs.current() == TitleScreen then 
    elseif gs.current() == PauseScreen then 
    elseif gs.current() == Credits then
    elseif gs.current() == alchemy then 
    else
        game:keyreleased(key, gamepad)
    end
end


function love.mousemoved(x,y,dx,dy, istouch)
    love.mouse.setVisible(true)
end

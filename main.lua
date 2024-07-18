anim8 = require 'libraries/anim8'
wf = require 'libraries/windfield'
camera = require 'libraries/hump-master/camera'
gs = require 'libraries/hump-master/gamestate'
sti = require 'libraries/sti'
Timer = require "libraries/hump-master/timer"

require 'src/helper'
require 'src/global'

require 'src/Stages/game'
require 'src/apple'
require 'src/Stages/tutorial'

require 'src/Menus/TitleScreen'
require 'src/Menus/Credits'


function love.load()
    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)

    gameFont = love.graphics.newFont(GAME_FONT_SIZE)
    textFont = love.graphics.newFont(TEXT_FONT_SIZE)
    SelectedButton = 1

    cam = camera(0,0,CAMERA_ZOOM)

    world = wf.newWorld(0, 800, false)
    world:setCallbacks(beginContact, endContact)
    add_col_classes(world)

    --TODO: Find a way to put these at the top with the other imports...
    require 'src/player'
    require 'src/apple'
    require 'src/Menus/PauseScreen'

    gs.switch(TitleScreen)
    love.mouse.setVisible(false)
end

function love.update(dt)
    if gs.current() == PauseScreen then 
        PauseScreen:update(dt)
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
    if player.hasapple then 
        love.graphics.print(player.inventory['apple'], textFont, 10, 10)
    end    
end

function love.keypressed(key)
    if gs.current() == TitleScreen then 
        TitleScreen:keypressed(key)
    elseif gs.current() == PauseScreen then 
        PauseScreen:keypressed(key)
    elseif gs.current() == Credits then
        Credits:keypressed(key)
    else 
        game:keypressed(key)
    end
end


function love.mousemoved(x,y,dx,dy, istouch)
    love.mouse.setVisible(true)
end

function love.keyreleased(key)
    if gs.current == Game then
        game:keyrealeased(key)
    end
end

-- Callback functions for object detection.
function beginContact(a, b, collision)
    print(apple.beginContact(a, b, collision))
end

function endContact(a,b, collision)
end

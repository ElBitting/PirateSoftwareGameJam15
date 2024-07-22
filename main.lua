anim8 = require 'libraries/anim8'
wf = require 'libraries/windfield'
camera = require 'libraries/hump-master/camera'
gs = require 'libraries/hump-master/gamestate'
sti = require 'libraries/sti'
Timer = require "libraries/hump-master/timer"

require 'src/helper'
require 'src/global'

require 'src/Stages/game'
require 'src/Stages/tutorial'
require 'src/apple'
require 'src/cauldron'

require 'src/Menus/TitleScreen'
require 'src/Menus/Credits'

shader_code = [[

extern vec2 player;

vec4 effect(vec4 color, Image image, vec2 uvs, vec2 screen_coords){

    
    return vec4(player.x, 0.0, 0.0, 1.0);
}
]]

function love.load()
    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)
    love.graphics.setDefaultFilter("nearest", "nearest")
    local joysticks = love.joystick.getJoysticks()
    joystick = joysticks[1]
    print(joystick)

    gameFont = love.graphics.newFont(GAME_FONT_SIZE)
    textFont = love.graphics.newFont(TEXT_FONT_SIZE)
    SelectedButton = 1

    cam = camera(10,490,CAMERA_ZOOM)

    world = wf.newWorld(0, 800, false)
    add_col_classes(world)

    --TODO: Find a way to put these at the top with the other imports...
    require 'src/player'
    require 'src/Menus/PauseScreen'
    require 'src/Menus/alchemy'

    gs.switch(TitleScreen)
    love.mouse.setVisible(false)

end

function love.update(dt)
    shader = love.graphics.newShader(shader_code)
    shader:send('player', {player:getPosition()})
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
    love.graphics.print(player.health, textFont, 10, 10)
end

function love.keyreleased(key)
    if gs.current() == tutorial then 
        game:keyrealeased(key)
    end
end

function love.keypressed(key)
    if gs.current() == TitleScreen then 
        TitleScreen:keypressed(key)
    elseif gs.current() == PauseScreen then 
        PauseScreen:keypressed(key)
    elseif gs.current() == Credits then
        Credits:keypressed(key)
    elseif gs.current() == alchemy then 
        alchemy:keypressed(key)
    else 
        game:keypressed(key)
    end
end

function love.gamepadpressed(joystick, button)
    if gs.current() == TitleScreen then 
        TitleScreen:keypressed(button)
    elseif gs.current() == PauseScreen then 
    elseif gs.current() == Credits then
    elseif gs.current() == alchemy then 
    else
        -- player:gamepadpressed(button)
    end
end
function love.gamepadreleased(joystick, button)
    if gs.current() == TitleScreen then 
    elseif gs.current() == PauseScreen then 
    elseif gs.current() == Credits then
    elseif gs.current() == alchemy then 
    else
        -- player:gamepadreleased(button)
    end
end


function love.mousemoved(x,y,dx,dy, istouch)
    love.mouse.setVisible(true)
end

anim8 = require 'libraries/anim8'
wf = require 'libraries/windfield'
camera = require 'libraries/hump-master/camera'
gs = require 'libraries/hump-master/gamestate'
sti = require 'libraries/sti'

require 'src/helper'
require 'src/global'

require 'src/Stages/game'

require 'TitleScreen'


function love.load()

    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)

    gameFont = love.graphics.newFont(GAME_FONT_SIZE)
    textFont = love.graphics.newFont(TEXT_FONT_SIZE)

    cam = camera(0,0,CAMERA_ZOOM)

    world = wf.newWorld(0, 800, false)
    add_col_classes(world)

    --TODO: Find a way to put these at the top with the other imports...
    require 'player'
    require 'PauseScreen'

    gs.switch(TitleScreen)
end

function love.update(dt)
    if gs.current() == game then
        player:update(dt)
        world:update(dt)
        cam:lookAt(player:getPosition())
    end
end

function love.draw()
    if gs.current() == TitleScreen then 
        TitleScreen:draw()
    else
        cam:attach()
            game:draw()
            world:draw()
            player:draw()
        cam:detach()

        -- Initiate Pause Sequence
        if gs.current() == PauseScreen then
            PauseScreen:draw()
        end
    end    
end

function love.keypressed(key)
    if key == 'return' and gs.current() == TitleScreen then
        gs.switch(game)
    end
    if key == 'escape' and gs.current() == TitleScreen then 
        safe_quit()
    end
    if key == 'escape' and gs.current() == game then
        gs.switch(PauseScreen)
    elseif key =='escape' and gs.current() == PauseScreen then
        safe_quit()
    end
    if key == 'p' and gs.current() == game then
        player:setX(20)
        player:setY(20)
    end
end
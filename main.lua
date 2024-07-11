anim8 = require 'libraries/anim8'
wf = require 'libraries/windfield'
camera = require 'libraries/hump-master/camera'
gs = require 'libraries/hump-master/gamestate'
sti = require 'libraries/sti'

require 'src/helper'
require 'src/global'

require 'src/Stages/game'

require 'src/Menus/TitleScreen'


function love.load()
    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)

    gameFont = love.graphics.newFont(GAME_FONT_SIZE)
    textFont = love.graphics.newFont(TEXT_FONT_SIZE)
    SelectedButton = 1

    cam = camera(0,0,CAMERA_ZOOM)

    world = wf.newWorld(0, 800, false)
    add_col_classes(world)

    --TODO: Find a way to put these at the top with the other imports...
    require 'src/player'
    require 'src/Menus/PauseScreen'

    gs.switch(TitleScreen)
    love.mouse.setVisible(false)
end

function love.update(dt)
    if gs.current() == PauseScreen then 
        PauseScreen:update(dt)
    elseif gs.current() == game then
        love.mouse.setVisible(false)
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
    if gs.current() == TitleScreen then 
        TitleScreen:keypressed(key)
    elseif gs.current() == PauseScreen then 
        PauseScreen:keypressed(key)
    else 
        game:keypressed(key)
    end
end


function love.mousemoved(x,y,dx,dy, istouch)
    love.mouse.setVisible(true)
end
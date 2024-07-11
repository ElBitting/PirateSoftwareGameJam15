anim8 = require 'library/anim8'
wf = require 'library/windfield'
camera = require 'library/hump-master/camera'
gs = require 'library/hump-master/gamestate'
sti = require 'library/sti'

require 'helper'
require 'global'

function love.load()
    game = {}
    love.window.setMode(GAME_WIDTH, GAME_HEIGHT)

    gameFont = love.graphics.newFont(GAME_FONT_SIZE)
    textFont = love.graphics.newFont(TEXT_FONT_SIZE)

    cam = camera(0,0,CAMERA_ZOOM)

    world = wf.newWorld(0, 800, false)
    add_col_classes(world)

    gameMap = sti('Maps/Tutorial_map_2.lua')

    --TODO: Find a way to put these at the top with the other imports...
    require 'player'
    require 'PauseScreen'
    require 'TitleScreen'

    walls = {}
    hazards = {}

    add_col_class_obj(walls, 'Platform', 'Walls',true)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true)

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
    else -- initiate game
        cam:attach()
            gameMap:drawLayer(gameMap.layers["BG"])
            gameMap:drawLayer(gameMap.layers["FG"])
            -- world:draw()
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
        love.event.quit()
    end
    if key == 'escape' and gs.current() == game then
        gs.switch(PauseScreen)
    elseif key =='escape' and gs.current() == PauseScreen then
        love.event.quit()
    end
end
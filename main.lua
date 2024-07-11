anim8 = require 'library/anim8'
wf = require 'library/windfield'
camera = require 'library/hump-master/camera'
gs = require 'library/hump-master/gamestate'


function newButton(text, fn)
    return { 
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

function love.load()
    game = {}
    love.window.setMode(1920, 1080)
    gameFont = love.graphics.newFont(100)
    textFont = love.graphics.newFont(32)
    cam = camera(0,0,2)
    world = wf.newWorld(0, 800, false)
    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    -- ground = world:newRectangleCollider(200, 400, 400, 50)
    -- ground:setCollisionClass('Platform')
    -- ground:setType('static') 

    sti = require 'library/sti'
    gameMap = sti('Maps/Tutorial_map_2.lua')

    require 'player'
    require 'PauseScreen'
    require 'TitleScreen'
    menuHeight = love.graphics.getHeight() *3/5

    menuWidth = love.graphics.getWidth() /5
    walls = {}
    if gameMap.layers['Walls'] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setCollisionClass('Platform')
            wall:setType('static')
            table.insert(walls, wall)
        end
    end
    menuWidth = love.graphics.getWidth() /7
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
            gameMap:drawLayer(gameMap.layers["BG"])
            gameMap:drawLayer(gameMap.layers["FG"])
            --world:draw()
            player:draw()
        cam:detach()
        PauseScreen:draw()
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
        gs.switch(game)
    end
end
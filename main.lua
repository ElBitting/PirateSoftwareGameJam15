anim8 = require 'library/anim8'
wf = require 'library/windfield'
camera = require 'library/hump-master/camera'

function love.load()
    love.window.setMode(1000, 768)
    gameFont = love.graphics.newFont(100)
    textFont = love.graphics.newFont(28)
    cam = camera()
    pause = false
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
    menuHeight = love.graphics.getHeight() *3/5
    menuWidth = love.graphics.getWidth() /5

    walls = {}
    if gameMap.layers['Walls'] then
        for i, obj in pairs(gameMap.layers["Walls"].objects) do
            local wall = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            wall:setType('static')
            table.insert(walls, wall)
        end
    end
end

function love.update(dt)
    if pause == false then
        player:update(dt)
        world:update(dt)
        cam:lookAt(player:getPosition())
    end
end

function love.draw()
    
    cam:attach()
        gameMap:drawLayer(gameMap.layers["BG"])
        gameMap:drawLayer(gameMap.layers["FG"])
        gameMap:resize(1000,1000)
        world:draw()
        player:draw()    
    cam:detach()
    PauseScreen:draw()
    
    love.graphics.print(player.grounded, textFont, 10, 10)
end

function love.keypressed(key)
    if key == 'escape' then
        pause = not pause
    end
end
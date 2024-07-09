anim8 = require 'library/anim8'
wf = require 'library/windfield'
camera = require 'library/hump-master/camera'


function love.load()
    love.window.setMode(1000, 768)
    gameFont = love.graphics.newFont(100)
    cam = camera()
    pause = false
    world = wf.newWorld(0, 800, false)
    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    ground = world:newRectangleCollider(200, 400, 400, 50)
    ground:setCollisionClass('Platform')
    ground:setType('static') 
    require 'player'

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
        world:draw()
        player:draw()
    cam:detach()
    if pause == true then
        love.graphics.print('Paused', gameFont, 325,100)
    end
    love.graphics.print(player.grounded, 10, 10)
end

function love.keypressed(key)
    if key == 'escape' then
        pause = not pause
    end
end
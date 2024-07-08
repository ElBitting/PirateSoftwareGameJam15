anim8 = require 'library/anim8'
wf = require 'library/windfield'


function love.load()
    love.window.setMode(1000, 768)
    gameFont = love.graphics.newFont(40)
    Background1 = love.graphics.newImage("Sprites/background/background_layer_1.png")
    Background2 = love.graphics.newImage("Sprites/background/background_layer_2.png")
    Background3 = love.graphics.newImage("Sprites/background/background_layer_3.png")

    world = wf.newWorld(0, 800, false)
    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    ground = world:newRectangleCollider(200, 400, 400, 50)
    ground:setCollisionClass('Platform')
    ground:setType('static') 
    require 'player'

end

function love.update(dt)
    player:update(dt)
    world:update(dt)
end

function love.draw()
    world:draw()
    player:draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function distance(x1, y1,x2, y2)
    return math.sqrt((x1 - x2)^2 + (y1-y2)^2) 
end

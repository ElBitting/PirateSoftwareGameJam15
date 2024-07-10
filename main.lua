anim8 = require 'library/anim8'
wf = require 'library/windfield'
camera = require 'library/hump-master/camera'


local buttons = {}

function love.load()
    love.window.setMode(1000, 768)
    gameFont = love.graphics.newFont(100)
    textFont = love.graphics.newFont(28)
    cam = camera()
    pause = false
    world = wf.newWorld(0, 800, false)
    world:addCollisionClass('Platform')
    world:addCollisionClass('Player')
    ground = world:newRectangleCollider(200, 400, 400, 50)
    ground:setCollisionClass('Platform')
    ground:setType('static') 
    require 'player'
    table.insert(buttons, newButton("Resume", function() pause = false end))
    table.insert(buttons, newButton("Inventory", function() end))
    table.insert(buttons, newButton("Save", function() pause = false end))
    table.insert(buttons, newButton("Settings", function() end))
    table.insert(buttons, newButton("Exit", function() love.event.quit() end))
    menuHeight = love.graphics.getHeight() *3/5
    menuWidth = love.graphics.getWidth() /5
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

    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()
    local butt = 0 
    if pause == true then
        love.graphics.print('Paused', gameFont, 325,100)
        love.graphics.rectangle("line", screenWidth-menuWidth-10, screenHeight /9, menuWidth, menuHeight)
        for i, button in ipairs(buttons) do
            button.last = button.now
            local color = {0.5, 0.7, 0.8, 1}
            local bx, by = screenWidth-menuWidth+20, screenHeight / 9 + 20 + butt * 50 
            local mx, my = love.mouse.getPosition()
            local hot = (mx > bx and mx < bx + menuWidth) and (my >by and my < by +50) 
            if hot then
                color = {0.7, 0.7, 0.9}
            end
            button.now = love.mouse.isDown(1)
            if button.now and not button.last and hot then
                button.fn()
            end
            love.graphics.setColor(unpack(color))
            love.graphics.print(button.text, textFont,bx,by )
            butt = butt +1
        end
        love.graphics.setColor(1,1,1)
    end
    love.graphics.print(player.grounded, textFont, 10, 10)
end

function love.keypressed(key)
    if key == 'escape' then
        pause = not pause
    end
    if pause and key == 'return' then
        love.event.quit()
    end
end

function newButton(text, fn)
    return { 
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end
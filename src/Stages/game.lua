game = {}

function game:enter()
    gs.switch(tutorial)
end

function game:update(dt)
    player:update(dt)
    world:update(dt)
    local px, py  = player:getPosition()
    local cx,cy = cam:position()
    if love.keyboard.isDown('w') then
        if cy - py > -30 then 
            cam:move(0,-300*dt)
        end
    elseif love.keyboard.isDown('s') then
        if cy - py < 30 then 
            cam:move(0,300*dt)
        end
    else
        cam:lockPosition(px,py, cam.smooth.damped(8))
    end
    apple:updateAll(dt)
end

function game:draw()
    cam:attach()
        tutorial:draw()
        -- world:draw() 
        player:draw()
    cam:detach()

    -- Initiate Pause Sequence
    if gs.current() == PauseScreen then
        PauseScreen:draw()
    end
end

function game:keypressed(key)
    if key == 'escape' then
        gs.switch(PauseScreen)
    end 
    if key == 'p' then
        player:setX(20)
        player:setY(20)
    end
    if key == 'r' then
        player:setX(20)
        player:setY(505)
    end
    player:keypressed(key)
end

function game:keyrealeased(key)
    player:keyrealeased(key)
end

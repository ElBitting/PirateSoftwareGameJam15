game = {}

function game:enter()
    gs.switch(tutorial)
end

function game:update(dt)
    player:update(dt)
    world:update(dt)
    cam:lookAt(player:getPosition())
    CameraUpdate(dt)
end

function game:draw()
    cam:attach()
        tutorial:draw()
        world:draw()
        apple:draw()
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

function CameraUpdate(dt)
    local px, py  = player:getPosition()
    local cx,cy = cam:position()
    if love.keyboard.isDown('w') and not player.laddered  then
        if cy - py > -GAME_HEIGHT/14 then 
            cam:move(0,-300*dt)
        else cam:lockPosition(px,  py - GAME_HEIGHT/14, cam.smooth.damped(8))
        end
    elseif love.keyboard.isDown('s') and not player.laddered then
        if cy - py < GAME_HEIGHT/14 then 
            cam:move(0,3200*dt)
        else cam:lockPosition(px, py + GAME_HEIGHT/14, cam.smooth.damped(8))
        end
    else
        cam:lockPosition(px,py, cam.smooth.damped(8))
    end
end
game = {}

function game:enter()
    gs.switch(tutorial)
end

function game:update(dt)
    player:update(dt)
    world:update(dt)
    -- cam:lookAt(player:getPosition())
    CameraUpdate(dt)
    tutorial:update(dt)
end

function game:draw()
    cam:attach()
        tutorial:draw()
        -- world:draw()
        player:draw()
    cam:detach()
    love.graphics.setShader(shader)
    gameMap:drawLayer(gameMap.layers['Shader'])
    love.graphics.setShader()

    -- Initiate Pause Sequence
    if gs.current() == PauseScreen then
        PauseScreen:draw()
    end
    if gs.current() == alchemy then
        alchemy:draw()
    end
end

function game:keypressed(key, gamepad)
    if key == 'escape' or (gamepad and key == 'start') then
        gs.push(PauseScreen)
    end 
    if key == 'p' then
        player:setX(20)
        player:setY(20)
    end
    if key == 'r' then
        player:setX(20)
        player:setY(505)
    end
    if (key == '.' or (gamepad and key == 'y')) and player.nearCauldron then
        gs.push(alchemy)
    end
    controls:jumpPressed(key, gamepad)
    -- player:keypressed(key)
end

function game:keyreleased(key, gamepad)
    controls:jumpReleased(key, gamepad)
    -- player:keyrealeased(key)
end



function CameraUpdate(dt)
    local px, py  = player:getPosition()
    local cx,cy = cam:position()
    if controls:checkUpMovement() and not player.laddered  then
        if cy - py > -GAME_HEIGHT/14 then 
            cam:move(0,-300*dt)
        else cam:lockPosition(px,  py - GAME_HEIGHT/14, cam.smooth.damped(8))
        end
    elseif controls:checkDownMovement() and not player.laddered then
        if cy - py < GAME_HEIGHT/14 then 
            cam:move(0,300*dt)
        else cam:lockPosition(px, py + GAME_HEIGHT/14, cam.smooth.damped(8))
        end
    else
        cam:lockPosition(px,py, cam.smooth.damped(8))
    end
end
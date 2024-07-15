game = {}

function game:enter()
    gs.switch(tutorial)
end

function game:update(dt)
    player:update(dt)
    world:update(dt)
    cam:lookAt(player:getPosition())
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
end
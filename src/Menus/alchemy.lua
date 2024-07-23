alchemy = {}

function alchemy:update(dt)
    local px, py = player:getPosition()
    cam:lockPosition(px,py-60, cam.smooth.damped(14))
end

function alchemy:draw()
    love.graphics.setColor(0.2,0.2,0.2,0.5)
    love.graphics.rectangle('fill', 200, 100, 1520,600)
    love.graphics.setColor(1,1,1)
end

function alchemy:keypressed(key, gamepad)
    if key == 'escape' or (gamepad and key == 'b') then 
        gs.pop()
    end
end
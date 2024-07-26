alchemy = {}

function alchemy:load()
    alchemychoice.new(200, 100, 1, 'apple', 'Art/Sprites/Original_sin.png', true)
    alchemychoice.new(200, 100, 2, 'poke', 'Art/Sprites/Original_sin.png', false)
    alchemychoice.new(200, 100, 3, 'Banana', 'Art/Sprites/Original_sin.png', false)
    alchemychoice.new(200, 100, 4, 'Elderberry', 'Art/Sprites/Original_sin.png', false)
    alchemychoice.new(200, 100, 5, 'frog', 'Art/Sprites/Original_sin.png', false)
    alchemychoice.new(200, 100, 6, 'rat tail', 'Art/Sprites/Original_sin.png', false)

    alchemyselected = 1
end

function alchemy:update(dt)
    local px, py = player:getPosition()
    cam:lockPosition(px,py-60, cam.smooth.damped(14))
    alchemychoice:update_all(dt)
end

function alchemy:draw()
    love.graphics.setColor(0.2,0.2,0.2,0.5)
    love.graphics.rectangle('fill', 200, 100, 1520,600)
    love.graphics.setColor(1,1,1)

    alchemychoice:draw_all()
end

function alchemy:keypressed(key, gamepad)
    if key == 'escape' or (gamepad and key == 'b') then 
        gs.pop()
    end
    if key == 'd' then
        if alchemyselected > 3 then 
            alchemyselected = alchemyselected -3
        else 
            alchemyselected  = alchemyselected + 3
        end
    end
    if key == 'a' then
        if alchemyselected < 3 then 
            alchemyselected = alchemyselected +3
        else 
            alchemyselected  = alchemyselected - 3
        end
    end
    if key == 'w' then 
        alchemyselected = alchemyselected -1
        if alchemyselected == 0 then alchemyselected = 6 end
    end
    if key == 's' then 
        alchemyselected = alchemyselected +1
        if alchemyselected == 7 then alchemyselected = 1 end
    end
end
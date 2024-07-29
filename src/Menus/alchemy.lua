alchemy = {}

function alchemy:load()
    alchemychoice.new(200, 100, 1, 'Health Potion', 'Art/Sprites/Vial.png', true, function() safe_quit() end)
    alchemychoice.new(200, 100, 2, 'Swiftness Potion', 'Art/Sprites/Vial_swift.png', false, function() 
        if player.inventory['apple'] == nil then player.inventory['apple'] = 1 
        else player.inventory['apple'] = player.inventory['apple'] + 1 end
    end)
    alchemychoice.new(200, 100, 3, 'Potion of Sight', 'Art/Sprites/Original_sin.png', false, function() end)
    alchemychoice.new(200, 100, 4, 'Potion of Jump', 'Art/Sprites/Vial_jump.png', false, function() end)
    alchemychoice.new(200, 100, 5, 'Potion of Heat Resistance', 'Art/Sprites/Original_sin.png', false, function() end)
    alchemychoice.new(200, 100, 6, 'Potion of Cold Resistance', 'Art/Sprites/Original_sin.png', false, function() end)

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
    if key == 'd' or (gamepad and joystick:isGamepadDown('dpright')) then
        if alchemyselected > 3 then 
            alchemyselected = alchemyselected -3
        else 
            alchemyselected  = alchemyselected + 3
        end
    end
    if key == 'a' or (gamepad and joystick:isGamepadDown('dpleft')) then
        if alchemyselected < 3 then 
            alchemyselected = alchemyselected +3
        else 
            alchemyselected  = alchemyselected - 3
        end
    end
    if key == 'w' or (gamepad and joystick:isGamepadDown('dpup')) then 
        alchemyselected = alchemyselected -1
        if alchemyselected == 0 then alchemyselected = 6 end
    end
    if key == 's' or (gamepad and joystick:isGamepadDown('dpdown')) then 
        alchemyselected = alchemyselected +1
        if alchemyselected == 7 then alchemyselected = 1 end
    end

    alchemychoice:keypressed(key)
end
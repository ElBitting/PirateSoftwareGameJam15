controls = {}
------------ MOVEMENT 4 directional 
function controls:checkLeftMovement()
    if joystick ~= nil then
        return love.keyboard.isDown('a') or joystick:isGamepadDown('dpleft')
    end
    return love.keyboard.isDown('a')
end

function controls:checkRightMovement()
    if joystick ~= nil then
        return love.keyboard.isDown('d') or joystick:isGamepadDown('dpright')
    end
    return love.keyboard.isDown('d')
end

function controls:checkUpMovement()
    if joystick ~= nil then
        return love.keyboard.isDown('w') or joystick:isGamepadDown('dpup')
    end
    return love.keyboard.isDown('w') 
end

function controls:checkDownMovement()
    if joystick ~= nil then
        return love.keyboard.isDown('s') or joystick:isGamepadDown('dpdown')
    end
    return love.keyboard.isDown('s') 
end

-- Used in Vine activity.
function controls:checkActionKey()
    if joystick ~= nil then
        return love.keyboard.isDown('x') or joystick:isGamepadDown('x')
    end
    return love.keyboard.isDown('x')
end

-- Used in pause menu selection
function controls:checkSelectionKey()
    if joystick ~= nill then
        return love.keyboard.isDown('return') or love.mouse.isDown(1) or joystick:isGamepadDown('a')
    end
end

-- JUMP controls for kyb/controller
function controls:jumpPressed(key, gamepad)
    if key == 'space' or (gamepad and key == 'a') then
        player:jumpKeyPressed()
    end
end

function controls:jumpReleased(key, gamepad)
    if key == 'space' or (gamepad and key == 'a') then
        player:jumpKeyReleased()
    end
end

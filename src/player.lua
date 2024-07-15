
player = world:newBSGRectangleCollider(20, 505, 8,13, 2)
player:setCollisionClass("Player")
player:setFixedRotation(true)

image = love.graphics.newImage('Sprites/character/oldHero.png')
Playergrid = anim8.newGrid(16,16, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-5',1), 0.1)

player.speed = 130
player.anim = animation
player.ismoving = false
player.dir = 1
player.grounded = true
local colliderWidth = 2
local colliderHeight = 3
local offsetCollionPlayerFeet = 5

function player:update(dt)
    -- Reset Horizontal velocity
    xNow,yNow = player:getLinearVelocity()
	player:setLinearVelocity(0, yNow)

    -- Check if grounded
    Jump = Timer.after(0.06, function() player.grounded = true end)

    local colliders = world:queryRectangleArea(player:getX()-colliderWidth/2, player:getY()+offsetCollionPlayerFeet, colliderWidth, colliderHeight, {'Platform', 'ThickWalls'})
    if #colliders > 0 then
        Jump = Timer.after(0.06, function() player.grounded = true end)
    else
        Timer.cancel(Jump)
        player.grounded = false
    end
    Timer.update(dt)



    -- Reset Moving
    player.ismoving = false
    
    local px, py = player:getPosition()
    --Basic Movement
    if love.keyboard.isDown('a') then
        player.ismoving = True
        player:setX(px - player.speed*dt)
        player.dir = -1
    elseif love.keyboard.isDown('d') then
        player.ismoving = True
        player:setX(px + player.speed*dt)
        player.dir = 1
    end

    -- local ladder = world:queryRectangleArea(player:getX()-6, player:getY(), 12,5, {'Ladders'})
    -- if #ladder > 0 and love.keyboard.isDown('w') then 
    --     player:setY(py - player.speed*dt)
    -- end
    if player:enter('Ladders') then 
        if love.keyboard.isDown('w') then
            player:setY(py-2*player.speed*dt)
        end
        player:setType('static')
    else 
        player:setType('dynamic')
    end
    


    -- Jumping
    local jumpKeyDown = love.keyboard.isDown('space')
    if jumpKeyDown and player.grounded then
        --honestly no idea why this line fixes a bug, but it does
        player:setLinearVelocity(0, 0)
        -- jump impulse
        player:applyLinearImpulse(0,-55)
    end

    
    --------------------- Collision Logic
    --Check if standing on spikes
    if player:enter('Hazards') then
        player:setX(20)
        player:setY(505)
        -- player = world:newCircleCollider(20, 505, 7)
    end
    if player:enter('TeleDoor') then
        player:setX(487)
        player:setY(200)
    end
    if player:enter('FinalDoor') then
        player:setX(20)
        player:setY(505)
        gs.switch(Credits)
    end

    player:setPreSolve(function(col1, col2, contact)
        if col1.collision_class == 'Player' and col2.collision_class == 'Platform' then
            local px, py = col1:getPosition()
            local pw, ph = 2, 2
            local tx, ty = col2:getPosition()
            local tw, th = 5, 5
            -- contact:setEnabled(false)
            if (py + ph)/2 > (ty - th)/2 then contact:setEnabled(false) end
        end
    end)

    --States For Animations (once we have them)
    local Currentrunning = player.ismoving and player.grounded
    local Currentidle = player.grounded and not player.ismoving
    local CurrentAir = not player.grounded

    player.anim:update(dt)

end

function player:draw()
    local px = player:getX()
    local py = player:getY()

    --scale character by 3
    sx = 1
    sy = 1
    --swap direction for facing left vs right
    if player.dir == -1 then
        sx = -sx
    end

    player.anim:draw(image, px, py, nil, sx, sy,7, 10)
    -- show grounded detection
    -- love.graphics.rectangle('line',px-colliderWidth/2, py+offsetCollionPlayerFeet, colliderWidth, colliderHeight)
    love.graphics.rectangle('line', px-(6), py,12, 2)
end
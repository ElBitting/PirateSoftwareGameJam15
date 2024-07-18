
player = world:newBSGRectangleCollider(20, 505, 8,13, 3)
player:setCollisionClass("Player")
player:setFixedRotation(true)


image = love.graphics.newImage('Art/Sprites/cat2.png')
Playergrid = anim8.newGrid(14,24, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-8',1), 0.15)

player.speed = 130
player.anim = animation
player.ismoving = false
player.dir = 1
player.grounded = true
player.laddered = false
player.x = 0
player.y = 0
player.inventory = {}
player.hasapple = false
local colliderWidth = 2
local colliderHeight = 3
local offsetCollionPlayerFeet = 5

function player:update(dt)
    -- Reset Horizontal velocity
    xNow,yNow = player:getLinearVelocity()
    player:setLinearVelocity(player.x * player.speed, yNow)
    -- player:setLinearVelocity(0, yNow)

    player.x = 0



    --Basic Movement
    local wall = world:queryRectangleArea(player:getX()+4*player.dir, player:getY()+3, 2*player.dir, 2, {'ThickWalls'})
    if love.keyboard.isDown('a') then
        player.ismoving = true
        player.dir = -1
        if #wall == 0 then player.x = -1 end
    elseif love.keyboard.isDown('d')  then
        player.ismoving = true
        player.dir = 1
        if #wall == 0 then player.x = 1 end
    end


    --Ladder and Jumping
    -- Check if grounded
    Jump1 = Timer.after(0.1, function() player.grounded = true end)
    Jump2 = Timer.after(0.1, function() player.laddered = true end)

    local colliders = world:queryRectangleArea(player:getX()-colliderWidth/2, player:getY()+offsetCollionPlayerFeet, colliderWidth, colliderHeight, {'Platform', 'ThickWalls'})
    if #colliders > 0 then
        Jump1 = Timer.after(0.1, function() player.grounded = true end)
    else
        Timer.cancel(Jump1)
        player.grounded = false
    end
    local ladder = world:queryRectangleArea(player:getX()-6, player:getY()+3, 12, 4, {'Ladders'})
    if #ladder > 0  then
        if yNow < 0 then
            player:setGravityScale(1)
        else 
            player:setLinearVelocity(player.x * player.speed, 0)
            player:setGravityScale(0)
        end
        if love.keyboard.isDown('w') then
            player:setY(player:getY() - player.speed*dt)
        elseif love.keyboard.isDown('s') then
            player:setY(player:getY() + player.speed*dt)
        end
        Jump2 = Timer.after(0.1, function() player.laddered = true end)
    else
        player:setGravityScale(1)
        Timer.cancel(Jump2)
        player.laddered = false
    end
    Timer.update(dt)



    -- Jumping
    

    
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
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Vines' then
            contact:setEnabled(false)
            if love.keyboard.isDown('x') then contact:setEnabled(true) end
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Ladders' then
            contact:setEnabled(false)
        end
    end)

    --States For Animations (once we have them)
    local Currentrunning = player.ismoving and player.grounded
    local Currentidle = player.grounded and not player.ismoving
    local CurrentAir = not player.grounded

    player.anim:update(dt)
end

-- Inventory Management 
function player:add_to_inventory(item)
    if item == 'apple' then
        if player.inventory['apple'] == nil then 
            player.inventory['apple'] = 1 
        else 
            player.inventory['apple'] = player.inventory['apple'] + 1 
        end
    player.hasapple = true
    end
end

function player:draw()
    local px = player:getX()
    local py = player:getY()

    --scale character by 1.1
    sx = 1
    sy = 1
    --swap direction for facing left vs right
    if player.dir == -1 then
        sx = -sx
    end

    
    -- show grounded detection
    -- love.graphics.rectangle('line',px-colliderWidth/2, py+offsetCollionPlayerFeet, collid2erWidth, colliderHeight)
    -- love.graphics.rectangle('line', px+(4*player.dir), py-2.5,2*player.dir, 5)

    player.anim:draw(image, px, py, nil, sx, sy,7, 14)

end

function player:keypressed(key)
    if key == 'space' and player.laddered then
        player:setLinearVelocity(0, 0)
        player:applyLinearImpulse(0,-52)
    elseif key == 'space' and player.grounded then
        -- jump impulse
        player:setLinearVelocity(0, 0)
        player:applyLinearImpulse(0,-50)
    end
end

function player:keyrealeased(key)
    if key == 'space' then
        local px, py = player:getLinearVelocity()
        player:setLinearVelocity(px,0)
    end
end
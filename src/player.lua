
player = world:newBSGRectangleCollider(20, 505, 12,13, 3)
player:setCollisionClass("Player")
player:setFixedRotation(true)


image = love.graphics.newImage('Art/Sprites/cat3SpriteSheet.png')
Playergrid = anim8.newGrid(32,32, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-6',1), 0.15)

player.speed = 130
player.jumpspeed = 85
player.anim = animation
player.ismoving = false
player.grounded = true
player.laddered = false
player.x = 0
player.y = 0
player.inventory = {}
player.health = 6

-- player.hasapple = false
local colliderWidth = 6
local colliderHeight = 2
local offsetCollionPlayerFeet = 6

function player:update(dt)
    -- Reset Horizontal velocity
    local xNow,yNow = player:getLinearVelocity()
    player:setLinearVelocity(player.x * player.speed, yNow)
    -- player:setLinearVelocity(0, yNow)

    -- player movement (No friction necessary!)
    if love.keyboard.isDown('a') and not love.keyboard.isDown('d') then 
        player.ismoving = true
        player.x = -1
    elseif love.keyboard.isDown('d') and not love.keyboard.isDown('a') then 
        player.ismoving = true
        player.x = 1
    else
        player.ismoving = false
        player.x = 0
    end


    --Wall detection
    local wall = world:queryRectangleArea(player:getX()+5*player.x, player:getY()-3, 2*player.x, 6, {'ThickWalls'})
    if #wall > 0 then
        player.x = 0
    end



    --Ladder and Jumping

    
    --Grounding
    local colliders = world:queryRectangleArea(player:getX()-colliderWidth/2, player:getY()+offsetCollionPlayerFeet, colliderWidth, colliderHeight, {'Platform', 'ThickWalls'})
    if #colliders > 0 then
        player.grounded = true
    else
        player.grounded = false
    end


    local ladder = world:queryRectangleArea(player:getX()-6, player:getY()+3, 12, 4, {'Ladders'})
    if #ladder > 0  then
        --gravity on ladder
        if yNow < 0 then
            player:setGravityScale(1)
        else 
            player:setLinearVelocity(player.x * player.speed, 0)
            player:setGravityScale(0)
        end

        --climbing and descending ladder
        if love.keyboard.isDown('w') then
            player:setY(player:getY() - player.speed*dt)
        elseif love.keyboard.isDown('s') then
            player:setY(player:getY() + player.speed*dt)
        end

        --set state
        player.laddered = true
    else
        player:setGravityScale(1)
        player.laddered = false
    end

    

    
    --------------------- Collision Logic
    --Check if standing on spikes
    if player:enter('Hazards') then
        player.health = player.health - 2
        if player.health > 0 then 
            player:setLinearVelocity(0, 0)
            player:applyLinearImpulse(0,-player.jumpspeed)
        end
        -- player = world:newCircleCollider(20, 505, 7)
    end
    if player.health == 0 then 
        player:setX(20)
        player:setY(505)
        player.health = 6
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
    if player:enter('Apples') then
        local collided = player:getEnterCollisionData('Apples')
        collided.collider:destroy()
        apple.is_picked_up(collided.collider)
        if player.inventory['apple'] == nil then player.inventory['apple'] = 1 
        else player.inventory['apple'] = player.inventory['apple'] + 1 end
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

function player:draw()
    local px = player:getX()
    local py = player:getY()

    --scale character by 1.1
    local sx = .8
    local sy = .8
    --swap direction for facing left vs right
    if player.x == -1 then
        sx = -sx
    end

    player.anim:draw(image, px, py, nil, sx, sy,16, 24)
end

function player:keypressed(key)
    -- jump logic
    if key == 'space' and (player.grounded or player.laddered) then
        player:setLinearVelocity(0, 0)
        player:applyLinearImpulse(0,-player.jumpspeed)
    end

end

function player:keyrealeased(key)
    -- jump logic
    if key == 'space' then
        local X, Y = player:getLinearVelocity()
        if Y < 0 then
            player:setLinearVelocity(X,0)
        end 
    end
end

player = world:newBSGRectangleCollider(20, 505, 12,13, 3)
player:setCollisionClass("Player")
player:setFixedRotation(true)

image = love.graphics.newImage('Art/Sprites/cat2.png')
Playergrid = anim8.newGrid(14,24, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-8',1), 0.15)

image = love.graphics.newImage('Art/Sprites/cat2.png')
Playergrid = anim8.newGrid(14,24, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-8',1), 0.15)

player.xVel = 0
player.yVel = 0
player.dir = 0
player.anim = animation
player.movement = 0
player.maxSpeed = 200
player.terminal_Velocity = 300
player.acceleration = 9000
player.friction = 3500
player.gravity = 600
player.jumpAmount = -80
player.height = 13
player.width = 18
player.grounded = false
player.laddered = false
player.climbing_top_speed = 120
player.teleported = fals

player.inventory = {}
-- player.hasapple = false
local colliderWidth = 2
local colliderHeight = 3
local offsetCollionPlayerFeet = 5

function player:update(dt)
    -- Reset Horizontal velocity
    local xNow,yNow = player:getLinearVelocity()
    player:setLinearVelocity(player.x * player.speed, yNow)
    -- player:setLinearVelocity(0, yNow)


function player:draw()
    -- local px = player:getX()
    -- local py = player:getY()
    -- -- Local Scale variables for the player sprite
    -- local sx = 1
    -- local sy = 1
    --swap direction for facing left vs right
    -- if player.dir == -1 then
    --     sx = -sx
    -- end

    
    -- show grounded detection
    -- love.graphics.rectangle('line',px-colliderWidth/2, py+offsetCollionPlayerFeet, collid2erWidth, colliderHeight)
    -- love.graphics.rectangle('line', px+(4*player.dir), py-2.5,2*player.dir, 5)

    player.anim:draw(image, player.x, player.y, nil, sx, sy,7, 14)

end

    --Ladder and Jumping
    -- Check if grounded
    local Jump1 = Timer.after(0.1, function() player.grounded = true end)
    local Jump2 = Timer.after(0.1, function() player.laddered = true end)

    if a == player.fixture then
        if b:isSensor() then
            -- check for ladders and check for hazzards...
            for i, instance in ipairs(ladders) do
                print(instance.fixture, b)
                if b == instance.fixture then
                    player.laddered = true
                end
            end
            for i, instance in ipairs(hazards) do
                if b == instance.fixture then
                    player.x = 20
                    player.y = 505
                    player.teleported = true
                    -- player:setPosition(20,505)
                    -- player:setX(20)
                    -- player:setY(505)
                end
            end
            return
        end
        _, by, _, _ = b:getBoundingBox()
        if ny > 0 and by > (player.y + player.height / 2.5)  then
            player:land(b, collision)
        else
            player.yVel = 0
        end
    elseif b == player.fixture then
        if a:isSensor() then 
            return
        end
        _, ay, _, _ = a:getBoundingBox()
        if ny < 0 and (player.y + player.height / 2.5) < ay then
            player:land(a, collision)
        else
            player.yVel = 0
        end
    end
end

function player:land(ground, collision)
    player.currentGround = ground
    player.currentGroundCollision = collision
    player.yVel = 0
    player.grounded = true
end

function player:endContact(a, b, collision)
    if a == player.fixture or b == player.fixture then
        if a == player.fixture then
            if b:isSensor() then
                -- check for ladders and check for hazzards...
                for i, instance in ipairs(ladders) do
                    -- print(instance.fixture, b)
                    if b == instance.fixture then
                        player.laddered = false
                    end
                end
            end
        end
        if player.currentGroundCollision == collision then
            player.grounded = false
        end
    end
end

function player:syncPhysics(dt)
    if player.laddered then 
        player:setLinearVelocity(player.xVel, player.yVel)
    else
        _, player.yVel = player:getLinearVelocity()
        player:setLinearVelocity(player.xVel, player.yVel)
    end
    if player:enter('Apples') then
        local collided = player:getEnterCollisionData('Apples')
        collided.collider:destroy()
        if player.inventory['apple'] == nil then player.inventory['apple'] = 1 
        else player.inventory['apple'] = player.inventory['apple'] + 1 end
    end
end

-- function player:applyGravity(dt)
--     -- print(player.laddered)
--     if not player.grounded and not player.laddered then 
--         player:setGravityScale(1)
--     else
--         player:setGravityScale(0)
--     end
-- end

function player:keypressed(key)
    player:jump(key)
    player:addDirection(key)
end

function player:keyreleased(key)
    player:releaseJump(key)
    player:releaseDirection(key)
end

function player:jump(key)
    if (key == "space" or key == "up") and (player.grounded or player.laddered) then
        player.laddered = false
        player.grounded = false
        player:applyLinearImpulse(0,player.jumpAmount)
    end
end

    --scale character by 1.1
    local sx = 1
    local sy = 1
    --swap direction for facing left vs right
    if player.dir == -1 then
        sx = -sx
    end
end

function player:addDirection(key)
    if key == 'd' or key =='right' then
    player.dir = 1
        if player.movement <1 then 
            player.movement = player.movement +1
        end
    elseif key == 'a' or key =='left' then
    player.dir = -1
        if player.movement >-1 then 
            player.movement = player.movement -1
        end
    end
end

function player:releaseDirection(key)
    if key == 'd' or key =='right' and player.movement >-1 then 
        player.movement = player.movement -1
    elseif key == 'a' or key =='left' and player.movement <1 then 
        player.movement = player.movement +1
    end
end
    player.anim:draw(image, px, py, nil, sx, sy,7, 14)
end

function player:keypressed(key)
    if key == 'space' and player.laddered then
        player:setLinearVelocity(0, 0)
        player:applyLinearImpulse(0,-52)
    elseif key == 'space' and player.grounded then
        -- jump impulse
        player:setLinearVelocity(0, 0)
        player:applyLinearImpulse(0,-85)
    end
end

function player:keyrealeased(key)
    if key == 'space' then
        local X, Y = player:getLinearVelocity()
        if Y < 0 then
            player:setLinearVelocity(X,0)
        end 
    end
end
player = world:newBSGRectangleCollider(20, 505 - 100, 18,13, 3)
player:setCollisionClass("Player")
player:setFixedRotation(true)

player.x = 0
player.y = 0

player.xVel = 0
player.yVel = 0
player.maxSpeed = 200
player.terminal_Velocity = 300
player.acceleration = 4000
player.friction = 3500
player.gravity = 600
player.jumpAmount = -300
player.height = 13
player.width = 18
player.grounded = false
player.laddered = false
player.climbing_top_speed = 120
player.teleported = fals

player.inventory = {}
player.hasapple = false

function player:syncPhysics()
    if player.teleported then
        player:setPosition(player.x, player.y)
        player.teleported = false
    else
        player.x, player.y = player:getPosition()
    end
end

function player:applyGravity(dt)
    if not player.grounded and not player.laddered and player.yVel < player.terminal_Velocity then 
        player.yVel = player.yVel + player.gravity * dt
    end
end

function player:jump(key)
    if (key == "space" or key == "up") and (player.grounded or player.laddered) then
        player.laddered = false
        player.grounded = false
        player:applyLinearImpulse(0,-150)
    end
end

function player:climb(dt)
    if not player.laddered then return end
    if love.keyboard.isDown("f") then
        if player.yVel > -player.climbing_top_speed then
            if player.yVel - player.acceleration * dt > -player.climbing_top_speed then
                player.yVel = player.yVel - player.acceleration * dt
            else 
                player.yVel = -player.climbing_top_speed
            end
        end
    else
        player.yVel = 0
    end
    if love.keyboard.isDown("s") then
        if player.yVel < player.climbing_top_speed then
            if player.yVel + player.acceleration * dt < player.climbing_top_speed then
                player.yVel = player.yVel + player.acceleration * dt
            else 
                player.yVel = player.climbing_top_speed
            end
        end
    end
end

function player:move(dt)
    if love.keyboard.isDown("d", "right") then
        if player.xVel < player.maxSpeed then
            if player.xVel + player.acceleration * dt < player.maxSpeed then
                player.xVel = player.xVel + player.acceleration * dt
            else 
                player.xVel = player.maxSpeed
            end
        end
    end
    if love.keyboard.isDown("a", "left") then
        if player.xVel > -player.maxSpeed then
            if player.xVel - player.acceleration * dt > -player.maxSpeed then
                player.xVel = player.xVel - player.acceleration * dt
            else 
                player.xVel = -player.maxSpeed
            end
        end
    else
        player:applyFriction(dt)
    end
end

function player:applyFriction(dt)
    if player.xVel > 0 then
        if player.xVel - player.friction * dt > 0 then
            player.xVel = player.xVel - player.friction * dt
        else
            player.xVel = 0
        end
    elseif player.xVel < 0 then
        if player.xVel + player.friction * dt < 0 then
            player.xVel = player.xVel + player.friction * dt
        else
            player.xVel = 0
        end
    end
end

function player:update(dt)
    -- player:setGravityScale(0)
    player:syncPhysics()
    player:move(dt)
    player:climb(dt)
    -- player:applyGravity(dt)
    -- player.anim:update(dt)
end

-- Inventory Management 
function player:add_to_inventory(item)
    if item == 'apple' then
        if player.inventory['apple'] == nil then 
            player.inventory['apple'] = 1 
        else 
            player.inventory['apple'] = player.inventory['apple'] + 1 
        end
    end
end

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

    -- player.anim:draw(image, px, py, nil, sx, sy,7, 14)

end
function player:beginContact(a, b, collision)
    if player.grounded == true then return end
    local nx, ny = collision:getNormal()

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
                    -- -- player:setPosition(20,505)
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
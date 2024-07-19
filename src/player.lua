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
player.gravity = 500
player.jumpAmount = -500
player.height = 13
player.width = 18


player.speed = 130
player.anim = animation
player.ismoving = false
player.dir = 1
player.grounded = false
player.laddered = false

player.inventory = {}
player.hasapple = false
local colliderWidth = 2
local colliderHeight = 3
local offsetCollionPlayerFeet = 5

image = love.graphics.newImage('Art/Sprites/cat2.png')
Playergrid = anim8.newGrid(14,24, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-8',1), 0.15)

function player:syncPhysics() 
    player.x, player.y = player:getPosition()
    player:setLinearVelocity(player.xVel, player.yVel)
end
function player:applyGravity(dt)
    print(player.yVel)
    if not player.grounded and player.yVel < player.terminal_Velocity then 
        player.yVel = player.yVel + player.gravity * dt
    end
end

function player:jump(key)
    if (key == "w" or key == "up") and player.grounded then
        player.grounded = false
        player.yVel = player.jumpAmount
    end
end

function player:move(dt)
    if love.keyboard.isDown("d", "right") then
        if player.xVel < player.maxSpeed then
            if player.xVel + player.acceleration * dt < player.maxSpeed then
                player.xVel = player.xVel + player.acceleration * dt
            else 
                self.xVel = self.maxSpeed
            end
        end
    end
    if love.keyboard.isDown("a", "left") then
        if player.xVel > -player.maxSpeed then
            if player.xVel - player.acceleration * dt > -player.maxSpeed then
                player.xVel = player.xVel - player.acceleration * dt
            else 
                self.xVel = -self.maxSpeed
            end
        end
    else
        self:applyFriction(dt)
    end
end

function player:applyFriction(dt)
    if player.xVel > 0 then
        if player.xVel - player.friction * dt > 0 then
            player.xVel = player.xVel - player.friction * dt
        else
            self.xVel = 0
        end
    elseif player.xVel < 0 then
        if player.xVel + player.friction * dt < 0 then
            player.xVel = player.xVel + player.friction * dt
        else
            self.xVel = 0
        end
    end
end

function player:update(dt)
    player:syncPhysics()
    player:move(dt)
    player:applyGravity(dt)
    -- -- Reset Horizontal velocity
    -- local xNow,yNow = player:getLinearVelocity()
    -- player:setLinearVelocity(player.x * player.speed, yNow)
    -- -- player:setLinearVelocity(0, yNow)

    -- player.x = 0



    -- --Basic Movement
    -- local wall = world:queryRectangleArea(player:getX()+4*player.dir, player:getY()+3, 2*player.dir, 2, {'ThickWalls'})
    -- if love.keyboard.isDown('a') then
    --     player.ismoving = true
    --     player.dir = -1
    --     if #wall == 0 then player.x = -1 end
    -- elseif love.keyboard.isDown('d')  then
    --     player.ismoving = true
    --     player.dir = 1
    --     if #wall == 0 then player.x = 1 end
    -- end


    -- --Ladder and Jumping
    -- -- Check if grounded
    -- local Jump1 = Timer.after(0.1, function() player.grounded = true end)
    -- local Jump2 = Timer.after(0.1, function() player.laddered = true end)

    -- local colliders = world:queryRectangleArea(player:getX()-colliderWidth/2, player:getY()+offsetCollionPlayerFeet, colliderWidth, colliderHeight, {'Platform', 'ThickWalls'})
    -- if #colliders > 0 then
    --     Jump1 = Timer.after(0.1, function() player.grounded = true end)
    -- else
    --     Timer.cancel(Jump1)
    --     player.grounded = false
    -- end
    -- local ladder = world:queryRectangleArea(player:getX()-6, player:getY()+3, 12, 4, {'Ladders'})
    -- if #ladder > 0  then
    --     if yNow < 0 then
    --         player:setGravityScale(1)
    --     else 
    --         player:setLinearVelocity(player.x * player.speed, 0)
    --         player:setGravityScale(0)
    --     end
    --     if love.keyboard.isDown('w') then
    --         player:setY(player:getY() - player.speed*dt)
    --     elseif love.keyboard.isDown('s') then
    --         player:setY(player:getY() + player.speed*dt)
    --     end
    --     Jump2 = Timer.after(0.1, function() player.laddered = true end)
    -- else
    --     player:setGravityScale(1)
    --     Timer.cancel(Jump2)
    --     player.laddered = false
    -- end
    -- Timer.update(dt)



    -- Jumping
    

    
    -- --------------------- Collision Logic
    -- --Check if standing on spikes
    -- if player:enter('Hazards') then
    --     player:setX(20)
    --     player:setY(505)
    --     -- player = world:newCircleCollider(20, 505, 7)
    -- end
    -- if player:enter('TeleDoor') then
    --     player:setX(487)
    --     player:setY(200)
    -- end
    -- if player:enter('FinalDoor') then
    --     player:setX(20)
    --     player:setY(505)
    --     gs.switch(Credits)
    -- end

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

    -- --States For Animations (once we have them)
    -- local Currentrunning = player.ismoving and player.grounded
    -- local Currentidle = player.grounded and not player.ismoving
    -- local CurrentAir = not player.grounded

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
    player.hasapple = true
    end
end

function player:draw()
    local px = player:getX()
    local py = player:getY()
    -- Local Scale variables for the player sprite
    local sx = 1
    local sy = 1
    --swap direction for facing left vs right
    if player.dir == -1 then
        sx = -sx
    end

    
    -- show grounded detection
    -- love.graphics.rectangle('line',px-colliderWidth/2, py+offsetCollionPlayerFeet, collid2erWidth, colliderHeight)
    -- love.graphics.rectangle('line', px+(4*player.dir), py-2.5,2*player.dir, 5)

    -- player.anim:draw(image, px, py, nil, sx, sy,7, 14)

end

-- function player:keypressed(key)
--     if key == 'space' and player.laddered then
--         player:setLinearVelocity(0, 0)
--         player:applyLinearImpulse(0,-152)
--     elseif key == 'space' and player.grounded then
--         -- jump impulse
--         player:setLinearVelocity(0, 0)
--         player:applyLinearImpulse(0,-150)
--     end
-- end

-- function player:keyrealeased(key)
--     if key == 'space' then
--         local X, Y = player:getLinearVelocity()
--         if Y < 0 then
--             player:setLinearVelocity(X,0)
--         end
--     end
-- end

function player:beginContact(a, b, collision)
    if player.grounded == true then return end
    local nx, ny = collision:getNormal()

    if a == player.fixture then
        if b:isSensor() then return end
        _, by, _, _ = b:getBoundingBox()
        if ny > 0 and by > (player.y + player.height / 2.5)  then
            player:land(b, collision)
        else
            player.yVel = 0
        end
    elseif b == player.fixture then
        if a:isSensor() then return end
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
        if player.currentGroundCollision == collision then
            player.grounded = false
        end
    end
end
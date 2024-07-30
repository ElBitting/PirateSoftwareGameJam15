
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
player.nearCauldron = false
player.x = 0
player.y = 0
player.inventory = {}
player.health = 6
player.inventory['apple'] = 0
player.inventory['elderberry'] = 0
player.inventory['cricket'] = 0
player.inventory['poke'] = 0
player.inventory['health'] = 0
player.inventory['speed'] = 0
player.inventory['jump'] = 0
player.jumpActive = false
player.speedActive = false

-- player.hasapple = false
local colliderWidth = 6
local colliderHeight = 2
local offsetCollionPlayerFeet = 6
local xNow, yNow = 0, 0



function player:update(dt)
    -- Reset Horizontal velocity
    xNow,yNow = player:getLinearVelocity()
    player:initializations(dt)
    player:movement(dt)
    player:detectections(dt)
    player:ladders(dt)
    player:interactions(dt)
    player:animations(dt)
    player:potions(dt)
    Timer.update(dt)

    
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
            if controls:checkActionKey() then contact:setEnabled(true) end
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Ladders' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Cauldron' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Hazards' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Apples' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Crickets' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Elderberries' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Player' and col2.collision_class == 'Poke' then
            contact:setEnabled(false)
        end
    end)
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



function player:initializations(dt)
    player:setLinearVelocity(player.x * player.speed, yNow)
    if player.health == 0 then 
        player:setX(20)
        player:setY(505)
        player.health = 6
    end
end



function player:movement(dt)
    if controls:checkLeftMovement() and not controls:checkRightMovement() then 
        player.ismoving = true
        player.x = -1
    elseif controls:checkRightMovement() and not controls:checkLeftMovement() then 
        player.ismoving = true
        player.x = 1
    else
        player.ismoving = false
        player.x = 0
    end

    --climbing and descending ladder
    if player.laddered and controls:checkUpMovement() then
        player:setY(player:getY() - player.speed*dt)
    elseif player.laddered and controls:checkDownMovement() then
        player:setY(player:getY() + player.speed*dt)
    end
end



function player:jumpKeyPressed()
    if (player.grounded or player.laddered) then
        player:setLinearVelocity(0, 0)
        player:applyLinearImpulse(0,-player.jumpspeed)
    end
end



function player:jumpKeyReleased()
    local X, Y = player:getLinearVelocity()
    if Y < 0 then
        player:setLinearVelocity(X,0)
    end 
end

function player:healthPotion()
    if player.health == 6 then return
    elseif player.health == 5 then 
        player.health = 6
        player.inventory['health'] = player.inventory['health'] - 1
    else
        player.health = player.health + 2
        player.inventory['health'] = player.inventory['health'] - 1
    end
end

function player:speedPotion()
    player.inventory['speed'] = player.inventory['speed'] - 1
    player.speedActive = true
end

function player:jumpPotion()
    player.inventory['jump'] = player.inventory['jump'] - 1
    player.jumpActive = true
end

function player:detectections(dt)
    -- Walls
    local wall = world:queryRectangleArea(player:getX()+5*player.x, player:getY()-3, 2*player.x, 6, {'ThickWalls'})
    if #wall > 0 then
        player.x = 0
    end
    -- Cauldrons
    -- world:setQueryDebugDrawing(true)
    local cauldrons = world:queryRectangleArea(player:getX()-16, player:getY()-3, 32, 6, {'Cauldron'})
    -- world:setQueryDebugDrawing(false)
    if #cauldrons > 0 then 
        player.nearCauldron = true
    else
        player.nearCauldron = false
    end

    --Ground
    local colliders = world:queryRectangleArea(player:getX()-colliderWidth/2, player:getY()+offsetCollionPlayerFeet, colliderWidth, colliderHeight, {'Platform', 'ThickWalls'})
    if #colliders > 0 then
        player.grounded = true
    else
        player.grounded = false
    end

    local ladder = world:queryRectangleArea(player:getX()-6, player:getY()+3, 12, 4, {'Ladders'})
    if #ladder > 0  then
        player.laddered = true
    else
        player.laddered = false
    end
end

function player:potions(dt)
    if player.jumpActive then 
        player.jumpspeed = 120
        jumpTimer = Timer.after(10, function() player.jumpspeed = 85 player.jumpActive = false end)
    end
    if player.speedActive then 
        player.speed = 250
        speedTimer = Timer.after(10, function() player.speed = 130 player.speedActive = false end)
    end
end



function player:ladders(dt)
    if player.laddered then 
        if yNow < 0 then
            player:setGravityScale(1)
        else 
            player:setLinearVelocity(player.x * player.speed, 0)
            player:setGravityScale(0)
        end
    else
        player:setGravityScale(1)
    end
end


function player:interactions(dt)
    --Hazards
    if player:enter('Hazards') then
        player:setLinearVelocity(0, yNow/100)
        player:applyLinearImpulse(0,-3)
        player.health = player.health - 1
        SpikeDMG = Timer.every(1, function() 
            player:setLinearVelocity(0, 0)
            player:applyLinearImpulse(0,-20)
            player.health = player.health -1
        end)
    end
    if player:exit('Hazards') then
        Timer.cancel(SpikeDMG)
    end

    --Doors
    if player:enter('TeleDoor') then
        player:setX(487)
        player:setY(200)
    end
    if player:enter('FinalDoor') then
        player:setX(20)
        player:setY(505)
        gs.switch(Credits)
    end

    --Apples
    if player:enter('Apples') then
        local collided = player:getEnterCollisionData('Apples')
        -- collided.collider:destroy()
        apple.is_picked_up(collided.collider)
        player.inventory['apple'] = player.inventory['apple'] + 1
    end

    if player:enter('Crickets') then
        local collided = player:getEnterCollisionData('Crickets')
        -- collided.collider:destroy()
        Crickets.is_picked_up(collided.collider)
        player.inventory['cricket'] = player.inventory['cricket'] + 1
    end

    if player:enter('Elderberries') then
        local collided = player:getEnterCollisionData('Elderberries')
        -- collided.collider:destroy()
        Elderberries.is_picked_up(collided.collider)
        player.inventory['elderberry'] = player.inventory['elderberry'] + 1
    end

    if player:enter('Poke') then
        local collided = player:getEnterCollisionData('Poke')
        -- collided.collider:destroy()
        Poke.is_picked_up(collided.collider)
        player.inventory['poke'] = player.inventory['poke'] + 1
    end
    

    if player:enter('Vines') then
        local collided = player:getEnterCollisionData('Vines')
        if controls:checkActionKey() then 
            latch(collided.collider)
        else
            delatch()
        end
    end
    if player:exit('Vines') then 
        delatch()
    end
end



function player:animations(dt)
    --States For Animations (once we have them)
    local Currentrunning = player.ismoving and player.grounded
    local Currentidle = player.grounded and not player.ismoving
    local CurrentAir = not player.grounded

    player.anim:update(dt)
end

function player.reset() 
    player.inventory = {}
    player.health = 6
    player.inventory['apple'] = 0
    player.inventory['elderberry'] = 0
    player.inventory['cricket'] = 0
    player.inventory['poke'] = 0
    player.inventory['health'] = 0
    player.inventory['speed'] = 0
    player.inventory['jump'] = 0

    player:setX(20)
    player:setY(505
)
end
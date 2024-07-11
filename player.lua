player = world:newCircleCollider(20, 505, 7)
player:setCollisionClass("Player")

image = love.graphics.newImage('Sprites/character/oldHero.png')
Playergrid = anim8.newGrid(16,16, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-5',1), 0.1)

player.speed = 200
player.anim = animation
player.ismoving = False
player.dir = 1
player.grounded = 'Ugggga'
local colliderWidth = 2
local colliderHeight = 3
offsetCollionPlayerFeet = 6

function player:update(dt)
    -- Reset Horizontal velocity
    xNow,yNow = player:getLinearVelocity()
	player:setLinearVelocity(0, yNow)

    -- Check if grounded
    if player.body then
        local colliders = world:queryRectangleArea(player:getX()-colliderWidth/2, player:getY()+offsetCollionPlayerFeet, colliderWidth, colliderHeight, {'Platform'})
        if #colliders > 0 then
            player.grounded = 'True'
        else
            player.grounded = 'False'
        end
        -- Reset Moving
        player.ismoving = False
        
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
        -- Jumping
        local jumpKeyDown = love.keyboard.isDown('w') or love.keyboard.isDown('space')
        if jumpKeyDown and player.grounded == 'True' then
            --honestly no idea why this line fixes a bug, but it does
            player:setLinearVelocity(0, 0)
            -- jump impulse
            player:applyLinearImpulse(0,-85)
        end
    end

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

    player.anim:draw(image, px, py, nil, sx, sy,7, 9)
    -- show grounded detection
    --love.graphics.rectangle('line',px-colliderWidth/2, py+offsetCollionPlayerFeet, colliderWidth, colliderHeight)
end
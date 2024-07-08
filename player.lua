player = world:newCircleCollider(400, 100, 16)
player:setCollisionClass("Player")

image = love.graphics.newImage('Sprites/character/oldHero.png')
Playergrid = anim8.newGrid(16,16, image: getWidth(), image:getHeight())
animation = anim8.newAnimation(Playergrid('1-5',1), 0.1)

player.speed = 200
player.anim = animation
player.ismoving = False
player.dir = 1
player.grounded = 'Ugga'

function player:update(dt)
    if player.body then
        local colliders = world:queryRectangleArea(player:getX() - 10, player:getY() +2, 40, 15, {'Platform'})
        if #colliders > 0 then
            player.grounded = 'True'
        else
            player.grounded = 'False'
        end
    
        player.ismoving = False
        
        local px, py = player:getPosition()
        if love.keyboard.isDown('a') then
            player.ismoving = True
            player:setX(px - player.speed*dt)
            player.dir = -1
        elseif love.keyboard.isDown('d') then
            player.ismoving = True
            player:setX(px + player.speed*dt)
            player.dir = 1
        end
        if love.keyboard.isDown('w') and player.grounded == 'True' then
            player:applyLinearImpulse(0,-500)
        end
    end

    local Currentrunning = player.ismoving and player.grounded
    local Currentidle = player.grounded and not player.ismoving
    local CurrentAir = not player.grounded

    player.anim:update(dt)

end

function player:draw()
    local px = player:getX()
    local py = player:getY()

    sx = 3
    sy = 3
    if player.dir == -1 then
        sx = -sx
    end

    player.anim:draw(image, px, py-30, nil, sx, sy)
    love.graphics.print(player.grounded, 10, 10)
end
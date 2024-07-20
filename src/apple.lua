apple = {}
apple[1] = world:newCircleCollider(270, 200, 8)
apple[2] = world:newCircleCollider(220, 200, 8)
apple[1]:setCollisionClass("Apples")
apple[2]:setCollisionClass("Apples")

function apple:draw()
    love.graphics.draw(love.graphics.newImage('Art/Sprites/Original_sin.png'), 254, 184, nil, 1, 1)
    love.graphics.draw(love.graphics.newImage('Art/Sprites/Original_sin.png'), 204, 184, nil, 1, 1)

end
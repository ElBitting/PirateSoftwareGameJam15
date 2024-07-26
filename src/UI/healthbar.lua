healthbar = {}
healthbar.__index = healthbar
healthbars = {}

healthbar.fullHealth = love.graphics.newImage('Art/Sprites/Vial.png')
healthbar.halfHealth = love.graphics.newImage('Art/Sprites/Vial_kracked.png')

function healthbar:draw()
    local sx, sy = 3, 3
    if player.health >= 2 then
        love.graphics.draw(healthbar.fullHealth, 0, 0, 0, sx,sy, -5, -5)
        if player.health >= 4 then
            love.graphics.draw(healthbar.fullHealth, 0, 0, 0, sx,sy, -32-5, -5)
            if player.health >= 6 then
                love.graphics.draw(healthbar.fullHealth, 0, 0, 0, sx,sy, -64 - 5, -5)
            elseif player.health >= 5 then
                love.graphics.draw(healthbar.halfHealth, 0, 0, 0, sx,sy, -64 - 5, -5)
            end
        elseif player.health >= 3 then
            love.graphics.draw(healthbar.halfHealth, 0, 0, 0, sx,sy, -32-5, -5)
        end
    else
        love.graphics.draw(healthbar.halfHealth, 0, 0, 0, sx,sy, -5, -5)
    end
end

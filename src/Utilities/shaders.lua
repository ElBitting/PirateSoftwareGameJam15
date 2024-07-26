shaders = {}
shader = love.graphics.newShader[[
    extern number playerX = 0;
    extern number playerY = 0;

    number radius = 900;
    vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ) {
        number distance = pow(pow(screen_coords.x - playerX, 2) + pow(screen_coords.y - playerY, 2), 0.5);
        number alpha = distance / radius;
        return vec4(0, 0, 0, alpha);
    }
]]

function shaders:update(dt)
    shader:send('playerX', (GAME_WIDTH/2))
    shader:send('playerY', (GAME_HEIGHT/2))
end

function shaders:draw()
    love.graphics.setShader(shader)
    love.graphics.rectangle("fill", -10, -10, 10000, 10000)
    love.graphics.setShader()
end
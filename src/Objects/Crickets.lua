Crickets = {}
Crickets.__index  = Crickets
active_crickets = {}


function Crickets.new(x, y)
    local instance = setmetatable({}, Crickets)
    instance.x = x
    instance.y = y
    instance.img = love.graphics.newImage('Art/Sprites/criket.png')
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.isDestroyed = false
    instance.bod = world:newCircleCollider(x, y, instance.width/2)
    instance.bod:setCollisionClass('Crickets')
    instance.bod:setType('static')

    table.insert(active_crickets, instance)
end

function Crickets.reset()
    for i, instance in ipairs(active_crickets) do
        instance.bod.body:destroy()
    end
    active_crickets = {}
end

function Crickets:update(dt)
end

function Crickets:draw()
    if self.is_full then return end
    love.graphics.draw(self.img, self.x, self.y, 0, 0.5, 0.5, self.width/2, self.height/2 -5)
end

function Crickets:update_all(dt) 
    for i, instance in ipairs(active_crickets) do
        instance:update(dt)
    end
end

function Crickets:draw_all()
    for i, instance in ipairs(active_crickets) do
        instance:draw()
    end
end
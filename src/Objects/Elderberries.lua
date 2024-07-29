Elderberries = {}
Elderberries.__index  = Elderberries
active_elderberries = {}


function Elderberries.new(x, y)
    local instance = setmetatable({}, Elderberries)
    instance.x = x
    instance.y = y
    instance.img_full = love.graphics.newImage('Art/Sprites/elderberry_shrub_full.png')
    instance.img_empty = love.graphics.newImage('Art/Sprites/elderberry_shrub.png')
    instance.width = instance.img_empty:getWidth()
    instance.height = instance.img_empty:getHeight()
    instance.is_full = true
    instance.bod = world:newCircleCollider(x, y, instance.width/2)
    instance.bod:setCollisionClass('Elderberries')
    instance.bod:setType('static')

    table.insert(active_elderberries, instance)
end

function Elderberries.reset()
    for i, instance in ipairs(active_elderberries) do
        instance.bod.body:destroy()
    end
    active_elderberries = {}
end

function Elderberries:update(dt)
end

function Elderberries:draw()
    if self.is_full then
        love.graphics.draw(self.img_full, self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
    else
        love.graphics.draw(self.img_empty, self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
    end
end

function Elderberries:update_all(dt) 
    for i, instance in ipairs(active_elderberries) do
        instance:update(dt)
    end
end

function Elderberries:draw_all()
    for i, instance in ipairs(active_elderberries) do
        instance:draw()
    end
end
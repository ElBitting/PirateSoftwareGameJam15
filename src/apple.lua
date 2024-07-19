apple = {}
apple.__index = apple
active_apples = {} 

function apple.new(x,y)
    local instance = setmetatable({}, apple)
    instance.x = x
    instance.y = y
    instance.img = love.graphics.newImage('Art/Sprites/Original_sin.png')
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.randomTimeOffset = math.random(0, 100)
    instance.bod = world:newCircleCollider(x, y, instance.width/2)
    instance.bod:setType('static')
    instance.bod:setSensor(true)
    instance.toBeRemoved = false
    table.insert(active_apples, instance)
end

function apple:update(dt)
    self:hover(dt)
    self:checkRemove()
end

function apple:updateAll(dt)
    for i, instance in ipairs(active_apples) do
        instance:update(dt)
    end
end 

function apple:hover(dt)
    self.height = self.height + math.sin(self.randomTimeOffset + love.timer.getTime() * 4) * 0.1
end

function apple:drawAll()
    for i, instance in ipairs(active_apples) do
        instance:draw()
    end
end

function apple:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
end

function apple:remove()
    for i, v in ipairs(active_apples) do
        if v == self then
            v.bod.body:destroy()
            table.remove(active_apples, i)
        end
    end
end

function apple:checkRemove()
    if self.toBeRemoved then
        self:remove()
    end 
end

function apple:beginContact(a, b, collision)
    for i, instance in ipairs(active_apples) do
        if a == instance.bod.fixture or b == instance.bod.fixture then
            if a == player.fixture or b == player.fixture then
                instance.toBeRemoved = true
                player:add_to_inventory('apple')
                return true
            end
        end
    end
end
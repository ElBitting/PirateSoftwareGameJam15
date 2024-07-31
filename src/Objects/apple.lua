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
    instance.randomTimeOffset = math.random(0, 100) -- used to make apples hover at different times
    instance.bod = world:newCircleCollider(x, y, instance.width/3.1415)
    instance.bod:setCollisionClass("Apples")
    instance.bod:setType('static')
    instance.isDestroyed = false
    table.insert(active_apples, instance)
end
function apple.reset()
    for i, instance in ipairs(active_apples) do
        instance.bod.body:destroy()
    end
    active_apples = {}
end
    
function apple:update(dt)
    self:hover(dt)
end

function apple:draw()
    if self.isDestroyed then return end
    love.graphics.draw(self.img, self.x, self.y, 0, 1, 1, self.width/2, self.height/2)
end

function apple:hover(dt)
    self.height = self.height + math.sin(self.randomTimeOffset + love.timer.getTime() * 4) * 0.1
end

function apple:update_all(dt) 
    for i, instance in ipairs(active_apples) do
        instance:update(dt)
    end
end

function apple:draw_all()
    for i, instance in ipairs(active_apples) do
        instance:draw()
    end
end

 -- Loops through all apple objects to find which collider was touched and marks it as such, so that it dissappears.
function apple.is_picked_up(collider)
    for i, instance in ipairs(active_apples) do
        if instance.bod == collider then
            instance.isDestroyed = true
            instance.bod:setSensor(true)
        end
    end
end
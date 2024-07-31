Poke = {}
Poke.__index  = Poke
active_poke = {}


function Poke.new(x, y)
    local instance = setmetatable({}, Poke)
    instance.x = x
    instance.y = y
    instance.img = love.graphics.newImage('Art/Sprites/Poke.png')
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.randomTimeOffset = math.random(0, 100)
    instance.isDestroyed = false
    instance.bod = world:newCircleCollider(x, y, instance.width/3.1415)
    instance.bod:setCollisionClass('Poke')
    instance.bod:setType('static')

    table.insert(active_poke, instance)
end

function Poke.reset()
    for i, instance in ipairs(active_poke) do
        instance.bod.body:destroy()
    end
    active_poke = {}
end

function Poke:update(dt)
    self:hover(dt)
end

function Poke:hover(dt)
    self.height = self.height + math.sin(self.randomTimeOffset+ love.timer.getTime() * 4) * 0.1
end

function Poke:draw()
    if self.isDestroyed then return end
    love.graphics.draw(self.img, self.x, self.y-6, 0, 0.5, 0.5, self.width/2, self.height/2 -5)
end

function Poke:update_all(dt) 
    for i, instance in ipairs(active_poke) do
        instance:update(dt)
    end
end

function Poke:draw_all()
    for i, instance in ipairs(active_poke) do
        instance:draw()
    end
end

function Poke.is_picked_up(collider)
    for i, instance in ipairs(active_poke) do
        if instance.bod == collider then
            instance.isDestroyed = true
            instance.bod:setSensor(true)
        end
    end
end
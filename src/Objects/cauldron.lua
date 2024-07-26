cauldron = {}
cauldron.__index = cauldron
active_cauldron = {}

function cauldron.new(x, y)
    local instance = setmetatable({}, cauldron)
    instance.x = x
    instance.y = y
    instance.img = love.graphics.newImage('Art/Sprites/potSpriteSheet.png')
    instance.width = 32
    instance.height = 32
    instance.bod = world:newRectangleCollider(instance.x-instance.width/2, instance.y-instance.height/2, instance.width, instance.height)
    instance.bod:setType('static')
    print(instance.x, instance.y)
    instance.bod:setCollisionClass("Cauldron")
    instance.img_grid = anim8.newGrid(32,32, instance.img:getWidth(), instance.img:getHeight())
    instance.anim = anim8.newAnimation(instance.img_grid('1-4', 1), 0.15)
    table.insert(active_cauldron, instance)
end

function cauldron.reset()
    for i, instance in ipairs(active_cauldron) do 
        instance.bod.body:destroy()
    end
    active_cauldron = {}
end

function cauldron:update(dt)
    self.anim:update(dt)
end

function cauldron:draw()
    self.anim:draw(calimg, self.x, self.y, nil, 1, 1, self.width/2, self.height/2)
end

function cauldron:update_all(dt)
    for i, instance in ipairs(active_cauldron) do
        instance:update(dt)
    end
end

function cauldron:draw_all()
    for i, instance in ipairs(active_cauldron) do
        instance:draw()
    end
end
Shadow = {}
Shadow.__index  = Shadow
Shadow.speed = 80
active_Shadow = {}


function Shadow.new(x, y)
    local instance = setmetatable({}, Shadow)
    instance.x = x
    instance.y = y
    instance.img = love.graphics.newImage('Art/Sprites/criket.png')
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.isDestroyed = false
    instance.xdir = 1
    instance.bod = world:newCircleCollider(x, y, instance.width/2)
    instance.bod:setCollisionClass('Shadow')
    instance.bod:setType('static')

    table.insert(active_Shadow, instance)
end

function Shadow.reset()
    for i, instance in ipairs(active_Shadow) do
        instance.bod.boxdy:destroy()
    end
    active_Shadow = {}
end

function Shadow:update(dt)
    self.bod.body:setLinearVelocity(Shadow.speed * self.xdir, 0) 

    local wall = world:queryRectangleArea(self.bod:getX()+5*self.xdir, self.bod:getY()-3, 2*self.xdir, 6, {'EnemyWalls'})
    if #wall > 0 then
        self.xdir = -self.xdir
    end

    self.bod:setPreSolve(function(col1, col2, contact)
        if col1.collision_class == 'Shadow' and col2.collision_class == 'Cauldron' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Shadow' and col2.collision_class == 'Hazards' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Shadow' and col2.collision_class == 'Apples' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Shadow' and col2.collision_class == 'Crickets' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Shadow' and col2.collision_class == 'Elderberries' then
            contact:setEnabled(false)
        elseif col1.collision_class == 'Shadow' and col2.collision_class == 'Poke' then
            contact:setEnabled(false)
        end
    end)
end

function Shadow:draw()
    if self.isDestroyed then return end
    love.graphics.draw(self.img, self.x, self.y, 0, 0.5, 0.5, self.width/2, self.height/2 -5)
end

function Shadow:update_all(dt) 
    for i, instance in ipairs(active_Shadow) do
        instance:update(dt)
    end
end

function Shadow:draw_all()
    for i, instance in ipairs(active_Shadow) do
        instance:draw()
    end
end
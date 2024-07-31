Shadow = {}
Shadow.__index  = Shadow
Shadow.speed = 80
active_Shadow = {}


function Shadow.new(x, y)
    local instance = setmetatable({}, Shadow)
    instance.x = x
    instance.y = y
    instance.img = love.graphics.newImage('Art/Sprites/Shadow_cat.png')
    instance.width = instance.img:getWidth()
    instance.height = instance.img:getHeight()
    instance.isDestroyed = false
    instance.xdir = 1
    instance.bod = world:newCircleCollider(x, y, instance.width/(3*6.823))
    instance.bod:setCollisionClass('Shadow')

    instance.img_grid = anim8.newGrid(14,24, instance.img:getWidth(), instance.img:getHeight())
    instance.anim = anim8.newAnimation(instance.img_grid('1-8', 1), 0.15)
    table.insert(active_Shadow, instance)
end

function Shadow.reset()
    for i, instance in ipairs(active_Shadow) do
        instance.bod.body:destroy()
    end
    active_Shadow = {}
end

function Shadow:update(dt)
    self.bod.body:setLinearVelocity(Shadow.speed * self.xdir,5)



    local wall = world:queryRectangleArea(self.bod:getX()+5*self.xdir, self.bod:getY()-3, 2*self.xdir, 6, {'EnemyWall'})
    
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
    self.anim:update(dt)
end

function Shadow:draw()
    if self.isDestroyed then return end
    -- love.graphics.draw(self.img, self.bod.body:getX(), self.bod.body:getY(), 0, 0.5, 0.5, self.width/2, self.height/2 -5)
    self.anim:draw(self.img, self.bod.body:getX()+8, self.bod.body:getY()-5, nil, 1, 1, self.width/9, self.height/2)
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
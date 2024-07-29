alchemychoice = {}
alchemychoice.__index = alchemychoice
choice_list = {}

function alchemychoice.new(x, y, count, title, imgsrc, selected, fnc)
    local instance = setmetatable({}, alchemychoice)
    instance.height = 175
    instance.width = 730
    instance.count = count
    if count < 4 then 
        instance.x = (x + 20)
        instance.y = (y + 10) + (instance.height + 25) * (count - 1)
    else
        instance.x = (x + 20) + (instance.width + 25)
        instance.y = (y + 10) + (instance.height + 25) * (count - 4)
    end
    
    instance.title = title
    instance.imgsrc = imgsrc
    instance.img = love.graphics.newImage(imgsrc)
    instance.selected = selected
    instance.fnc = fnc

    table.insert(choice_list, instance)
end

function alchemychoice:draw()
    if self.selected then
        love.graphics.setColor(0.3,0.3,0.3,1)
    else
        love.graphics.setColor(0.25, 0.25, 0.25,1) 
    end

    love.graphics.rectangle('fill', self.x , self.y, self.width,self.height, 10, 10)
    love.graphics.setColor(1,1,1)
    
    love.graphics.print(self.title, self.x+self.width/2 - 15, self.y )
    love.graphics.draw(self.img, self.x, self.y, 0, 6, 6, -5, -5)
end

function alchemychoice:update(dt)
    if alchemyselected == self.count then
        self.selected = true
    else
        self.selected = false
    end
end

function alchemychoice:draw_all()
    for i, instance in ipairs(choice_list) do
        instance:draw()
    end
end

function alchemychoice:update_all(dt)
    for i, instance in ipairs(choice_list) do
        instance:update(dt)
    end
end

function alchemychoice:keypressed(key)
    if key == 'return' then 
        for i, instance in ipairs(choice_list) do
            if instance.selected then 
                instance.fnc()
            end
        end
    end
end
function add_col_classes(world)
    world:addCollisionClass('Player')
    
    world:addCollisionClass('Platform')
    world:addCollisionClass('Hazards')
    world:addCollisionClass('TeleDoor')
    world:addCollisionClass('FinalDoor')
    world:addCollisionClass('Ladders')
    world:addCollisionClass('ThickWalls')
    world:addCollisionClass('Vines')
    world:addCollisionClass('Apples')
    
end

function newButton(text, fn)
    return { 
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

function add_col_class_obj(list, collision_class, layer_name, static_flag, vine_flag, sensor_flag)
    if gameMap.layers[layer_name] then
        local PrevofName = {}
        for i, obj in pairs(gameMap.layers[layer_name].objects) do
            local col = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            col:setCollisionClass(collision_class)
            if static_flag then
                col:setType('static')
            end
            if vine_flag then
                if PrevofName[obj.name]~= nil then
                    joint = world:addJoint('RevoluteJoint', PrevofName[obj.name], col, obj.x +obj.width/2, obj.y-obj.height/5, true)
                else
                    col:setType('static')
                end
            end
            col:setSensor(sensor_flag)
            PrevofName[obj.name] = col
            table.insert(list, col)
        end
    end
end



function safe_quit()
    world:destroy()
    love.event.quit()
end
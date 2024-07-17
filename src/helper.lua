function add_col_classes(world)
    world:addCollisionClass('Player')
    
    world:addCollisionClass('Platform')
    world:addCollisionClass('Hazards')
    world:addCollisionClass('TeleDoor')
    world:addCollisionClass('FinalDoor')
    world:addCollisionClass('Ladders')
    world:addCollisionClass('ThickWalls')
    world:addCollisionClass('Vines')
    
end

function newButton(text, fn)
    return { 
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

function add_col_class_obj(list, collision_class, layer_name, static_flag, vine_flag)
    if vine_flag then 
        if gameMap.layers[layer_name] then
            for i, obj in pairs(gameMap.layers[layer_name].objects) do
                local col = world:newBSGRectangleCollider(obj.x, obj.y, obj.width, obj.height,1)
                col:setCollisionClass(collision_class)
                if i == 1 then
                    col:setType('static')
                else
                    joint = world:addJoint('RevoluteJoint', list[i-1], col, obj.x +obj.width/2, obj.y-obj.height/5, true)
                end
                table.insert(list, col)
            end
        end
    else
        if gameMap.layers[layer_name] then
            for i, obj in pairs(gameMap.layers[layer_name].objects) do
                local col = world:newBSGRectangleCollider(obj.x, obj.y, obj.width, obj.height,1)
                col:setCollisionClass(collision_class)
                if static_flag then
                    col:setType('static')
                end
                table.insert(list, col)
            end
        end
    end
end


function add_vines(list, collision_class, layer_name)
    if gameMap.layers[layer_name] then
        for i, obj in pairs(gameMap.layers[layer_name].objects) do
            local col = world:newBSGRectangleCollider(obj.x, obj.y, obj.width, obj.height,1)
            col:setCollisionClass(collision_class)
            if i == 1 then
                col:setType('static')
            else
                joint = world:addJoint('RevoluteJoint', list[i-1], col, obj.x +obj.width/2, obj.y, true)
            end
            table.insert(list, col)
        end
    end
end

function safe_quit()
    world:destroy()
    love.event.quit()
end
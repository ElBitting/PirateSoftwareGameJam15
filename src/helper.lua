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

function add_col_class_obj(list, collision_class, layer_name, static_flag, vine_flag)
    if gameMap.layers[layer_name] then
        for i, obj in pairs(gameMap.layers[layer_name].objects) do
            local col = world:newBSGRectangleCollider(obj.x, obj.y, obj.width, obj.height,1)
            col:setCollisionClass(collision_class)
            if static_flag then
                col:setType('static')
            end
            if vine_flag then
                if i == 1 then
                    col:setType('static')
                elseif obj.name == previousName then 
                    joint = world:addJoint('RevoluteJoint', list[i-1], col, obj.x +obj.width/2, obj.y-obj.height/5, true)
                end
                previousName = obj.name
            end
            table.insert(list, col)
        end
    end
end



function safe_quit()
    world:destroy()
    love.event.quit()
end
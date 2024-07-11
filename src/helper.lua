function add_col_classes(world)
    world:addCollisionClass('Player')
    
    world:addCollisionClass('Platform')
    world:addCollisionClass('Hazards')
    world:addCollisionClass('TeleDoor')
    world:addCollisionClass('FinalDoor')
end

function newButton(text, fn)
    return { 
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

function add_col_class_obj(list, collision_class, layer_name, static_flag)
    if gameMap.layers[layer_name] then
        for i, obj in pairs(gameMap.layers[layer_name].objects) do
            local col = world:newRectangleCollider(obj.x, obj.y, obj.width, obj.height)
            col:setCollisionClass(collision_class)
            if static_flag then
                col:setType('static')
            end
            table.insert(list, col)
        end
    end
end

function safe_quit()
    world:destroy()
    love.event.quit()
end
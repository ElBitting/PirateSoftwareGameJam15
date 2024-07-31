function launch_level(gameMap)
    walls = {}
    hazards = {}
    door = {}
    exit = {}
    ladders = {}
    twals = {}
    vines = {}
    enemeyWalls = {}
    
    add_col_class_obj(walls, 'Platform', 'Walls',true, false)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true, false)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true, false)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true, false)
    add_col_class_obj(ladders, 'Ladders','Ladders', true, false)
    add_col_class_obj(twals, 'ThickWalls','ThickWalls', true, false)
    add_col_class_obj(vines, 'Vines','Vines', false, true)
    add_col_class_obj(enemeyWalls, 'EnemyWall','EnemyWalls', true, false)
    vines_destroyed = false

    add_entities()
end

function update_level(dt)
    apple:update_all(dt)
    Poke:update_all(dt)
    cauldron:update_all(dt)
    Elderberries:update_all(dt)
    Crickets:update_all(dt)
    Shadow:update_all(dt)
end

function draw_level(gameMap, stages)
    for _, stage in ipairs(stages) do
        gameMap:drawLayer(gameMap.layers[stage])
    end
    if not vines_destroyed then
        for i, vine in ipairs(vines) do
            if i == 1 then goto continue end
            local px = vine:getX()
            local py = vine:getY()
            local r = vine:getAngle()
            love.graphics.draw(love.graphics.newImage('Art/Sprites/vine.png'), px, py, r, 1, 1,7, 10)
            vine:setAngularDamping(500)
            ::continue::
        end
    end

    apple:draw_all()
    cauldron:draw_all()
    Elderberries:draw_all()
    Crickets:draw_all()
    Poke:draw_all()
    Shadow:draw_all()
end

function end_level()
    remove_collider_obj(walls)
    remove_collider_obj(hazards)
    remove_collider_obj(ladders)
    remove_collider_obj(door)
    remove_collider_obj(exit)
    remove_collider_obj(twals)
    remove_collider_obj(vines)
    remove_collider_obj(enemeyWalls)
    vines_destroyed = true
    
    apple.reset()
    cauldron.reset()
    Elderberries.reset()
    Crickets.reset()
    Poke.reset()
    Shadow.reset()
end

function add_entities()
    for i, instance in ipairs(gameMap.layers.Entities.objects) do
        if instance.name == "Apple" then
            apple.new(instance.x + instance.width/2, instance.y + instance.height/2)
        elseif instance.name == "Cauldron" then
            cauldron.new(instance.x + instance.width / 2, instance.y + instance.height / 2)
        elseif instance.name == "Cricket" then
            Crickets.new(instance.x + instance.width / 2, instance.y + instance.height / 2)
        elseif instance.name == 'Elderberries' then
            Elderberries.new(instance.x + instance.width / 2, instance.y + instance.height / 2)
        elseif instance.name == 'Poke' then
            Poke.new(instance.x + instance.width / 2, instance.y + instance.height / 2)
        elseif instance.name == 'Shadow' then
            Shadow.new(instance.x + instance.width/2, instance.y + instance.height/2)
        end
    end
end


tutorial = {}

function tutorial:init()

    gameMap = sti('Art/MapDesign/Maps/Tutorial_map_2.lua')

    walls = {}
    hazards = {}
    door = {}
    exit = {}
    ladders = {}
    twals = {}  
    vines = {}
    


    add_col_class_obj(walls, 'Platform', 'Walls',true, false)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true, false)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true, false)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true, false)
    add_col_class_obj(ladders, 'Ladders','Ladders', true, false)
    add_col_class_obj(twals, 'ThickWalls','ThickWalls', true, false)
    add_col_class_obj(vines, 'Vines','Vines', false, true)

    add_entities()
end

function tutorial:draw()
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
    gameMap:drawLayer(gameMap.layers['fg2'])
    
    for i, vine in ipairs(vines) do
        if i == 1 then goto continue end
        local px = vine:getX()
        local py = vine:getY()
        local r = vine:getAngle()
        love.graphics.draw(love.graphics.newImage('Art/Sprites/vine.png'), px, py, r, 1, 1,7, 10)
        vine:setAngularDamping(450)
        ::continue::
    end
    apple:draw_all()
end

function add_entities()
    for i, instance in ipairs(gameMap.layers.Entities.objects) do
        if instance.name == "Apple" then
            apple.new(instance.x + instance.width/2, instance.y + instance.height/2)
        end
    end
end

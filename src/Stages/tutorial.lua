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
    apples_list = {}
    
    


    add_col_class_obj(walls, 'Platform', 'Walls',true, false, false)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true, false, true)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true, false, true)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true, false, true)
    add_col_class_obj(ladders, 'Ladders','Ladders', true, false, true)
    add_col_class_obj(twals, 'ThickWalls','ThickWalls', true, false, false)
    add_col_class_obj(vines, 'Vines','Vines', false, true, true)
    add_col_class_obj(apples_list, 'Apples','Apples', false, true)

    spawnEntities()
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
        ::continue::
    end
    
    apple.drawAll()
end

function spawnEntities()
    for i, v in ipairs(gameMap.layers.entity.objects) do
        if v.name == 'Apple' then
            apple.new(v.x + v.width/2 , v.y)
        end
    end
end

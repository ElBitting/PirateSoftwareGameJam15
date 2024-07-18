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
end

function tutorial:draw()
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
    gameMap:drawLayer(gameMap.layers['fg2'])
    
    for i, vine in ipairs(vines) do
        local px = vine:getX()
        local py = vine:getY()
        local r = vine:getAngle()
        
        love.graphics.draw(love.graphics.newImage('Art/Sprites/vine.png'), px, py, r, sx, sy,7, 10)
    end
end

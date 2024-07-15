tutorial = {}

function tutorial:enter()

    gameMap = sti('Art/MapDesign/Maps/Tutorial_map_2.lua')

    walls = {}
    hazards = {}
    door = {}
    exit = {}
    ladders = {}
    twals = {}


    add_col_class_obj(walls, 'Platform', 'Walls',true)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true)
    add_col_class_obj(ladders, 'Ladders','Ladders', true)
    add_col_class_obj(twals, 'ThickWalls','ThickWalls', true)

end

function tutorial:draw()
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
end


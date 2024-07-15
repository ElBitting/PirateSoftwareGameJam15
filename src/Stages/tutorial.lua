tutorial = {}

function tutorial:enter()

    gameMap = sti('Art/MapDesign/Maps/Tutorial_map_2.lua')

    walls = {}
    hazards = {}
    door = {}
    exit = {}
    ladders = {}

    add_col_class_obj(walls, 'Platform', 'Walls',true)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true)
    add_col_class_obj(exit, 'Ladders','Ladders', true)
end

function tutorial:draw()
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
end


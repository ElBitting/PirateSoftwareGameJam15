tutorial = {}

function tutorial:enter()

    gameMap = sti('Art/MapDesign/Maps/Tutorial_map_2.lua')

    walls = {}
    hazards = {}
    door = {}
    exit = {}
    ladders = {}
    twals = {}
    vines = {}


    add_col_class_obj(walls, 'Platform', 'Walls',true)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true)
    add_col_class_obj(ladders, 'Ladders','Ladders', true)
    add_col_class_obj(twals, 'ThickWalls','ThickWalls', true)
    add_col_class_obj(vines, 'Vines','Vines', true)


end

function tutorial:draw()
    gameMap:drawLayer(gameMap.layers['BG'])
    gameMap:drawLayer(gameMap.layers['FG'])
    gameMap:drawLayer(gameMap.layers['fg2'])
end


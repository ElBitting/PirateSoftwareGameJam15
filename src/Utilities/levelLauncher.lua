function launch_level(gameMap)

    walls = {}
    hazards = {}
    door = {}
    exit = {}
    ladders = {}
    twals = {}
    vines = {}
    joints = {}
    
    add_col_class_obj(walls, 'Platform', 'Walls',true, false)
    add_col_class_obj(hazards, 'Hazards', 'Hazards',true, false)
    add_col_class_obj(door, 'TeleDoor','TeleDoor', true, false)
    add_col_class_obj(exit, 'FinalDoor','FinalDoor', true, false)
    add_col_class_obj(ladders, 'Ladders','Ladders', true, false)
    add_col_class_obj(twals, 'ThickWalls','ThickWalls', true, false)
    add_col_class_obj(vines, 'Vines','Vines', false, true)
    vines_destroyed = false

    add_entities()
end

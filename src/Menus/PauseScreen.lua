PauseScreen = {}
local appleimg = love.graphics.newImage('Art/Sprites/Original_sin.png')
local elderberryimg = love.graphics.newImage('Art/Sprites/elderberry_shrub_full.png')
local cricketimg = love.graphics.newImage('Art/Sprites/criket.png')

table.insert(PauseScreen, newButton("Resume", function() 
    gs.pop() 
end))
table.insert(PauseScreen, newButton("Map", function() end))
table.insert(PauseScreen, newButton("Quests", function() end))
table.insert(PauseScreen, newButton("Inventory", function() end))
table.insert(PauseScreen, newButton("Recipes", function() end))
table.insert(PauseScreen, newButton("Equipment", function() end))
table.insert(PauseScreen, newButton("Restart Game", function() safe_restart() end))
table.insert(PauseScreen, newButton("Settings", function() end))
table.insert(PauseScreen, newButton("Title Screen", function() 
    gs.pop()
    player.reset()
    gs.switch(TitleScreen)
end))
table.insert(PauseScreen, newButton("Quit", function() safe_quit() end))


function PauseScreen: draw()
    love.graphics.print('Paused', gameFont, 325,100)
    InventoryMenu()
    RightMenu()
end

function PauseScreen: update(dt)
    if SelectedButton > #PauseScreen then
        SelectedButton = 1
    end
    if SelectedButton < 1 then 
        SelectedButton = #PauseScreen
    end
end

function PauseScreen:enter(previous)
    SelectedButton = 1 
end


function PauseScreen: keypressed(key, gamepad)
    if key == 's' or (gamepad and key == 'dpdown') then 
        SelectedButton = SelectedButton + 1
        love.mouse.setVisible(false)
    end
    if key == 'w' or (gamepad and key == 'dpup') then 
        SelectedButton = SelectedButton - 1
        love.mouse.setVisible(false)
    end
    if key =='escape' or (gamepad and key == 'b') then
        gs.pop()
    end
end

function RightMenu()
    local butt = 0
    love.graphics.setColor(0.2,0.2,0.2, 0.5)
    love.graphics.rectangle("fill", GAME_WIDTH-MENU_WIDTH-10, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT)
    love.graphics.setColor(0,0,0.1)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-10, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-9, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT-1)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-11, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT+1)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-12, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT-2)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-8, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT+2)
    for i, button in ipairs(PauseScreen) do
        local color = {0.5, 0.7, 0.8, 1}
        local bx, by = GAME_WIDTH-MENU_WIDTH+25, GAME_HEIGHT / 9 + 30 + butt * 60
        local hot = false 
        local mx, my = love.mouse.getPosition()
        if love.mouse.isVisible() then
            if (mx > bx and mx < bx + MENU_WIDTH) and (my >by and my < by +50) then
                SelectedButton = i
            end 
        end
        hot = SelectedButton == i
        if hot then
            color = {0.7, 0.7, 0.9}
            SelectedButton = i
        end
        
        selected = controls:checkSelectionKey()
        if selected and hot then
            button.fn()
        end
        love.graphics.setColor(unpack(color))
        love.graphics.print(button.text, textFont,bx,by )
        butt = butt +1
    end
    love.graphics.setColor(1,1,1)
end

function InventoryMenu()
    love.graphics.setColor(0.2,0.2,0.2, 0.5)
    love.graphics.rectangle("fill", 0, GAME_HEIGHT *2/3, GAME_WIDTH, GAME_HEIGHT/3)
    love.graphics.setColor(0.2,0,0)
    love.graphics.rectangle("line", 0, GAME_HEIGHT *2/3-1, GAME_WIDTH, GAME_HEIGHT/3)
    love.graphics.rectangle("line", 0, GAME_HEIGHT *2/3+1, GAME_WIDTH, GAME_HEIGHT/3)
    love.graphics.rectangle("line", 0, GAME_HEIGHT *2/3-2, GAME_WIDTH, GAME_HEIGHT/3)
    love.graphics.rectangle("line", 0, GAME_HEIGHT *2/3+2, GAME_WIDTH, GAME_HEIGHT/3)
    love.graphics.setColor(1,1,1)
    love.graphics.draw(appleimg, 100, 850, nil, 6, 6)
    love.graphics.print(player.inventory['apple'], textFont, 95, 920)

    love.graphics.draw(elderberryimg, 225, 850, nil, 6, 6)
    love.graphics.print(player.inventory['elderberry'], textFont, 220, 920)

    love.graphics.draw(cricketimg, 450, 890, nil, 6, 6)
    love.graphics.print(player.inventory['cricket'], textFont, 445, 920)
end
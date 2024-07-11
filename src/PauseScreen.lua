PauseScreen = {}

table.insert(PauseScreen, newButton("Resume", function() 
    gs.switch(game) 
    SelectedButton = 1
end))
table.insert(PauseScreen, newButton("Inventory", function() end))
table.insert(PauseScreen, newButton("Save", function() gs.switch(game) end))
table.insert(PauseScreen, newButton("Settings", function() end))
table.insert(PauseScreen, newButton("Title Screen", function() 
    gs.switch(TitleScreen)
    SelectedButton = 1 
end))
table.insert(PauseScreen, newButton("Quit", function() love.event.quit() end))
SelectedButton = 1

function PauseScreen: draw()

    butt = 0
    love.graphics.print('Paused', gameFont, 325,100)
    love.graphics.rectangle("line", GAME_WIDTH-MENU_WIDTH-10, GAME_HEIGHT /9, MENU_WIDTH, MENU_HEIGHT)
    for i, button in ipairs(PauseScreen) do
        button.last = button.now
        local color = {0.5, 0.7, 0.8, 1}
        local bx, by = GAME_WIDTH-MENU_WIDTH+20, GAME_HEIGHT / 9 + 20 + butt * 50 
        local mx, my = love.mouse.getPosition()
        local hot = SelectedButton == i 
        if hot then
            color = {0.7, 0.7, 0.9}
        end
        button.now = love.mouse.isDown(1)
        if love.keyboard.isDown('return') and hot then
            button.fn()
        end
        love.graphics.setColor(unpack(color))
        love.graphics.print(button.text, textFont,bx,by )
        butt = butt +1
    end
    love.graphics.setColor(1,1,1)
end

function PauseScreen: update(dt)
    if SelectedButton > #PauseScreen then
        SelectedButton = #PauseScreen
    end
    if SelectedButton < 1 then 
        SelectedButton = 1
    end
end

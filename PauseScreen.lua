PauseScreen = {}

function newButton(text, fn)
    return { 
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

table.insert(PauseScreen, newButton("Resume", function() pause = false end))
table.insert(PauseScreen, newButton("Inventory", function() end))
table.insert(PauseScreen, newButton("Save", function() pause = false end))
table.insert(PauseScreen, newButton("Settings", function() end))
table.insert(PauseScreen, newButton("Exit", function() love.event.quit() end))

function PauseScreen: draw()
     screenWidth = love.graphics.getWidth()
     screenHeight = love.graphics.getHeight()
     butt = 0 
    if pause == true then
        love.graphics.print('Paused', gameFont, 325,100)
        love.graphics.rectangle("line", screenWidth-menuWidth-10, screenHeight /9, menuWidth, menuHeight)
        for i, button in ipairs(PauseScreen) do
            button.last = button.now
            local color = {0.5, 0.7, 0.8, 1}
            local bx, by = screenWidth-menuWidth+20, screenHeight / 9 + 20 + butt * 50 
            local mx, my = love.mouse.getPosition()
            local hot = (mx > bx and mx < bx + menuWidth) and (my >by and my < by +50) 
            if hot then
                color = {0.7, 0.7, 0.9}
            end
            button.now = love.mouse.isDown(1)
            if (button.now or love.keyboard.isDown('return')) and not button.last and hot then
                button.fn()
            end
            love.graphics.setColor(unpack(color))
            love.graphics.print(button.text, textFont,bx,by )
            butt = butt +1
        end
        love.graphics.setColor(1,1,1)
    end
end

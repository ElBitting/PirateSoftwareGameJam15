Credits = {}

function Credits: draw()
    love.graphics.print(TITLE, gameFont, 180, 100)
    love.graphics.print("Congratulations!", textFont, 370, 250)
    love.graphics.print("Press enter for Title Screen", textFont, 360, 300)
    love.graphics.print("Press escape to quit", textFont, 360, 350)
end


function Credits:keypressed(key, gamepad)
    if key == 'escape' or (gamepad and key == 'b') then 
        safe_quit()
    end
    if key == 'return' then 
        gs.switch(TitleScreen)
    end
end
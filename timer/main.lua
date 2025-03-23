function love.load()
    startGame()
end

function startGame()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 3
    gameOver = false

    gameFont = love.graphics.newFont(40)
end

function love.update(dt)
    if not gameOver then
        if timer > 0 then
            timer = timer - dt
            if timer <= 0 then
                timer = 0
                gameOver = true
            end
        end
    end
end

function love.draw()
    if not gameOver then
        -- Gambar target
        love.graphics.setColor(1, 0, 0)
        love.graphics.circle("fill", target.x, target.y, target.radius)
    end

    -- Gambar skor dan timer
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print("Score: " .. score, 10, 10)
    love.graphics.print("Time: " .. math.ceil(timer), 300, 10)

    -- Tampilkan Game Over
    if gameOver then
        love.graphics.printf("GAME OVER\nPress R to Restart", 0, love.graphics.getHeight()/2 - 50, love.graphics.getWidth(), "center")
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 and not gameOver then
        local mouseToTarget = distanceBetween(x, y, target.x, target.y)
        if mouseToTarget < target.radius then
            score = score + 1
            target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
            target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
        end
    end
end

function love.keypressed(key)
    if key == "r" and gameOver then
        startGame()
    end
end

function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((x2 - x1)^2 + (y2 - y1)^2)
end

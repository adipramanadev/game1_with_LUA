function love.load()
    love.window.setTitle("Kasih Target")
    love.graphics.setBackgroundColor(0, 1, 0)
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 50

    score = 0
    timer = 0
    gameFont = love.graphics.newFont(40)
end

function love.update(dt)
end

function love.draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", target.x, target.y, target.radius)

    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(gameFont)
    love.graphics.print(score, 0, 0)
end

-- tambahin klik mouse
function love.mousepressed( x, y, button, istouch, presses )
    if button == 1 then
        score = score + 1
    end
end

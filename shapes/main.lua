function love.load()
    -- set title of window
    love.window.setTitle("Belajar Membuat Game 2D dengan LOVE 2D")
    -- set background color
    love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
end

function love.update(dt)
end

function love.draw()
    -- Rectangle
    love.graphics.setColor(1, 0, 0) -- Merah
    love.graphics.rectangle("fill", 200, 400, 200, 100)

    -- Circle
    love.graphics.setColor(0, 1, 0) -- Hijau
    love.graphics.circle("fill", 300, 200, 100)

    -- Triangle (segitiga)
    love.graphics.setColor(1, 1, 0) -- Kuning
    love.graphics.polygon("fill", 
        500, 100,  -- Titik atas
        450, 200,  -- Titik kiri bawah
        550, 200   -- Titik kanan bawah
    )

    -- Reset warna ke putih
    love.graphics.setColor(1, 1, 1)
end

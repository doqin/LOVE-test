function love.load()
	Sharkitty = love.graphics.newImage("assets/images/sharkitty.jpg")
end

function love.update()
end

function love.draw()
	love.graphics.draw(Sharkitty, 0, 0)
	love.graphics.print("Shark yah", 0, 0)
end

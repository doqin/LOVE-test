require("src/Object3D")
require("src/Camera")
require("src/Renderer")


function love.load()
	love.window.setTitle("3D Renderer in Love2D")

	local cubeVertices = {
		{x = -1, y = -1, z = -1}, {x =  1, y = -1, z = -1},
        {x =  1, y =  1, z = -1}, {x = -1, y =  1, z = -1},
        {x = -1, y = -1, z =  1}, {x =  1, y = -1, z =  1},
        {x =  1, y =  1, z =  1}, {x = -1, y =  1, z =  1}
	}

	local cubeFaces = {
		{1, 2, 3}, {1, 3, 4}, {2, 6, 7}, {2, 7, 3},
        {6, 5, 8}, {6, 8, 7}, {5, 1, 4}, {5, 4, 8},
        {4, 3, 7}, {4, 7, 8}, {5, 6, 2}, {5, 2, 1}
	}

	Cube = Object3D:new(cubeVertices, cubeFaces)
	Cube.position.z = 5

	Camera = Camera:new(90, love.graphics.getWidth() / love.graphics.getHeight(), 0.1, 100)
	Renderer = Renderer:new(Camera)
end

function love.update(dt)
	Cube.rotation.x = Cube.rotation.x + dt * 1 / 3
	Cube.rotation.y = Cube.rotation.y + dt * 2 / 3
	Cube.rotation.z = Cube.rotation.z + dt
end

function love.draw()
	Renderer:draw(Cube)
end

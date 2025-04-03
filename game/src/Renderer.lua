Renderer = {}
Renderer.__index = Renderer

function Renderer:new(camera)
	local renderer = {camera = camera}
	setmetatable(renderer, self)
	return renderer
end

function Renderer:draw(object)
	local transformedVertices = object:applyTransformations()
	love.graphics.setColor(1, 1, 1) -- white color
	for _, face in ipairs(object.faces) do
		local v1 = self.camera:project(transformedVertices[face[1]])
		local v2 = self.camera:project(transformedVertices[face[2]])
		local v3 = self.camera:project(transformedVertices[face[3]])
		love.graphics.polygon("line", v1.x, v1.y, v2.x, v2.y, v3.x, v3.y)
	end
end

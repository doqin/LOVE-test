Camera = {}
Camera.__index = Camera

function Camera:new(fov, aspect, near, far)
	local cam = {
		position = {x = 0, y = 0, z = -5}, -- camera position
		fov = fov or 90,
		aspect = aspect or love.graphics.getWidth() / love.graphics.getHeight(),
		near = near or 0.1,
		far = far or 1000
	}
	setmetatable(cam, self)
	return cam
end

function Camera:project(point)
	-- simple perspective projection formula
	local f = 1 / math.tan(math.rad(self.fov) / 2)
	local z = point.z - self.position.z
	if z == 0 then z = 0.01 end -- Prevent division by 0
	return {
		x = (point.x / z) * f * self.aspect * love.graphics.getWidth() / 2 + love.graphics.getWidth() / 2,
		y = -(point.y / z) * f * love.graphics.getHeight() / 2 + love.graphics.getHeight() / 2
	}
end

Object3D = {}
Object3D.__index = Object3D

function Object3D:new(vertices, faces)
	local obj = {
		vertices = vertices or {},  -- list of 3D points {x, y, z}
		faces = faces or {},        -- list of face indices {v1, v2, v3}
		position = { x = 0, y = 0, z = 0 }, -- object position
		rotation = { x = 0, y = 0, z = 0 }, -- rotation angles
		scale = { x = 1, y = 1, z = 1 } -- scale factors
	}
	setmetatable(obj, self)
	return obj
end

function Object3D:applyTransformations()
	-- apply translation, rotation, and scaling
	local transformedVertices = {}
	for _, v in ipairs(self.vertices) do
		local x, y, z = v.x * self.scale.x, v.y * self.scale.y, v.z * self.scale.z
		-- apply rotation (simple example, you can add full rotation math)
		local cosY, sinY = math.cos(self.rotation.y), math.sin(self.rotation.y)
		local x_rot = x * cosY - z * sinY
		local z_rot = x * sinY + z * cosY
		transformedVertices[#transformedVertices + 1] = { x = x_rot + self.position.x, y = y + self.position.y, z = z_rot + self.position.z }
	end
	return transformedVertices
end

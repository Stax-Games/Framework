--!strict

--[[
    IMPORTS
--]]
local Types = require(script.Parent.Parent.types.core)

local Service = {}

function Service.new<T>(data: T): Types.Service<T>
	return setmetatable(data, Service)
end

return Service

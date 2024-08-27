--!strict

--[[
    IMPORTS
--]]
local Types = require(script.Parent.Parent.types.core)

local Service = {}

function Service.new<T>(data: table): Types.Service<T>
	return setmetatable(data, Service)
end

function Service:Load() end

function Service:Initialize() end

function Service:Start() end

function Service:Stop() end

function Service.add<T>(service: Types.Service<T>)
	print(service)
end

function Service.remove(service: string)
	print(service)
end

function Service.get(service: string)
	print(service)
end

return Service

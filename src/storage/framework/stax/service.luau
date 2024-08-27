--!strict

--[[
    IMPORTS
--]]
local Types = require(script.Parent.types)

local Service = {}

function Service.new<T>(newService: Types.Service<T>): Types.Service<T>
	return {
		table.unpack(newService),
	}
end

function Service:Load() end

function Service:Initialize() end

function Service:Start() end

function Service:Stop() end

function Service.add(service: Types.Service) end

function Service.remove(service: string) end

function Service.get(service: string) end

return Service

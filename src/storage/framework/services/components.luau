--[[
    SERVICES
--]]
local _RS = game:GetService("ReplicatedStorage")

--[[
    IMPORTS
--]]
local Types = require(_RS.framework.stax.types.core)

local ComponentService: Types.Service<Types.ComponentService> = {
	name = "ComponentService",
	Components = {},
}

function ComponentService.Load()
	print(ComponentService.name .. " Loaded!")
end

function ComponentService.Initialize()
	print(ComponentService.name .. " Initialized!")
end

function ComponentService.Start() end

function ComponentService.Stop() end

function ComponentService.Fetch<T>(name: string): T
	print(name)
end

return ComponentService

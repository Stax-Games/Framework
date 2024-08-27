--[[
    SERVICES
--]]
local _ReplicatedStorage = game:GetService("ReplicatedStorage")

--[[
    IMPORTS
--]]
local Types = require(_ReplicatedStorage.framework.stax.types.core)

local ComponentService: Types.Service<Types.ComponentService> = {
	name = "ComponentService",
	Components = {},
}

function ComponentService.Load(next: () -> nil)
	next()
end

function ComponentService.Initialize(next: () -> nil)
	next()
end

function ComponentService.Start(next: () -> nil)
	next()
end

function ComponentService.Stop() end

function ComponentService.Fetch<T>(name: string): T
	print(name)
end

return ComponentService

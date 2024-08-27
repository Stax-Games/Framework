--[[
    SERVICES
--]]
local _RS = game:GetService("ReplicatedStorage")

--[[
    IMPORTS
--]]
local Types = require(_RS.framework.stax.types)

local ComponentService: Types.Service<Types.ComponentService> = {
	name = "ComponentService",
	Components = {},
}

function ComponentService.Initialize() end

function ComponentService.Load() end

function ComponentService.Start() end

function ComponentService.Stop() end

function ComponentService.Fetch<T>(name: string): T
	print(name)
end

return ComponentService

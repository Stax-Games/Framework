--[[
    SERVICES
--]]
local _ReplicatedStorage = game:GetService("ReplicatedStorage")

--[[
    IMPORTS
--]]
local Types = require(_ReplicatedStorage.framework.stax.types.core)
-- local Component = require(_ReplicatedStorage.framework.stax.classes.component)
local Service = require(_ReplicatedStorage.framework.stax.classes.service)

local ComponentService: Types.Service<Types.ComponentService> = Service.new({
	name = "ComponentService",
	Components = {},
})

function ComponentService.Load(next: () -> nil)
	print("LOAD ALL COMPONENTS")

	next()
end

function ComponentService.Initialize(next: () -> nil)
	print("INITIALIZE ALL COMPONENTS")

	next()
end

function ComponentService.Start(next: () -> nil)
	print("STARTING ALL COMPONENTS")

	ComponentService.Fetch()

	next()
end

function ComponentService.Stop()
	print("STOPPING COMPONENT SERVICE")
end

function ComponentService.Fetch<T>(): Types.Component<T> end

return ComponentService

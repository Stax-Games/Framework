--!strict

--[[
    IMPORTS
--]]
local Types = require(script.Parent.Parent.types.core)

local Component = {}

function Component.new<T>(name: string, component: table): Types.Component<T>
	local newComponent = setmetatable(component, Component)

	newComponent.name = name

	return newComponent
end

return Component

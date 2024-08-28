--!strict

--[[
    SERVICES
--]]
local _ReplicatedStorage = game:GetService("ReplicatedStorage")

--[[
    TYPES
--]]
local ClassTypes = require(_ReplicatedStorage.framework.stax.types.classes)

--[[
    IMPORTS
--]]

local Door: ClassTypes.Door = {}

function Door.new(doorModel: Model)
	return setmetatable({
		_doorModel = doorModel,
	}, Door)
end

function Door.Open(door: ClassTypes.Door) end

function Door.Close(door: ClassTypes.Door) end

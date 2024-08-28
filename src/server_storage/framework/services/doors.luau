local _ServerStorage = game:GetService("ServerStorage")
local _ReplicatedStorage = game:GetService("ReplicatedStorage")
local _CollectionService = game:GetService("CollectionService")

--[[
    CLASS IMPORTS
--]]
-- local Door = require(_ServerStorage.framework.classes.door)
local Service = require(_ReplicatedStorage.framework.stax.classes.service)

--[[
    IMPORTS
--]]
local CoreTypes = require(_ReplicatedStorage.framework.stax.types.core)
local ServiceTypes = require(_ReplicatedStorage.framework.stax.types.services)

--[[
    DOORSERVICE
--]]
local DoorService: CoreTypes.Service<ServiceTypes.DoorService> = Service.new({
	name = "DoorService",
	Doors = {},
})

--[[
    REQUIRED METHODS
--]]
function DoorService.Load(next: () -> nil)
	local doors = _CollectionService:GetTagged("Door")

	print("Doors Found: ", doors)

	next()
end

function DoorService.Initialize(next: () -> nil)
	next()
end

function DoorService.Start(next: () -> nil)
	next()
end

function DoorService.Stop(next: () -> nil)
	next()
end

return DoorService

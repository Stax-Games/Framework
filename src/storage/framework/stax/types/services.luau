--!strict

--[[
	TYPES
--]]
local ClassTypes = require(script.Parent.classes)

local Types = {}

--[[
	server_storage\framework\services\players.luau
--]]
export type PlayerService = {
	Storage: { [number]: ClassTypes.Player },
	Fetch: (uid: number) -> ClassTypes.Player,
}

--[[
    server_storage\framework\services\doors.luau
--]]
export type DoorService = {
	Doors: {},
}

return Types

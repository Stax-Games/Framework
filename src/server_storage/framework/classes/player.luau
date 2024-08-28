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
local Network = require(_ReplicatedStorage.framework.stax.utils.network)

--[[
	PLAYERSERVICE EVENTS
--]]
local PlayerService_Fetch = Network.BindableFunction("PlayerService", "Fetch")

local Player: ClassTypes.Player = {}

function Player.new(_p: Player): ClassTypes.Player
	local newPlayer = setmetatable({
		_instance = _p,
		name = _p.Name,
		uid = _p.UserId,
	}, Player)

	return newPlayer
end

function Player.Classic(_p: ClassTypes.Player): Player
	return _p._player
end

function Player.Fetch(uid: number): ClassTypes.Player | nil
	return PlayerService_Fetch:Invoke(uid)
end

return Player

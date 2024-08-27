--!strict

--[[
    SERVICES
--]]
local _RS = game:GetService("ReplicatedStorage")

--[[
    IMPORTS
--]]
local ComponentTypes = require(_RS.framework.stax.types.components)

local Player: ComponentTypes.Player = {}

function Player.new(_p: Player): ComponentTypes.Player
	local newPlayer = setmetatable({
		_instance = _p,
		name = _p.Name,
		uid = _p.UserId,
	}, Player)

	return newPlayer
end

function Player.Classic(_p: ComponentTypes.Player): Player
	return _p._player
end

return Player

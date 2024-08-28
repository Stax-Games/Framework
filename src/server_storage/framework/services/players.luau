--[[
    SERVICES
--]]
local _ServerStorage = game:GetService("ServerStorage")
local _ReplicatedStorage = game:GetService("ReplicatedStorage")
local _Players = game:GetService("Players")

--[[
    CLASS IMPORTS
--]]
local Player = require(_ServerStorage.framework.classes.player)
local Service = require(_ReplicatedStorage.framework.stax.classes.service)
local Network = require(_ReplicatedStorage.framework.stax.utils.network)

--[[
    TYPES
--]]
local CoreTypes = require(_ReplicatedStorage.framework.stax.types.core)
local ServiceTypes = require(_ReplicatedStorage.framework.stax.types.services)

--[[
	PLAYERSERVICE EVENTS
--]]
local Fetch = Network.BindableFunction("PlayerService", "Fetch")

--[[
	PLAYERSERVICE
--]]
local PlayerService: CoreTypes.Service<ServiceTypes.PlayerService> = Service.new({
	name = "PlayerService",
	Players = {},
})

--[[
    USABLE METHODS
--]]
function PlayerService.Fetch(uid: number)
	local fetchedPlayer = PlayerService.Players[uid]

	if not fetchedPlayer then
		return nil
	end

	return fetchedPlayer
end

function PlayerService.MassSave(): boolean
	return false
end

--[[
    SERVICE EVENTS
--]]
function PlayerService.Added(player: Player)
	PlayerService.Players[player.UserId] = Player.new(player)
end

function PlayerService.Removing(player: Player)
	PlayerService.Players[player.UserId] = nil
end

---[[ REQUIRED METHODS ]]
function PlayerService.Load(next: () -> nil)
	next()
end

function PlayerService.Initialize(next: () -> nil)
	_Players.PlayerAdded:Connect(PlayerService.Added)
	_Players.PlayerRemoving:Connect(PlayerService.Removing)
	Fetch.OnInvoke = PlayerService.Fetch

	next()
end

function PlayerService.Start(next: () -> nil)
	next()
end

function PlayerService.Stop(next: () -> nil)
	next()
end

return PlayerService

--!strict

--[[
    TYPES
--]]
local Types = require(script.types)

--[[
    IMPORTS
--]]
local Network = require(script.utils.network)

--[[
    HANDLERS
--]]
local ServiceHandler = require(script.handlers.service)

--[[
    STAX CLASS
--]]
local Stax: Types.Stax = {
	Network = Network,
}
Stax.__index = Stax

--[[
    Stax.Init()

    ! Do not call this method more than once !
--]]
function Stax.Init()
	local stax = setmetatable({
		Services = ServiceHandler.new(),
	}, Stax)

	stax.Services.Load()

	return stax
end

return Stax

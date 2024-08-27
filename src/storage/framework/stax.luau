--!strict

--[[
    SERVICES
--]]
local _RS = game:GetService("ReplicatedStorage")

--[[
    IMPORTS
--]]
local Types = require(_RS.framework.types)

--[[
    CLASS :: Stax
--]]
local Stax: Types.Stax = {
	Components = {},
}

--[[
    * Stax.Init()

    Do not call this method more than once!
--]]
function Stax.Init()
	print("Initializing Stax")
end

--[[
    SERVICES
--]]
local _RunService = game:GetService("RunService")

--[[
    TYPES
--]]
local Types = require(script.Parent.Parent.types)

local ServiceHandler: Types.ServiceHandler = {
	Services = {},
}

function ServiceHandler.new()
	print("Fetching Services")

	local isServer = _RunService:IsServer()

	if isServer then
		local services = game:GetService("ServerScriptService").services:GetDescendants()

		if services then
			for _, service in pairs(services) do
				if not service:IsA("ModuleScript") then
					continue
				end

				local requiredService = require(service)

				ServiceHandler.Services[service.name] = requiredService

				print("Loaded Server Service: " .. tostring(service.name))
			end
		end
	else
		local services = game:GetService("StarterPlayer").StarterPlayerScripts.services:GetDescendants()

		if services then
			for _, service in pairs(services) do
				if not service:IsA("ModuleScript") then
					continue
				end

				local requiredService = require(service)

				ServiceHandler.Services[service.name] = requiredService

				print("Loaded Client Service: " .. tostring(service.name))
			end
		end
	end

	print("Finished Finding Services")

	return ServiceHandler
end

function ServiceHandler.Load() end

function ServiceHandler.Initialize() end

function ServiceHandler.Start() end

function ServiceHandler.Stop() end

function ServiceHandler.Fetch() end

return ServiceHandler

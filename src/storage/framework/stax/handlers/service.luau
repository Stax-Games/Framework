--[[
    SERVICES
--]]
local _RunService = game:GetService("RunService")

--[[
    TYPES
--]]
local Types = require(script.Parent.Parent.types.core)

local ServiceHandler: Types.ServiceHandler = {
	Services = {},
	ServicesCount = 0,
}

function ServiceHandler.new()
	print("[STAX]: ServiceHandler | Fetching Services")

	local isServer = _RunService:IsServer()

	if isServer then
		local services = game:GetService("ServerStorage").framework.services:GetDescendants()

		if services then
			for _, service in pairs(services) do
				if not service:IsA("ModuleScript") then
					continue
				end

				local requiredService = require(service)

				ServiceHandler.Services[service.name] = requiredService
				ServiceHandler.ServicesCount = ServiceHandler.ServicesCount + 1
			end
		end
	else
		local services = game:GetService("StarterPlayer").StarterPlayerScripts.framework.services:GetDescendants()

		if services then
			for _, service in pairs(services) do
				if not service:IsA("ModuleScript") then
					continue
				end

				local requiredService = require(service)

				ServiceHandler.Services[service.name] = requiredService
				ServiceHandler.ServicesCount = ServiceHandler.ServicesCount + 1
			end
		end
	end

	local sharedServices = game:GetService("ReplicatedStorage").framework.services:GetDescendants()

	for _, service in pairs(sharedServices) do
		if not service:IsA("ModuleScript") then
			continue
		end

		local requiredService = require(service)

		ServiceHandler.Services[requiredService.name] = requiredService
		ServiceHandler.ServicesCount = ServiceHandler.ServicesCount + 1
	end

	print("[STAX]: ServiceHandler | Fetched Services")

	ServiceHandler.Load()

	return ServiceHandler
end

function ServiceHandler.Load()
	print("[STAX]: ServiceHandler | Loading Services")

	local loaded = 0

	for _, service in pairs(ServiceHandler.Services) do
		service.Load(function()
			loaded = loaded + 1

			print("[STAX]: ServiceHandler | " .. service.name .. " Loaded!")

			if loaded == ServiceHandler.ServicesCount then
				print("[STAX]: ServiceHandler | Loaded Services")
				ServiceHandler.Initialize()
			end
		end)
	end
end

function ServiceHandler.Initialize()
	print("[STAX]: ServiceHandler | Initializing Services")
	local initialized = 0

	for _, service in pairs(ServiceHandler.Services) do
		service.Initialize(function()
			initialized = initialized + 1

			print("[STAX]: ServiceHandler | " .. service.name .. " Initialized!")

			if initialized == ServiceHandler.ServicesCount then
				print("[STAX]: ServiceHandler | Initialized Services")
				ServiceHandler.Start()
			end
		end)
	end
end

function ServiceHandler.Start()
	print("[STAX]: ServiceHandler | Starting Services")

	local started = 0

	for _, service in pairs(ServiceHandler.Services) do
		service.Start(function()
			started = started + 1

			print("[STAX]: ServiceHandler | " .. service.name .. " Started!")

			if started == ServiceHandler.ServicesCount then
				print("[STAX]: ServiceHandler | All Services Started")
			end
		end)
	end
end

function ServiceHandler.Stop()
	print("[STAX]: ServiceHandler | Stopping Services")

	for _, service in pairs(ServiceHandler.Services) do
		service.Stop()
	end

	print("[STAX]: ServiceHandler | Stopped Services")
end

function ServiceHandler.Fetch<T>(name: string): Types.Service<T>
	local service = ServiceHandler.Services[name]

	if service then
		return service
	end

	return nil
end

return ServiceHandler

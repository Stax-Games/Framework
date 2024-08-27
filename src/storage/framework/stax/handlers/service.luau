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
}

function ServiceHandler.new()
	print("[STAX]: ServiceHandler | Fetching Services")

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
	end

	print("[STAX]: ServiceHandler | Fetched Services")

	ServiceHandler.Load()

	return ServiceHandler
end

function ServiceHandler.Load(name: string?)
	print("[STAX]: ServiceHandler | Loading Services")

	if name then
		local service = ServiceHandler.Services[name]

		if not service then
			return
		end

		service.Load()
	else
		for _, service in pairs(ServiceHandler.Services) do
			service.Load()
		end

		ServiceHandler.Initialize()
	end

	print("[STAX]: ServiceHandler | Loaded Services")
end

function ServiceHandler.Initialize(name: string?)
	print("[STAX]: ServiceHandler | Initializing Services")

	if name then
		local service = ServiceHandler.Services[name]

		if not service then
			return
		end

		service.Initialize()
	else
		for _, service in pairs(ServiceHandler.Services) do
			service.Initialize()
		end

		ServiceHandler.Start()
	end

	print("[STAX]: ServiceHandler | Initialized Services")
end

function ServiceHandler.Start(name: string?)
	print("[STAX]: ServiceHandler | Starting Services")

	if name then
		local service = ServiceHandler.Services[name]

		if not service then
			return
		end

		service.Start()
	else
		for _, service in pairs(ServiceHandler.Services) do
			service.Start()
		end
	end

	print("[STAX]: ServiceHandler | Started Services")
end

function ServiceHandler.Stop(name: string?)
	print("[STAX]: ServiceHandler | Stopping Services")

	if name then
		local service = ServiceHandler.Services[name]

		if not service then
			return
		end

		service.Stop()
	else
		for _, service in pairs(ServiceHandler.Services) do
			service.Stop()
		end
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

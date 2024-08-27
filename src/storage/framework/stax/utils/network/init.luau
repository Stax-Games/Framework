--!strict

--[[
	SERVICES
--]]
local _RS = game:GetService("ReplicatedStorage")

--[[
    TYPES
--]]
local Types = require(script.Parent.Parent.types.core)

--[[
	REFERENCES
--]]
local RemotesPath = _RS.framework.remotes

--[[
	NETWORK SINGLETON
--]]
local Network: Types.Network = {}

function Network.BindableEvent(category: string, name: string): BindableEvent
	local _category = RemotesPath:FindFirstChild(category)

	if _category then
		local existing = _category:FindFirstChild(name)

		if existing then
			if not existing:IsA("BindableEvent") then
				error(
					"Network.BindableEvent | Couldn't create BindableEvent = '"
						.. category
						.. "/"
						.. name
						.. " because another event matches the name but isn't the same BindableEvent type!"
				)
			end

			return existing
		else
			local _newRemote = Instance.new("BindableEvent")
			_newRemote.Name = name
			_newRemote.Parent = _category
		end
	else
		local _newCategory = Instance.new("Folder")
		_newCategory.Name = category
		_newCategory.Parent = RemotesPath

		local _newRemote = Instance.new("BindableEvent")
		_newRemote.Name = name
		_newRemote.Parent = _newCategory
	end
end

function Network.RemoteEvent(category: string, name: string): RemoteEvent
	local _category = RemotesPath:FindFirstChild(category)

	if _category then
		local existing = _category:FindFirstChild(name)

		if existing then
			if not existing:IsA("RemoteEvent") then
				error(
					"Network.RemoteEvent | Couldn't create RemoteEvent = '"
						.. category
						.. "/"
						.. name
						.. " because another event matches the name but isn't the same RemoteEvent type!"
				)
			end

			return existing
		else
			local _newRemote = Instance.new("RemoteEvent")
			_newRemote.Name = name
			_newRemote.Parent = _category
		end
	else
		local _newCategory = Instance.new("Folder")
		_newCategory.Name = category
		_newCategory.Parent = RemotesPath

		local _newRemote = Instance.new("RemoteEvent")
		_newRemote.Name = name
		_newRemote.Parent = _newCategory
	end
end

function Network.UnreliableRemoteEvent(category: string, name: string): UnreliableRemoteEvent
	local _category = RemotesPath:FindFirstChild(category)

	if _category then
		local existing = _category:FindFirstChild(name)

		if existing then
			if not existing:IsA("UnreliableRemoteEvent") then
				error(
					"Network.UnreliableRemoteEvent | Couldn't create UnreliableRemoteEvent = '"
						.. category
						.. "/"
						.. name
						.. " because another event matches the name but isn't the same UnreliableRemoteEvent type!"
				)
			end

			return existing
		else
			local _newRemote = Instance.new("UnreliableRemoteEvent")
			_newRemote.Name = name
			_newRemote.Parent = _category
		end
	else
		local _newCategory = Instance.new("Folder")
		_newCategory.Name = category
		_newCategory.Parent = RemotesPath

		local _newRemote = Instance.new("UnreliableRemoteEvent")
		_newRemote.Name = name
		_newRemote.Parent = _newCategory
	end
end

function Network.RemoteFunction(category: string, name: string): RemoteFunction
	local _category = RemotesPath:FindFirstChild(category)

	if _category then
		local existing = _category:FindFirstChild(name)

		if existing then
			if not existing:IsA("RemoteFunction") then
				error(
					"Network.RemoteFunction | Couldn't create RemoteFunction = '"
						.. category
						.. "/"
						.. name
						.. " because another event matches the name but isn't the same RemoteFunction type!"
				)
			end

			return existing
		else
			local _newRemote = Instance.new("RemoteFunction")
			_newRemote.Name = name
			_newRemote.Parent = _category
		end
	else
		local _newCategory = Instance.new("Folder")
		_newCategory.Name = category
		_newCategory.Parent = RemotesPath

		local _newRemote = Instance.new("RemoteFunction")
		_newRemote.Name = name
		_newRemote.Parent = _newCategory
	end
end

return Network

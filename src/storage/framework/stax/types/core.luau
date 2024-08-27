--!strict

local Types = {}

--[[
    storage\framework\stax.luau
--]]
export type Stax = {
	Network: Network,

	Init: () -> nil,
	LoadComponents: () -> nil,
	LoadServices: () -> nil,
}

--[[
    storage\framework\stax\service.luau
--]]
export type Service<T> = {
	name: string,

	Load: () -> nil,
	Initialize: () -> nil,
	Start: () -> nil,
	Stop: () -> nil,
}

--[[
	storage\framework\stax\handlers\service.luau
--]]
export type ServiceHandler = {
	new: () -> ServiceHandler,
	Load: () -> nil,
	Initialize: () -> nil,
	Start: () -> nil,
	Stop: () -> nil,
	Fetch: () -> nil,
}

--[[
    storage\framework\stax\component.luau
--]]
export type Component<T> = {
	name: string,
	new: () -> Component<T>,
}

--[[
	server\services\components.luau
--]]
export type ComponentService = {
	Fetch: <T>(name: string) -> T,
}

--[[
	storage\framework\stax\utils\network.luau
--]]
export type Network = {
	BindableEvent: (category: string, name: string) -> BindableEvent,
	RemoteEvent: (category: string, name: string) -> RemoteEvent,
	UnreliableRemoteEvent: (category: string, name: string) -> UnreliableRemoteEvent,
	RemoteFunction: (category: string, name: string) -> RemoteFunction,
}

return Types

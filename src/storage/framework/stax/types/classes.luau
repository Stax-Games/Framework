--!strict

local Types = {}

export type Player = {
	_instance: Player,
	name: string,
	uid: number,
}

export type Door = {
	_doorModel: Model,
	type: string,

	new: (doorModel: Model) -> Door,

	Open: (door: Door) -> nil,
	Close: (door: Door) -> nil,
}

return Types

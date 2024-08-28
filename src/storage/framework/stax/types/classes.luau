--!strict

local Types = {}

export type Player = {
	_instance: Player,
	name: string,
	uid: number,
}

export type Door = {
	_doorModel: Model,
}

return Types

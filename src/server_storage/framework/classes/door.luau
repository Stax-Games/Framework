--!strict

--[[
    SERVICES
--]]
local _ReplicatedStorage = game:GetService("ReplicatedStorage")
local _TweenService = game:GetService("TweenService")

--[[
    TYPES
--]]
local ClassTypes = require(_ReplicatedStorage.framework.stax.types.classes)

--[[
    IMPORTS
--]]
local Tweens = {
	["Default"] = {
		Open = function(time: number, scriptable: Model)
			local door = scriptable.PrimaryPart
			local Info = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
			local Tween = _TweenService:Create(door, Info, {
				CFrame = door.CFrame * CFrame.new(0, door.Size.Y, 0),
			})

			Tween:Play()
		end,
		Close = function(time: number, scriptable: Model)
			local door = scriptable.PrimaryPart
			local Info = TweenInfo.new(time, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0)
			local Tween = _TweenService:Create(door, Info, {
				CFrame = door.CFrame * CFrame.new(0, -door.Size.Y, 0),
			})

			Tween:Play()
		end,
	},
}

local Door: ClassTypes.Door = {}

function Door.new(doorModel: Model): ClassTypes.Door
	return setmetatable({
		_doorModel = doorModel,
		type = doorModel:GetAttribute("DoorType"),
	}, Door)
end

--! BYPASSING CI LINTER
function Door.Open(door: ClassTypes.Door)
	local scriptable = door._doorModel:FindFirstChild("Scriptables")

	if not scriptable then
		return
	end
	if not door.type then
		return
	end
	if not Tweens[door.type] then
		return
	end

	Tweens[door.type].Open(5, scriptable)
end

function Door.Close(door: ClassTypes.Door)
	local scriptable = door._doorModel:FindFirstChild("Scriptables")

	if not scriptable then
		return
	end
	if not door.type then
		return
	end
	if not Tweens[door.type] then
		return
	end

	Tweens[door.type].Close(5, scriptable)
end

return Door

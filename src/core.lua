Core = {}

Attunement.AddOnLoad(function()
	Core.Active = Options.Active
	
	-- Core.Console = Attunement.Debug.Console:Enable()
	
	Core.SettingsButton = {}
	Core.SettingsButton.Locked = true
	
	Core.SettingsButton.On = Attunement.Texture:New {
		Layer = "Dialog",
	
		X = Options.SettingsButton.X,
		Y = Options.SettingsButton.Y,
		Width = 32,
		Height = 32,
		
		FilePath = "res/interface/settingsButtonColor.png",
		
		OnMouseLeftDown = function()
			Core.Active = not Core.Active
		end,
		
		OnMouseRightDown = function()
			Core.SettingsButton.Locked = false
		end
	}
	
	Core.SettingsButton.Off = Attunement.Texture:New {
		Layer = "Dialog",
	
		X = Options.SettingsButton.X,
		Y = Options.SettingsButton.Y,
		Width = 32,
		Height = 32,
		
		FilePath = "res/interface/settingsButtonGrey.png",
		
		OnMouseRightDown = function()
			Core.SettingsButton.On.X = Core.SettingsButton.Off.X
			Core.SettingsButton.On.Y = Core.SettingsButton.Off.Y
			Core.SettingsButton.Locked = true
		end,
		
		Draggable = true
	}
	
	Core.Player = nil
	Core.Target = nil
	Core.TargetTarget = nil
	Core.Focus = nil
	
	Core.CombatantsList = nil
	Core.CombatEvents = nil
end)

function UpdateCore()
	Core.CombatantsList = FF.GetAllCombatants()
	Core.CombatEvents = FF.GetAllCombatEvents()

	Core.Player = FF.GetPlayer()
	Core.Target = FF.GetTarget()
	if Core.Target ~= nil and Core.Target.TargetID ~= 0 then
		for i = 0, Core.CombatantsList.Length - 1 do
			if Core.Target.TargetID == Core.CombatantsList[i].ID then
				Core.TargetTarget = Core.CombatantsList[i]
			end
		end
	else
		Core.TargetTarget = nil
	end
	Core.Focus = FF.GetFocusTarget()

	if Core.SettingsButton.Locked then
		Core.SettingsButton.On:Show()
		Core.SettingsButton.Off:Hide()
	else
		Core.SettingsButton.On:Hide()
		Core.SettingsButton.Off:Show()
	end
end

Attunement.AddOnFrame(function(ticks)
	UpdateCore()
	
	if Core.Active then
		UpdatePlayerUI()
		UpdateTargetUI()
		UpdateTargetTargetUI()
		UpdateFocusUI()
		
		UpdateCombo(ticks)
		UpdateCastBar()
	else
		UF_Player.Hide()
		UF_Target.Hide()
		UF_TargetTarget.Hide()
		UF_Focus.Hide()
	
		UF_Combo.Hide()
		UF_CastBar.Hide()
	end
end)

function getMetric(number)
	local class = {"k", "M", "G", "T", "P", "E", "Z", "Y"}
	local buffer = number
	local i = 0
	
	while(buffer > 10) do
		buffer = buffer / 10
		i = i + 1
	end
	
	i = math.floor(i/3)
	if i < 1 then
		return string.format("%.1f", number)
	else
		for j=1,i,1 do
			number = number / 1000
		end
		return string.format("%.1f%s", number, class[i])
	end
end

function PlayerUseAetherflow()
	if Core.Player.Job == "Acn" or Core.Player.Job == "Smn" or Core.Player.Job == "Sch" then
		return true
	end
	return false
end

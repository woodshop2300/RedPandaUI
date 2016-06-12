UF_CastBar = {}

Attunement.AddOnLoad(function()
	-- Player
	UF_CastBar.PlayerBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.CastBar.Player.PosX,
		Y = Options.CastBar.Player.PosY,
		Width = Options.CastBar.Player.Width,
		Height = Options.CastBar.Player.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.CastBar.Player.BorderSize,
		BorderColor = Options.CastBar.Player.BorderColor
	}
	
	UF_CastBar.PlayerTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_CastBar.PlayerBackground.X,
		Y = UF_CastBar.PlayerBackground.Y,
		Width = UF_CastBar.PlayerBackground.Width,
		Height = UF_CastBar.PlayerBackground.Height,
		
		ScaleCenterX = UF_CastBar.PlayerBackground.X,
		ScaleCenterY = UF_CastBar.PlayerBackground.Y,
		ScaleX = UF_CastBar.PlayerBackground.Width /256,
		ScaleY = UF_CastBar.PlayerBackground.Height /32,
		
		FilePath = "res/castBar/castTexture.png"
	}
	
	UF_CastBar.PlayerMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.PlayerTexture.X,
		Y = UF_CastBar.PlayerTexture.Y,
		Width = UF_CastBar.PlayerTexture.Width,
		Height = UF_CastBar.PlayerTexture.Height,
		
		Color = Options.CastBar.Player.Color
	}
	
	UF_CastBar.PlayerBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.PlayerTexture.X,
		Y = UF_CastBar.PlayerTexture.Y,
		Width = UF_CastBar.PlayerTexture.Width,
		Height = UF_CastBar.PlayerTexture.Height,
		
		ScaleCenterX = UF_CastBar.PlayerTexture.X,
		ScaleCenterY = UF_CastBar.PlayerTexture.Y,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_CastBar.PlayerTexture.X + UF_CastBar.PlayerTexture.Width
	}
	
	UF_CastBar.PlayerCastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.PlayerTexture.X + 5,
		Y = UF_CastBar.PlayerTexture.Y,
		Width = UF_CastBar.PlayerTexture.Width,
		Height = UF_CastBar.PlayerTexture.Height,
		
		FontSize = Options.CastBar.Player.TextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_CastBar.PlayerCastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.PlayerTexture.X - 5,
		Y = UF_CastBar.PlayerTexture.Y,
		Width = UF_CastBar.PlayerTexture.Width,
		Height = UF_CastBar.PlayerTexture.Height,
		
		FontSize = Options.CastBar.Player.TextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_CastBar.ShowPlayerCastBar = function()
		UF_CastBar.PlayerBackground:Show()
		UF_CastBar.PlayerTexture:Show()
		UF_CastBar.PlayerMask:Show()
		UF_CastBar.PlayerBar:Show()
		UF_CastBar.PlayerCastName:Show()
		UF_CastBar.PlayerCastTimer:Show()
	end
	
	UF_CastBar.HidePlayerCastBar = function()
		UF_CastBar.PlayerBackground:Hide()	
		UF_CastBar.PlayerTexture:Hide()
		UF_CastBar.PlayerMask:Hide()
		UF_CastBar.PlayerBar:Hide()
		UF_CastBar.PlayerCastName:Hide()
		UF_CastBar.PlayerCastTimer:Hide()
	end
	
	-- Target
	UF_CastBar.TargetBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.CastBar.Target.PosX,
		Y = Options.CastBar.Target.PosY,
		Width = Options.CastBar.Target.Width,
		Height = Options.CastBar.Target.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.CastBar.Target.BorderSize,
		BorderColor = Options.CastBar.Target.BorderColor
	}
	
	UF_CastBar.TargetTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_CastBar.TargetBackground.X,
		Y = UF_CastBar.TargetBackground.Y,
		Width = UF_CastBar.TargetBackground.Width,
		Height = UF_CastBar.TargetBackground.Height,
		
		ScaleCenterX = UF_CastBar.TargetBackground.X,
		ScaleCenterY = UF_CastBar.TargetBackground.Y,
		ScaleX = UF_CastBar.TargetBackground.Width /256,
		ScaleY = UF_CastBar.TargetBackground.Height /32,
		
		FilePath = "res/castBar/castTexture.png"
	}
	
	UF_CastBar.TargetMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.TargetTexture.X,
		Y = UF_CastBar.TargetTexture.Y,
		Width = UF_CastBar.TargetTexture.Width,
		Height = UF_CastBar.TargetTexture.Height,
		
		Color = Options.CastBar.Target.Color
	}
	
	UF_CastBar.TargetBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.TargetTexture.X,
		Y = UF_CastBar.TargetTexture.Y,
		Width = UF_CastBar.TargetTexture.Width,
		Height = UF_CastBar.TargetTexture.Height,
		
		ScaleCenterX = UF_CastBar.TargetTexture.X,
		ScaleCenterY = UF_CastBar.TargetTexture.Y,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_CastBar.TargetTexture.X + UF_CastBar.TargetTexture.Width
	}
	
	UF_CastBar.TargetCastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.TargetTexture.X + 5,
		Y = UF_CastBar.TargetTexture.Y,
		Width = UF_CastBar.TargetTexture.Width,
		Height = UF_CastBar.TargetTexture.Height,
		
		FontSize = Options.CastBar.Target.TextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_CastBar.TargetCastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.TargetTexture.X - 5,
		Y = UF_CastBar.TargetTexture.Y,
		Width = UF_CastBar.TargetTexture.Width,
		Height = UF_CastBar.TargetTexture.Height,
		
		FontSize = Options.CastBar.Target.TextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_CastBar.ShowTargetCastBar = function()
		UF_CastBar.TargetBackground:Show()
		UF_CastBar.TargetTexture:Show()
		UF_CastBar.TargetMask:Show()
		UF_CastBar.TargetBar:Show()
		UF_CastBar.TargetCastName:Show()
		UF_CastBar.TargetCastTimer:Show()
	end
	
	UF_CastBar.HideTargetCastBar = function()
		UF_CastBar.TargetBackground:Hide()	
		UF_CastBar.TargetTexture:Hide()
		UF_CastBar.TargetMask:Hide()
		UF_CastBar.TargetBar:Hide()
		UF_CastBar.TargetCastName:Hide()
		UF_CastBar.TargetCastTimer:Hide()
	end
	
	-- TargetTarget
	UF_CastBar.TargetTargetBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.CastBar.TargetTarget.PosX,
		Y = Options.CastBar.TargetTarget.PosY,
		Width = Options.CastBar.TargetTarget.Width,
		Height = Options.CastBar.TargetTarget.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.CastBar.TargetTarget.BorderSize,
		BorderColor = Options.CastBar.TargetTarget.BorderColor
	}
	
	UF_CastBar.TargetTargetTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_CastBar.TargetTargetBackground.X,
		Y = UF_CastBar.TargetTargetBackground.Y,
		Width = UF_CastBar.TargetTargetBackground.Width,
		Height = UF_CastBar.TargetTargetBackground.Height,
		
		ScaleCenterX = UF_CastBar.TargetTargetBackground.X,
		ScaleCenterY = UF_CastBar.TargetTargetBackground.Y,
		ScaleX = UF_CastBar.TargetTargetBackground.Width /256,
		ScaleY = UF_CastBar.TargetTargetBackground.Height /32,
		
		FilePath = "res/castBar/castTexture.png"
	}
	
	UF_CastBar.TargetTargetMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.TargetTargetTexture.X,
		Y = UF_CastBar.TargetTargetTexture.Y,
		Width = UF_CastBar.TargetTargetTexture.Width,
		Height = UF_CastBar.TargetTargetTexture.Height,
		
		Color = Options.CastBar.TargetTarget.Color
	}
	
	UF_CastBar.TargetTargetBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.TargetTargetTexture.X,
		Y = UF_CastBar.TargetTargetTexture.Y,
		Width = UF_CastBar.TargetTargetTexture.Width,
		Height = UF_CastBar.TargetTargetTexture.Height,
		
		ScaleCenterX = UF_CastBar.TargetTargetTexture.X,
		ScaleCenterY = UF_CastBar.TargetTargetTexture.Y,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_CastBar.TargetTargetTexture.X + UF_CastBar.TargetTargetTexture.Width
	}
	
	UF_CastBar.TargetTargetCastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.TargetTargetTexture.X + 5,
		Y = UF_CastBar.TargetTargetTexture.Y,
		Width = UF_CastBar.TargetTargetTexture.Width,
		Height = UF_CastBar.TargetTargetTexture.Height,
		
		FontSize = Options.CastBar.TargetTarget.TextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_CastBar.TargetTargetCastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.TargetTargetTexture.X - 5,
		Y = UF_CastBar.TargetTargetTexture.Y,
		Width = UF_CastBar.TargetTargetTexture.Width,
		Height = UF_CastBar.TargetTargetTexture.Height,
		
		FontSize = Options.CastBar.TargetTarget.TextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_CastBar.ShowTargetTargetCastBar = function()
		UF_CastBar.TargetTargetBackground:Show()
		UF_CastBar.TargetTargetTexture:Show()
		UF_CastBar.TargetTargetMask:Show()
		UF_CastBar.TargetTargetBar:Show()
		UF_CastBar.TargetTargetCastName:Show()
		UF_CastBar.TargetTargetCastTimer:Show()
	end
	
	UF_CastBar.HideTargetTargetCastBar = function()
		UF_CastBar.TargetTargetBackground:Hide()	
		UF_CastBar.TargetTargetTexture:Hide()
		UF_CastBar.TargetTargetMask:Hide()
		UF_CastBar.TargetTargetBar:Hide()
		UF_CastBar.TargetTargetCastName:Hide()
		UF_CastBar.TargetTargetCastTimer:Hide()
	end
	
	-- Focus
	UF_CastBar.FocusBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.CastBar.Focus.PosX,
		Y = Options.CastBar.Focus.PosY,
		Width = Options.CastBar.Focus.Width,
		Height = Options.CastBar.Focus.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.CastBar.Focus.BorderSize,
		BorderColor = Options.CastBar.Focus.BorderColor
	}
	
	UF_CastBar.FocusTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_CastBar.FocusBackground.X,
		Y = UF_CastBar.FocusBackground.Y,
		Width = UF_CastBar.FocusBackground.Width,
		Height = UF_CastBar.FocusBackground.Height,
		
		ScaleCenterX = UF_CastBar.FocusBackground.X,
		ScaleCenterY = UF_CastBar.FocusBackground.Y,
		ScaleX = UF_CastBar.FocusBackground.Width /256,
		ScaleY = UF_CastBar.FocusBackground.Height /32,
		
		FilePath = "res/castBar/castTexture.png"
	}
	
	UF_CastBar.FocusMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.FocusTexture.X,
		Y = UF_CastBar.FocusTexture.Y,
		Width = UF_CastBar.FocusTexture.Width,
		Height = UF_CastBar.FocusTexture.Height,
		
		Color = Options.CastBar.Focus.Color
	}
	
	UF_CastBar.FocusBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_CastBar.FocusTexture.X,
		Y = UF_CastBar.FocusTexture.Y,
		Width = UF_CastBar.FocusTexture.Width,
		Height = UF_CastBar.FocusTexture.Height,
		
		ScaleCenterX = UF_CastBar.FocusTexture.X,
		ScaleCenterY = UF_CastBar.FocusTexture.Y,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_CastBar.FocusTexture.X + UF_CastBar.FocusTexture.Width
	}
	
	UF_CastBar.FocusCastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.FocusTexture.X + 5,
		Y = UF_CastBar.FocusTexture.Y,
		Width = UF_CastBar.FocusTexture.Width,
		Height = UF_CastBar.FocusTexture.Height,
		
		FontSize = Options.CastBar.Focus.TextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_CastBar.FocusCastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_CastBar.FocusTexture.X - 5,
		Y = UF_CastBar.FocusTexture.Y,
		Width = UF_CastBar.FocusTexture.Width,
		Height = UF_CastBar.FocusTexture.Height,
		
		FontSize = Options.CastBar.Focus.TextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_CastBar.ShowFocusCastBar = function()
		UF_CastBar.FocusBackground:Show()
		UF_CastBar.FocusTexture:Show()
		UF_CastBar.FocusMask:Show()
		UF_CastBar.FocusBar:Show()
		UF_CastBar.FocusCastName:Show()
		UF_CastBar.FocusCastTimer:Show()
	end
	
	UF_CastBar.HideFocusCastBar = function()
		UF_CastBar.FocusBackground:Hide()	
		UF_CastBar.FocusTexture:Hide()
		UF_CastBar.FocusMask:Hide()
		UF_CastBar.FocusBar:Hide()
		UF_CastBar.FocusCastName:Hide()
		UF_CastBar.FocusCastTimer:Hide()
	end
	
	UF_CastBar.Hide = function ()
		UF_CastBar.HidePlayerCastBar()
		UF_CastBar.HideTargetCastBar()
		UF_CastBar.HideTargetTargetCastBar()
		UF_CastBar.HideFocusCastBar()
	end
end)

function UpdateCastBar()
	if Options.CastBar.Show then
		-- Player
		if Options.CastBar.Player.Show and Core.Player ~= nil then
			if Core.Player.IsCasting then
				UF_CastBar.PlayerBar.ScaleX = 1 - Core.Player.CastDurationCurrent / Core.Player.CastDurationTotal
				UF_CastBar.PlayerCastName.Text = Core.Player.CastingSkillName
				UF_CastBar.PlayerCastTimer.Text = string.format("%.1f", Core.Player.CastDurationTotal - Core.Player.CastDurationCurrent)
				
				UF_CastBar.ShowPlayerCastBar()
			else
				UF_CastBar.HidePlayerCastBar()
			end
		else
			UF_CastBar.HidePlayerCastBar()
		end
		
		-- Target
		if Options.CastBar.Target.Show and Core.Target ~= nil then
			if Core.Target.IsCasting then
				UF_CastBar.TargetBar.ScaleX = 1 - Core.Target.CastDurationCurrent / Core.Target.CastDurationTotal
				UF_CastBar.TargetCastName.Text = Core.Target.CastingSkillName
				UF_CastBar.TargetCastTimer.Text = string.format("%.1f", Core.Target.CastDurationTotal - Core.Target.CastDurationCurrent)
			
				UF_CastBar.ShowTargetCastBar()
			else
				UF_CastBar.HideTargetCastBar()
			end
		else
			UF_CastBar.HideTargetCastBar()
		end
		
		-- TargetTarget
		if Options.CastBar.TargetTarget.Show and Core.TargetTarget ~= nil then
			if Core.TargetTarget.IsCasting then
				UF_CastBar.TargetTargetBar.ScaleX = 1 - Core.TargetTarget.CastDurationCurrent / Core.TargetTarget.CastDurationTotal
				UF_CastBar.TargetTargetCastName.Text = Core.TargetTarget.CastingSkillName
				UF_CastBar.TargetTargetCastTimer.Text = string.format("%.1f", Core.TargetTarget.CastDurationTotal - Core.TargetTarget.CastDurationCurrent)
				
				UF_CastBar.ShowTargetTargetCastBar()
			else
				UF_CastBar.HideTargetTargetCastBar()
			end
		else
			UF_CastBar.HideTargetTargetCastBar()
		end
		
		-- Focus
		if Options.CastBar.Focus.Show and Core.Focus ~= nil then
			if Core.Focus.IsCasting then
				UF_CastBar.FocusBar.ScaleX = 1 - Core.Focus.CastDurationCurrent / Core.Focus.CastDurationTotal
				UF_CastBar.FocusCastName.Text = Core.Focus.CastingSkillName
				UF_CastBar.FocusCastTimer.Text = string.format("%.1f", Core.Focus.CastDurationTotal - Core.Focus.CastDurationCurrent)
			
				UF_CastBar.ShowFocusCastBar()
			else
				UF_CastBar.HideFocusCastBar()
			end
		else
			UF_CastBar.HideFocusCastBar()
		end
		
	else
		-- Hide all
		UF_CastBar.HidePlayerCastBar()
		UF_CastBar.HideTargetCastBar()
		UF_CastBar.HideTargetTargetCastBar()
		UF_CastBar.HideFocusCastBar()
	end
end

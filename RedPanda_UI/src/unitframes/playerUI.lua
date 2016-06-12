UF_Player = {}

Attunement.AddOnLoad(function()

	-- Background
	UF_Player.Background = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.UIFrames.Player.PosX,
		Y = Options.UIFrames.Player.PosY,
		Width = Options.UIFrames.Player.Width,
		Height = Options.UIFrames.Player.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}

	UF_Player.PlayerName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.Background.X + 2,
		Y = UF_Player.Background.Y + 1,
		Width = UF_Player.Background.Width,
		Height = UF_Player.Background.Height,
		
		FontSize = Options.UIFrames.Player.NameTextSize
	}
	
	-- Health Bar
	UF_Player.HealthTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Player.Background.X,
		Y = UF_Player.Background.Y,
		Width = UF_Player.Background.Width,
		Height = UF_Player.Background.Height * 0.6,
		
		ScaleCenterX = UF_Player.Background.X,
		ScaleCenterY = UF_Player.Background.Y,
		ScaleX = UF_Player.Background.Width / 256,
		ScaleY = UF_Player.Background.Height * 0.6 / 32,
		
		FilePath = "res/bar/healthBar.png"
	}
	
	if Options.UIFrames.Player.ShowHealthOnly then
		UF_Player.HealthTexture.Height = UF_Player.Background.Height
		UF_Player.HealthTexture.ScaleY = UF_Player.Background.Height / 32
	end
	
	UF_Player.HealthMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.HealthTexture.X,
		Y = UF_Player.HealthTexture.Y,
		Width = UF_Player.HealthTexture.Width,
		Height = UF_Player.HealthTexture.Height,
		
		Color = Options.UIFrames.HPColor
	}
	
	UF_Player.HealthBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.HealthTexture.X,
		Y = UF_Player.HealthTexture.Y,
		Width = UF_Player.HealthTexture.Width,
		Height = UF_Player.HealthTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Player.HealthTexture.X + UF_Player.HealthTexture.Width
	}
	
	UF_Player.HealthAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.HealthTexture.X + 5,
		Y = UF_Player.HealthTexture.Y,
		Width = UF_Player.HealthTexture.Width,
		Height = UF_Player.HealthTexture.Height,
		
		FontSize = Options.UIFrames.Player.HealthTextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_Player.HealthPercent = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.HealthTexture.X - 5,
		Y = UF_Player.HealthTexture.Y,
		Width = UF_Player.HealthTexture.Width,
		Height = UF_Player.HealthTexture.Height,
		
		FontSize = Options.UIFrames.Player.HealthTextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	-- Resource Bar
	UF_Player.ResourceTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Player.Background.X,
		Y = UF_Player.Background.Y + UF_Player.HealthTexture.Height,
		Width = UF_Player.Background.Width,
		Height = UF_Player.Background.Height * 0.2,
		
		ScaleCenterX = UF_Player.Background.X,
		ScaleCenterY = UF_Player.Background.Y + UF_Player.HealthTexture.Height,
		ScaleX = UF_Player.Background.Width / 256,
		ScaleY = UF_Player.Background.Height * 0.2 / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_Player.ResourceMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.ResourceTexture.X,
		Y = UF_Player.ResourceTexture.Y,
		Width = UF_Player.ResourceTexture.Width,
		Height = UF_Player.ResourceTexture.Height
	}
	
	UF_Player.ResourceBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.ResourceTexture.X,
		Y = UF_Player.ResourceTexture.Y,
		Width = UF_Player.ResourceTexture.Width,
		Height = UF_Player.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Player.ResourceTexture.X + UF_Player.ResourceTexture.Width
	}
	
	UF_Player.ResourceAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.ResourceTexture.X + 5,
		Y = UF_Player.ResourceTexture.Y,
		Width = UF_Player.ResourceTexture.Width,
		Height = UF_Player.ResourceTexture.Height,
		
		FontSize = Options.UIFrames.Player.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Tactical Bar
	UF_Player.TacticalTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Player.Background.X,
		Y = UF_Player.ResourceTexture.Y + UF_Player.ResourceTexture.Height,
		Width = UF_Player.Background.Width,
		Height = UF_Player.ResourceTexture.Height,
		
		ScaleCenterX = UF_Player.Background.X,
		ScaleCenterY = UF_Player.ResourceTexture.Y + UF_Player.ResourceTexture.Height,
		ScaleX = UF_Player.Background.Width / 256,
		ScaleY = UF_Player.ResourceTexture.Height / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_Player.TacticalMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.TacticalTexture.X,
		Y = UF_Player.TacticalTexture.Y,
		Width = UF_Player.TacticalTexture.Width,
		Height = UF_Player.TacticalTexture.Height,
		
		Color = Options.UIFrames.TPColor
	}
	
	UF_Player.TacticalBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.TacticalTexture.X,
		Y = UF_Player.TacticalTexture.Y,
		Width = UF_Player.TacticalTexture.Width,
		Height = UF_Player.TacticalTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Player.TacticalTexture.X + UF_Player.TacticalTexture.Width
	}
	
	UF_Player.TacticalAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.TacticalTexture.X + 5,
		Y = UF_Player.TacticalTexture.Y,
		Width = UF_Player.TacticalTexture.Width,
		Height = UF_Player.TacticalTexture.Height,
		
		FontSize = Options.UIFrames.Player.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Cast Bar
	UF_Player.CastBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_Player.Background.X,
		Y = UF_Player.Background.Y - UF_Player.ResourceTexture.Height,
		Width = UF_Player.Background.Width,
		Height = UF_Player.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}
	
	UF_Player.CastTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Player.CastBackground.X,
		Y = UF_Player.CastBackground.Y,
		Width = UF_Player.CastBackground.Width,
		Height = UF_Player.CastBackground.Height,
		
		ScaleCenterX = UF_Player.CastBackground.X,
		ScaleCenterY = UF_Player.CastBackground.Y,
		ScaleX = UF_Player.CastBackground.Width / 256,
		ScaleY = UF_Player.CastBackground.Height / 32,
		
		FilePath = "res/bar/castBar.png"
	}
	
	UF_Player.CastMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.CastBackground.X,
		Y = UF_Player.CastBackground.Y,
		Width = UF_Player.CastBackground.Width,
		Height = UF_Player.CastBackground.Height,
		
		Color = Options.UIFrames.CastColor
	}
	
	UF_Player.CastBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Player.CastBackground.X,
		Y = UF_Player.CastBackground.Y,
		Width = UF_Player.CastBackground.Width,
		Height = UF_Player.CastBackground.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Player.CastBackground.X + UF_Player.CastBackground.Width
	}
	
	UF_Player.CastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.CastBackground.X + 5,
		Y = UF_Player.CastBackground.Y,
		Width = UF_Player.CastBar.Width,
		Height = UF_Player.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2
	}
	
	UF_Player.CastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Player.CastBackground.X - 5,
		Y = UF_Player.CastBackground.Y,
		Width = UF_Player.CastBar.Width,
		Height = UF_Player.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_Player.Hide = function()
		UF_Player.Background:Hide()
		UF_Player.PlayerName:Hide()
		
		UF_Player.HealthTexture:Hide()
		UF_Player.HealthMask:Hide()
		UF_Player.HealthBar:Hide()
		UF_Player.HealthAmount:Hide()
		UF_Player.HealthPercent:Hide()
	
		UF_Player.ResourceTexture:Hide()
		UF_Player.ResourceMask:Hide()
		UF_Player.ResourceBar:Hide()
		UF_Player.ResourceAmount:Hide()

		UF_Player.TacticalTexture:Hide()
		UF_Player.TacticalMask:Hide()
		UF_Player.TacticalBar:Hide()
		UF_Player.TacticalAmount:Hide()
		
		UF_Player.CastBackground:Hide()
		UF_Player.CastTexture:Hide()
		UF_Player.CastMask:Hide()
		UF_Player.CastBar:Hide()
		UF_Player.CastName:Hide()
		UF_Player.CastTimer:Hide()
	end
	
	UF_Player.ShowCast = function()
		UF_Player.CastBackground:Show()
		UF_Player.CastTexture:Show()
		UF_Player.CastMask:Show()
		UF_Player.CastBar:Show()
		UF_Player.CastName:Show()
		UF_Player.CastTimer:Show()
	end
	
	UF_Player.HideCast = function()
		UF_Player.CastBackground:Hide()
		UF_Player.CastTexture:Hide()
		UF_Player.CastMask:Hide()
		UF_Player.CastBar:Hide()
		UF_Player.CastName:Hide()
		UF_Player.CastTimer:Hide()
	end
end)

function UpdatePlayerUI()
	if Options.UIFrames.Player.Show and Core.Player ~= nil then
		
		-- Updating Name
		if Options.UIFrames.Player.ShowName then
			if Core.Player.Job ~= "Unknown" then
				UF_Player.PlayerName.Text = string.format("%d - %s (%s)", Core.Player.Level, Core.Player.Name, Core.Player.Job)
			else
				UF_Player.PlayerName.Text = string.format("%d - %s", Core.Player.Level, Core.Player.Name)
			end
		end
		
		-- Updating Health
		UF_Player.HealthBar.ScaleX = 1 - Core.Player.CurrentHP / Core.Player.MaxHP
		UF_Player.HealthAmount.Text = getMetric(Core.Player.CurrentHP) .. "/" .. getMetric(Core.Player.MaxHP)
		UF_Player.HealthPercent.Text = string.format("|%d%%", 100 * Core.Player.CurrentHP / Core.Player.MaxHP)
		
		-- Updating Resource
		if Core.Player.MaxMP > 0 then
			UF_Player.ResourceMask.Color = Options.UIFrames.MPColor
			UF_Player.ResourceBar.ScaleX = 1 - Core.Player.CurrentMP / Core.Player.MaxMP
			UF_Player.ResourceAmount.Text = string.format("%d/%d", Core.Player.CurrentMP, Core.Player.MaxMP)
		elseif Core.Player.MaxCP > 0 then
			UF_Player.ResourceMask.Color = Options.UIFrames.CPColor
			UF_Player.ResourceBar.ScaleX = 1 - Core.Player.CurrentCP / Core.Player.MaxCP
			UF_Player.ResourceAmount.Text = string.format("%d/%d", Core.Player.CurrentCP, Core.Player.MaxCP)
		elseif Core.Player.MaxGP > 0 then
			UF_Player.ResourceMask.Color = Options.UIFrames.GPColor
			UF_Player.ResourceBar.ScaleX = 1 - Core.Player.CurrentGP / Core.Player.MaxGP
			UF_Player.ResourceAmount.Text = string.format("%d/%d", Core.Player.CurrentGP, Core.Player.MaxGP)
		else
			UF_Player.ResourceMask.Color = Options.UIFrames.MPColor
			UF_Player.ResourceBar.ScaleX = 0
			UF_Player.ResourceAmount.Text = ""
		end
		
		-- Updating Tactical
		UF_Player.TacticalBar.ScaleX = 1 - Core.Player.CurrentTP / Core.Player.MaxTP
		UF_Player.TacticalAmount.Text = string.format ("%d/%d", Core.Player.CurrentTP, Core.Player.MaxTP)
		
		-- Detecting Cast
		if Options.UIFrames.Player.ShowCast and Core.Player.IsCasting then
			UF_Player.CastBar.ScaleX = 1 - Core.Player.CastDurationCurrent / Core.Player.CastDurationTotal
			UF_Player.CastName.Text = Core.Player.CastingSkillName
			UF_Player.CastTimer.Text = string.format("%.1f", Core.Player.CastDurationTotal - Core.Player.CastDurationCurrent)
			
			UF_Player.ShowCast()
		else
			UF_Player.HideCast()
		end
		
		-- Showing everything
		UF_Player.Background:Show()
		UF_Player.PlayerName:Show()
		UF_Player.HealthTexture:Show()
		UF_Player.HealthMask:Show()
		UF_Player.HealthBar:Show()
		UF_Player.HealthAmount:Show()
		UF_Player.HealthPercent:Show()
		
		if Options.UIFrames.Player.ShowHealthOnly == false then
			UF_Player.ResourceTexture:Show()
			UF_Player.ResourceMask:Show()
			UF_Player.ResourceBar:Show()
			UF_Player.ResourceAmount:Show()
				
			UF_Player.TacticalTexture:Show()
			UF_Player.TacticalMask:Show()
			UF_Player.TacticalBar:Show()
			UF_Player.TacticalAmount:Show()
		end
	else
		-- Hiding everything
		UF_Player.Hide()
	end
end

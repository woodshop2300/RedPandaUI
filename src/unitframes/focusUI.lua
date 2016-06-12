UF_Focus = {}

Attunement.AddOnLoad(function()

	-- Background
	UF_Focus.Background = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.UIFrames.Focus.PosX,
		Y = Options.UIFrames.Focus.PosY,
		Width = Options.UIFrames.Focus.Width,
		Height = Options.UIFrames.Focus.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}

	UF_Focus.FocusName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.Background.X + 2,
		Y = UF_Focus.Background.Y + 1,
		Width = UF_Focus.Background.Width,
		Height = UF_Focus.Background.Height,
		
		FontSize = Options.UIFrames.Focus.NameTextSize
	}
	
	-- Health Bar
	UF_Focus.HealthTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Focus.Background.X,
		Y = UF_Focus.Background.Y,
		Width = UF_Focus.Background.Width,
		Height = UF_Focus.Background.Height * 0.6,
		
		ScaleCenterX = UF_Focus.Background.X,
		ScaleCenterY = UF_Focus.Background.Y,
		ScaleX = UF_Focus.Background.Width / 256,
		ScaleY = UF_Focus.Background.Height * 0.6 / 32,
		
		FilePath = "res/bar/healthBar.png"
	}
	
	if Options.UIFrames.Focus.ShowHealthOnly then
		UF_Focus.HealthTexture.Height = UF_Focus.Background.Height
		UF_Focus.HealthTexture.ScaleY = UF_Focus.Background.Height / 32
	end
	
	UF_Focus.HealthMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.HealthTexture.X,
		Y = UF_Focus.HealthTexture.Y,
		Width = UF_Focus.HealthTexture.Width,
		Height = UF_Focus.HealthTexture.Height,
		
		Color = Options.UIFrames.HPColor
	}
	
	UF_Focus.HealthBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.HealthTexture.X,
		Y = UF_Focus.HealthTexture.Y,
		Width = UF_Focus.HealthTexture.Width,
		Height = UF_Focus.HealthTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Focus.HealthTexture.X + UF_Focus.HealthTexture.Width
	}
	
	UF_Focus.HealthAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.HealthTexture.X + 5,
		Y = UF_Focus.HealthTexture.Y,
		Width = UF_Focus.HealthTexture.Width,
		Height = UF_Focus.HealthTexture.Height,
		
		FontSize = Options.UIFrames.Focus.HealthTextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_Focus.HealthPercent = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.HealthTexture.X - 5,
		Y = UF_Focus.HealthTexture.Y,
		Width = UF_Focus.HealthTexture.Width,
		Height = UF_Focus.HealthTexture.Height,
		
		FontSize = Options.UIFrames.Focus.HealthTextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	-- Resource Bar
	UF_Focus.ResourceTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Focus.Background.X,
		Y = UF_Focus.Background.Y + UF_Focus.HealthTexture.Height,
		Width = UF_Focus.Background.Width,
		Height = UF_Focus.Background.Height * 0.2,
		
		ScaleCenterX = UF_Focus.Background.X,
		ScaleCenterY = UF_Focus.Background.Y + UF_Focus.HealthTexture.Height,
		ScaleX = UF_Focus.Background.Width / 256,
		ScaleY = UF_Focus.Background.Height * 0.2 / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_Focus.ResourceMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.ResourceTexture.X,
		Y = UF_Focus.ResourceTexture.Y,
		Width = UF_Focus.ResourceTexture.Width,
		Height = UF_Focus.ResourceTexture.Height
	}
	
	UF_Focus.ResourceBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.ResourceTexture.X,
		Y = UF_Focus.ResourceTexture.Y,
		Width = UF_Focus.ResourceTexture.Width,
		Height = UF_Focus.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Focus.ResourceTexture.X + UF_Focus.ResourceTexture.Width
	}
	
	UF_Focus.ResourceAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.ResourceTexture.X + 5,
		Y = UF_Focus.ResourceTexture.Y,
		Width = UF_Focus.ResourceTexture.Width,
		Height = UF_Focus.ResourceTexture.Height,
		
		FontSize = Options.UIFrames.Focus.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Tactical Bar
	UF_Focus.TacticalTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Focus.Background.X,
		Y = UF_Focus.ResourceTexture.Y + UF_Focus.ResourceTexture.Height,
		Width = UF_Focus.Background.Width,
		Height = UF_Focus.ResourceTexture.Height,
		
		ScaleCenterX = UF_Focus.Background.X,
		ScaleCenterY = UF_Focus.ResourceTexture.Y + UF_Focus.ResourceTexture.Height,
		ScaleX = UF_Focus.Background.Width / 256,
		ScaleY = UF_Focus.ResourceTexture.Height / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_Focus.TacticalMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.TacticalTexture.X,
		Y = UF_Focus.TacticalTexture.Y,
		Width = UF_Focus.TacticalTexture.Width,
		Height = UF_Focus.TacticalTexture.Height,
		
		Color = Options.UIFrames.TPColor
	}
	
	UF_Focus.TacticalBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.TacticalTexture.X,
		Y = UF_Focus.TacticalTexture.Y,
		Width = UF_Focus.TacticalTexture.Width,
		Height = UF_Focus.TacticalTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Focus.TacticalTexture.X + UF_Focus.TacticalTexture.Width
	}
	
	UF_Focus.TacticalAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.TacticalTexture.X + 5,
		Y = UF_Focus.TacticalTexture.Y,
		Width = UF_Focus.TacticalTexture.Width,
		Height = UF_Focus.TacticalTexture.Height,
		
		FontSize = Options.UIFrames.Focus.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Cast Bar
	UF_Focus.CastBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_Focus.Background.X,
		Y = UF_Focus.Background.Y - UF_Focus.ResourceTexture.Height,
		Width = UF_Focus.Background.Width,
		Height = UF_Focus.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}
	
	UF_Focus.CastTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Focus.CastBackground.X,
		Y = UF_Focus.CastBackground.Y,
		Width = UF_Focus.CastBackground.Width,
		Height = UF_Focus.CastBackground.Height,
		
		ScaleCenterX = UF_Focus.CastBackground.X,
		ScaleCenterY = UF_Focus.CastBackground.Y,
		ScaleX = UF_Focus.CastBackground.Width / 256,
		ScaleY = UF_Focus.CastBackground.Height / 32,
		
		FilePath = "res/bar/castBar.png"
	}
	
	UF_Focus.CastMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.CastBackground.X,
		Y = UF_Focus.CastBackground.Y,
		Width = UF_Focus.CastBackground.Width,
		Height = UF_Focus.CastBackground.Height,
		
		Color = Options.UIFrames.CastColor
	}
	
	UF_Focus.CastBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Focus.CastBackground.X,
		Y = UF_Focus.CastBackground.Y,
		Width = UF_Focus.CastBackground.Width,
		Height = UF_Focus.CastBackground.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Focus.CastBackground.X + UF_Focus.CastBackground.Width
	}
	
	UF_Focus.CastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.CastBackground.X + 5,
		Y = UF_Focus.CastBackground.Y,
		Width = UF_Focus.CastBar.Width,
		Height = UF_Focus.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2
	}
	
	UF_Focus.CastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Focus.CastBackground.X - 5,
		Y = UF_Focus.CastBackground.Y,
		Width = UF_Focus.CastBar.Width,
		Height = UF_Focus.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_Focus.Hide = function()
		UF_Focus.Background:Hide()
		UF_Focus.FocusName:Hide()
		
		UF_Focus.HealthTexture:Hide()
		UF_Focus.HealthMask:Hide()
		UF_Focus.HealthBar:Hide()
		UF_Focus.HealthAmount:Hide()
		UF_Focus.HealthPercent:Hide()
	
		UF_Focus.ResourceTexture:Hide()
		UF_Focus.ResourceMask:Hide()
		UF_Focus.ResourceBar:Hide()
		UF_Focus.ResourceAmount:Hide()

		UF_Focus.TacticalTexture:Hide()
		UF_Focus.TacticalMask:Hide()
		UF_Focus.TacticalBar:Hide()
		UF_Focus.TacticalAmount:Hide()
		
		UF_Focus.CastBackground:Hide()
		UF_Focus.CastTexture:Hide()
		UF_Focus.CastMask:Hide()
		UF_Focus.CastBar:Hide()
		UF_Focus.CastName:Hide()
		UF_Focus.CastTimer:Hide()
	end
	
	UF_Focus.ShowCast = function()
		UF_Focus.CastBackground:Show()
		UF_Focus.CastTexture:Show()
		UF_Focus.CastMask:Show()
		UF_Focus.CastBar:Show()
		UF_Focus.CastName:Show()
		UF_Focus.CastTimer:Show()
	end
	
	UF_Focus.HideCast = function()
		UF_Focus.CastBackground:Hide()
		UF_Focus.CastTexture:Hide()
		UF_Focus.CastMask:Hide()
		UF_Focus.CastBar:Hide()
		UF_Focus.CastName:Hide()
		UF_Focus.CastTimer:Hide()
	end
end)

function UpdateFocusUI()
	if Options.UIFrames.Focus.Show and Core.Focus ~= nil then
		
		-- Updating Name
		if Options.UIFrames.Focus.ShowName then
			if Core.Focus.Job ~= "Unknown" then
				UF_Focus.FocusName.Text = string.format("%d - %s (%s)", Core.Focus.Level, Core.Focus.Name, Core.Focus.Job)
			else
				UF_Focus.FocusName.Text = string.format("%d - %s", Core.Focus.Level, Core.Focus.Name)
			end
		end
		
		-- Updating Health
		UF_Focus.HealthBar.ScaleX = 1 - Core.Focus.CurrentHP / Core.Focus.MaxHP
		UF_Focus.HealthAmount.Text = getMetric(Core.Focus.CurrentHP) .. "/" .. getMetric(Core.Focus.MaxHP)
		UF_Focus.HealthPercent.Text = string.format("|%d%%", 100 * Core.Focus.CurrentHP / Core.Focus.MaxHP)
		
		-- Updating Resource
		if Core.Focus.MaxMP > 0 then
			UF_Focus.ResourceMask.Color = Options.UIFrames.MPColor
			UF_Focus.ResourceBar.ScaleX = 1 - Core.Focus.CurrentMP / Core.Focus.MaxMP
			UF_Focus.ResourceAmount.Text = string.format("%d/%d", Core.Focus.CurrentMP, Core.Focus.MaxMP)
		elseif Core.Focus.MaxCP > 0 then
			UF_Focus.ResourceMask.Color = Options.UIFrames.CPColor
			UF_Focus.ResourceBar.ScaleX = 1 - Core.Focus.CurrentCP / Core.Focus.MaxCP
			UF_Focus.ResourceAmount.Text = string.format("%d/%d", Core.Focus.CurrentCP, Core.Focus.MaxCP)
		elseif Core.Focus.MaxGP > 0 then
			UF_Focus.ResourceMask.Color = Options.UIFrames.GPColor
			UF_Focus.ResourceBar.ScaleX = 1 - Core.Focus.CurrentGP / Core.Focus.MaxGP
			UF_Focus.ResourceAmount.Text = string.format("%d/%d", Core.Focus.CurrentGP, Core.Focus.MaxGP)
		else
			UF_Focus.ResourceMask.Color = Options.UIFrames.MPColor
			UF_Focus.ResourceBar.ScaleX = 0
			UF_Focus.ResourceAmount.Text = ""
		end
		
		-- Updating Tactical
		UF_Focus.TacticalBar.ScaleX = 1 - Core.Focus.CurrentTP / Core.Focus.MaxTP
		UF_Focus.TacticalAmount.Text = string.format ("%d/%d", Core.Focus.CurrentTP, Core.Focus.MaxTP)
		
		-- Detecting Cast
		if Options.UIFrames.Focus.ShowCast and Core.Focus.IsCasting then
			UF_Focus.CastBar.ScaleX = 1 - Core.Focus.CastDurationCurrent / Core.Focus.CastDurationTotal
			UF_Focus.CastName.Text = Core.Focus.CastingSkillName
			UF_Focus.CastTimer.Text = string.format("%.1f", Core.Focus.CastDurationTotal - Core.Focus.CastDurationCurrent)
			
			UF_Focus.ShowCast()
		else
			UF_Focus.HideCast()
		end
		
		-- Showing everything
		UF_Focus.Background:Show()
		UF_Focus.FocusName:Show()
		UF_Focus.HealthTexture:Show()
		UF_Focus.HealthMask:Show()
		UF_Focus.HealthBar:Show()
		UF_Focus.HealthAmount:Show()
		UF_Focus.HealthPercent:Show()
		
		if Options.UIFrames.Focus.ShowHealthOnly == false then
			UF_Focus.ResourceTexture:Show()
			UF_Focus.ResourceMask:Show()
			UF_Focus.ResourceBar:Show()
			UF_Focus.ResourceAmount:Show()
				
			UF_Focus.TacticalTexture:Show()
			UF_Focus.TacticalMask:Show()
			UF_Focus.TacticalBar:Show()
			UF_Focus.TacticalAmount:Show()
		end
	else
		-- Hiding everything
		UF_Focus.Hide()
	end
end

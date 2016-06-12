UF_TargetTarget = {}

Attunement.AddOnLoad(function()

	-- Background
	UF_TargetTarget.Background = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.UIFrames.TargetTarget.PosX,
		Y = Options.UIFrames.TargetTarget.PosY,
		Width = Options.UIFrames.TargetTarget.Width,
		Height = Options.UIFrames.TargetTarget.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}

	UF_TargetTarget.TargetTargetName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.Background.X + 2,
		Y = UF_TargetTarget.Background.Y + 1,
		Width = UF_TargetTarget.Background.Width,
		Height = UF_TargetTarget.Background.Height,
		
		FontSize = Options.UIFrames.TargetTarget.NameTextSize
	}
	
	-- Health Bar
	UF_TargetTarget.HealthTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_TargetTarget.Background.X,
		Y = UF_TargetTarget.Background.Y,
		Width = UF_TargetTarget.Background.Width,
		Height = UF_TargetTarget.Background.Height * 0.6,
		
		ScaleCenterX = UF_TargetTarget.Background.X,
		ScaleCenterY = UF_TargetTarget.Background.Y,
		ScaleX = UF_TargetTarget.Background.Width / 256,
		ScaleY = UF_TargetTarget.Background.Height * 0.6 / 32,
		
		FilePath = "res/bar/healthBar.png"
	}
	
	if Options.UIFrames.TargetTarget.ShowHealthOnly then
		UF_TargetTarget.HealthTexture.Height = UF_TargetTarget.Background.Height
		UF_TargetTarget.HealthTexture.ScaleY = UF_TargetTarget.Background.Height / 32
	end
	
	UF_TargetTarget.HealthMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.HealthTexture.X,
		Y = UF_TargetTarget.HealthTexture.Y,
		Width = UF_TargetTarget.HealthTexture.Width,
		Height = UF_TargetTarget.HealthTexture.Height,
		
		Color = Options.UIFrames.HPColor
	}
	
	UF_TargetTarget.HealthBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.HealthTexture.X,
		Y = UF_TargetTarget.HealthTexture.Y,
		Width = UF_TargetTarget.HealthTexture.Width,
		Height = UF_TargetTarget.HealthTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_TargetTarget.HealthTexture.X + UF_TargetTarget.HealthTexture.Width
	}
	
	UF_TargetTarget.HealthAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.HealthTexture.X + 5,
		Y = UF_TargetTarget.HealthTexture.Y,
		Width = UF_TargetTarget.HealthTexture.Width,
		Height = UF_TargetTarget.HealthTexture.Height,
		
		FontSize = Options.UIFrames.TargetTarget.HealthTextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_TargetTarget.HealthPercent = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.HealthTexture.X - 5,
		Y = UF_TargetTarget.HealthTexture.Y,
		Width = UF_TargetTarget.HealthTexture.Width,
		Height = UF_TargetTarget.HealthTexture.Height,
		
		FontSize = Options.UIFrames.TargetTarget.HealthTextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	-- Resource Bar
	UF_TargetTarget.ResourceTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_TargetTarget.Background.X,
		Y = UF_TargetTarget.Background.Y + UF_TargetTarget.HealthTexture.Height,
		Width = UF_TargetTarget.Background.Width,
		Height = UF_TargetTarget.Background.Height * 0.2,
		
		ScaleCenterX = UF_TargetTarget.Background.X,
		ScaleCenterY = UF_TargetTarget.Background.Y + UF_TargetTarget.HealthTexture.Height,
		ScaleX = UF_TargetTarget.Background.Width / 256,
		ScaleY = UF_TargetTarget.Background.Height * 0.2 / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_TargetTarget.ResourceMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.ResourceTexture.X,
		Y = UF_TargetTarget.ResourceTexture.Y,
		Width = UF_TargetTarget.ResourceTexture.Width,
		Height = UF_TargetTarget.ResourceTexture.Height
	}
	
	UF_TargetTarget.ResourceBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.ResourceTexture.X,
		Y = UF_TargetTarget.ResourceTexture.Y,
		Width = UF_TargetTarget.ResourceTexture.Width,
		Height = UF_TargetTarget.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_TargetTarget.ResourceTexture.X + UF_TargetTarget.ResourceTexture.Width
	}
	
	UF_TargetTarget.ResourceAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.ResourceTexture.X + 5,
		Y = UF_TargetTarget.ResourceTexture.Y,
		Width = UF_TargetTarget.ResourceTexture.Width,
		Height = UF_TargetTarget.ResourceTexture.Height,
		
		FontSize = Options.UIFrames.Target.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Tactical Bar
	UF_TargetTarget.TacticalTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_TargetTarget.Background.X,
		Y = UF_TargetTarget.ResourceTexture.Y + UF_TargetTarget.ResourceTexture.Height,
		Width = UF_TargetTarget.Background.Width,
		Height = UF_TargetTarget.ResourceTexture.Height,
		
		ScaleCenterX = UF_TargetTarget.Background.X,
		ScaleCenterY = UF_TargetTarget.ResourceTexture.Y + UF_TargetTarget.ResourceTexture.Height,
		ScaleX = UF_TargetTarget.Background.Width / 256,
		ScaleY = UF_TargetTarget.ResourceTexture.Height / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_TargetTarget.TacticalMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.TacticalTexture.X,
		Y = UF_TargetTarget.TacticalTexture.Y,
		Width = UF_TargetTarget.TacticalTexture.Width,
		Height = UF_TargetTarget.TacticalTexture.Height,
		
		Color = Options.UIFrames.TPColor
	}
	
	UF_TargetTarget.TacticalBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.TacticalTexture.X,
		Y = UF_TargetTarget.TacticalTexture.Y,
		Width = UF_TargetTarget.TacticalTexture.Width,
		Height = UF_TargetTarget.TacticalTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_TargetTarget.TacticalTexture.X + UF_TargetTarget.TacticalTexture.Width
	}
	
	UF_TargetTarget.TacticalAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.TacticalTexture.X + 5,
		Y = UF_TargetTarget.TacticalTexture.Y,
		Width = UF_TargetTarget.TacticalTexture.Width,
		Height = UF_TargetTarget.TacticalTexture.Height,
		
		FontSize = Options.UIFrames.Target.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Cast Bar
	UF_TargetTarget.CastBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_TargetTarget.Background.X,
		Y = UF_TargetTarget.Background.Y - UF_TargetTarget.ResourceTexture.Height,
		Width = UF_TargetTarget.Background.Width,
		Height = UF_TargetTarget.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}
	
	UF_TargetTarget.CastTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_TargetTarget.CastBackground.X,
		Y = UF_TargetTarget.CastBackground.Y,
		Width = UF_TargetTarget.CastBackground.Width,
		Height = UF_TargetTarget.CastBackground.Height,
		
		ScaleCenterX = UF_TargetTarget.CastBackground.X,
		ScaleCenterY = UF_TargetTarget.CastBackground.Y,
		ScaleX = UF_TargetTarget.CastBackground.Width / 256,
		ScaleY = UF_TargetTarget.CastBackground.Height / 32,
		
		FilePath = "res/bar/castBar.png"
	}
	
	UF_TargetTarget.CastMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.CastBackground.X,
		Y = UF_TargetTarget.CastBackground.Y,
		Width = UF_TargetTarget.CastBackground.Width,
		Height = UF_TargetTarget.CastBackground.Height,
		
		Color = Options.UIFrames.CastColor
	}
	
	UF_TargetTarget.CastBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_TargetTarget.CastBackground.X,
		Y = UF_TargetTarget.CastBackground.Y,
		Width = UF_TargetTarget.CastBackground.Width,
		Height = UF_TargetTarget.CastBackground.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_TargetTarget.CastBackground.X + UF_TargetTarget.CastBackground.Width
	}
	
	UF_TargetTarget.CastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.CastBackground.X + 5,
		Y = UF_TargetTarget.CastBackground.Y,
		Width = UF_TargetTarget.CastBar.Width,
		Height = UF_TargetTarget.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2
	}
	
	UF_TargetTarget.CastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_TargetTarget.CastBackground.X - 5,
		Y = UF_TargetTarget.CastBackground.Y,
		Width = UF_TargetTarget.CastBar.Width,
		Height = UF_TargetTarget.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_TargetTarget.Hide = function()
		UF_TargetTarget.Background:Hide()
		UF_TargetTarget.TargetTargetName:Hide()
		
		UF_TargetTarget.HealthTexture:Hide()
		UF_TargetTarget.HealthMask:Hide()
		UF_TargetTarget.HealthBar:Hide()
		UF_TargetTarget.HealthAmount:Hide()
		UF_TargetTarget.HealthPercent:Hide()
	
		UF_TargetTarget.ResourceTexture:Hide()
		UF_TargetTarget.ResourceMask:Hide()
		UF_TargetTarget.ResourceBar:Hide()
		UF_TargetTarget.ResourceAmount:Hide()

		UF_TargetTarget.TacticalTexture:Hide()
		UF_TargetTarget.TacticalMask:Hide()
		UF_TargetTarget.TacticalBar:Hide()
		UF_TargetTarget.TacticalAmount:Hide()
		
		UF_TargetTarget.CastBackground:Hide()
		UF_TargetTarget.CastTexture:Hide()
		UF_TargetTarget.CastMask:Hide()
		UF_TargetTarget.CastBar:Hide()
		UF_TargetTarget.CastName:Hide()
		UF_TargetTarget.CastTimer:Hide()
	end
	
	UF_TargetTarget.ShowCast = function()
		UF_TargetTarget.CastBackground:Show()
		UF_TargetTarget.CastTexture:Show()
		UF_TargetTarget.CastMask:Show()
		UF_TargetTarget.CastBar:Show()
		UF_TargetTarget.CastName:Show()
		UF_TargetTarget.CastTimer:Show()
	end
	
	UF_TargetTarget.HideCast = function()
		UF_TargetTarget.CastBackground:Hide()
		UF_TargetTarget.CastTexture:Hide()
		UF_TargetTarget.CastMask:Hide()
		UF_TargetTarget.CastBar:Hide()
		UF_TargetTarget.CastName:Hide()
		UF_TargetTarget.CastTimer:Hide()
	end
end)

function UpdateTargetTargetUI()
	if Options.UIFrames.TargetTarget.Show and Core.TargetTarget ~= nil then
		
		-- Updating Name
		if Options.UIFrames.TargetTarget.ShowName then
			if Core.TargetTarget.Job ~= "Unknown" then
				UF_TargetTarget.TargetTargetName.Text = string.format("%d - %s (%s)", Core.TargetTarget.Level, Core.TargetTarget.Name, Core.TargetTarget.Job)
			else
				UF_TargetTarget.TargetTargetName.Text = string.format("%d - %s", Core.TargetTarget.Level, Core.TargetTarget.Name)
			end
		end
		
		-- Updating Health
		UF_TargetTarget.HealthBar.ScaleX = 1 - Core.TargetTarget.CurrentHP / Core.TargetTarget.MaxHP
		UF_TargetTarget.HealthAmount.Text = getMetric(Core.TargetTarget.CurrentHP) .. "/" .. getMetric(Core.TargetTarget.MaxHP)
		UF_TargetTarget.HealthPercent.Text = string.format("|%d%%", 100 * Core.TargetTarget.CurrentHP / Core.TargetTarget.MaxHP)
		
		-- Updating Resource
		if Core.TargetTarget.MaxMP > 0 then
			UF_TargetTarget.ResourceMask.Color = Options.UIFrames.MPColor
			UF_TargetTarget.ResourceBar.ScaleX = 1 - Core.TargetTarget.CurrentMP / Core.TargetTarget.MaxMP
			UF_TargetTarget.ResourceAmount.Text = string.format("%d/%d", Core.TargetTarget.CurrentMP, Core.TargetTarget.MaxMP)
		elseif Core.TargetTarget.MaxCP > 0 then
			UF_TargetTarget.ResourceMask.Color = Options.UIFrames.CPColor
			UF_TargetTarget.ResourceBar.ScaleX = 1 - Core.TargetTarget.CurrentCP / Core.TargetTarget.MaxCP
			UF_TargetTarget.ResourceAmount.Text = string.format("%d/%d", Core.TargetTarget.CurrentCP, Core.TargetTarget.MaxCP)
		elseif Core.TargetTarget.MaxGP > 0 then
			UF_TargetTarget.ResourceMask.Color = Options.UIFrames.GPColor
			UF_TargetTarget.ResourceBar.ScaleX = 1 - Core.TargetTarget.CurrentGP / Core.TargetTarget.MaxGP
			UF_TargetTarget.ResourceAmount.Text = string.format("%d/%d", Core.TargetTarget.CurrentGP, Core.TargetTarget.MaxGP)
		else
			UF_TargetTarget.ResourceMask.Color = Options.UIFrames.MPColor
			UF_TargetTarget.ResourceBar.ScaleX = 0
			UF_TargetTarget.ResourceAmount.Text = ""
		end
		
		-- Updating Tactical
		UF_TargetTarget.TacticalBar.ScaleX = 1 - Core.TargetTarget.CurrentTP / Core.TargetTarget.MaxTP
		UF_TargetTarget.TacticalAmount.Text = string.format ("%d/%d", Core.TargetTarget.CurrentTP, Core.TargetTarget.MaxTP)
		
		-- Detecting Cast
		if Options.UIFrames.TargetTarget.ShowCast and Core.TargetTarget.IsCasting then
			UF_TargetTarget.CastBar.ScaleX = 1 - Core.TargetTarget.CastDurationCurrent / Core.TargetTarget.CastDurationTotal
			UF_TargetTarget.CastName.Text = Core.TargetTarget.CastingSkillName
			UF_TargetTarget.CastTimer.Text = string.format("%.1f", Core.TargetTarget.CastDurationTotal - Core.TargetTarget.CastDurationCurrent)
			
			UF_TargetTarget.ShowCast()
		else
			UF_TargetTarget.HideCast()
		end
		
		-- Showing everything
		UF_TargetTarget.Background:Show()
		UF_TargetTarget.TargetTargetName:Show()
		UF_TargetTarget.HealthTexture:Show()
		UF_TargetTarget.HealthMask:Show()
		UF_TargetTarget.HealthBar:Show()
		UF_TargetTarget.HealthAmount:Show()
		UF_TargetTarget.HealthPercent:Show()
		
		if Options.UIFrames.TargetTarget.ShowHealthOnly == false then
			UF_TargetTarget.ResourceTexture:Show()
			UF_TargetTarget.ResourceMask:Show()
			UF_TargetTarget.ResourceBar:Show()
			UF_TargetTarget.ResourceAmount:Show()
				
			UF_TargetTarget.TacticalTexture:Show()
			UF_TargetTarget.TacticalMask:Show()
			UF_TargetTarget.TacticalBar:Show()
			UF_TargetTarget.TacticalAmount:Show()
		end
	else
		-- Hiding everything
		UF_TargetTarget.Hide()
	end
end

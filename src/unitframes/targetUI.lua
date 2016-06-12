UF_Target = {}

Attunement.AddOnLoad(function()

	-- Background
	UF_Target.Background = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = Options.UIFrames.Target.PosX,
		Y = Options.UIFrames.Target.PosY,
		Width = Options.UIFrames.Target.Width,
		Height = Options.UIFrames.Target.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}

	UF_Target.TargetName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.Background.X + 2,
		Y = UF_Target.Background.Y + 1,
		Width = UF_Target.Background.Width,
		Height = UF_Target.Background.Height,
		
		FontSize = Options.UIFrames.Target.NameTextSize
	}
	
	-- Health Bar
	UF_Target.HealthTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Target.Background.X,
		Y = UF_Target.Background.Y,
		Width = UF_Target.Background.Width,
		Height = UF_Target.Background.Height * 0.6,
		
		ScaleCenterX = UF_Target.Background.X,
		ScaleCenterY = UF_Target.Background.Y,
		ScaleX = UF_Target.Background.Width / 256,
		ScaleY = UF_Target.Background.Height * 0.6 / 32,
		
		FilePath = "res/bar/healthBar.png"
	}
	
	if Options.UIFrames.Target.ShowHealthOnly then
		UF_Target.HealthTexture.Height = UF_Target.Background.Height
		UF_Target.HealthTexture.ScaleY = UF_Target.Background.Height / 32
	end
	
	UF_Target.HealthMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.HealthTexture.X,
		Y = UF_Target.HealthTexture.Y,
		Width = UF_Target.HealthTexture.Width,
		Height = UF_Target.HealthTexture.Height,
		
		Color = Options.UIFrames.HPColor
	}
	
	UF_Target.HealthBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.HealthTexture.X,
		Y = UF_Target.HealthTexture.Y,
		Width = UF_Target.HealthTexture.Width,
		Height = UF_Target.HealthTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Target.HealthTexture.X + UF_Target.HealthTexture.Width
	}
	
	UF_Target.HealthAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.HealthTexture.X + 5,
		Y = UF_Target.HealthTexture.Y,
		Width = UF_Target.HealthTexture.Width,
		Height = UF_Target.HealthTexture.Height,
		
		FontSize = Options.UIFrames.Target.HealthTextSize,
		
		ParagraphAlignment = 2
	}
	
	UF_Target.HealthPercent = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.HealthTexture.X - 5,
		Y = UF_Target.HealthTexture.Y,
		Width = UF_Target.HealthTexture.Width,
		Height = UF_Target.HealthTexture.Height,
		
		FontSize = Options.UIFrames.Target.HealthTextSize,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	-- Resource Bar
	UF_Target.ResourceTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Target.Background.X,
		Y = UF_Target.Background.Y + UF_Target.HealthTexture.Height,
		Width = UF_Target.Background.Width,
		Height = UF_Target.Background.Height * 0.2,
		
		ScaleCenterX = UF_Target.Background.X,
		ScaleCenterY = UF_Target.Background.Y + UF_Target.HealthTexture.Height,
		ScaleX = UF_Target.Background.Width / 256,
		ScaleY = UF_Target.Background.Height * 0.2 / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_Target.ResourceMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.ResourceTexture.X,
		Y = UF_Target.ResourceTexture.Y,
		Width = UF_Target.ResourceTexture.Width,
		Height = UF_Target.ResourceTexture.Height
	}
	
	UF_Target.ResourceBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.ResourceTexture.X,
		Y = UF_Target.ResourceTexture.Y,
		Width = UF_Target.ResourceTexture.Width,
		Height = UF_Target.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Target.ResourceTexture.X + UF_Target.ResourceTexture.Width
	}
	
	UF_Target.ResourceAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.ResourceTexture.X + 5,
		Y = UF_Target.ResourceTexture.Y,
		Width = UF_Target.ResourceTexture.Width,
		Height = UF_Target.ResourceTexture.Height,
		
		FontSize = Options.UIFrames.Target.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Tactical Bar
	UF_Target.TacticalTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Target.Background.X,
		Y = UF_Target.ResourceTexture.Y + UF_Target.ResourceTexture.Height,
		Width = UF_Target.Background.Width,
		Height = UF_Target.ResourceTexture.Height,
		
		ScaleCenterX = UF_Target.Background.X,
		ScaleCenterY = UF_Target.ResourceTexture.Y + UF_Target.ResourceTexture.Height,
		ScaleX = UF_Target.Background.Width / 256,
		ScaleY = UF_Target.ResourceTexture.Height / 32,
		
		FilePath = "res/bar/resourceBar.png"
	}
	
	UF_Target.TacticalMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.TacticalTexture.X,
		Y = UF_Target.TacticalTexture.Y,
		Width = UF_Target.TacticalTexture.Width,
		Height = UF_Target.TacticalTexture.Height,
		
		Color = Options.UIFrames.TPColor
	}
	
	UF_Target.TacticalBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.TacticalTexture.X,
		Y = UF_Target.TacticalTexture.Y,
		Width = UF_Target.TacticalTexture.Width,
		Height = UF_Target.TacticalTexture.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Target.TacticalTexture.X + UF_Target.TacticalTexture.Width
	}
	
	UF_Target.TacticalAmount = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.TacticalTexture.X + 5,
		Y = UF_Target.TacticalTexture.Y,
		Width = UF_Target.TacticalTexture.Width,
		Height = UF_Target.TacticalTexture.Height,
		
		FontSize = Options.UIFrames.Target.ResourceTextSize,
		
		ParagraphAlignment = 2
	}
	
	-- Cast Bar
	UF_Target.CastBackground = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_Target.Background.X,
		Y = UF_Target.Background.Y - UF_Target.ResourceTexture.Height,
		Width = UF_Target.Background.Width,
		Height = UF_Target.ResourceTexture.Height,
		
		Color = "#FF000000",
		
		BorderWidth = Options.UIFrames.BorderSize,
		BorderColor = Options.UIFrames.BorderColor
	}
	
	UF_Target.CastTexture = Attunement.Texture:New {
		Layer = "Low",
		
		X = UF_Target.CastBackground.X,
		Y = UF_Target.CastBackground.Y,
		Width = UF_Target.CastBackground.Width,
		Height = UF_Target.CastBackground.Height,
		
		ScaleCenterX = UF_Target.CastBackground.X,
		ScaleCenterY = UF_Target.CastBackground.Y,
		ScaleX = UF_Target.CastBackground.Width / 256,
		ScaleY = UF_Target.CastBackground.Height / 32,
		
		FilePath = "res/bar/castBar.png"
	}
	
	UF_Target.CastMask = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.CastBackground.X,
		Y = UF_Target.CastBackground.Y,
		Width = UF_Target.CastBackground.Width,
		Height = UF_Target.CastBackground.Height,
		
		Color = Options.UIFrames.CastColor
	}
	
	UF_Target.CastBar = Attunement.Rectangle:New {
		Layer = "Low",
		
		X = UF_Target.CastBackground.X,
		Y = UF_Target.CastBackground.Y,
		Width = UF_Target.CastBackground.Width,
		Height = UF_Target.CastBackground.Height,
		
		Color = "#FF000000",
		
		ScaleCenterX = UF_Target.CastBackground.X + UF_Target.CastBackground.Width
	}
	
	UF_Target.CastName = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.CastBackground.X + 5,
		Y = UF_Target.CastBackground.Y,
		Width = UF_Target.CastBar.Width,
		Height = UF_Target.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2
	}
	
	UF_Target.CastTimer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Target.CastBackground.X - 5,
		Y = UF_Target.CastBackground.Y,
		Width = UF_Target.CastBar.Width,
		Height = UF_Target.CastBar.Height,
		
		FontSize = 10,
		
		ParagraphAlignment = 2,
		TextAlignment = 1
	}
	
	UF_Target.Hide = function()
		UF_Target.Background:Hide()
		UF_Target.TargetName:Hide()
		
		UF_Target.HealthTexture:Hide()
		UF_Target.HealthMask:Hide()
		UF_Target.HealthBar:Hide()
		UF_Target.HealthAmount:Hide()
		UF_Target.HealthPercent:Hide()
	
		UF_Target.ResourceTexture:Hide()
		UF_Target.ResourceMask:Hide()
		UF_Target.ResourceBar:Hide()
		UF_Target.ResourceAmount:Hide()

		UF_Target.TacticalTexture:Hide()
		UF_Target.TacticalMask:Hide()
		UF_Target.TacticalBar:Hide()
		UF_Target.TacticalAmount:Hide()
		
		UF_Target.CastBackground:Hide()
		UF_Target.CastTexture:Hide()
		UF_Target.CastMask:Hide()
		UF_Target.CastBar:Hide()
		UF_Target.CastName:Hide()
		UF_Target.CastTimer:Hide()
	end
	
	UF_Target.ShowCast = function()
		UF_Target.CastBackground:Show()
		UF_Target.CastTexture:Show()
		UF_Target.CastMask:Show()
		UF_Target.CastBar:Show()
		UF_Target.CastName:Show()
		UF_Target.CastTimer:Show()
	end
	
	UF_Target.HideCast = function()
		UF_Target.CastBackground:Hide()
		UF_Target.CastTexture:Hide()
		UF_Target.CastMask:Hide()
		UF_Target.CastBar:Hide()
		UF_Target.CastName:Hide()
		UF_Target.CastTimer:Hide()
	end
end)

function UpdateTargetUI()
	if Options.UIFrames.Target.Show and Core.Target ~= nil then
		
		-- Updating Name
		if Options.UIFrames.Target.ShowName then
			if Core.Target.Job ~= "Unknown" then
				UF_Target.TargetName.Text = string.format("%d - %s (%s)", Core.Target.Level, Core.Target.Name, Core.Target.Job)
			else
				UF_Target.TargetName.Text = string.format("%d - %s", Core.Target.Level, Core.Target.Name)
			end
		end
		
		-- Updating Health
		UF_Target.HealthBar.ScaleX = 1 - Core.Target.CurrentHP / Core.Target.MaxHP
		UF_Target.HealthAmount.Text = getMetric(Core.Target.CurrentHP) .. "/" .. getMetric(Core.Target.MaxHP)
		UF_Target.HealthPercent.Text = string.format("|%d%%", 100 * Core.Target.CurrentHP / Core.Target.MaxHP)
		
		-- Updating Resource
		if Core.Target.MaxMP > 0 then
			UF_Target.ResourceMask.Color = Options.UIFrames.MPColor
			UF_Target.ResourceBar.ScaleX = 1 - Core.Target.CurrentMP / Core.Target.MaxMP
			UF_Target.ResourceAmount.Text = string.format("%d/%d", Core.Target.CurrentMP, Core.Target.MaxMP)
		elseif Core.Target.MaxCP > 0 then
			UF_Target.ResourceMask.Color = Options.UIFrames.CPColor
			UF_Target.ResourceBar.ScaleX = 1 - Core.Target.CurrentCP / Core.Target.MaxCP
			UF_Target.ResourceAmount.Text = string.format("%d/%d", Core.Target.CurrentCP, Core.Target.MaxCP)
		elseif Core.Target.MaxGP > 0 then
			UF_Target.ResourceMask.Color = Options.UIFrames.GPColor
			UF_Target.ResourceBar.ScaleX = 1 - Core.Target.CurrentGP / Core.Target.MaxGP
			UF_Target.ResourceAmount.Text = string.format("%d/%d", Core.Target.CurrentGP, Core.Target.MaxGP)
		else
			UF_Target.ResourceMask.Color = Options.UIFrames.MPColor
			UF_Target.ResourceBar.ScaleX = 0
			UF_Target.ResourceAmount.Text = ""
		end
		
		-- Updating Tactical
		UF_Target.TacticalBar.ScaleX = 1 - Core.Target.CurrentTP / Core.Target.MaxTP
		UF_Target.TacticalAmount.Text = string.format ("%d/%d", Core.Target.CurrentTP, Core.Target.MaxTP)
		
		-- Detecting Cast
		if Options.UIFrames.Target.ShowCast and Core.Target.IsCasting then
			UF_Target.CastBar.ScaleX = 1 - Core.Target.CastDurationCurrent / Core.Target.CastDurationTotal
			UF_Target.CastName.Text = Core.Target.CastingSkillName
			UF_Target.CastTimer.Text = string.format("%.1f", Core.Target.CastDurationTotal - Core.Target.CastDurationCurrent)
			
			UF_Target.ShowCast()
		else
			UF_Target.HideCast()
		end
		
		-- Showing everything
		UF_Target.Background:Show()
		UF_Target.TargetName:Show()
		UF_Target.HealthTexture:Show()
		UF_Target.HealthMask:Show()
		UF_Target.HealthBar:Show()
		UF_Target.HealthAmount:Show()
		UF_Target.HealthPercent:Show()
		
		if Options.UIFrames.Target.ShowHealthOnly == false then
			UF_Target.ResourceTexture:Show()
			UF_Target.ResourceMask:Show()
			UF_Target.ResourceBar:Show()
			UF_Target.ResourceAmount:Show()
				
			UF_Target.TacticalTexture:Show()
			UF_Target.TacticalMask:Show()
			UF_Target.TacticalBar:Show()
			UF_Target.TacticalAmount:Show()
		end
	else
		-- Hiding everything
		UF_Target.Hide()
	end
end

UF_Combo = {}

Attunement.AddOnLoad(function()
	UF_Combo.ArcanistTexture= {}
	UF_Combo.MachinistTexture = {}
	UF_Combo.SummonerTexture = {}
	UF_Combo.WarriorTexture = {[1] = {}, [2] = {}}
	
	-- Loading Texture
	for i=1,5,1 do
		if i <= 3 then
			-- Arcanist
			UF_Combo.ArcanistTexture[i] = Attunement.Texture:New {
				Layer = "Low",
				
				X = Options.Combo.Arcanist.PosX,
				Y = Options.Combo.Arcanist.PosY,
				Width = 76,
				Height = 136,
				
				FilePath = "res/combo/acn/" .. i .. ".png"
			}
			
			-- Machinist
			UF_Combo.SummonerTexture[i] = Attunement.Texture:New {
				Layer = "Low",
				
				X = Options.Combo.Summoner.PosX,
				Y = Options.Combo.Summoner.PosY,
				Width = 76,
				Height = 136,
				
				FilePath = "res/combo/smn/" .. i .. ".png"
			}
		end
		
		-- Machinist
		UF_Combo.MachinistTexture[i] = Attunement.Texture:New {
			Layer = "Low",
			
			X = Options.Combo.Machinist.PosX,
			Y = Options.Combo.Machinist.PosY,
			Width = 193,
			Height = 36,
			
			FilePath = "res/combo/mch/" .. i .. ".png"
		}
		
		-- Warrior
		UF_Combo.WarriorTexture[1][i] = Attunement.Texture:New {
			Layer = "Low",
			
			X = Options.Combo.Warrior.PosX,
			Y = Options.Combo.Warrior.PosY,
			Width = 193,
			Height = 36,
			
			FilePath = "res/combo/war/defiance/" .. i .. ".png"
		}
		
		UF_Combo.WarriorTexture[2][i] = Attunement.Texture:New {
			Layer = "Low",
			
			X = Options.Combo.Warrior.PosX,
			Y = Options.Combo.Warrior.PosY,
			Width = 193,
			Height = 36,
			
			FilePath = "res/combo/war/deliverance/" .. i .. ".png"
		}
	end

	UF_Combo.ArcanistTexture[4] = Attunement.Texture:New {
		Layer = "Low",
		
		X = Options.Combo.Arcanist.PosX,
		Y = Options.Combo.Arcanist.PosY,
		Height = 76,
		Width = 136,
		
		FilePath = "res/combo/acn/0.png"
	}
	
	-- Combos bar and timer HUD
	UF_Combo.Bar = {}
	
	UF_Combo.Bar.GetAetherflow = function(ticks)
		for i = 0, Core.CombatEvents.Length - 1 do
			if Core.CombatEvents[i].MessageType == "SingleAbility" and Core.CombatEvents[i].SkillID == 166 then
				if Core.CombatEvents[i].ActorID == Core.Player.ID then
					UF_Combo.startTick = ticks
					UF_Combo.aetherflowRecast = 60000
				end
			end
		end
		
		if UF_Combo.startTick ~= nil then
			local cooldown = UF_Combo.aetherflowRecast - (ticks - UF_Combo.startTick)
			if cooldown < 0 then
				cooldown = 0
				UF_Combo.startTick = nil
			end
			return cooldown
		else
			return nil
		end
	end
	
	-- Arcanist bar
	UF_Combo.Bar.Arcanist = {}
	
	UF_Combo.Bar.Arcanist.Background = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_Combo.ArcanistTexture[1].X + 30,
		Y = UF_Combo.ArcanistTexture[1].Y + 35,
		Width = 24,
		Height = 69,
		
		Color = "#FF000000"
	}
	
	UF_Combo.Bar.Arcanist.Bar = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_Combo.Bar.Arcanist.Background.X,
		Y = UF_Combo.Bar.Arcanist.Background.Y,
		Width = UF_Combo.Bar.Arcanist.Background.Width,
		Height = UF_Combo.Bar.Arcanist.Background.Height,
		
		Color = "#FFFF8E48",
		
		ScaleCenterY = UF_Combo.Bar.Arcanist.Background.Y + UF_Combo.Bar.Arcanist.Background.Height
	}
	
	UF_Combo.Bar.Arcanist.Timer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Combo.ArcanistTexture[1].X + 3,
		Y = UF_Combo.ArcanistTexture[1].Y,
		Width = 58,
		Height = 31,
		
		FontSize = 14,
		
		ParagraphAlignment = 2,
		TextAlignment = 2
	}
	
	-- Summoner bar
	UF_Combo.Bar.Summoner = {}
	
	UF_Combo.Bar.Summoner.Background = Attunement.Rectangle:New {
		Layer = "Background",
	
		X = UF_Combo.SummonerTexture[1].X + 25,
		Y = UF_Combo.SummonerTexture[1].Y + 35,
		Width = 24,
		Height = 69,
		
		Color = "#FF000000"
	}
	
	UF_Combo.Bar.Summoner.Bar = Attunement.Rectangle:New {
		Layer = "Background",
		
		X = UF_Combo.Bar.Summoner.Background.X,
		Y = UF_Combo.Bar.Summoner.Background.Y,
		Width = UF_Combo.Bar.Summoner.Background.Width,
		Height = UF_Combo.Bar.Summoner.Background.Height,
		
		Color = "#FF3A93F5",
		
		ScaleCenterY = UF_Combo.Bar.Summoner.Background.Y + UF_Combo.Bar.Summoner.Background.Height
	}
	
	UF_Combo.Bar.Summoner.Timer = Attunement.Label:New {
		Layer = "Medium",
		
		X = UF_Combo.SummonerTexture[1].X + 18,
		Y = UF_Combo.SummonerTexture[1].Y,
		Width = 58,
		Height = 31,
		
		FontSize = 14,
		
		ParagraphAlignment = 2,
		TextAlignment = 2
	}
	
	UF_Combo.Hide = function ()
		for i=1,5,1 do
			if i <= 3 then
				UF_Combo.ArcanistTexture[i]:Hide()
				UF_Combo.SummonerTexture[i]:Hide()
			end
			UF_Combo.MachinistTexture[i]:Hide()
			UF_Combo.WarriorTexture[1][i]:Hide()
			UF_Combo.WarriorTexture[2][i]:Hide()
		end
		UF_Combo.ArcanistTexture[4]:Hide()
		
		UF_Combo.Bar.Arcanist.Background:Hide()
		UF_Combo.Bar.Arcanist.Bar:Hide()
		UF_Combo.Bar.Arcanist.Timer:Hide()
		UF_Combo.Bar.Summoner.Background:Hide()
		UF_Combo.Bar.Summoner.Bar:Hide()
		UF_Combo.Bar.Summoner.Timer:Hide()
	end	
end)

function UpdateCombo(ticks)
	if Options.Combo.Show and Core.Player ~= nil then
		
		-- Hiding everything
		UF_Combo.Hide()

		-- Updating aetherflow recast time
		UF_Combo.Bar.Arcanist.AetherflowTimer = UF_Combo.Bar.GetAetherflow(ticks)
		
		-- are we in a fight ?
		if Core.Player.Status == "WeaponUnsheathed" then
			-- combo detection
			if (Options.Combo.Arcanist.Show or Options.Combo.Summoner.Show) and PlayerUseAetherflow() then
				-- Arcanist
				if Options.Combo.Arcanist.Show then
					if UF_Combo.Bar.Arcanist.AetherflowTimer ~= nil then
						UF_Combo.Bar.Arcanist.Bar.ScaleY = 1 - (UF_Combo.Bar.Arcanist.AetherflowTimer / 1000) / 60
						UF_Combo.Bar.Arcanist.Timer.Text = string.format("%.1f", tostring(UF_Combo.Bar.Arcanist.AetherflowTimer / 1000))
					else
						UF_Combo.Bar.Arcanist.Bar.ScaleY = 1
						UF_Combo.Bar.Arcanist.Timer.Text = "Ready"
					end
				
					UF_Combo.Bar.Arcanist.Background:Show()
					UF_Combo.Bar.Arcanist.Bar:Show()
					if Core.Player:GetBuffByID(304) then
						UF_Combo.ArcanistTexture[tonumber(Core.Player:GetBuffByID(304).OtherInfo,10)]:Show()
					else
						UF_Combo.ArcanistTexture[4]:Show()
					end
					UF_Combo.Bar.Arcanist.Timer:Show()
				end
				
				-- Summoner
				if Options.Combo.Summoner.Show and Core.Player:GetBuffByID(807) then
					UF_Combo.Bar.Summoner.Bar.ScaleY = Core.Player:GetBuffByID(807).Timer / 30
					UF_Combo.Bar.Summoner.Timer.Text = string.format("%.1f", Core.Player:GetBuffByID(807).Timer)
					
					UF_Combo.Bar.Summoner.Background:Show()
					UF_Combo.Bar.Summoner.Bar:Show()
					UF_Combo.SummonerTexture[tonumber(Core.Player:GetBuffByID(807).OtherInfo,10)]:Show()
					UF_Combo.Bar.Summoner.Timer:Show()
				end
			-- Machinist
			elseif Options.Combo.Machinist.Show and  Core.Player.Job == "Mch" then
				if Core.Player:GetBuffByID(862) then
					UF_Combo.MachinistTexture[tonumber(Core.Player:GetBuffByID(862).OtherInfo,10)]:Show()
				end
			-- Warrior
			elseif Options.Combo.Warrior.Show and Core.Player.Job == "War" then
				-- Defiance
				if Core.Player:GetBuffByID(91) then
					if Core.Player:GetBuffByID(93) then
						UF_Combo.WarriorTexture[1][1]:Show()
					elseif Core.Player:GetBuffByID(94) then
						UF_Combo.WarriorTexture[1][2]:Show()
					elseif Core.Player:GetBuffByID(95) then
						UF_Combo.WarriorTexture[1][3]:Show()
					elseif Core.Player:GetBuffByID(96) then
						UF_Combo.WarriorTexture[1][4]:Show()
					elseif Core.Player:GetBuffByID(97) then
						UF_Combo.WarriorTexture[1][5]:Show()
					end
				-- Deliverance
				elseif Core.Player:GetBuffByID(729) then
					if Core.Player:GetBuffByID(730) then
						UF_Combo.WarriorTexture[2][1]:Show()
					elseif Core.Player:GetBuffByID(731) then
						UF_Combo.WarriorTexture[2][2]:Show()
					elseif Core.Player:GetBuffByID(732) then
						UF_Combo.WarriorTexture[2][3]:Show()
					elseif Core.Player:GetBuffByID(733) then
						UF_Combo.WarriorTexture[2][4]:Show()
					elseif Core.Player:GetBuffByID(734) then
						UF_Combo.WarriorTexture[2][5]:Show()
					end
				end
			end
		end
	else
		UF_Combo.Hide()
	end
end

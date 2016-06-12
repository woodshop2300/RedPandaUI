Options = {}

-- ====================
-- GENERAL OPTIONS
-- ====================

Options.Active = true

Options.SettingsButton = {}
Options.SettingsButton.X = 1860
Options.SettingsButton.Y = 180

-- ====================
-- UI FRAMES OPTIONS
-- ====================

Options.UIFrames = {}

-- Player Bar
Options.UIFrames.Player = {}
Options.UIFrames.Player.Show = true
Options.UIFrames.Player.PosX = 584
Options.UIFrames.Player.PosY = 866
Options.UIFrames.Player.Width = 250
Options.UIFrames.Player.Height = 80
Options.UIFrames.Player.ShowName = true
Options.UIFrames.Player.NameTextSize = 10
Options.UIFrames.Player.HealthTextSize = 20
Options.UIFrames.Player.ResourceTextSize = 10
Options.UIFrames.Player.ShowCast = true
Options.UIFrames.Player.ShowHealthOnly = false

-- Target Bar
Options.UIFrames.Target = {}
Options.UIFrames.Target.Show = true
Options.UIFrames.Target.PosX = 1086
Options.UIFrames.Target.PosY = 866
Options.UIFrames.Target.Width = 250
Options.UIFrames.Target.Height = 80
Options.UIFrames.Target.ShowName = true
Options.UIFrames.Target.NameTextSize = 10
Options.UIFrames.Target.HealthTextSize = 20
Options.UIFrames.Target.ResourceTextSize = 10
Options.UIFrames.Target.ShowCast = false
Options.UIFrames.Target.ShowHealthOnly = false

-- Target target bar
Options.UIFrames.TargetTarget = {}
Options.UIFrames.TargetTarget.Show = true
Options.UIFrames.TargetTarget.PosX = 1356
Options.UIFrames.TargetTarget.PosY = 866
Options.UIFrames.TargetTarget.Width = 175
Options.UIFrames.TargetTarget.Height = 48
Options.UIFrames.TargetTarget.ShowName = true
Options.UIFrames.TargetTarget.NameTextSize = 10
Options.UIFrames.TargetTarget.HealthTextSize = 15
Options.UIFrames.TargetTarget.ResourceTextSize = 10
Options.UIFrames.TargetTarget.ShowCast = false
Options.UIFrames.TargetTarget.ShowHealthOnly = true

-- Focus Bar
Options.UIFrames.Focus = {}
Options.UIFrames.Focus.Show = true
Options.UIFrames.Focus.PosX = 1300
Options.UIFrames.Focus.PosY = 640
Options.UIFrames.Focus.Width = 175
Options.UIFrames.Focus.Height = 40
Options.UIFrames.Focus.ShowName = true
Options.UIFrames.Focus.NameTextSize = 10
Options.UIFrames.Focus.HealthTextSize = 15
Options.UIFrames.Focus.ResourceTextSize = 10
Options.UIFrames.Focus.ShowCast = false
Options.UIFrames.Focus.ShowHealthOnly = true

-- Color
Options.UIFrames.BorderColor = "#FF000000"
Options.UIFrames.BorderSize = 1
Options.UIFrames.HPColor = "#A32E7E33"
Options.UIFrames.MPColor = "#A33C3CD0"
Options.UIFrames.CPColor = "#A3BC79DA"
Options.UIFrames.GPColor = "#A377BDE3"
Options.UIFrames.TPColor = "#A3DD9B46"
Options.UIFrames.CastColor = "#AE2BE0ED"

-- ====================
-- CASTBAR EXTENSIONS
-- ====================

Options.CastBar = {}
Options.CastBar.Show = true

-- Player
Options.CastBar.Player = {}
Options.CastBar.Player.Show = false
Options.CastBar.Player.PosX = 720
Options.CastBar.Player.PosY = 375
Options.CastBar.Player.Width = 480
Options.CastBar.Player.Height = 25
Options.CastBar.Player.Color = "#A381CFED"
Options.CastBar.Player.BorderSize = 1
Options.CastBar.Player.BorderColor = "#FF000000"
Options.CastBar.Player.TextSize = 15

-- Target
Options.CastBar.Target = {}
Options.CastBar.Target.Show = true
Options.CastBar.Target.PosX = 720
Options.CastBar.Target.PosY = 710
Options.CastBar.Target.Width = 480
Options.CastBar.Target.Height = 25
Options.CastBar.Target.Color = "#A381CFED"
Options.CastBar.Target.BorderSize = 1
Options.CastBar.Target.BorderColor = "#FF000000"
Options.CastBar.Target.TextSize = 15

-- TargetTarget
Options.CastBar.TargetTarget = {}
Options.CastBar.TargetTarget.Show = false
Options.CastBar.TargetTarget.PosX = 720
Options.CastBar.TargetTarget.PosY = 275
Options.CastBar.TargetTarget.Width = 480
Options.CastBar.TargetTarget.Height = 25
Options.CastBar.TargetTarget.Color = "#A381CFED"
Options.CastBar.TargetTarget.BorderSize = 1
Options.CastBar.TargetTarget.BorderColor = "#FF000000"
Options.CastBar.TargetTarget.TextSize = 15

-- Focus
Options.CastBar.Focus = {}
Options.CastBar.Focus.Show = true
Options.CastBar.Focus.PosX = 720
Options.CastBar.Focus.PosY = 695
Options.CastBar.Focus.Width = 480
Options.CastBar.Focus.Height = 15
Options.CastBar.Focus.Color = "#A381CFED"
Options.CastBar.Focus.BorderSize = 1
Options.CastBar.Focus.BorderColor = "#FF000000"
Options.CastBar.Focus.TextSize = 10

-- ====================
-- COMBO EXTENSIONS
-- ====================

Options.Combo = {}
Options.Combo.Show = true

-- Arcanist
Options.Combo.Arcanist ={}
Options.Combo.Arcanist.Show = true
Options.Combo.Arcanist.PosX = 744
Options.Combo.Arcanist.PosY = 522

-- Machinist
Options.Combo.Machinist = {}
Options.Combo.Machinist.Show = false
Options.Combo.Machinist.PosX = UI.PrimaryMonitorWidth /2
Options.Combo.Machinist.PosY = UI.PrimaryMonitorHeight /2

-- Summoner
Options.Combo.Summoner = {}
Options.Combo.Summoner.Show = true
Options.Combo.Summoner.PosX = 1100
Options.Combo.Summoner.PosY = 522

-- Warrior
Options.Combo.Warrior = {}
Options.Combo.Warrior.Show = true
Options.Combo.Warrior.PosX = 863
Options.Combo.Warrior.PosY= 730

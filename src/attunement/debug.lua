
-- Ensure Attunement is defined
if not Attunement then
	Attunement = {}
end

Attunement.Debug = {}

--[[
Debug Console
--]]

Attunement.Debug.Console = {
	-- Only set up once (singleton)
	setUp = false,

	messages = {},
	minimized = false,

	maxLines = math.floor((UI.PrimaryMonitorHeight/2)/17), -- Should work for now, with default fonts and sizes

	prefixes = {
		debug = '[D]',
		info = '[I]',
		warning = '[W]',
		error = '[E]'
	}
}

-- Enable the console, or retrieve it if already set up
function Attunement.Debug.Console:Enable()
	-- Class acts as a singleton, only allow one to be created.
	local ref = self
	if self.setUp then
		return self
	end

	-- Set up the log text we're going to render to
	self.log = Attunement.Label:New{
		FontFamily = 'Consolas',
		FontSize = 14,
		Color = '#FFFFFFFF',

		Width = UI.PrimaryMonitorWidth / 2,
		Height = UI.PrimaryMonitorHeight / 2,

		DrawBackground = true,
		BackgroundColor = '#88000000',

		Draggable = true,

		Hidden = false,
		Layer = 'Dialog'
	}
	self.log.OnMouseRightDown = function()
		if ref.minimized then
			ref.minimized = false
			ref.log.Text = table.concat(ref.messages, '\n')
			ref.log.Draggable = true
			ref.log.Height = UI.PrimaryMonitorHeight / 2
		else
			ref.minimized = true
			ref.log.Text = "Attunement Console"
			ref.log.Draggable = false
			ref.log.Height = 17
		end
	end

	-- Replace core's noop print() with a wrapper for :write
	print = function(...)
		-- Coerce arguments to a string and place in a buffer (better performance
		-- to concat table instead of modify strings)
		local buf = {}
		local args = {...}
		for i = 1, #args do
			table.insert(buf, tostring(args[i]))
		end

		-- We do the concat with a tab character to better fake
		-- how print() works. The newline is provided by the console.
		self:Write(table.concat(buf, '\t'))
	end

	-- Initial setup complete, next enable call shouldn't do any of that
	self.setUp = true

	return self
end

-- split strings, thanks Lua manual
local function stringSplit(str, sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	str:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

function Attunement.Debug.Console:Write(...)
	-- If the console isn't set up, treat as a no op
	if not self.setUp then
		return
	end

	-- Default to debug
	local prefix = self.prefixes.debug

	-- Add each param to the log
	local args = {...}
	local message
	for i = 1, #args do
		message = args[i]

		-- If the first param is a log level, set the prefix
		if i == 1 and self.prefixes[message] then
			prefix = self.prefixes[message]
		else
			-- Need to do some magic here..
			-- to support writing things with new lines in them
			local lines = stringSplit(message, "\n")
			for _,line in ipairs(lines) do
				table.insert(self.messages, prefix .. ' ' .. line)
			end
		end
	end

	-- If the log is too long, start removing old messages
	while #self.messages > self.maxLines do
		table.remove(self.messages, 1)
	end

	if self.minimized == false then
		-- Update the label's data
		self.log.Text = table.concat(self.messages, '\n')
	end
end

-- Clear the log of messages
function Attunement.Debug.Console:Clear()
	-- Just replace the message list with a new empty one
	self.messages = {}
end

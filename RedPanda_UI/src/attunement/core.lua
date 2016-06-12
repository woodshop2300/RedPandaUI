
-- Ensure Attunement is defined
if not Attunement then
	Attunement = {}
end

Attunement.Core = {}

-- Define print() as a noop if it's not already been defined, simply so things don't error out
if not print then
	print = function() end
end

--[[
Error Handling
--]]

-- Used for outputting errors when debug module is not included
local errorText
local getBasicErrorLabel = function()
	if not errorText then
		errorText = UI.NewLabel('Dialog')
		errorText.Color = "#FFFF0000"
		errorText.Width = UI.PrimaryMonitorWidth
		errorText:Show()
	end

	return errorText
end

local handleError = function(err)
	-- C# also seems capable of throwing an error for us, but it's a userdata Exception instance.
	if type(err) == 'userdata' then
		-- Dig down the exception tree to get the base issue
		err = err:GetBaseException()

		-- Convert it to a string and note it's from C#
		err = '[C#] ' .. tostring(err)
	end

	-- If the debug console is enabled, pop it up and show the error
	if Attunement.Debug and Attunement.Debug.Console then
		Attunement.Debug.Console:Enable():Write('error', err)

	-- Else, generate a nasty red text so the user at least knows something went wrong
	else
		output = getBasicErrorLabel()
		output.Text = err
	end
end

--[[
Wrappers for OnLoad / OnFrame
--]]

-- Handlers
local loadHandlers = {}
local frameHandlers = {}

-- Functions to add/remove handlers
local nextLoadIndex = 1
function Attunement.AddOnLoad(func)
	loadHandlers[nextLoadIndex] = func
	nextLoadIndex = nextLoadIndex + 1
	return nextLoadIndex - 1
end
function Attunement.RemoveOnLoad(index)
	loadHandlers[index] = nil
end
function Attunement.ClearOnLoad()
	nextLoadIndex = 1
	loadHandlers = {}
end

local nextFrameIndex = 1
function Attunement.AddOnFrame(func)
	frameHandlers[nextFrameIndex] = func
	nextFrameIndex = nextFrameIndex + 1
	return nextFrameIndex - 1
end
function Attunement.RemoveOnFrame(index)
	frameHandlers[index] = nil
end
function Attunement.ClearOnFrame()
	nextFrameIndex = 1
	frameHandlers = {}
end

-- If the dev's loaded their addon first, cover their ass because we're nice
local function handleOldStyle(source, dest)
	if not Attunement[source] then return end

	if Attunement.Debug then
		Attunement.Debug.Console:Write('warning', 'Warning: Directly setting Attunement.OnLoad and Attunement.OnFrame is deprecated. Please update to using Attunement.AddOnLoad and Attunement.AddOnFrame respectively.')
	end

	local sourceType = type(Attunement[source])
	if sourceType == 'function' then
		Attunement[dest](Attunement[source])
	elseif sourceType == 'table' then
		for _, func in pairs(Attunement[source]) do
			Attunement[dest](func)
		end
	end

	Attunement[source] = nil
end
handleOldStyle('OnLoad', 'AddOnLoad')
handleOldStyle('OnFrame', 'AddOnFrame')

-- Real OnLoad
UI.OnLoad = function()
	handleOldStyle('OnLoad', 'AddOnLoad')

	local status, err = pcall(function()
		for _, func in pairs(loadHandlers) do
			func()
		end
	end)

	-- There was an error, throw it.
	if not status then
		handleError(err)
	end
end

-- Real OnFrame
UI.OnFrame = function(ticks)
	handleOldStyle('OnFrame', 'AddOnFrame')

	local status, err = pcall(function()
		for _, func in pairs(frameHandlers) do
			func(ticks)
		end
	end)

	-- There was an error, throw it.
	if not status then
		handleError(err)
	end
end

--[[
Interval and timeout timers
--]]

Attunement.Interval = {
	setUp = false
}
function Attunement.Interval:New(interval, func)
	-- Ensure the Interval stuff has been set up
	self:SetUp()

	-- Build the schedule task and add it to the queue queue
	local task = {
		func = func,
		interval = interval,
		remove = false,
		removeIn = 0
	}
	self.add:Push(task)

	-- Task functions
	local new = {}

	function new:StopAfter(num)
		task.remove = true
		task.removeIn = num
	end

	function new:Stop()
		self:StopAfter(0)
	end

	return new
end

-- Pretty helper function for setting up a timeout
function Attunement.Interval:Once(...)
	local task = self:New(...)
	task:StopAfter(1)
	return task
end

function Attunement.Interval:SetUp()
	-- If we've already set outselves up, do nothing
	if self.setUp then return end

	local DS = Attunement.DataStructures

	-- Error out if data-structures isn't available
	if not DS then
		error('OnInterval requires `data-structures.lua` to be loaded.', 2)
	end

	-- Set up all the fields we need
	-- Queue/set for adding/removing tasks
	self.add = DS.FIFOQueue:New()

	-- The actual interval queue & priority handling (for performance)
	self.queue = DS.PriorityQueue:New()
	self.nextPriority = math.huge

	-- Register the OnFrame handler with the rest of attunement
	-- TODO: Currently have to proxy to keep reference to self. Better workaround?
	Attunement.AddOnFrame(function(ticks) self:OnFrame(ticks) end)

	self.setUp = true
end

function Attunement.Interval:OnFrame(ticks)
	-- Add pending tasks if there are any
	while not self.add:Empty() do
		local task = self.add:Pop()
		local priority = ticks + task.interval
		task.priority = priority
		self.queue:Push(task)

		-- Keep track of the next priority that's going to be popped
		if priority < self.nextPriority then
			self.nextPriority = priority
		end
	end

	-- If there's nothing queued, quit out without trying to pop
	if self.nextPriority > ticks then
		return
	end

	-- Something's gonna get popped, so start popping
	while true do
		local task = self.queue:Pop()

		-- No tasks remaining, kill the loop
		if not task then
			self.nextPriority = math.huge
			break
		end

		-- Task was force-stopped, and should not be run again. Skip execution and re-queuing.
		if task.remove and task.removeIn <= 0 then
			goto continue
		end

		-- Task is for future, push it back on and update the next priority
		if task.priority > ticks then
			self.nextPriority = task.priority
			self.queue:Push(task)
			break
		end

		-- Execute the task
		task.func(ticks)

		-- Decrement the removal counter if it's due for removal, skipping re-queue if req.
		if task.remove then
			task.removeIn = task.removeIn - 1

			if task.removeIn <= 0 then
				goto continue
			end
		end

		-- TODO: Allow option between tick+interval and priority+interval
		-- Update the task's priority and add back into the queue
		task.priority = task.priority + task.interval
		self.queue:Push(task)

		::continue::
	end
end

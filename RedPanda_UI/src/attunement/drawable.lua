
-- Ensure Attunement is defined
if not Attunement then
	Attunement = {}
end

--[[
Default attributes values (for :Reset)
TODO: If someone can think of a better way to do it, please tell me.
--]]

-- Need a special constant for nil, as we can't store a real nil in a table without it just vanishing
local NIL = {}
local function getElementDefaults(extraAttrs)
	-- Base attributes used on everything
	local attributes = {
		-- Basic positioning
		X=0, Y=0, Width=32, Height=32,

		-- Transformations
		ScaleCenterX=0, ScaleCenterY=0, ScaleX=1, ScaleY=1, ScalingRotation=0,
		SkewX=0, SkewY=0,
		RotationCenterX=0, RotationCenterY=0, Rotation=0,
		TranslationX=0, TranslationY=0,

		Hidden=true,

		-- Colouring
		Color='#FFFFFFFF',
		BorderWidth=0, BorderColor='#FF000000',
		DrawBackground=false, BackgroundColor='#FFFFFFFF',

		-- Event callbacks
		OnMouseLeftDown=NIL, OnMouseLeftUp=NIL,
		OnMouseRightDown=NIL, OnMouseRightUp=NIL,
		OnMouseMiddleDown=NIL, OnMouseMiddleUp=NIL,
		OnMouseEnter=NIL, OnMouseLeave=NIL, OnMouseWheel=NIL,

		-- Drag
		Draggable=false,
		DragMinX=0, DragMaxX=0,
		DragMinY=0, DragMaxY=0,

		-- Focus
		Focuseable=false
	}

	if extraAttrs then
		for key, value in pairs(extraAttrs) do attributes[key] = value end
	end

	return attributes
end

local defaultElementValues = {
	Rectangle = getElementDefaults(),

	Ellipse = getElementDefaults{
		Width=64, Height=64,
		CenterX=32, CenterY=32, -- TODO: Not sure if that's accurate
		RadiusX=32, RadiusY=32
	},

	Label = getElementDefaults{
		Text='',
		FontFamily='Arial', FontWeight=400, FontSize=16, FontStyle=0, FontStretch=5,
		FlowDirection=0, ReadingDirection=0,
		ParagraphAlignment=0, TextAlignment=0,
		WordWrapping=0
	},

	Texture = getElementDefaults{
		FilePath='', DrawTint=false
	}
}

--[[
Element pool (will be filled out by :Delete and so on)
--]]
local elementPool = {}
function Attunement.ClearElementPool()
	elementPool = {
		Background = {},
		Low = {},
		Medium = {},
		High = {},
		Dialog = {},
		Fullscreen = {},
		Tooltip = {}
	}
end
Attunement.ClearElementPool()

--[[
Wrappers
--]]

-- Makes a new base Element.
local function NewElement(parent, params, args, name)
	-- Get the layer if passed, defaulting to medium
	local layer = 'Medium'
	if params and params.Layer then
		layer = params.Layer
		params.Layer = nil
	end

	-- Work out if we can just grab a recycled element
	local pool = elementPool[layer][name]
	if pool and #pool > 0 then
		-- Manual, unpack seems to be blocked/missing
		local recycled = table.remove(pool)

		-- Need to merge in the new params
		recycled[1]:Merge(params)
		return recycled[1], recycled[2]
	end

	-- Scopes
	local self = {}
	local protected = {}

	-- Create the element in AF
	local elem = UI['New' .. name](layer)
	protected.elem = elem

	-- Make forwarding versions of Show and Hide
	function self:Hide() elem:Hide() end
	function self:Show() elem:Show() end

	-- Allow merging numerous changes in one fall swoop. Used by constructor as well.
	function self:Merge(params)
		if params then
			for key, value in pairs(params) do self[key] = value end
		end
	end

	-- Allow Iteration of the attributes
	local function AttributeIteration(_, index)
		index, _ = next(args,index)
		if index then
			return index, self[index]
		end
	end
	function self:Attributes()
		return AttributeIteration, nil, nil
	end

	-- Reset the element to the default state (bypassing the metatable here)
	function self:Reset()
		for key, value in pairs(defaultElementValues[name]) do
			if value == NIL then value = nil end
			elem[key] = value
		end
	end

	-- 'Delete' the element by resetting and adding it to the pool for reuse
	function self:Delete()
		self:Reset()
		self:Hide()

		-- Lazy-create the tables.
		-- TODO: Should I use a FIFO? Seems overkill esp. with the extra dependency.
		if not elementPool[layer][name] then
			elementPool[layer][name] = {}
		end

		-- TODO: Currently recycling the atn element as opposed to the af core element.
		--       If it proves troublesome I'll just store the af one.
		table.insert(elementPool[layer][name], {self, protected})
	end

	-- Proxy the table so we can catch bad assigments before they crash Aetherflow
	local mt = {
		__index = function(table, key)
			local action = args[key]
			local actionType = type(action)
			-- Direct Access
			if actionType == 'number' then
				local value = elem[key]

				-- If the colour module is included, and it's a colour field, do some serious magic and
				-- return a mutable colour object
				if Attunement.Color and string.find(key, 'Color') then
					value = Attunement.Color:New(value)
					local mt = getmetatable(value)
					local oldNewIndex = mt.__newindex
					mt.__newindex = function(cTable, cKey, cValue)
						oldNewIndex(cTable, cKey, cValue)
						elem[key] = value.String
					end
				end

				return value

			-- Smart Access
			elseif actionType == 'function' then
				return action(elem, key)

			-- Forwarding Access
			elseif actionType == 'string' then
				return elem[action]

			else
				error('Attempted to read undefined attribute `' .. tostring(key) .. '` on ' .. name, 2)
			end
		end,

		__newindex = function(table, key, value)
			local action = args[key]
			local actionType = type(action)

			-- If the colour module is included, and we're assigning a table to a colour attribute,
			-- assume it's a colour object and grab the string representation
			-- TODO: Assuming (as it is so far) that colour attributes will have 'Color' in the name
			if Attunement.Color and string.find(key, 'Color') and type(value) == 'table' then
				value = value.String
			end

			-- Direct Access
			if actionType == 'number' then
				elem[key] = value

			-- Smart Access
			elseif actionType == 'function' then
				action(elem, key, value)

			-- Forwarding Access
			elseif actionType == 'string' then
				elem[action] = value

			else
				error('Attempted to write undefined attribute `' .. tostring(key) .. '` on ' .. name, 2)
			end
		end
	}
	setmetatable(self, mt)

	-- Set all the params into the new element
	-- This should already be using the proxy code
	-- So even it can throw errors.
	self:Merge(params)

	return self, protected
end

-- Makes an Element into a Geometry
local function BlessGeometry(self, protected)
	local elem = protected.elem

	-- BeginFigure(int x, int y, int figureBeginType)
	rawset(self, 'BeginFigure',
		function(self, x, y, figureBeginType)
			elem:BeginFigure(x, y, figureBeginType)
		end
	)
	-- AddArc(int arcSize, int endX, int endY, float rotAngle, float radiusX, float radiusY, int sweepDirection)
	rawset(self, 'AddArc',
		function(self, arcSize, endX, endY, rotAngle, radiusX, radiusY, sweepDirection)
			elem:AddArc(arcSize, endX, endY, rotAngle, radiusX, radiusY, sweepDirection)
		end
	)
	-- AddBezier(int x1, int y1, int x2, int y2, int x3, int y3)
	rawset(self, 'AddBezier',
		function(self, x1, y1, x2, y2, x3, y3)
			elem:AddBezier(x1, y1, x2, y2, x3, y3)
		end
	)
	-- AddLine(int x, int y)
	rawset(self, 'AddLine',
		function(self, x, y)
			elem:AddLine(x, y)
		end
	)
	-- EndFigure(int figureEndType)
	rawset(self, 'EndFigure',
		function(self, figureEndType)
			elem:EndFigure(figureEndType)
		end
	)

	rawset(self, 'Reset', function(self)
		-- Can't reset geometry at the moment
		error('Cannot currently reset a Geometry element.', 2)
	end)

	rawset(self, 'Delete', function(self)
		-- Can't actually recycle geo at the moment. Hide, and warn if the console is up.
		self:Hide()
		if Attunement.Debug then
			Attunement.Debug.Console:Write('warning', 'Could not recycle Geometry - has been hidden.')
		end
	end)

	return self, protected
end

-- Makes a new Geometry
local function NewGeometry(parent, params, args, name)
	return BlessGeometry(NewElement(parent, params, args, name))
end

--[[
Permitted attributes & mappings
--]]

-- All AF elements inherit these attributes, so no need to repeat them for each indivitual wrapper
local getElementAttributes = function(extraAttrs)
	-- Base attributes used on everything
	local attributes = {
		-- Default constructor
		Constructor = NewElement,

		-- Basic positioning
		X=1, Y=1, Width=1, Height=1,

		-- Transformations
		ScaleCenterX=1, ScaleCenterY=1, ScaleX=1, ScaleY=1, ScalingRotation=1,
		SkewX=1, SkewY=1,
		RotationCenterX=1, RotationCenterY=1, Rotation=1,
		TranslationX=1, TranslationY=1,

		Hidden=1,

		-- Colouring
		Color=1,
		BorderWidth=1, BorderColor=1,
		DrawBackground=1, BackgroundColor=1,

		-- Event callbacks
		OnMouseLeftDown=1, OnMouseLeftUp=1,
		OnMouseRightDown=1, OnMouseRightUp=1,
		OnMouseMiddleDown=1, OnMouseMiddleUp=1,
		OnMouseEnter=1, OnMouseLeave=1, OnMouseWheel=1,

		-- Drag
		Draggable=1,DragMinX=1, DragMaxX=1, DragMinY=1, DragMaxY=1,

		-- Focus
		Focuseable=1
	}

	if extraAttrs then
		for key, value in pairs(extraAttrs) do attributes[key] = value end
	end

	return attributes
end

-- Names of the available elements, for automatically handled wrapping
-- Arg list is stored as it is to allow hash lookups (as opposed to linear
-- lookups) to optimise performance.
local elements = {
	Rectangle = getElementAttributes(),

	Ellipse = getElementAttributes{
		CenterX=1, CenterY=1,
		RadiusX=1, RadiusY=1
	},

	Label = getElementAttributes{
		Text=1,
		FontFamily=1, FontWeight=1, FontSize=1, FontStyle=1, FontStretch=1,
		FlowDirection=1, ReadingDirection=1,
		ParagraphAlignment=1, TextAlignment=1,
		WordWrapping=1
	},

	Texture = getElementAttributes{
		FilePath=1, DrawTint=1
	},

	Geometry = getElementAttributes{
		Constructor=NewGeometry,

		-- Geometry X, and Y won't do anything
		-- TranslationX/Y does it instead
		X='TranslationX', Y='TranslationY'
	}
}

--[[
Global scope exposure
--]]

-- For each of the defined elements, wrap and add a nice constructor
for name, args in pairs(elements) do
	local constructor = args['Constructor']
	args['Constructor'] = nil
	Attunement[name] = {
		New = function(parent, params)
			return constructor(parent, params, args, name)
		end
	}
end

--[[
Constants
--]]

-- Elements have a bunch of parameters that take obscure numbers for settings. Expose some nicer constants.
local elementConstants = {
	Label = {
		-- FontStyle
		STYLE_NORMAL  = 0,
		STYLE_OBLIQUE = 1,
		STYLE_ITALIC  = 2,

		-- FlowDirection
		FLOW_TOP_TO_BOTTOM = 0,
		FLOW_BOTTOM_TO_TOP = 1,
		FLOW_LEFT_TO_RIGHT = 2,
		FLOW_RIGHT_TO_LEFT = 3,

		-- ReadingDirecction
		READ_LEFT_TO_RIGHT = 0,
		READ_RIGHT_TO_LEFT = 1,
		READ_TOP_TO_BOTTOM = 2,
		READ_BOTTOM_TO_TOP = 3,

		-- ParagraphAlignment
		PARAGRAPH_NEAR   = 0,
		PARAGRAPH_FAR    = 1,
		PARAGRAPH_CENTER = 2,

		-- TextAlignment
		ALIGN_LEADING   = 0,
		ALIGN_TRAILING  = 1,
		ALIGN_CENTER    = 2,
		ALIGN_JUSTIFIED = 3,

		-- WordWrapping
		WRAP                 = 0,
		NO_WRAP              = 1,
		WRAP_EMERGENCY_BREAK = 2,
		WRAP_WHOLE_WORD      = 3,
		WRAP_CHARACTER       = 4
	},

	Geometry = {
		-- Figure Type
		FIGURE_TYPE_FILLED = 0,
		FIGURE_TYPE_HOLLOW = 1,

		-- End Type
		END_TYPE_OPEN = 0,
		END_TYPE_CLOSED = 1,

		-- ARC Sizes
		ARC_180_OR_LESS = 0,
		ARC_180_OR_GREATER = 1,

		-- ARC Sweep Direction
		ARC_SWEEP_COUNTER_CLOCKWISE = 0,
		ARC_SWEEP_CLOCKWISE = 1
	}
}
for element, constants in pairs(elementConstants) do
	for key, value in pairs(constants) do
		Attunement[element][key] = value
	end
end

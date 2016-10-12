--[[ Little Object Library v0.1
   ____  _____  ____
  /   / /     \/   /
 /   /_/   /  /   /_
/_____/\_____/_____/.lua
Copyright © 2016 Manuel Sainz de Baranda y Goñi.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
UNALTERED in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE. ]]

LOL                      = {}
LOL.base_class           = {}
LOL.base_class_metatable = {__index = LOL.base_class}

function LOL.base_class:is_class   () return self.class == nil end
function LOL.base_class:is_instance() return self.class ~= nil end


function LOL.base_class:is_descendant_of(class)
	if class:is_instance() then class = class.class end
	self = self.super
	while self do
		if self == class then return true end
		self = self.super
	end
	return false
end


function LOL.base_class:is_ancestor_of(class)
	if self:is_instance() then self = self.class end
	local class = class.super
	while class do
		if class == self then return true end
		class = class.super
	end
	return false
end


function LOL.base_class:is_kind_of(class)
	if class:is_instance() then class = class.class end
	if self:is_instance () then self  = self.class  end
	while self do
		if self == class then return true end
		self = self.super
	end
	return false
end


LOL.new_class = function(superclass, initialize_class)
	local class = {}
	local class_metatable = {__index = class}

	if superclass then
		setmetatable(class, {__index = superclass})
		class.super = superclass
	else
		setmetatable(class, LOL.base_class_metatable)
		class.super = LOL.base_class
	end

	function class:new(...)
		local instance = {}
		setmetatable(instance, class_metatable)
		instance.class = class
		if instance.initialize then
			instance:initialize(...)
		end
		return instance
	end

	if initialize_class then initialize_class(class) end
	return class
end


-- LOL.lua EOF

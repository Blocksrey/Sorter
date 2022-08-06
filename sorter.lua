local Sorter = {}
Sorter.__index = Sorter

function Sorter.new()
	local self = setmetatable({}, Sorter)
	
	self._scores = {}--forward
	self._hashed = {}--inverse
	self._sorted = {}--sorted
	
	return self
end

function Sorter:Set(score, value)
	if self._hashed[score] then
		error("Score already exists")
	else
		table.insert(self._scores, score)
		self._hashed[score] = value
	end
end

function Sorter:Sort()
	table.sort(self._scores)
	
	for index, score in next, self._scores do
		self._sorted[index] = self._hashed[score]
	end
end

function Sorter:GetSorted()
	return self._sorted
end

function Sorter:Destroy()
	self._scores = nil
	self._hashed = nil
	self._sorted = nil
	
	setmetatable(self, nil)
end

return Sorter

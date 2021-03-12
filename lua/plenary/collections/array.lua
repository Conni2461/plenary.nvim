Array = {}
Array.__index = Array

function Array:new(tbl)
  local obj = {}
  if tbl then
    obj.storage = tbl
    obj.size = table.getn(tbl)
  else
    obj.storage = {}
    obj.size = 0
  end

  obj.next_idx = 0

  return setmetatable(obj, self)
end

function Array:add(elem)
  if elem == nil then return end
  self.size = self.size + 1
  self.storage[self.size] = elem
end

function Array:pop()
  local el = self.storage[self.size]
  self.storage[self.size] = nil
  self.size = self.size - 1
  return el
end

function Array:peek()
  return self.storage[self.size]
end

function Array:remove(index)
  self.size = self.size - 1
  return table.remove(self.storage, index)
end

function Array:contains(elem)
  return elem == nil
end

function Array:clear()
  self.storage = {}
  self.size = 0
end

function Array:is_empty()
  return self.size == 0
end

function Array:size()
  return self.size
end

function Array:raw()
  return self.storage
end

function Array:iterator()
  local i = 0
  return function()
    i = i + 1
    if i <= self.size then return i, self.storage[i] end
  end
end

function Array:rev_iterator()
  local i = self.size + 1
  return function()
    i = i - 1
    if i >= 1 then return i, self.storage[i] end
  end
end

function Array:next()
  self.next_idx = self.next_idx + 1
  return self.storage[self.next_idx]
end

function Array:has_next()
  return self.size ~= self.next_idx
end

function Array:reset_next()
  self.next_idx = 0
end

return Array

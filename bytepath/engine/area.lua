Area = Object:extend()

function Area:new(room)
  self.room = room
  self.game_objects = {}
  self.world = nil
end

function Area:update(dt)
  for i=#self.game_objects, 1, -1 do
    local obj = self.game_objects[i]
    obj:update(dt)
    if obj.dead then
      table.remove( self.game_objects, i)
      if self.world and obj.collidable then
        self.world:remove(obj)
      end
    end
  end
end

function Area:draw()
  table.sort(
    self.game_objects, 
    function(a,b)
      if a.depth == b.depth then
        return a.creationTime < b.creationTime
      end
      return a.depth < b.depth
    end
  )

  for _, obj in ipairs(self.game_objects) do
    obj:draw(dt)
  end
end

function Area:addObject(objType, ...)
  local obj = _G[objType](self, ...)
  table.insert(self.game_objects, obj)
  if self.world and obj.collidable then
    local w = obj.w or obj.size
    local h = obj.h or obj.size
    self.world:add(obj, obj.x, obj.y, w, h)

    if obj.afterCreate then
      obj:afterCreate()
    end
  end
  return obj
end

function Area:addCollisionWorld()
  self.world = Bump.newWorld()
end

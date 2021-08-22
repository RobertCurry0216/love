Pickup = GameObject:extend()

function Pickup:new(area, x, y)
  Pickup.super.new(self, area, x, y)
  self.type = "pickup"
  self.collide.canBePickedUp = true
end

function Pickup:onPickup(other)

end
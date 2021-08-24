Director = Object:extend()

function Director:new(stage)
  self.stage = stage
  self.difficulty = 1
  self.roundDuration = 22
  self.roundTimer = 0

  --difficulty points
  local points = {16}
  for i=2, 1024, 4 do
    points[i] = points[i-1] + 8
    points[i+1] = points[i]
    points[i+2] = math.floor(points[i+1] / 1.5)
    points[i+3] = points[i+2] * 2
  end
  self.difficultyPoints = points

  self.enemyPointValues = {
    Rock = 1,
    Shooter = 2
  }
end

function Director:update(dt)
  self.roundTimer = self.roundTimer + dt
  if self.roundTimer > self.roundDuration then
    self.roundTimer = 0
    self.difficulty = self.difficulty + 1
    self:setEnemySpawnsForThisRound()
  end
end

function Director:setEnemySpawnsForThisRound()

end
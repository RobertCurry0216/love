Director = Object:extend()

function Director:new(stage)
  self.stage = stage
  self.difficulty = 1
  self.roundDuration = 22
  self.roundTimer = 0
  self.timer = Timer()

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
  
  -- set pickups spawns
  self.enemySpawnGenerators = {
    chanceGenerator({"Rock", 1}),
    chanceGenerator({"Rock", 8}, {"Shooter", 4}),
    chanceGenerator({"Rock", 8}, {"Shooter", 8}),
    chanceGenerator({"Rock", 4}, {"Shooter", 8}),
  }

  self:setEnemySpawnsForThisRound()
  
  local pickupSpawnGenerator = chanceGenerator(
    {'BoostPickup', 28}, {'HPPickup', 14}, {'SkillPointPickup', 58}
  )
  self.timer:every(16, function() self.stage.area:addObject(pickupSpawnGenerator()) end)

  -- set gun spawns
  local gunSpawnGenerator = chanceGenerator(
    {"Double", 3},
    {"Triple", 3},
    {"Rapid", 3},
    {"Spread", 3},
    {"Back", 3},
    {"Side", 3}
  )
  self.timer:every(30, function() self.stage.area:addObject("GunPickup", gunSpawnGenerator()) end)
end

function Director:update(dt)
  self.roundTimer = self.roundTimer + dt
  self.timer:update(dt)
  if self.roundTimer > self.roundDuration then
    self.roundTimer = 0
    self.difficulty = self.difficulty + 1
    self:setEnemySpawnsForThisRound()
  end
end

function Director:setEnemySpawnsForThisRound()
  local points = self.difficultyPoints[self.difficulty]

  -- create enemy list
  local enemyList = {}
  local generator = self.enemySpawnGenerators[self.difficulty] or chanceGenerator({"Rock", love.math.random(2,12)},{"Shooter", love.math.random(2,12)})
  while points > 0 do
    local e = generator()
    points = points - self.enemyPointValues[e]
    table.insert(enemyList, e)
  end

  -- set spawn times
  local spawnTimes = {}
  for i=1,#enemyList do
    table.insert(spawnTimes, random(1, self.roundDuration))
  end

  -- set timers
  for i, v in ipairs(spawnTimes) do
    self.timer:after(
      v,
      function()
        self.stage.area:addObject(enemyList[i])
      end
    )
  end
end
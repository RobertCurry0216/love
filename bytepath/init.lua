--globals
require "globals"

-- external libs
Object = require "lib.classic.classic"
Input = require "lib.boipushy.input"
Timer = require "lib.hump.timer"
Camera = require "lib.hump.camera"
Shake = require "lib.hump.shake"
M = require "lib.Moses.moses"
Bump = require "lib.bump.bump"
V = require "lib.hump.vector-light"

--utils
require "utils.utils"
require "utils.math"

--engine
require "engine.room"
require "engine.area"
require "engine.gameObject"

--rooms
require "rooms.stage"

--classes
require "objects.player"
require "objects.projectile"

--effects
require "objects.effects.shootEffect"
require "objects.effects.projectileDeathEffect"
require "objects.effects.explodeEffect"
require "objects.effects.tickEffect"
require "objects.effects.trailEffect"
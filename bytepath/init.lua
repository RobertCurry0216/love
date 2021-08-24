-- external libs
Object = require "lib.classic.classic"
Input = require "lib.boipushy.input"
Timer = require "lib.hump.timer"
Camera = require "lib.hump.camera"
Shake = require "lib.hump.shake"
M = require "lib.Moses.moses"
Bump = require "lib.bump.bump"
V = require "lib.hump.vector-light"
Draft = require "lib.draft.draft"
require "lib.utf8"

--globals
require "globals"

--utils
require "utils.utils"
require "utils.math"
require "utils.spawners"

--engine
require "engine.room"
require "engine.area"
require "engine.gameObject"

--custom responses
require "responses.push"

--rooms
require "rooms.stage"

--game objects
require "objects.director"
require "objects.player"
require "objects.ships"
require "objects.guns"
require "objects.enemies.rock"
require "objects.enemies.shooter"
require "objects.projectiles.projectile"
require "objects.projectiles.enemyProjectile"

require "objects.pickups.pickup"
require "objects.pickups.ammoPickup"
require "objects.pickups.boostPickup"
require "objects.pickups.skillPointPickup"
require "objects.pickups.hpPickup"
require "objects.pickups.gunPickup"

--effects
require "objects.effects.shootEffect"
require "objects.effects.projectileDeathEffect"
require "objects.effects.explodeEffect"
require "objects.effects.tickEffect"
require "objects.effects.trailEffect"
require "objects.effects.ammoEffect"
require "objects.effects.boostEffect"
require "objects.effects.hpEffect"
require "objects.effects.skillPointEffect"
require "objects.effects.textEffect"
require "objects.effects.gunEffect"
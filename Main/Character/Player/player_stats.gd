class_name PlayerStats
extends Resource

static var damage_mult: float = 1
static var speed_mult: float = 1
static var fire_rate: float = 1
static var laser_length_mult: float = 1
static var crit_chance: float = 0.05
static var crit_damage: float = 1.5
static var homing: bool = false

static func reset() -> void:
	damage_mult = 1
	speed_mult = 1
	fire_rate = 1
	laser_length_mult = 1
	crit_chance = 0.05
	crit_damage = 1.5
	homing = false

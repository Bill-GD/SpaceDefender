class_name PlayerStats
extends Resource

static var damage_boost: float = 1
static var speed_boost: float = 1
static var crit_chance: float = 0.05
static var crit_damage: float = 1.5
static var homing: bool = false

static func reset() -> void:
	damage_boost = 1
	speed_boost = 1
	crit_chance = 0.05
	crit_damage = 1.5
	homing = false

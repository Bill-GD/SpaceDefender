class_name WeaponUtils
extends GDScript

enum WeaponType {
	SINGLE_BLASTER,
	DOUBLE_BLASTER,
	SHOTGUN,
	QUAD_BLASTER,
	SINGLE_ROCKET,
	DOUBLE_ROCKET,
	LASER,
}

static var weapon_types: Array[String] = [
	"SINGLE_BLASTER",
	"DOUBLE_BLASTER",
	"SHOTGUN",
	"QUAD_BLASTER",
	"SINGLE_ROCKET",
	"DOUBLE_ROCKET",
	"LASER",
]

static var weapon_paths: Array[String] = [
	"res://Main/Weapon/Blaster/blaster.tscn",
	"res://Main/Weapon/Blaster/double_blaster.tscn",
	"res://Main/Weapon/Shotgun/shotgun.tscn",
	"res://Main/Weapon/Blaster/quad_blaster.tscn",
	"res://Main/Weapon/RocketLauncher/single_rocket_launcher.tscn",
	"res://Main/Weapon/RocketLauncher/double_rocket_launcher.tscn",
	"res://Main/Weapon/LaserGun/laser_gun.tscn",
]

static var player_weapons: Array[WeaponType] = [
	WeaponType.SINGLE_BLASTER,
	WeaponType.DOUBLE_BLASTER,
	WeaponType.SHOTGUN,
	WeaponType.QUAD_BLASTER,
	WeaponType.SINGLE_ROCKET,
	WeaponType.DOUBLE_ROCKET,
	WeaponType.LASER,
]

static var enemy_weapons: Array[WeaponType] = [
	WeaponType.SINGLE_BLASTER,
	WeaponType.DOUBLE_BLASTER,
]

static func get_weapon_path(type: WeaponType) -> String:
	return weapon_paths[type]

static func add_player_weapon(type: WeaponType) -> void:
	player_weapons.append(type)

	var next_enemy_weapon: int = type + 1
	if next_enemy_weapon >= WeaponType.size(): return
	
	enemy_weapons.append(WeaponType.get(weapon_types[next_enemy_weapon]))

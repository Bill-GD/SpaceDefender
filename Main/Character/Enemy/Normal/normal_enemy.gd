class_name NormalEnemy
extends Enemy

@export var weapon_type: WeaponUtils.WeaponType

func _ready() -> void:
	super()
	set_weapon(WeaponUtils.enemy_weapons.pick_random())
	target = %Player

func _physics_process(delta) -> void:
	super(delta)
	pass

func set_weapon(type: WeaponUtils.WeaponType) -> void:
	weapon_type = type
	var weapon_node: PackedScene = load(WeaponUtils.get_weapon_path(type))
	$Weapon.add_child(weapon_node.instantiate())
	$Weapon.update_weapon()

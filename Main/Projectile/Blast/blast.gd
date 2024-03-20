class_name Blast
extends Projectile

func _ready() -> void:
	set_sprite_scale(Vector2(0.3, 0.3))
	super()
	if not from_player:
		$Sprite.frame = 1

func _physics_process(delta) -> void:
	super(delta)
	pass

func set_despawn_timer(new_time: float) -> void:
	$DespawnTimer.wait_time = new_time

class_name Rocket
extends Projectile

func _ready() -> void:
	set_sprite_scale(Vector2(0.02, 0.02))
	super()
	if not from_player:
		$Sprite.frame = 1

func _physics_process(delta) -> void:
	super(delta)
	pass

func _on_tree_exiting() -> void:
	#print('Rocket exited')
	pass

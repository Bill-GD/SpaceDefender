class_name Blast
extends Projectile

func _ready() -> void:
	super()
	if not from_player:
		$Sprite.frame = 1

func _physics_process(delta) -> void:
	super(delta)
	pass

class_name Character
extends CharacterBody2D

signal died

@export var base_stats: BasicStats
#@onready var health_bar: HealthBar = $HealthBar

var speed: float
var health: float
var damage: float
var shield: float

func _ready() -> void:
	speed = base_stats.base_speed
	health = base_stats.base_health
	damage = base_stats.base_damage
	shield = base_stats.base_shield
	pass

func die() -> void:
	print_rich("[color=red]%s has died[/color]" % name)

func take_damage(damage_taken: float) -> void:
	$AnimationPlayer.play("hit_flash")
	health -= damage_taken
	# print_rich("[color=yellow]%s took %s damage, %s left[/color]" % [name, damage_taken, health])
	
	if health <= 0:
		died.emit()
		die()

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if not area is Projectile: return
	area = area as Projectile
	
	if (area.from_player and self is Enemy) or (area.from_player and self is not Player):
		var knockback: Vector2 = area.global_position - global_position
		print_rich("Knockback: f=%s, v=%s" % [area.knockback_force, knockback])
		velocity += knockback * area.knockback_force * 500
		
		take_damage(area.damage)
		area.queue_free()

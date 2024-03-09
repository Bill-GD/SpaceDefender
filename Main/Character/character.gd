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
	get_base_stats(base_stats)
	#print('Updating health of %s' % name)
	#health_bar.set_max_value(health)
	#health_bar.update_value(health)
	pass

func get_base_stats(stats: BasicStats) -> void:
	speed = stats.base_speed
	health = stats.base_health
	damage = stats.base_damage
	shield = stats.base_shield

func die() -> void:
	print_rich("[color=red]%s has died[/color]" % name)

func take_damage(damage_taken: float) -> void:
	$AnimationPlayer.play("hit_flash")
	health -= damage_taken
	if health <= 0:
		died.emit()
		die()
	
	print_rich("[color=yellow]%s took %s damage, %s left[/color]" % [name, damage_taken, health])

func _on_hurt_box_area_entered(area: Area2D) -> void:
	if not area is Projectile: return
	area = area as Projectile
	
	if (area.from_player and self is Enemy) or (not area.from_player and self is Player):
		take_damage(area.damage)
		area.queue_free()

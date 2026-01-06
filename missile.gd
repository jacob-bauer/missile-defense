## TODO:
##		Missiles need to draw trails behind them.

extends Node2D
class_name Missile


@export var inactive_warhead: PackedScene = preload("res://explosion.tscn")

## Speed in pixels per second of flight to target
@export var flight_speed: int = 400


func launch(silo_position: Vector2, target_position: Vector2) -> void:
	var active_warhead: Explosion = inactive_warhead.instantiate()
	add_child(active_warhead)
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed	
	await get_tree().create_timer(time_of_flight).timeout
	
	position = target_position
	active_warhead.explode()

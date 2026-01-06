## TODO:
##		Missiles need to draw trails behind them.

extends Node2D
class_name Missile


var inactive_warhead = preload("res://explosion.tscn")


@export var flight_time: float = 1.0


func launch(target_position: Vector2) -> void:
	position = target_position
	
	var active_warhead: Explosion = inactive_warhead.instantiate()
	add_child(active_warhead)
	
	await get_tree().create_timer(flight_time).timeout
	active_warhead.explode()

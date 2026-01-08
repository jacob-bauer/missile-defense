## TODO:
##		Missiles need to draw trails behind them.

extends Node2D
class_name Missile


var _active_warhead: Explosion
var _target_position: Vector2


@export var inactive_warhead: PackedScene = preload("res://explosion.tscn")
@export var smoke: PackedScene = preload("res://smoke_trail.tscn")

## Speed in pixels per second of flight to target
@export var flight_speed: int = 240


func launch(silo_position: Vector2, target_position: Vector2) -> void:
	var active_warhead: Explosion = inactive_warhead.instantiate()
	active_warhead.name = "ActiveWarhead"
	add_child(active_warhead)
	
	_active_warhead = active_warhead
	_target_position = target_position
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed
	var active_smoke: SmokeTrail = smoke.instantiate()
	active_smoke.target_reached.connect(_on_target_reached)
	add_child(active_smoke)
	active_smoke.launch(silo_position, target_position, time_of_flight)


func _on_target_reached() -> void:
	position = _target_position
	_active_warhead.explode()

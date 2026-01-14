extends Node
class_name Launcher


@export var missile_prototype: PackedScene = preload("res://missile.tscn")


func launch(target_position: Vector2, launch_position: Vector2, flight_speed: int, friendly: bool) -> void:
	var active_missile: Missile = missile_prototype.instantiate()
	active_missile.flight_speed = flight_speed
	add_child(active_missile)
	active_missile.launch(launch_position, target_position, friendly)

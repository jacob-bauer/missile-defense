extends Area2D
class_name NewMissile


var _target_position: Vector2


## Speed in pixels per second of flight to target
@export var flight_speed: int = 240


func launch(silo_position: Vector2, target_position: Vector2) -> void:
	_target_position = target_position
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed
	$SmokeTrail.launch(silo_position, target_position, time_of_flight)


func _on_target_reached() -> void:
	position = _target_position
	# Make the missile explode

extends Line2D
class_name SmokeTrail


signal target_reached


var _target_position: Vector2
var _speed: int
var _direction: Vector2


func _ready() -> void:
	set_process(false)


func _process(delta: float) -> void:
	var velocity = _direction * _speed * delta
	var new_position = points[1] + velocity
	
	if new_position.distance_to(_target_position) > points[1].distance_to(_target_position):
		set_process(false)
		queue_free()
		target_reached.emit()
		
	else:
		set_point_position(1, new_position)


func launch(launch_position: Vector2, target_position: Vector2, time_of_flight: float) -> void:
	_target_position = target_position
	_speed = roundi(launch_position.distance_to(target_position) / time_of_flight)
	_direction = launch_position.direction_to(target_position)
	
	add_point(launch_position, 0)
	add_point(launch_position, 1)
	
	set_process(true)

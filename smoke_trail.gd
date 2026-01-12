extends Line2D
class_name SmokeTrail


signal target_reached


# This variable is tweened and that causes our line to be animated
@warning_ignore("unused_private_class_variable")
var _current_line_end: Vector2:
	set(value):
		add_point(value, 1)
	get:
		return points[1]


func _ready() -> void:
	antialiased = true


func launch(launch_position: Vector2, target_position: Vector2, time_of_flight: float) -> void:
	add_point(launch_position, 0)
	add_point(launch_position, 1)
	
	var line_length = get_tree().create_tween()
	line_length.tween_property(self, "_current_line_end", target_position, time_of_flight)
	
	await line_length.finished
	queue_free()
	target_reached.emit()

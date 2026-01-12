extends Area2D
class_name NewMissile


var _target_position: Vector2


## Speed in pixels per second of flight to target
@export var flight_speed: int = 240
## The radius in pixels of the missile explosion at it's largest
@export var explosion_radius: int = 40
## The number of seconds the explosion takes. It will reach it's peak explosion_radius
## at [code]explosion_lifetime / 2[/code] seconds.
@export var explosion_lifetime: float = 3


func _draw() -> void:
	# Now I need this to be animated WITH the size of the collision shape.
	# Unfortunately this means I cannot use the animation player, and so must also manually
	# animate the collision shape
	draw_circle(Vector2.ZERO, 20, Color.WHITE, -1, true)


func launch(silo_position: Vector2, target_position: Vector2) -> void:
	_target_position = target_position
	$CollisionShape2D.disabled = true
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed
	$SmokeTrail.launch(silo_position, target_position, time_of_flight)


func _on_target_reached() -> void:
	$CollisionShape2D.disabled = false
	position = _target_position
	queue_redraw()
	$AnimationPlayer.play("Explode")
	

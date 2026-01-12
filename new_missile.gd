extends Area2D
class_name NewMissile


var _target_position: Vector2
var _current_radius: float:
	set(value):
		_current_radius = value
		queue_redraw()
	get:
		return _current_radius


## Speed in pixels per second of flight to target
@export var flight_speed: int = 240
## The radius in pixels of the missile explosion at it's largest
@export var explosion_radius: int = 20
## The number of seconds the explosion takes. It will reach it's peak explosion_radius
## at [code]explosion_lifetime / 2[/code] seconds.
@export var explosion_lifetime: float = 3


func _ready() -> void:
	set_process(false)
	$CollisionShape2D.disabled = true
	$CollisionShape2D.shape.radius = 0


func _draw() -> void:
	draw_circle(Vector2.ZERO, _current_radius, Color.WHITE, true, -1, true)


func launch(silo_position: Vector2, target_position: Vector2) -> void:
	_target_position = target_position
	$CollisionShape2D.disabled = true
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed
	$SmokeTrail.launch(silo_position, target_position, time_of_flight)


func _on_target_reached() -> void:
	$CollisionShape2D.disabled = false
	position = _target_position
	
	var explosion_growth = get_tree().create_tween()
	explosion_growth.set_parallel()
	explosion_growth.tween_property($CollisionShape2D.shape, "radius", explosion_radius, explosion_lifetime / 2)
	explosion_growth.tween_property(self, "_current_radius", explosion_radius, explosion_lifetime / 2)
	explosion_growth.chain()
	explosion_growth.tween_property($CollisionShape2D.shape, "radius", 0, explosion_lifetime / 2)
	explosion_growth.tween_property(self, "_current_radius", 0, explosion_lifetime / 2)

extends Area2D
class_name Missile


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
## at [code]explosion_transition_time / 2[/code] seconds.
@export var explosion_transition_time: float = 3
## The time in seconds that the explosion is at it's maximum radius
@export var explosion_time_at_max: float = 0.5
## The color of the explosion circle
@export var explosion_color: Color


func _ready() -> void:
	set_process(false)
	$CollisionShape2D.disabled = true
	$CollisionShape2D.shape.radius = 0


func _draw() -> void:
	draw_circle(Vector2.ZERO, _current_radius, explosion_color, true, -1, true)


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
	explosion_growth.tween_property($CollisionShape2D.shape, "radius", explosion_radius, explosion_transition_time / 2)
	explosion_growth.tween_property(self, "_current_radius", explosion_radius, explosion_transition_time / 2)
	explosion_growth.chain()
	explosion_growth.tween_interval(explosion_time_at_max)
	explosion_growth.chain()
	explosion_growth.tween_property($CollisionShape2D.shape, "radius", 0, explosion_transition_time / 2)
	explosion_growth.tween_property(self, "_current_radius", 0, explosion_transition_time / 2)

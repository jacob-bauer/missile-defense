extends Area2D
class_name Missile


var _exploded: bool = false
var _line_tween: Tween
var _friendly: bool
var _target_position: Vector2
var _current_radius: float:
	set(value):
		_current_radius = value
		queue_redraw()
	get:
		return _current_radius

# This gets manipulated by a tween, so it appears that it doesn't get used,
# but it does.
@warning_ignore("unused_private_class_variable")
var _current_position: Vector2:
	set(value):
		$Line2D.add_point(value, 1)
		$CollisionShape2D.position = value
	get:
		return $Line2D.points[1]


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
## The width of the smoke trail in pixels
@export var smoke_trail_width: float = 1.5
@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	$CollisionShape2D.shape.radius = 1
	$Line2D.antialiased = true
	$Line2D.width = smoke_trail_width


func _draw() -> void:
	draw_circle(Vector2.ZERO, _current_radius, explosion_color, true, -1, true)


func launch(silo_position: Vector2, target_position: Vector2, friendly: bool = true) -> void:
	if friendly:
		$CollisionShape2D.disabled = true
	
	_target_position = target_position
	_friendly = friendly
	set_initial_physics_layers()
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed

	$Line2D.add_point(silo_position, 0)
	$Line2D.add_point(silo_position, 1)
	
	_line_tween = get_tree().create_tween()
	_line_tween.tween_property(self, "_current_position", target_position, time_of_flight)
	await _line_tween.finished

	_on_target_reached()

func set_initial_physics_layers() -> void:
	if _friendly:
		collision_layer = GameData.Collision_Layers.FRIENDLY_MISSILES
		collision_mask = GameData.Collision_Layers.ENEMY_MISSILES
	else:
		collision_layer = GameData.Collision_Layers.ENEMY_MISSILES
		collision_mask = GameData.Collision_Layers.FRIENDLY_MISSILES | GameData.Collision_Layers.CITY | GameData.Collision_Layers.ENEMY_MISSILES


func _on_target_reached() -> void:
	if _line_tween.is_running():
		_line_tween.kill()
	
	$Line2D.queue_free()
	position = _target_position
	$CollisionShape2D.position = Vector2.ZERO
	$CollisionShape2D.set_deferred("disabled", false)
	
	var explosion_growth = get_tree().create_tween()
	explosion_growth.set_parallel()
	explosion_growth.tween_property($CollisionShape2D.shape, "radius", explosion_radius, explosion_transition_time / 2)
	explosion_growth.tween_property(self, "_current_radius", explosion_radius, explosion_transition_time / 2)
	explosion_growth.chain()
	explosion_growth.tween_interval(explosion_time_at_max)
	explosion_growth.chain()
	explosion_growth.tween_property($CollisionShape2D.shape, "radius", 0, explosion_transition_time / 2)
	explosion_growth.tween_property(self, "_current_radius", 0, explosion_transition_time / 2)
	
	await explosion_growth.finished
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if not _friendly and not _exploded and area is Missile:
		var missile = area as Missile
		_exploded = true
		_target_position = $CollisionShape2D.position
		_on_target_reached()
	
	game_state.missile_hit.emit(area)

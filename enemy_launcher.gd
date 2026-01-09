extends Node
class_name EnemyLauncher


@export var enemy_missile_quantity: int = 10
@export var min_seconds_between_launches: float = 0.1
@export var max_seconds_between_launches: float = 0.5
@export var game_state: GameData


func begin_attack() -> void:
	start_timer()


func _on_launch_countdown_timeout() -> void:
	var target_position: Vector2 = game_state.target_positions.pick_random()
	var launch_position: Vector2 = Vector2(randi_range(0, get_viewport().size()), 0)
	
	$Silo.launch(target_position, launch_position)
	start_timer()


func start_timer() -> void:
	$LaunchCountdown.start(randf_range(min_seconds_between_launches, max_seconds_between_launches))

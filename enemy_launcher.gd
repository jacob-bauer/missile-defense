extends Node
class_name EnemyLauncher
# Update to manage own missile quantity

@export var enemy_missile_quantity: int = 10
@export var enemy_missile_speed: int = 25
@export var min_seconds_between_launches: float = 0.1
@export var max_seconds_between_launches: float = 0.5
@export var game_state: GameData


func begin_attack() -> void:
	_start_timer()


func _on_launch_countdown_timeout() -> void:
	var target_position: Vector2 = game_state.target_positions.pick_random()
	$EnemyLaunchPath/EnemyLaunchPosition.progress_ratio = randf()
	var launch_position: Vector2 = $EnemyLaunchPath/EnemyLaunchPosition.global_position
	
	if enemy_missile_quantity > 0:
		enemy_missile_quantity -= 1
		$Launcher.launch(target_position, launch_position, enemy_missile_speed, false)
		_start_timer()


func _start_timer() -> void:
	$LaunchCountdown.start(randf_range(min_seconds_between_launches, max_seconds_between_launches))

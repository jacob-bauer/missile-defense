extends Node
class_name EnemyLauncher


var _log_string: String =\
GameData.log_separator + """Enemy Launch Event
{begin_or_end}
Wave:\t{wave}
Quantity:\t{quantity}"""


var _completed_missiles_quantity: int:
	set(value):
		_completed_missiles_quantity = value
		if value == _wave_missile_quantity:
			print(_log_string.format({"begin_or_end":"Attack Completed",
									  "wave":game_state.wave,
									  "quantity":_completed_missiles_quantity}))
			
			game_state.wave_completed.emit()
	
	get:
		return _completed_missiles_quantity


var _current_ammo: int:
	set(value):
		_current_ammo = value
		if value <= 0:
			game_state.wave_launched.emit(_wave_missile_quantity)

	get:
		return _current_ammo


var _wave_missile_quantity: int
var _wave_missile_speed: int


@export var difficulty_increase_per_wave: float = 0.1
@export var base_missile_quantity: int = 10
@export var base_missile_speed: int = 25
@export var min_seconds_between_launches: float = 0.1
@export var max_seconds_between_launches: float = 0.5
@export var game_state: GameData


func _ready() -> void:
	game_state.begin_wave.connect(begin_attack)


func begin_attack() -> void:
	print(_log_string.format({"begin_or_end":"Begin Attack",
							  "wave":game_state.wave,
							  "quantity":_wave_missile_quantity}))
	
	_wave_missile_quantity = base_missile_quantity
	_completed_missiles_quantity = 0
	_wave_missile_speed = base_missile_speed
	var wave = game_state.wave
	if wave > 1:
		_wave_missile_quantity += roundi(_wave_missile_quantity * difficulty_increase_per_wave * wave)
		_wave_missile_speed += roundi(_wave_missile_speed * difficulty_increase_per_wave * wave)
	
	_current_ammo = _wave_missile_quantity
	_start_timer()


func _on_launch_countdown_timeout() -> void:
	var target_position: Vector2 = game_state.target_positions.pick_random()
	$EnemyLaunchPath/EnemyLaunchPosition.progress_ratio = randf()
	var launch_position: Vector2 = $EnemyLaunchPath/EnemyLaunchPosition.global_position
	
	if _current_ammo > 0:
		_current_ammo -= 1
		$Launcher.launch(target_position, launch_position, _wave_missile_speed, false)
		_start_timer()


func _start_timer() -> void:
	$LaunchCountdown.start(randf_range(min_seconds_between_launches, max_seconds_between_launches))


func _on_launcher_child_exiting_tree(_node: Node) -> void:
	_completed_missiles_quantity += 1

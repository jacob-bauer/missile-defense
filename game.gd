extends Node


var paused: bool = false


@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	toggle_pause(false)
	game_state.wave_changed.connect(_on_wave_changed)
	game_state.begin_wave.connect(_on_begin_wave)
	game_state.begin_wave.emit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		toggle_pause()


func toggle_pause(pause: bool = not paused) -> void:
	paused = pause
	$PauseMenu.visible = paused
	get_tree().paused = paused


func _on_wave_changed(_wave: int) -> void:
	$WaveTransiter.transition()


func _on_begin_wave() -> void:
	$PlayableArea/EnemyLauncher.begin_attack()

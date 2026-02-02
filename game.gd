extends Node


var _disable_pause: bool = false


@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	game_logger.log_level_flags = GameLogger.LOG_LEVEL.INFORMATIONAL | GameLogger.LOG_LEVEL.STATUS | GameLogger.LOG_LEVEL.ERROR
	game_logger.requester_types.append_array([])
	game_state.game_over.connect(_on_game_over)
	
	game_state.score = 8000

func _on_game_over() -> void:
	_disable_pause = true


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause") and not _disable_pause:
		$PauseMenu.toggle_pause()

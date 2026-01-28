extends Node


@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	game_logger.log_level_flags = GameLogger.LOG_LEVEL.INFORMATIONAL
	game_logger.requester_types.append("enemy_launcher")


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		$PauseMenu.toggle_pause()

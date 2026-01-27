extends Node


var _log_close: String =\
GameData.log_separator +\
"""Game Exiting
Time:\t{time}"""


@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	$PauseMenu.visible = false
	get_tree().paused = false


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		print(_log_close.format({"time":Time.get_datetime_string_from_system()}))
		get_tree().quit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		toggle_pause()


func toggle_pause() -> void:
	$PauseMenu.visible = not $PauseMenu.visible
	game_state.pause.emit($PauseMenu.visible)
	get_tree().paused = not get_tree().paused

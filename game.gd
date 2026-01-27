extends Node


@export var game_state: GameData = load("res://shared_game_data.tres")


func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		get_tree().quit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		$PauseMenu.toggle_pause()

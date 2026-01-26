extends Node


@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	$PauseMenu.visible = false
	get_tree().paused = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		toggle_pause()


func toggle_pause() -> void:
	$PauseMenu.visible = not $PauseMenu.visible
	game_state.pause.emit($PauseMenu.visible)
	get_tree().paused = not get_tree().paused

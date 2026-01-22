extends Node


var paused: bool = false


func _ready() -> void:
	toggle_pause(false)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		toggle_pause()


func toggle_pause(pause: bool = not paused) -> void:
	paused = pause
	$PauseMenu.visible = paused
	get_tree().paused = paused

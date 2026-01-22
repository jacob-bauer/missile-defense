extends Node


var paused: bool = false


func _ready() -> void:
	$PauseMenu.visible = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		if not paused:
			get_tree().paused = true
			$PauseMenu.visible = true
		
		else:
			get_tree().paused = false
			$PauseMenu.visible = false
		
		paused = not paused

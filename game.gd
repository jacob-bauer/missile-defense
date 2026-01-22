extends Node


var paused: bool = false


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		if not paused:
			get_tree().paused = true
		
		else:
			get_tree().paused = false
		
		paused = not paused
	
	elif paused:
		get_viewport().set_input_as_handled() # Catch all further input

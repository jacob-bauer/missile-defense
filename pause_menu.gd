extends VBoxContainer


func _on_play_button_down() -> void:
	var pause_key: InputEvent = InputMap.action_get_events("Pause")[0]
	pause_key.pressed = true
	Input.parse_input_event(pause_key)


func _on_menu_button_down() -> void:
	pass # Replace with function body.


func _on_restart_button_down() -> void:
	pass # Replace with function body.


func _on_quit_button_down() -> void:
	pass # Replace with function body.

extends VBoxContainer


func _on_play_button_down() -> void:
	var pause_key: InputEvent = InputMap.action_get_events("Pause")[0]
	pause_key.pressed = true
	Input.parse_input_event(pause_key)


func _on_menu_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_restart_button_down() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_down() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

extends VBoxContainer
class_name GameOver


@export var game_state: GameData


func _ready() -> void:
	game_state.game_over.connect(_on_game_over)
	visible = false


func _on_game_over() -> void:
	var log_message: LogMessage = LogMessage.new("game_over",
												get_path(),
												GameLogger.LOG_LEVEL.STATUS,
												13,
												"Game Over\tScore: {score}".format({"score":game_state.score}))
	game_logger.record_log_entry(log_message)
	$HBoxContainer/Score.text = str(game_state.score)
	get_tree().paused = true
	visible = true


func _on_save_score_button_down() -> void:
	var log_message: LogMessage = LogMessage.new("game_over",
												get_path(),
												game_logger.LOG_LEVEL.ERROR,
												24,
												"_on_save_score_button_down() not implemented in file game_over.gd")
	game_logger.record_log_entry(log_message)


func _on_restart_button_down() -> void:
	get_tree().reload_current_scene()


func _on_menu_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_quit_button_down() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

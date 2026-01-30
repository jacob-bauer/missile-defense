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
	save_score()


func save_score() -> void:
	var high_scores: FileAccess = FileAccess.open(GameData.highscores_file_path, FileAccess.READ_WRITE)
	high_scores.seek_end()
	high_scores.store_line("{datetime},{wave},{score}".format({"datetime":Time.get_datetime_string_from_system(true),
																"wave":game_state.wave,
																"score":game_state.score}))
	
	var log_message: LogMessage = LogMessage.new("game_over",
												get_path(),
												game_logger.LOG_LEVEL.INFORMATIONAL,
												26,
												"Saved high score at path: {path}".format({"path":ProjectSettings.globalize_path("user://highscores.txt")}))
	game_logger.record_log_entry(log_message)


func _on_restart_button_down() -> void:
	get_tree().reload_current_scene()


func _on_menu_button_down() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_quit_button_down() -> void:
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)

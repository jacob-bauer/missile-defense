extends Control


var _log_ready: String =\
GameData.log_separator +\
"""Game Loaded
DateTime:\t{datetime}"""

var _log_new_scene: String =\
GameData.log_separator +\
"""Changing to new Scene
Scene:\t{scene}"""


var game_scene: PackedScene = preload("res://game.tscn")


func _ready() -> void:
	print(_log_ready.format({"datetime":Time.get_datetime_string_from_system()}))


func _on_play_pressed() -> void:
	print(_log_new_scene.format({"scene":"res://game.tscn"}))
	get_tree().change_scene_to_packed(game_scene)

extends Node2D


var missile_pattern: PackedScene = preload("res://missile.tscn")


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var missile: Missile = missile_pattern.instantiate()
			add_child(missile)
			missile.launch(get_global_mouse_position())

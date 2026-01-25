extends Node2D


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$City.launch(get_global_mouse_position())

extends Node2D


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			game_state.score += 1
			
			if game_state.score >= 10:
				game_state.wave += 1
				game_state.score = 0

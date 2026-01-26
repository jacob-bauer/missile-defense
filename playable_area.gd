extends Node2D


var _enable_missile_launching: bool = false


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()
	game_state.begin_countdown.connect(func(): _enable_missile_launching = false)
	game_state.begin_wave.connect(func(): _enable_missile_launching = true)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and _enable_missile_launching:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			$City.launch(get_global_mouse_position())

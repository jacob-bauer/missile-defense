extends Node2D


var _silos: Array[Silo]


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()
	var silo_nodes: Array[Node] = get_tree().get_nodes_in_group("silos") as Array[Node]
	_silos.assign(silo_nodes)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# First, check if any silos are empty. If so, remove them
			if _silos.size() > 1:
				var indices_to_remove: Array[int] = []
				for i in range(_silos.size()):
					if _silos[i].missile_quantity <= 0:
						indices_to_remove.append(i)
					
				for i in indices_to_remove:
					_silos.remove_at(i)
			
			# Now _silos only contains valid silos. Select the closest one
			var mouse_position: Vector2 = get_global_mouse_position()
			var closest_silo = _silos[0]
			for silo in _silos:
				if silo.position.distance_to(mouse_position) < closest_silo.position.distance_to(mouse_position):
					closest_silo = silo
			
			closest_silo.launch(mouse_position)

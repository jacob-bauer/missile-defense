extends Node2D


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# Figure out which silo is closest to the mouse position
			# that also has any remaining missiles.
			# Launch from that silo.
			var silo_nodes: Array[Node] = get_tree().get_nodes_in_group("silos") as Array[Node]
			var silos: Array[Silo] = []
			silos.assign(silo_nodes)
			
			var mouse_position: Vector2 = get_global_mouse_position()
			var closest_silo = silos[0]
			for silo in silos:
				if silo.position.distance_to(mouse_position) < closest_silo.position.distance_to(mouse_position) \
					and silo.missile_quantity > 0:
						closest_silo = silo
			
			closest_silo.launch(mouse_position)

extends Node2D


@export var game_state: GameData


func _ready() -> void:
	game_state._reset_state()
	
	var silo_nodes: Array[Node] = get_tree().get_nodes_in_group("silos") as Array[Node]
	var test: Array[Silo] = []
	test.assign(silo_nodes)
	game_state.silos = test


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			fire_closest_silo(get_global_mouse_position())


func fire_closest_silo(target_position: Vector2) -> void:
	var silos_with_missiles: Array[Silo] = game_state.silos_with_ammo
	if silos_with_missiles.size() > 0:
		var closest_silo: Silo = silos_with_missiles[0]
		for silo in silos_with_missiles:
			if silo.position.distance_to(target_position) < closest_silo.position.distance_to(target_position):
				closest_silo = silo
		
		closest_silo.launch(target_position)

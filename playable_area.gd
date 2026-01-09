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
			fire_closest_silo(get_global_mouse_position())


func get_silos_with_missiles() -> Array[Silo]:
	var silos_with_missiles: Array[Silo] = []
	for silo in _silos:
		if silo.missile_quantity > 0:
			silos_with_missiles.append(silo)
	
	return silos_with_missiles


func fire_closest_silo(target_position: Vector2) -> bool:
	var silos_with_missiles: Array[Silo] = get_silos_with_missiles()
	if silos_with_missiles.size() > 0:
		var closest_silo: Silo = silos_with_missiles[0]
		for silo in silos_with_missiles:
			if silo.position.distance_to(target_position) < closest_silo.position.distance_to(target_position):
				closest_silo = silo
		
		closest_silo.launch(target_position)
		return true
		
	else:
		return false

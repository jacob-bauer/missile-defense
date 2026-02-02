extends Node2D
class_name City


signal out_of_ammo


var _silos_with_ammo = 3
var _city_blocks = 4
var _bonus_cities_earned: int = 1


@export var game_state: GameData = load("res://shared_game_data.tres")


func _ready() -> void:
	game_state.begin_wave.connect(_on_begin_wave)
	game_state.score_changed.connect(_on_score_changed)
	_city_blocks = 4


func _on_score_changed(score: int) -> void:
	var current_bonus_threshold = 10_000 * _bonus_cities_earned
	if score > current_bonus_threshold:
		_bonus_cities_earned += 1
		
		for target in game_state.target_positions:
			if target is CityBlock:
				if game_state.target_positions[target].enabled == false:
					_city_blocks += 1
					target.reset_health()
					break


func _on_begin_wave() -> void:
	_silos_with_ammo = 3


func _on_silo_out_of_ammo(_silo: Silo) -> void:
	_silos_with_ammo -= 1
	if _silos_with_ammo == 0:
		out_of_ammo.emit()


func _on_city_block_destroyed() -> void:
	_city_blocks -= 1
	if _city_blocks == 0:
		game_state.game_over.emit()


func launch(target_position: Vector2) -> void:
	var silos_by_distance: Array[Silo] = get_silos_by_distance_to(target_position)
	
	for silo in silos_by_distance:
		if silo.missile_quantity > 0:
			silo.launch(target_position)
			break


func get_silos_by_distance_to(targ_pos: Vector2) -> Array[Silo]:
	var silos_by_distance: Array[Silo] = [$Silo]
	
	if $Silo2/LaunchPosition.global_position.distance_to(targ_pos) < silos_by_distance[0].global_position.distance_to(targ_pos):
		silos_by_distance.push_front($Silo2)
	else:
		silos_by_distance.append($Silo2)
	
	if $Silo3/LaunchPosition.global_position.distance_to(targ_pos) < silos_by_distance[0].global_position.distance_to(targ_pos):
		silos_by_distance.push_front($Silo3)
	elif $Silo3/LaunchPosition.global_position.distance_to(targ_pos) > silos_by_distance[1].global_position.distance_to(targ_pos):
		silos_by_distance.append($Silo3)
	else:
		silos_by_distance.insert(1, $Silo3)
	
	return silos_by_distance

class_name GameData
extends Resource


signal score_changed(new_score: int)
signal wave_changed(new_wave: int)
signal game_over(reason: String)
@warning_ignore("unused_signal")
signal missile_hit(obj: Object)


enum Collision_Layers {
	FRIENDLY_MISSILES = 1,
	ENEMY_MISSILES = 2,
	CITY = 4,
}


var score: int:
	set(value):
		score = value
		score_changed.emit(value)
	get:
		return score

var wave: int:
	set(value):
		wave = value
		wave_changed.emit(value)
	get:
		return wave

var silos: Array[Silo]:
	set(value):
		silos = value
		
		for silo in silos:
			silo.out_of_ammo.connect(_on_out_of_ammo)
			if silo.missile_quantity > 0:
				silos_with_ammo.append(silo)
	get:
		return silos

var silos_with_ammo: Array[Silo] = []

var target_positions: Array[Vector2]:
	set(value):
		pass
	
	get:
		var silo_target_positions: Array[Vector2] = []
		for silo in silos:
			silo_target_positions.append(silo.enemies_should_target_here)
		
		return silo_target_positions


func _reset_state() -> void:
	score = 0
	wave = 1
	silos = []


func _on_out_of_ammo(silo: Silo) -> void:
	for i in range(silos_with_ammo.size()):
		if silos_with_ammo[i].name == silo.name:
			silos_with_ammo.remove_at(i)
			break
	
	if silos_with_ammo.size() == 0:
		game_over.emit("Out of Ammo")

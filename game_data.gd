class_name GameData
extends Resource


signal score_changed(new_score: int)
signal wave_changed(new_wave: int)
signal game_over(reason: String)


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

var silos: Array[Silo]
var silos_with_ammo: Array[Silo]:
	set(value):
		pass
	get:
		var non_empty_silos: Array[Silo] = []
		for silo in silos:
			if silo.missile_quantity > 0:
				non_empty_silos.append(silo)
		
		if non_empty_silos.size() == 0:
			game_over.emit("Out of Ammo")
		
		return non_empty_silos


func _reset_state() -> void:
	score = 0
	wave = 1
	silos = []

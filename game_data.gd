class_name GameData
extends Resource


signal score_changed(new_score: int)
signal wave_changed(new_wave: int)


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


func _reset_state() -> void:
	score = 0
	wave = 1

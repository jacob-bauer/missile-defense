class_name GameData
extends Resource


signal score_changed(new_score: int)
signal wave_changed(new_wave: int)
signal wave_launched(missile_quantity: int)
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


# IMPORTANT
var target_positions: Array[Vector2]
var friendly_ammunition: int
var enemy_missiles_launched: int


func _reset_state() -> void:
	score = 0
	wave = 1
	missile_hit.connect(_on_missile_hit)
	wave_launched.connect(_on_wave_launched)


func _on_wave_launched(missile_quantity: int) -> void:
	enemy_missiles_launched = missile_quantity


func _on_missile_hit(obj: Object) -> void:
	if obj is Missile:
		var missile: Missile = obj as Missile
		if not missile._friendly:
			score += 1

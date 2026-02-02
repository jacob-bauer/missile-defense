class_name GameData
extends Resource


const highscores_file_path: String = "user://highscores.txt"


signal score_changed(new_score: int)
signal wave_changed(new_wave: int)
signal wave_launched(missile_quantity: int)
signal wave_completed()
signal missile_hit(obj: Object)
@warning_ignore_start("unused_signal")
signal begin_wave()
signal pause(paused: bool)
signal begin_countdown()
signal end_countdown()
signal game_over()
@warning_ignore_restore("unused_signal")


enum Collision_Layers {
	FRIENDLY_MISSILES = 1,
	ENEMY_MISSILES = 2,
	CITY = 4,
}


var score: int:
	set(value):
		if value < 0:
			value = score
		
		game_logger.record_log_entry(LogMessage.new("game_data",
											get_path(),
											GameLogger.LOG_LEVEL.INFORMATIONAL,
											29,
											"Changing score from {old} to {new}".format({"old":score, "new":value})))

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
var target_positions: Dictionary[Object, TargetData] = {}
var friendly_ammunition: int
var enemy_missiles_launched: int
var missiles_destroyed: int = 0
var city_health: int = 0


func _reset_state() -> void:
	score = 0
	wave = 1
	
	if not missile_hit.is_connected(_on_missile_hit):
		missile_hit.connect(_on_missile_hit)
	if not wave_launched.is_connected(_on_wave_launched):
		wave_launched.connect(_on_wave_launched)
	if not wave_completed.is_connected(_on_wave_completed):
		wave_completed.connect(_on_wave_completed)


func _on_wave_completed() -> void:
	var tmp_score: int = missiles_destroyed * 25
	tmp_score += city_health * 50
	tmp_score += friendly_ammunition * 5
	
	score += tmp_score * wave


func _on_wave_launched(missile_quantity: int) -> void:
	enemy_missiles_launched = missile_quantity


func _on_missile_hit(obj: Object) -> void:
	if obj is Missile:
		var missile: Missile = obj as Missile
		if not missile._friendly:
			missiles_destroyed += 1
	
	elif obj is CityBlock:
		city_health -= 1

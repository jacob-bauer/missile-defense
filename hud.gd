extends Control


@export var game_state: GameData


func _ready() -> void:
	game_state.score_changed.connect(_on_score_changed)
	game_state.wave_changed.connect(_on_wave_changed)


func _on_score_changed(new_score: int) -> void:
	$Score.text = str(new_score)


func _on_wave_changed(new_wave: int) -> void:
	$Wave.text = str(new_wave)

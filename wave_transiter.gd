extends VBoxContainer


@export var game_state: GameData = load("res://shared_game_data.tres")
@export var seconds_between_waves: int = 5

func _ready() -> void:
	visible = false
	game_state.score_changed.connect(_on_score_changed)


func _on_score_changed(score: int) -> void:
	$ScoreContainer/Score.text = str(score)


func transition() -> void:
	visible = true
	while seconds_between_waves > 0:
		$TimerDisplay.text = str(seconds_between_waves)
		await get_tree().create_timer(1).timeout
		seconds_between_waves -= 1
	
	visible = false
	game_state.begin_wave.emit()

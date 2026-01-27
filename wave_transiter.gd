extends VBoxContainer


var _countdown_log: String = """-----------------------
Countdown Event
{reason}"""


var _transitioning: bool = false
var _seconds_remaining: int


@export var game_state: GameData = load("res://shared_game_data.tres")
@export var seconds_between_waves: int = 5

func _ready() -> void:
	visible = false
	game_state.score_changed.connect(_on_score_changed)
	game_state.wave_changed.connect(transition)
	game_state.pause.connect(_on_pause)


func _log(reason: String) -> void:
	print_verbose(_countdown_log.format({"reason":reason}))


func _on_pause(paused: bool) -> void:
	if paused:
		visible = false
	elif not paused and _transitioning:
		visible = true


func _on_score_changed(score: int) -> void:
	$ScoreContainer/Score.text = str(score)


func transition(_new_wave: int) -> void:
	_log("Starting")
	game_state.begin_countdown.emit()
	visible = true
	_transitioning = true
	_seconds_remaining = seconds_between_waves
	while _seconds_remaining > 0:
		$TimerDisplay.text = str(_seconds_remaining)
		$Timer.start(1)
		await $Timer.timeout
		_seconds_remaining -= 1
	
	visible = false
	_transitioning = false
	_log("Ending")
	game_state.begin_wave.emit()

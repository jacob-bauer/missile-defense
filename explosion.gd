extends Area2D


@export var time_of_flight: float = 0


func _ready() -> void:
	$FlightTimer.start(time_of_flight)


func _on_flight_timer_timeout() -> void:
	$AnimationPlayer.play("explode")

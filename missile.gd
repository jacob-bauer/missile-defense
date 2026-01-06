## TODO:
##		Missiles need to draw trails behind them.

extends Node2D
class_name Missile


@export var inactive_warhead: PackedScene = preload("res://explosion.tscn")

## Speed in pixels per second of flight to target
@export var flight_speed: int = 240


func launch(silo_position: Vector2, target_position: Vector2) -> void:
	var active_warhead: Explosion = inactive_warhead.instantiate()
	add_child(active_warhead)
	
	var time_of_flight: float = silo_position.distance_to(target_position) / flight_speed
	my_draw_line(silo_position, target_position)
	await get_tree().create_timer(time_of_flight).timeout
	
	$MyLine.queue_free()
	position = target_position
	active_warhead.explode()


func my_draw_line(start: Vector2, end: Vector2) -> void:
	# Great! I can finally get a line. Now I just need to animate it over time
	var line := Line2D.new()
	line.add_point(start)
	line.add_point(end)
	line.name = "MyLine"
	line.antialiased = true
	line.width = 2
	
	add_child(line)

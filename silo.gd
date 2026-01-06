extends Node2D
class_name Silo


@export var missile_prototype: PackedScene = preload("res://missile.tscn")
@export var missile_quantity: int = 10:
	set(value):
		$Label.text = str(value)
		missile_quantity = value
	get:
		return missile_quantity


@onready var playable_area: Node2D = get_parent()


func _ready() -> void:
	missile_quantity = missile_quantity


func launch(target_position: Vector2) -> void:
	if missile_quantity > 0:
		missile_quantity -= 1
		
		var active_missile: Missile = missile_prototype.instantiate()
		playable_area.add_child(active_missile)
		print($LaunchPosition.position)
		active_missile.launch($LaunchPosition.position, target_position)

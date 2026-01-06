extends Node2D


signal missile_launched


@export var missile_prototype: PackedScene = preload("res://missile.tscn")
@export var missile_quantity: int = 10:
	set(value):
		$Label.text = str(value)
		missile_quantity = value
	get:
		return missile_quantity


@onready var playable_area: Node2D = get_parent()


func launch(target_position: Vector2) -> void:
	if missile_quantity > 0:
		missile_quantity -= 1
		
		var active_missile: Missile = missile_prototype.instantiate()
		playable_area.add_child(active_missile)
		active_missile.launch(position, target_position)
		
		missile_launched.emit()

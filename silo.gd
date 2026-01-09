extends Node2D
class_name Silo


signal out_of_ammo(Silo)


var enemies_should_target_here: Vector2:
	set(value):
		pass
	get:
		return $TargetPosition.position


@export var missile_prototype: PackedScene = preload("res://missile.tscn")
@export var missile_quantity: int = 10:
	set(value):
		$Label.text = str(value)
		missile_quantity = value
		
		if missile_quantity == 0:
			out_of_ammo.emit(self)
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
		active_missile.launch($LaunchPosition.global_position, target_position)

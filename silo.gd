extends Node2D
class_name Silo


signal out_of_ammo(Silo)


var enemies_should_target_here: Vector2:
	set(value):
		pass
	get:
		return $TargetPosition.global_position


@export var friendly: bool
@export var missile_prototype: PackedScene = preload("res://missile.tscn")
@export var missile_speed: int = 240
@export var missile_quantity: int = 10:
	set(value):
		$Label.text = str(value)
		missile_quantity = value
		
		if missile_quantity == 0:
			out_of_ammo.emit(self)
	get:
		return missile_quantity


@onready var playable_area: Node = get_parent()


func _ready() -> void:
	missile_quantity = missile_quantity # Missile Quantity is not displayed unless it is changed


func launch(target_position: Vector2, launch_position: Vector2 = $LaunchPosition.global_position) -> void:
	if missile_quantity > 0:
		missile_quantity -= 1
		
		var active_missile: Missile = missile_prototype.instantiate()
		active_missile.flight_speed = missile_speed
		set_physics_layers(active_missile)
		playable_area.add_child(active_missile)
		active_missile.launch(launch_position, target_position)


func set_physics_layers(missile: Missile) -> void:
	if friendly:
		missile.collision_layer = GameData.Collision_Layers.FRIENDLY_MISSILES
		missile.collision_mask = GameData.Collision_Layers.ENEMY_MISSILES
	else:
		missile.collision_layer = GameData.Collision_Layers.ENEMY_MISSILES
		missile.collision_mask = GameData.Collision_Layers.FRIENDLY_MISSILES | GameData.Collision_Layers.ENEMY_MISSILES

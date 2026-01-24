extends Area2D
class_name Silo


signal out_of_ammo(Silo)


var enemies_should_target_here: Vector2:
	set(value):
		pass
	get:
		return $TargetPosition.global_position

@export var game_state: GameData = load("res://shared_game_data.tres")
@export var ammo_lowered_on_hit: int = 3
@export var friendly: bool
@export var missile_prototype: PackedScene = preload("res://missile.tscn")
@export var missile_speed: int = 240
@export var missile_quantity: int = 10:
	set(value):
		$Stockpile.frame = value
		missile_quantity = value
		
		if missile_quantity <= 0:
			out_of_ammo.emit(self)
	get:
		return missile_quantity


func _ready() -> void:
	game_state.missile_hit.connect(_on_missile_hit)
	game_state.friendly_ammunition += missile_quantity
	missile_quantity = missile_quantity # Missile Quantity is not displayed unless it is changed
	if friendly:
		collision_layer = GameData.Collision_Layers.CITY
		collision_mask = GameData.Collision_Layers.ENEMY_MISSILES
	
	$Stockpile.frame = missile_quantity
	
	$AnimatedSprite2D.frame = randi_range(0, 6)
	$AnimatedSprite2D.play("rotate_radar")


func launch(target_position: Vector2, launch_position: Vector2 = $LaunchPosition.global_position) -> void:
	if missile_quantity > 0:
		_reduce_ammunition(1)
		
		$Launcher.launch(target_position, launch_position, missile_speed, friendly)


func _on_missile_hit(obj: Object) -> void:
	if obj == self:
		_reduce_ammunition(ammo_lowered_on_hit)


func _reduce_ammunition(reduction: int) -> void:
	missile_quantity -= reduction
	game_state.friendly_ammunition -= reduction

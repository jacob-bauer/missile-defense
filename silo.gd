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
@export var base_missile_quantity = 10


var missile_quantity: int = 10:
	set(value):
		if value > 30:
			value = 30
			
		$Stockpile.frame = value
		missile_quantity = value
		
		if missile_quantity <= 0:
			out_of_ammo.emit(self)
	get:
		return missile_quantity


func _ready() -> void:
	game_state.begin_wave.connect(_set_missile_quantity)
	game_state.missile_hit.connect(_on_missile_hit)
	_set_missile_quantity()
	if friendly:
		collision_layer = GameData.Collision_Layers.CITY
		collision_mask = GameData.Collision_Layers.ENEMY_MISSILES
	
	$AnimatedSprite2D.frame = randi_range(0, 6)
	$AnimatedSprite2D.play("rotate_radar")


func _set_missile_quantity() -> void:
	if game_state.wave > 1:
		missile_quantity = base_missile_quantity + ceili(base_missile_quantity * 0.1 * game_state.wave)
	else:
		missile_quantity = base_missile_quantity
	
	game_state.friendly_ammunition = missile_quantity
	game_state.target_positions.set(self, TargetData.new($TargetPosition.global_position, true))
	
	$Stockpile.frame = missile_quantity


func launch(target_position: Vector2, launch_position: Vector2 = $LaunchPosition.global_position) -> void:
	if missile_quantity > 0:
		_reduce_ammunition(1)
		$Launcher.launch(target_position, launch_position, missile_speed, friendly)


func _on_missile_hit(obj: Object) -> void:
	if obj == self:
		_reduce_ammunition(ammo_lowered_on_hit)


func _reduce_ammunition(reduction: int) -> void:
	var actual_reduction: int = reduction
	if reduction >= missile_quantity:
		actual_reduction = reduction - missile_quantity
	var old_quantity: int = missile_quantity
	missile_quantity -= actual_reduction
	game_state.friendly_ammunition -= actual_reduction
	if reduction >= missile_quantity:
		game_state.target_positions[self].enabled = false
	
	game_logger.record_log_entry(LogMessage.new("silo",
												get_path(),
												game_logger.LOG_LEVEL.INFORMATIONAL,
												71,
												"Reducing ammunition: Request: {req}\tActual:{act}\tOld: {old}\tNew: {new}". format({"req":reduction,
																																	"act":actual_reduction,
																																	"old":old_quantity,
																																	"new":missile_quantity})))

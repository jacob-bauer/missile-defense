extends Area2D
class_name CityBlock


signal destroyed


var _health: int = 3


@export var game_state: GameData = load("res://shared_game_data.tres")


enum Health_States {
	FULL = 0,
	TWO_THIRDS = 1,
	ONE_THIRD = 2,
	DESTROYED = 3
}


func _ready() -> void:
	$AnimatedSprite2D.frame = Health_States.FULL
	game_state.missile_hit.connect(_on_missile_hit)
	
	game_state.target_positions[self] = TargetData.new($TargetPosition.global_position, true)
	game_state.city_health += 3


func _on_missile_hit(obj: Object) -> void:
	if obj == self:
		reduce_health()


func _decrement_health() -> void:
	match _health:
		3:
			$AnimatedSprite2D.frame = Health_States.FULL
		2:
			$AnimatedSprite2D.frame = Health_States.TWO_THIRDS
		1:
			$AnimatedSprite2D.frame = Health_States.ONE_THIRD
		0:
			$AnimatedSprite2D.frame = Health_States.DESTROYED


func reduce_health() -> void:
	_health -= 1
	game_state.city_health -= 1
	_decrement_health()
	
	if _health == 0:
		$FullHealthPolygon.set_deferred("disabled", true)
		game_state.target_positions[self].enabled = false
		destroyed.emit()

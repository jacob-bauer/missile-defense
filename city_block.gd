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
	$FullHealthPolygon.disabled = false
	$TwoThirdsPolygon.disabled = true
	$OneThirdPolygon.disabled = true
	
	$AnimatedSprite2D.frame = Health_States.FULL
	
	game_state.missile_hit.connect(_on_missile_hit)


func _on_missile_hit(obj: Object) -> void:
	if obj == self:
		reduce_health()


func _decrement_health() -> void:
	match _health:
		3:
			$AnimatedSprite2D.frame = Health_States.FULL
			_disable_polygons(false, true, true)
		2:
			$AnimatedSprite2D.frame = Health_States.TWO_THIRDS
			_disable_polygons(true, false, true)
		1:
			$AnimatedSprite2D.frame = Health_States.ONE_THIRD
			_disable_polygons(true, true, false)
		0:
			$AnimatedSprite2D.frame = Health_States.DESTROYED
			_disable_polygons(true, true, true)


func _disable_polygons(full: bool, two_thirds: bool, one_third: bool) -> void:
	$FullHealthPolygon.set_deferred("disabled", full)
	$TwoThirdsPolygon.set_deferred("disabled", two_thirds)
	$OneThirdPolygon.set_deferred("disabled", one_third)


func reduce_health() -> void:
	_health -= 1
	
	_decrement_health()
	
	if _health == 0:
		destroyed.emit()

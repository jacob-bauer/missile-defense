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
			$FullHealthPolygon.disabled = false
			$TwoThirdsPolygon.disabled = true
			$OneThirdPolygon.disabled = true
		2:
			$AnimatedSprite2D.frame = Health_States.TWO_THIRDS
			$FullHealthPolygon.disabled = true
			$TwoThirdsPolygon.disabled = false
			$OneThirdPolygon.disabled = true
		1:
			$AnimatedSprite2D.frame = Health_States.ONE_THIRD
			$FullHealthPolygon.disabled = true
			$TwoThirdsPolygon.disabled = true
			$OneThirdPolygon.disabled = false
		0:
			$AnimatedSprite2D.frame = Health_States.DESTROYED
			$FullHealthPolygon.disabled = true
			$FullHealthPolygon.disabled = true
			$FullHealthPolygon.disabled = true


func reduce_health() -> void:
	_health -= 1
	
	_decrement_health()
	
	if _health == 0:
		destroyed.emit()

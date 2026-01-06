extends Area2D
class_name Explosion


signal exploded(explosion: Explosion)


@export var explosion_speed: float:
	set(value):
		$AnimationPlayer.speed_scale = explosion_speed
	get:
		return $AnimationPlayer.speed_scale


func explode() -> void:
	$AnimationPlayer.play("explode")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "explode":
		exploded.emit(self)

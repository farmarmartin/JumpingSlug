extends "res://src/Actors/Actor.gd"

signal life_minus

func _ready() -> void:
	$sekacka.play()
	set_physics_process(false)
	_velocity.x = - speed.x


func _on_StompDetector_body_entered(body: Node) -> void:
	if body.global_position.y > get_node("StompDetector").global_position.y:
		return
	get_node("CollisionShape2D").disabled = true
	queue_free()


func _physics_process(delta: float) -> void:
	if is_on_wall():
		_velocity.x *= -1.0
		$lawnmower.flip_h = not $lawnmower.flip_h
	_velocity.y = move_and_slide(_velocity, FLOOR_NORMAL).y
	


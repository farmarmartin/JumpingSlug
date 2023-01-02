extends "res://src/Actors/Actor.gd"



func _on_PickupDetector_body_entered(body: Node) -> void:
	queue_free()
	
func _physics_process(delta: float) -> void:
	_velocity.x = 0.0
	_velocity.y = 0.0

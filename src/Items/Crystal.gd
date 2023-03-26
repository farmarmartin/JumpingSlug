extends "res://src/Actors/Actor.gd"
onready var pickup_sound = $pickup

signal crystal_collected

func _on_PickupDetector_body_entered(body: Node) -> void:
	Global.lives += 1
	Global.crystals += 1
	
	emit_signal("crystal_collected")
	queue_free()
	
	
func _physics_process(delta: float) -> void:
	_velocity.x = 0.0
	_velocity.y = 0.0

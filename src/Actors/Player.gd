extends Actor

var life: = 1.0
export var stomp_impulse: = 1000.0


func _on_EnemyDetector_area_entered(area: Area2D) -> void:
	_velocity = calculate_stomp_velocity(_velocity, stomp_impulse)

func _on_EnemyDetector_body_entered(body: Node) -> void:
	life -= 1.0
	if life < 1.0:
		get_tree().reload_current_scene()


func _on_CrystalDetection_area_entered(area: Area2D) -> void:
	life += 1


func _physics_process(delta: float) -> void:
	var is_jump_interrupted: = Input.is_action_just_released("jump") and _velocity.y < 0.0
	var direction: = get_direction()
	_velocity = calculate_move_velocity(_velocity, direction, speed, is_jump_interrupted)
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)


#func get_direction() -> Vector2:
#	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
#	-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)
func get_direction() -> Vector2:
	if is_on_wall():
		speed.y = 400.0
		return Vector2(0.0, -1.0 if Input.is_action_pressed("move_right") else 0.0)
	else:
		speed.y = 1300.0
		return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)



	
func calculate_move_velocity(
		linear_velocity: Vector2,
		direction: Vector2,
		speed: Vector2,
		is_jump_interrupted: bool
	) -> Vector2:
	var new_velocity: = linear_velocity
	new_velocity.x = speed.x * direction.x
	new_velocity.y += gravity * get_physics_process_delta_time()
	if direction.y == -1.0:
		new_velocity.y = speed.y * direction.y
	if is_jump_interrupted:
		new_velocity.y = 0.0
		
	return new_velocity

func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out: = linear_velocity
	out.y = -impulse
	return out

extends CharacterBody2D


@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		if direction > 0:
			$AnimationPlayer.play("walk_right")
			$AnimatedSprite2D.flip_h = false
		elif direction < 0:
			$AnimationPlayer.play("walk_left")
			$AnimatedSprite2D.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.y > 0:
		$AnimationPlayer.play("fall")
	elif velocity.y < 0:
		$AnimationPlayer.play("jump")
		
	if !velocity:
		$AnimationPlayer.play("idle")

	move_and_slide()


func _on_sword_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

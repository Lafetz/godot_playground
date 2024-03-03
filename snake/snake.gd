extends CharacterBody2D


const SPEED = 3000.0



func _physics_process(delta):
	if Input.is_action_just_pressed("up"):
		velocity.y=-delta*SPEED
	if Input.is_action_just_pressed("down"):
		velocity.y=delta*SPEED
	if Input.is_action_just_pressed("left"):
		velocity.x=-delta*SPEED
	if Input.is_action_just_pressed("right"):
		velocity.x=delta*SPEED

	move_and_slide()

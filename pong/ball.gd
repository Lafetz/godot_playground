extends CharacterBody2D
var SPEED=500
var direction=Vector2.from_angle(91)
func _ready():
	velocity=direction*SPEED
func _physics_process(delta):

	var collision=move_and_collide(velocity*delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())



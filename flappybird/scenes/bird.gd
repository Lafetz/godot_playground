extends CharacterBody2D
var jump_velocity=13000
var gravity=400
var game_end=false
var ground_hit=false
func _ready():
		$AnimatedSprite2D.play("flying")
func _process(delta):
	velocity.y+=delta*gravity
	if game_end:
		rotation=160	
		$AnimatedSprite2D.stop()
	if ground_hit:
		velocity=Vector2.ZERO	
	if velocity.y<0:
		#$AnimatedSprite2D.play("up")	
		rotation=-0.5
	if velocity.y>0 and !game_end:
		rotation=0.5
		#$AnimatedSprite2D.play("up")	
	if Input.is_action_just_released("jump")  and !game_end:
		velocity.y=-jump_velocity*delta
	move_and_slide()

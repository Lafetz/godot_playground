extends CharacterBody2D
var SPEED=20000
var HEIGHT
func _ready():
	HEIGHT=$Sprite2D.texture.get_size().y-1
func _process(delta):
	
	if Input.is_action_just_released("up"):
		velocity.y=-SPEED*delta
	if Input.is_action_just_pressed("down"):
		velocity.y=SPEED*delta
	if position.y-HEIGHT<-5:
		velocity.y=SPEED*delta
	if position.y-HEIGHT>500:
		velocity.y=-SPEED*delta
	move_and_slide()

extends CharacterBody2D
var direction=Vector2(0,-1)
var SPEED=20000
var HEIGHT
func _ready():
	direction=Vector2(0,1)
	HEIGHT=$Sprite2D.texture.get_size().y-1
func _process(delta):
	velocity=direction*delta*SPEED
	if position.y-HEIGHT<-5:
		direction=Vector2.DOWN
	if position.y-HEIGHT>500:
		direction=Vector2.UP
	move_and_slide()

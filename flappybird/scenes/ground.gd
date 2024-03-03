extends Area2D

@export var speed=150
var screen_size
var scroll=0
var game_end=false
signal hit
# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	pass # Replace with function body.
func _on_body_entered(_body):
	
	hit.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !game_end:
		scroll+=speed*delta
		if scroll>=screen_size.x:
			scroll=0
		position.x=-scroll



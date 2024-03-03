extends Area2D
signal hit
signal score
var speed=150
var scroll=0
var game_end=false


func _process(delta):
	if game_end!=true:
		position.x-=speed*delta
	




func _on_body_entered(body):
	hit.emit()


func _on_win_body_entered(body):
	score.emit() 

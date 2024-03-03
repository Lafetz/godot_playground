extends Node2D
var score=0
func _process(delta):
	if $ball.position.y>$opponent.position.y+60 and $ball.position.x>720:
		$opponent.direction=Vector2.DOWN
	if $ball.position.y<$opponent.position.y-60 and $ball.position.x>720:
		$opponent.direction=Vector2.UP
	


func _on_win_body_entered(body):
	if body.velocity.x<0:
		print("opponent won")
	else:
		print("player won")# Replace with function body.

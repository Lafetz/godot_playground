extends Node2D


# Called when the node enters the scene tree for the first time.
var game_end=false
var pipe_scene=preload("res://scenes/pipes.tscn")
var pipes : Array
var score=0



func _process(_delta):
	$scores.text=str(score)
	for p in pipes:
		p.game_end=game_end
	if Input.is_action_just_pressed("stop"):
		$bird.game_end=true
	pass


func _on_pipe_timer_timeout():
	var pipe=pipe_scene.instantiate() as Node2D
	pipe.position=$pipe_spawn.position
	pipe.position.y=RandomNumberGenerator.new().randi_range(230,370)
	pipes.append(pipe)
	pipe.hit.connect(_on_pipe_hit)
	pipe.score.connect(score_game)
	add_child(pipe)
	
	pass # Replace with function body.
func score_game():
	score+=1

func _on_pipe_hit():
	game_over()


func _on_ground_hit():
	$bird.ground_hit=true
	game_over()


func game_over():
	game_end=true
	$ground.game_end=true
	$pipe_timer.stop()
	$bird.game_end=true

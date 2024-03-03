extends Node2D
const SNAKE=0
const APPLE=1
var apple_pos:Vector2
var snake_body= [Vector2(5,10),Vector2(4,10),Vector2(3,10)]
var direction=Vector2(1,0)
var lock=false;
func _ready():
	place_apple()
	pass
func place_apple():
	var x = randi() % 20
	var y = randi() % 20
	apple_pos=Vector2(x,y)
	$snakeApple.set_cell(0,Vector2(x,y),APPLE,Vector2(0,0))
#func random_cor():
func draw_snake():
	for body in snake_body:
		if body==snake_body[0]:
			
			$snakeApple.set_cell(0,body,SNAKE,Vector2(4,0))
		else: 
			$snakeApple.set_cell(0,body,SNAKE,Vector2(4,0))	
func _process(_delta):
	draw_snake()
func _input(_event):
	if !lock:# this lock to make user not change direction twice in the timer period
		if Input.is_action_just_released("up"):
			if direction != Vector2(0,1):
				direction=Vector2(0,-1)
				lock=true
		if Input.is_action_just_released("down"):
			if direction != Vector2(0,-1):
				direction=Vector2(0,1)
			lock=true
		if Input.is_action_just_released("left"):
			if direction!=Vector2(1,0):
				direction=Vector2(-1,0)
			lock=true
		if Input.is_action_just_released("right"):
			if direction!=Vector2(-1,0):
				direction=Vector2(1,0)
			lock=true
func move_snake():
	var copy_body=snake_body.slice(0,snake_body.size()-1)
#

#
	var new_head=copy_body[0] + direction
	if new_head.x>19 or new_head.y>19 or new_head.y<0 or new_head.x<0: #check if snake is out of window
		print("game over")
		return
	$snakeApple.set_cell(0,snake_body[snake_body.size()-1],SNAKE,Vector2(-1,-1))
	if apple_pos==new_head:
		copy_body.insert(1,apple_pos)
		place_apple()
	copy_body.insert(0,new_head)
	snake_body=copy_body
func remove_tile(id:int):
	var cells=$snakeApple.get_used_cells_by_id(0,id)
	for cell in cells:
		$snakeApple.set_cell(0,cell,id,Vector2(-1,-1))

func _on_snake_tick_timeout():
	lock=false
	move_snake()
	pass # Replace with function body.

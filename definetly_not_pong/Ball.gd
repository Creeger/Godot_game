@icon("res://Ball.png")

extends CharacterBody2D
class_name Ball
var speed = 500

var original_x : int
var original_y : int

# Called when the node enters the scene tree for the first time.
func _ready():
	
	original_x = position.x
	original_y = position.y
	velocity = Vector2(speed, 0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var data = move_and_collide(velocity*delta)
	
	if not data:
		return
	
	if data.get_collider() is Player:
		var player : Player = data.get_collider()
		var bounce_direction = global_position - player.global_position
		bounce_direction = bounce_direction.normalized()
		velocity = bounce_direction * speed
		return
	
	velocity = velocity.bounce(data.get_normal())
	
func reset():
	
	position.x = original_x
	position.y = original_y
	velocity = Vector2(speed, 0)


func _on_goal_keeper_reset():
	reset()

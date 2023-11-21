@icon("res://Paddle.png")

extends CharacterBody2D
class_name Player

@export var move_up_input: String
@export var move_down_input: String

const SPEED = 300.0

func _physics_process(_delta):
	
	var direction = Input.get_axis(move_up_input, move_down_input)
	
	velocity.y = direction * SPEED
	
	move_and_slide()

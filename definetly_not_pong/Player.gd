@icon("res://Paddle.png")

extends CharacterBody2D
class_name Player

@export var move_up_input: String
@export var move_down_input: String

const SPEED = 300.0

var original_x : int
var original_y : int
var i = 0

func _ready():
	original_x = position.x
	original_y = position.y

func _physics_process(_delta):
	
	
	var direction = Input.get_axis(move_up_input, move_down_input)
	position.x = original_x
	velocity.y = direction * SPEED
	move_and_slide()


func reset():
	position.x = original_x
	position.y = original_y


func _on_goal_keeper_reset():
	reset()

extends CharacterBody2D

class_name Enemy
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var ray_cast_2d = $RayCast2D
@onready var ray_cast_2d_2 = $RayCast2D2
var direction = 1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if not ray_cast_2d.is_colliding():
		direction = -1
	if not ray_cast_2d_2.is_colliding():
		direction = 1

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	

	

	move_and_slide()

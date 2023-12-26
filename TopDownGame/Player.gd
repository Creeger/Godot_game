extends CharacterBody2D

@export var weapon : Weapon
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down")).normalized()

	velocity = direction * SPEED
	

	move_and_slide()

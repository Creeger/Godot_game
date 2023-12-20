extends CharacterBody2D

class_name Player
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var last_standing_position = Vector2(0, 0)

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	global_position = CheckpointState.last_position

func _physics_process(delta):
	if is_on_floor():
		last_standing_position = global_position
	# Add the gravity.
	if not is_on_floor():
		if Input.is_action_pressed("Jump") and velocity.y < 0:
			velocity.y += gravity * delta
		else:
			velocity.y += (gravity * 3) * delta
	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
func die():
	CheckpointState.respawn()

extends CharacterBody2D

class_name Player
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var last_standing_position = Vector2(0, 0)
@onready var ray_cast_2d_left = $RayCast2DLeft
@onready var ray_cast_2d_right = $RayCast2DRight

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
	var jump_direction = wall_jump_process()
	if Input.is_action_just_pressed("Jump") and (is_on_floor() or jump_direction):
		if !is_on_floor():
			velocity.x = 300 * jump_direction * 2
		velocity.y = JUMP_VELOCITY


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("Left", "Right")
	if is_on_floor():
		velocity.x = SPEED * direction
	else:
		velocity.x = move_toward(velocity.x, SPEED * direction, SPEED * delta * 5)

	move_and_slide()

func wall_jump_process():
	var bodyL = int(is_on_left_wall())
	var bodyR = int(is_on_right_wall())
	var jump_direction = bodyL - bodyR
	return jump_direction
	
	
func is_on_left_wall():
	var body = ray_cast_2d_left.get_collider()
	return body is TileMap
		
func is_on_right_wall():
	var body = ray_cast_2d_right.get_collider()
	return body is TileMap
	
	   
func die():
	CheckpointState.respawn()

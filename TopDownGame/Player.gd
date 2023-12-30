extends CharacterBody2D

@export var weapon : Weapon :
	set(new_weapon):
		weapon = new_weapon
		changed_weapon.emit()

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

signal changed_weapon
@onready var item_scanner = $ItemScanner

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	var items = item_scanner.get_overlapping_areas()
	if not items.is_empty() and Input.is_action_just_pressed("PickUpItem"):
		weapon = items[0].weapon
	
	var direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down")).normalized()
	velocity = direction * SPEED
	move_and_slide()


#func _on_item_scanner_area_entered(area):
#	print("found item")


func _on_hurt_box_got_hit(damage: HurtBox.HitData):
	print(damage.damage)
	pass # Replace with function body.

extends Node

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

var last_position: Vector2 = Vector2() :
	set(value):
		last_position = value
		for checkpoint in get_tree().get_nodes_in_group("Checkpoint"):
			if last_position == checkpoint.global_position:
				checkpoint.set_color(Color(1))
			else:
				checkpoint.set_color(Color(.0,.0,.0,1.0))
	get:
		return last_position

func respawn():
	get_tree().paused = false
	get_tree().reload_current_scene()

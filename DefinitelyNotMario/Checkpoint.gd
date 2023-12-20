extends Area2D

@onready var polygon_2d = $Polygon2D

func set_color(color: Color):
	polygon_2d.color = color

func _on_body_entered(body):
	if body is Player:
		CheckpointState.last_position = global_position
		polygon_2d.color = Color(1,1,1)

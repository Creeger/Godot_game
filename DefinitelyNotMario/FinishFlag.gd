extends Area2D

@onready var rich_text_label = $RichTextLabel
@onready var play_again = $"../CanvasLayer/Control/PlayAgain"

func _on_body_entered(body):
	if body is Player:
		rich_text_label.visible = true
		play_again.visible = true
		get_tree().paused = true

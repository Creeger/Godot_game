extends Label


func _ready():
	text = "Player 1: 0 points"


func _on_goal_keeper_update_state(player1score, player2score):
	text = "Player 1: " + str(player1score) + " points"

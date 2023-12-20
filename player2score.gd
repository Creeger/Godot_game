extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Player 2: 0 points"


func _on_goal_keeper_update_state(player1score, player2score):
	text = "Player 2: " + str(player2score) + " points"

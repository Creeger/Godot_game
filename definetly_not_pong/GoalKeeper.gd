extends Node

signal reset()
signal update_state(player1score : int, player2score : int)
var score_player_1 = 0
var score_player_2 = 0


func _on_player_1_goal_body_entered(body):
	score_player_2 += 1;
	print("Player 1: " + str(score_player_1) + " point")
	update_state.emit(score_player_1, score_player_2)
	reset.emit()

func _on_player_2_goal_body_entered(body):
	score_player_1 += 1;
	print("Player 2: " + str(score_player_2) + " point")
	update_state.emit(score_player_1, score_player_2)
	reset.emit()

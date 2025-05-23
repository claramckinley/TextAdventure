extends Control

func _ready():
	$MovesLabel.text = "Moves: " + str(Player.moves)
	$SanityLabel.text = "Sanity: " + str(Player.sanity)
	$RankLabel.text = "Rank: " + str(determine_rank())
	$WinLabel.text = Player.ending
		
func determine_rank():
	var rank_sign = ""
	if Player.sanity > 60:
		rank_sign = "+"
	elif Player.sanity < 40:
		rank_sign = "-"
		
	if Player.score == 310:
		return "S RANK"
	elif Player.score > 250:
		return "A" + rank_sign
	elif Player.score > 200:
		return "B" + rank_sign
	elif Player.score > 150:
		return "C" + rank_sign 
	elif Player.score > 100:
		return "D" + rank_sign
	return "F RANK"
		
func _on_Button_pressed():
	get_tree().quit()

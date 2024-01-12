extends Control

@onready var label = $CenterContainer/Label

func _ready():
	$ScoreLabel.text = "Score: " + str(Player.score)
	$MovesLabel.text = "Moves: " + str(Player.moves)

func _on_button_pressed():
	get_tree().quit()

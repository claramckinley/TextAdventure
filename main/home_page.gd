extends Control

func _ready():
	$CenterContainer/Button.grab_focus()

func _on_Button_pressed():
	get_tree().change_scene("res://main/text_adventure.tscn")

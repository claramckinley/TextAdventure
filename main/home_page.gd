extends Control

func _ready():
	$CenterContainer/Button.grab_focus()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://main/text_adventure.tscn")

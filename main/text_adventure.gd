extends ColorRect

@onready var user_input = $UserInput
@onready var display_text = $DisplayText

var curr_loc = "HOTEL"
var target = ""
var change_score = true

#enum commands {
#	NORTH = "NORTH",
#	EAST = "EAST",
#	SOUTH = "SOUTH",
#	WEST = "WEST",
#	QUIT = "QUIT",
#	EXAMINE = "EXAMINE"
#}

func _ready():
	user_input.caret_force_displayed = true
	user_input.grab_focus()
	update_display("hello there")
	
func update_display(text):
	if change_score:
		Player.score = Player.score + 1
	display_text.add_text(text + "\n")

func _on_user_input_text_submitted(new_text):
	user_input.clear()
	update_display("> " + new_text)
	parse_input(new_text)
	
func parse_input(input):
	input = separate_input(input)
	match(input):
		"QUIT":
			get_tree().quit()
		"PICK UP":
			if Objects.location.has(target):
				Player.inventory.append(target)
				Objects.location.erase(target)
				update_display(target + " picked up")
			else:
				update_display("i cant pick that up")
		"TAKE":
			if Objects.location.has(target):
				Player.inventory.append(target)
				Objects.location.erase(target)
				update_display("took " + target)
			else:
				update_display("i cant take that")
		"DROP":
			if Player.inventory.find(target) != null:
				Player.inventory.erase(target)
				Objects.location[target] = curr_loc
				update_display(target + " dropped")
		"INVENTORY":
			if Player.inventory.size() > 0:
				for i in Player.inventory:
					update_display(i)
					change_score = false
				change_score = true
			else:
				update_display("your hands are empty")
		"SCORE":
			update_display("score: " + str(Player.score))
		"EXAMINE":
			generate_examine()
		"NORTH":
			if Locations.north.has(curr_loc):
				curr_loc = Locations.north.get(curr_loc)
				generate_examine()
		"SOUTH":
			if Locations.south.has(curr_loc):
				curr_loc = Locations.south.get(curr_loc)
				generate_examine()

func separate_input(text):
	text = text.to_upper()
	if text.contains("PICK UP"):
		target = text.trim_prefix("PICK UP ")
		return "PICK UP"
	elif text.contains("TAKE"):
		target = text.trim_prefix("TAKE ")
		return "TAKE"
	elif text.contains("DROP"):
		target = text.trim_prefix("DROP ")
		return "DROP"
	else:
		target = ""
	return text
	
func generate_examine():
	var examine = Locations.examine.get(curr_loc)
	var object = Objects.location.find_key(curr_loc)
	if object != null:
		examine = examine + Objects.examine.get(object)
	update_display(examine)

extends ColorRect

@onready var user_input = $UserInput
@onready var display_text = $DisplayText

var curr_loc = "HOTEL"
var target = ""
var change_moves = true
var start_time

func _ready():
	user_input.caret_force_displayed = true
	user_input.grab_focus()
	var intro_text = FileAccess.open("res://main/intro.txt", FileAccess.READ)
	update_display(intro_text.get_as_text())
	start_time = Time.get_ticks_msec()
	
func update_display(text):
	display_text.add_text(text + "\n")

func _on_user_input_text_submitted(new_text):
	if change_moves:
		Player.moves = Player.moves + 1
	user_input.clear()
	update_display("")
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
			if Player.inventory.find(target) != -1:
				Player.inventory.erase(target)
				Objects.location[target] = curr_loc
				update_display(target + " dropped")
		"INVENTORY":
			if Player.inventory.size() > 0:
				for i in Player.inventory:
					update_display(i)
					change_moves = false
				change_moves = true
			else:
				update_display("your hands are empty")
		"MOVES":
			update_display("moves: " + str(Player.moves))
		"SCORE":
			update_display("score: " + str(Player.score))
		"TIME":
			update_display("total time: " + str(snapped((Time.get_ticks_msec() - start_time) / (1000.00 * 60.00), .01)))
		"EXAMINE":
			generate_examine()
		"NORTH":
			if Locations.north.has(curr_loc) and check_travel(Locations.north.get(curr_loc)):
				curr_loc = Locations.north.get(curr_loc)
				generate_examine()
		"SOUTH":
			if Locations.south.has(curr_loc) and check_travel(Locations.south.get(curr_loc)):
				curr_loc = Locations.south.get(curr_loc)
				generate_examine()
		"EAST":
			if Locations.east.has(curr_loc) and check_travel(Locations.east.get(curr_loc)):
				curr_loc = Locations.east.get(curr_loc)
				generate_examine()
		"WEST":
			if Locations.west.has(curr_loc) and check_travel(Locations.west.get(curr_loc)):
				curr_loc = Locations.west.get(curr_loc)
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
	update_display(examine)
	var object = Objects.location.find_key(curr_loc)
	if object != null:
		update_display(Objects.examine.get(object))

func check_travel(next_loc):
	if Locations.blockers.has(next_loc):
		var blocker = Locations.blockers.get(next_loc)
		var has_blocker = Player.inventory.find(blocker)
		if has_blocker != -1:
			update_display("used " + blocker)
			Player.inventory.erase(blocker)
			return true
		else:
			update_display("you dont have " + blocker)
	else:
		return true
	return false
		

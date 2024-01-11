extends ColorRect

@onready var user_input = %UserInput
@onready var display_text = %DisplayText
@onready var progress_bar = %ProgressBar

var origin = "ROOM 428"
var curr_loc = origin
var target = ""
var change_moves = false
var start_time
var footsteps = 5
var monster_check = true
var check_password = false
var max_value = 100
var final_chars
var done_typing = false

@export var damage = 20

func _ready():
	progress_bar.value = max_value
	user_input.caret_force_displayed = true
	user_input.grab_focus()
	var intro_text = FileAccess.open("res://main/intro.txt", FileAccess.READ)
	update_display(intro_text.get_as_text())
	start_time = Time.get_ticks_msec()
	
func _process(_delta):
	if monster_check and Player.monster_distance == 1:
			update_display("\nYou hear wet thunking steps. Tentacles dragging and and liquid sloshing.")
			monster_check = false
	if footsteps == 0:
		randomize()
		var index = randi_range(0, Player.sounds.size() - 1)
		update_display(Player.sounds[index])
		footsteps = randi_range(5, 10)
	if Input.is_action_just_pressed("skip"):
		print("skip")
#		display_text.visible_characters = final_chars
	if Player.monster_distance == 0:
		Player.sanity = Player.sanity - damage
		progress_bar.value = Player.sanity
		for key in Objects.examine.keys():
			if Player.inventory.has(key):
				var locations = Locations.examine.keys()
				randomize()
				var new_loc = locations[randi() % locations.size()]
				Objects.location[key] = new_loc
				Player.inventory.erase(key)

		update_display("\nEverything goes black. You sit up in your bed in room 428, no memory of how you got here. You feel your pockets and realize that any car parts you had are most definitely gone...")
		curr_loc = origin
		Player.monster_distance = 5
		monster_check = true
	if Player.sanity <= 0:
		await update_display("\nThe madness takes over. You die.")
		get_tree().quit()
		
func update_display(text):
	display_text.add_text(text + "\n")
	final_chars = display_text.get_total_character_count() + text.length()
	var tween = create_tween()
	await tween.tween_property(display_text, "visible_characters", final_chars, 10).finished


func _on_user_input_text_submitted(new_text):
	monster_check = true
	if change_moves:
		Player.moves = Player.moves + 1
		Player.monster_distance = Player.monster_distance - 1
		footsteps = footsteps - 1
	user_input.clear()
	update_display("")
	update_display("> " + new_text)
	parse_input(new_text)
	
func parse_input(input):
	input = separate_input(input)
	match(input):
		"QUIT":
			get_tree().quit()
		"HELP":
			change_moves = false
			var help_text = FileAccess.open("res://main/help.txt", FileAccess.READ)
			update_display(help_text.get_as_text())
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
			else:
				update_display("your hands are empty")
		"DIG":
			if Objects.dig.has(curr_loc):
				var dig = Objects.static_object.get(Objects.dig[curr_loc])
				update_display(Objects.dig[curr_loc] + "\n" + dig)
		"MOVES":
			change_moves = false
			update_display("moves: " + str(Player.moves))
		"SCORE":
			change_moves = false
			update_display("score: " + str(Player.score))
		"SANITY":
			change_moves = false
			update_display("sanity: " + str(Player.sanity))
		"TIME":
			change_moves = false
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
		"NORTHEAST":
			if Locations.northeast.has(curr_loc) and check_travel(Locations.northeast.get(curr_loc)):
				curr_loc = Locations.northeast.get(curr_loc)
				generate_examine()
		"SOUTHEAST":
			if Locations.southeast.has(curr_loc) and check_travel(Locations.southeast.get(curr_loc)):
				curr_loc = Locations.southeast.get(curr_loc)
				generate_examine()
		"NORTHWEST":
			if Locations.northwest.has(curr_loc) and check_travel(Locations.northwest.get(curr_loc)):
				curr_loc = Locations.northwest.get(curr_loc)
				generate_examine()
		"SOUTHWEST":
			if Locations.southwest.has(curr_loc) and check_travel(Locations.southwest.get(curr_loc)):
				curr_loc = Locations.southwest.get(curr_loc)
				generate_examine()
		"UP":
			if Locations.up.has(curr_loc) and check_travel(Locations.up.get(curr_loc)):
				curr_loc = Locations.up.get(curr_loc)
				generate_examine()
		"DOWN":
			if Locations.down.has(curr_loc) and check_travel(Locations.down.get(curr_loc)):
				curr_loc = Locations.down.get(curr_loc)
				generate_examine()
		"PASSWORD":
			check_password = false
			if target == "4798":
				update_display("The keypad beeps cheerily and a tiny green light flashes. The door swings open.")
				Locations.examine["DR OFFICE"] = "You stand in what appears to be a local doctor's office. There is a framed photograph of a river gorge spanned by a rickety bridge and a few upended waiting-room seats. On the back wall there is an open safe.
	\nTo the EAST is a dark hallway,
	\nTo the SOUTHWEST is the door"
				Objects.location["PISTON"] = "SAFE"
				Objects.static_object["SAFE"] = "The safe is wide open."
			else:
				update_display("The keypad honks at you angrily and a tiny red light flashes. That wasnt the right code.")
		"EXAMINE OBJECT":
			if Objects.static_object.has(target) and Objects.static_object_location.get(target) == curr_loc:
				if target == "CAR":
					check_complete()
				else:
					generate_object_examine()
				if target == "KEYPAD":
					check_password = true
			else:
				update_display("I don't know what that means")
				
func separate_input(text):
	if text == "" or text == null:
		update_display("type something")
	else:
		change_moves = true
	if check_password:
		target = text
		return "PASSWORD"
	text = text.to_upper()
	if text.contains("EXAMINE"):
		target = text.trim_prefix("EXAMINE")
		if target == "" or target == " " or target == null:
			return "EXAMINE"
		else:
			target = target.trim_prefix(" ")
			target = target.trim_suffix(" ")
			return "EXAMINE OBJECT"
	if text.contains("PICK UP"):
		target = text.trim_prefix("PICK UP ")
		return "PICK UP"
	elif text.contains("TAKE"):
		target = text.trim_prefix("TAKE ")
		return "TAKE"
	elif text.contains("DROP"):
		target = text.trim_prefix("DROP ")
		return "DROP"
	elif text.contains("DIG"):
		return "DIG"
	if text.contains("HELP"):
		return "HELP"
	if text == "I":
		return "INVENTORY"
	if text == "EX":
		return "EXAMINE"
	if text == "N":
		return "NORTH"
	if text == "S":
		return "SOUTH"
	if text == "E":
		return "EAST"
	if text == "W":
		return "WEST"
	if text == "NW":
		return "NORTHWEST"
	if text == "SW":
		return "SOUTHWEST"
	if text == "NE":
		return "NORTHEAST"
	if text == "SE":
		return "SOUTHEAST"
	else:
		target = ""
	return text
	
func generate_examine():
	var examine = Locations.examine.get(curr_loc)
	display_text.push_color(Color.GREEN)
	update_display("\n" + curr_loc + "\n")
	display_text.push_color(Color.WHITE)
	var object = Objects.location.find_key(curr_loc)
	if object != null:
		var examine_arr = examine.split("\n\n")
		update_display(examine_arr[0] + "\n" + Objects.examine.get(object) + "\n" + examine_arr[1])
	else:
		update_display(examine)

func generate_object_examine():
	var examine = Objects.static_object.get(target)
	display_text.push_color(Color.GREEN)
	update_display("\n" + target + "\n")
	display_text.push_color(Color.WHITE)
	update_display(examine)
	var object = Objects.location.find_key(target)
	if object != null:
		update_display(Objects.examine.get(object))
	if Objects.sanity_loss.get(target) != null:
		Player.sanity = Player.sanity - Objects.sanity_loss.get(target)
		progress_bar.value = Player.sanity

func check_travel(next_loc):
	if Locations.blockers.has(next_loc):
		var blocker = Locations.blockers.get(next_loc)
		var has_blocker = Player.inventory.find(blocker)
		if has_blocker != -1:
			update_display("used " + blocker)
			if blocker.contains("KEY"):
				Player.inventory.erase(blocker)
			Player.monster_distance = Player.monster_distance + 2
			return true
		else:
			update_display("you dont have " + blocker)
	else:
		Player.monster_distance = Player.monster_distance + 2
		return true
	return false
	
func check_complete():
	if Player.inventory.find("BATTERY") != -1 and Player.inventory.find("ALTERNATOR") != -1 and Player.inventory.find("SPARK PLUG") != -1 and Player.inventory.find("CAR KEY") != -1 and Player.inventory.find("BATTERY") != -1:
		var escape_text = FileAccess.open("res://main/escape.txt", FileAccess.READ)
		update_display(escape_text.get_as_text())
	else:
		generate_object_examine()
		

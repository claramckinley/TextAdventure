extends ColorRect

@onready var user_input = %UserInput
@onready var display_text = %DisplayText

var origin = "ROOM 428"
var curr_loc = origin
var target = ""
var change_moves = true
var start_time
@export var damage = 5

func _ready():
	user_input.caret_force_displayed = true
	user_input.grab_focus()
	var intro_text = FileAccess.open("res://main/intro.txt", FileAccess.READ)
	update_display(intro_text.get_as_text())
	start_time = Time.get_ticks_msec()
	
#func _process(delta):
##	if Input.is_action_just_pressed("skip"):
##		display_text.visible_ratio = 1
#	if Player.monster_distance == 0:
#		Player.sanity = Player.sanity - damage
#	if Player.sanity <= 0:
#		curr_loc = origin
#		for key in Objects.examine.keys():
#			if Player.inventory.has(key):
#				var locations = Locations.examine.keys()
#				randomize()
#				var new_loc = locations[randi() % locations.size()]
#				print(new_loc)
#				Objects.location[key] = new_loc
#				Player.inventory.erase(key)
#		update_display("you were caught by the monster. youre back at the hotel and the car pieces you had are gone...")
#		Player.monster_distance = 3
#		Player.sanity = 10
		
func update_display(text):
	display_text.add_text(text + "\n")
#	var tween = create_tween()
#	tween.tween_property(display_text, "visible_ratio", 1.0, 15)
	

func _on_user_input_text_submitted(new_text):
#	if new_text == "" or new_text == null :
#		display_text.visible_ratio = 1
	if change_moves:
		Player.moves = Player.moves + 1
		Player.monster_distance = Player.monster_distance - 1
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
		"MOVES":
			change_moves = false
			update_display("moves: " + str(Player.moves))
		"SCORE":
			change_moves = false
			update_display("score: " + str(Player.score))
		"SANITY":
			change_moves = false
			update_display("sanity: " + str(Player.sanity))
		"MONSTER":
			change_moves = false
			update_display("monster: " + str(Player.monster_distance))
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
		"EXAMINE OBJECT":
			if Locations.object.has(target) and Locations.object_location.get(target) == curr_loc:
				generate_object_examine()
				
func separate_input(text):
	if text == "" or text == null:
		update_display("type something")
	else:
		change_moves = true
	text = text.to_upper()
	if text.contains("EXAMINE"):
		target = text.trim_prefix("EXAMINE ")
		return ""
	if text.contains("PICK UP"):
		target = text.trim_prefix("PICK UP ")
		return "PICK UP"
	elif text.contains("TAKE"):
		target = text.trim_prefix("TAKE ")
		return "TAKE"
	elif text.contains("DROP"):
		target = text.trim_prefix("DROP ")
		return "DROP"
	elif text.contains("OPEN"):
		target = text.trim_prefix("OPEN ")
		return "OPEN"
	elif text.contains("CLOSE"):
		target = text.trim_prefix("CLOSE ")
		return "CLOSE"
	if text.contains("HELP"):
		return "HELP"
	else:
		target = ""
	return text
	
func generate_examine():
	var examine = Locations.examine.get(curr_loc)
	update_display(curr_loc + "\n" + examine)
	var object = Objects.location.find_key(curr_loc)
	if object != null:
		update_display(Objects.examine.get(object))

func generate_object_examine():
	var examine = Locations.object.get(target)
	update_display(target + "\n" + examine)
	var object = Objects.location.find_key(target)
	if object != null:
		update_display(Objects.examine.get(object))

func check_travel(next_loc):
	if Locations.blockers.has(next_loc):
		var blocker = Locations.blockers.get(next_loc)
		var has_blocker = Player.inventory.find(blocker)
		if has_blocker != -1:
			update_display("used " + blocker)
			Player.inventory.erase(blocker)
			Player.monster_distance = Player.monster_distance + 2
			return true
		else:
			update_display("you dont have " + blocker)
	else:
		Player.monster_distance = Player.monster_distance + 2
		return true
	return false

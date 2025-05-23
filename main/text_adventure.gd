extends ColorRect

onready var user_input = $"../UserInput"
onready var display_text = $"../ScrollContainer/DisplayText"
onready var progress_bar = $"../ProgressBar"
onready var typing_timer = $"../TypingTimer"
onready var sanity_delta = $"../ProgressBar/SanityDelta"
onready var delta_timer = $"../DeltaTimer"
onready var scroller = $"../ScrollContainer"
onready var bullet1 = $"../ProgressBar/HBoxContainer/bullet1"
onready var bullet2 = $"../ProgressBar/HBoxContainer/bullet2"
onready var bullet3 = $"../ProgressBar/HBoxContainer/bullet3"
onready var bullet4 = $"../ProgressBar/HBoxContainer/bullet4"
onready var bullet5 = $"../ProgressBar/HBoxContainer/bullet5"
onready var bullet6 = $"../ProgressBar/HBoxContainer/bullet6"
onready var scroll_bar = scroller.get_v_scrollbar()


var origin = "ROOM 428"
var curr_loc = origin
var target = ""
var change_moves = false
var start_time
var monster_check = true
var check_password = false
var max_monster_distance = Player.monster_distance
var bullet_count = 0
var bullet_success = 0
var game_over = false
var max_scroll_length = 0
var temp_text = ""
var start_text = true
var end_scene = false
var waiting_for_ans = false
var must_shoot = false
var waiting = ""
var is_typing = true
var foghorn_present = ["LIGHTHOUSE", "TOP OF LIGHTHOUSE", "LIGHTHOUSE BRIDGE", "BASE OF LIGHTHOUSE", "BEACH", "SOUTH BEACH", "DOCKS"]
var beach_present = ["BEACH", "SOUTH BEACH"]
var wilds_present = ["WILDS", "SMALL PATH", "NORTH OF HOTEL"]
var river_present = ["RIVER EDGE"]
var dock_present = ["DOCKS"]
var cave_present = ["CAVES", "LOW TUNNEL"]
var buy_time = ["CAR KEY", "BATTERY", "PISTON", "SPARK PLUG", "ALTERNATOR"]
var multi_use_objects =["FLASHLIGHT", "SHOVEL", ".38 REVOLVER"]
var bullet_icons
var monster_text = ""
var question_text = ""
var sanity_text = true

export var damage = 20

func _ready():
	scroll_bar.connect("changed", self, "handle_scrollbar_changed")
	max_scroll_length = scroll_bar.max_value
	progress_bar.value = Player.sanity
	user_input.caret_blink = true
	user_input.grab_focus()
	var intro_text = File.new()
	intro_text.open("res://main/intro.tres", File.READ)
	update_display(false, "\n" + intro_text.get_as_text())
	start_time = Time.get_ticks_msec()
	parse_input("EXAMINE")
	update_display("GREEN", "\nType HELP for information on how to play!")
	bullet_icons = [bullet1, bullet2, bullet3, bullet4, bullet5, bullet6]
	
func _process(_delta):
	if Player.monster_distance == 1 || Player.monster_distance == 2 || Player.monster_distance == 3:
		if $"../monster_background".playing == false:
			$"../monster_background".play()
	else:
		$"../monster_background".stop()
	if !game_over and monster_check and (Player.monster_distance == 1 || Player.monster_distance == 2):
			monster_text = "(red)\nYou hear wet thunking steps. Tentacles dragging and liquid sloshing. You might want to USE GUN...(white)"
			monster_check = false
			must_shoot = true
			change_moves = true
	if !start_text and !game_over and (Input.is_action_just_pressed("skip") or Input.is_action_just_pressed("ui_select")):
		var text_arr = temp_text.split("(green)")
		for i in text_arr:
			var sub_text_arr = i.split("(white)")
			for j in sub_text_arr:
				display_text.add_text(j)
		temp_text = ""
	if !game_over and Player.monster_distance <= 0:
		update_sanity(damage)
		if Player.sanity <= 0:
			check_ending("MONSTER")
		else:
			curr_loc = origin
			update_display("GREEN", "\n" + curr_loc + "\n")
			update_display(false, "\nEverything goes black. You sit up in your bed in room 428, no memory of how you got here.\n\n\nTo the WEST is the door to the hallway, marks on the door frame suggesting the recent removal of a bolt,\nTo the NORTH is a door with no handles.")
			Player.monster_distance = max_monster_distance
			monster_check = true
			must_shoot = false
	if end_scene and (Input.is_action_just_pressed("skip") or Input.is_action_just_pressed("ui_accept")):
		get_tree().change_scene("res://main/end_page.tscn")
	if !game_over and Player.sanity <= 0:
		check_ending("INSANITY")
		
func update_display(color, text):
	match(color):
		"GREEN":
			text = "(green)" + str(text) + "(white)"
		"RED":
			text = "(red)" + str(text) + "(white)"
	temp_text = temp_text + text + "\n"
	typing_timer.start()
	return true
	
func handle_scrollbar_changed():
	if max_scroll_length != scroll_bar.max_value:
		max_scroll_length = scroll_bar.max_value
		scroller.scroll_vertical = scroll_bar.max_value

func _on_user_input_text_submitted(new_text):
	if !game_over and !is_typing and new_text != "" and new_text != null:
		new_text = new_text.lstrip(" ")
		is_typing = true
		monster_check = true
		if change_moves:
			Player.moves = Player.moves + 1
			Player.monster_distance = Player.monster_distance - 2
			change_moves = false
		user_input.clear()
		display_text.visible_characters = display_text.get_total_character_count()
		update_display(false, "\n\n> " + new_text)
		if waiting_for_ans:
			check_waiting_for_answer(new_text)
		elif must_shoot and new_text.to_upper() != "USE GUN":
			Player.moves = Player.moves + 1
			Player.monster_distance = Player.monster_distance - 2
			change_moves = true
			return
		else:
			parse_input(new_text)
	
func check_waiting_for_answer(new_text):
	if new_text.to_upper() == "YES":
		waiting_for_ans = false
		if curr_loc == "RIVER EDGE":
			check_ending("RIVER")
		elif curr_loc == "LIGHTHOUSE BRIDGE":
			update_display(false, "\n" + Objects.yes[waiting])
			curr_loc = "LIGHTHOUSE BRIDGE LEDGE"
			generate_examine()
		elif curr_loc == "CITY HALL":
			update_display(false, "\n" + Objects.yes[waiting])
			update_sanity(damage)
		else:
			update_display(false, "\n" + Objects.yes[waiting])
	elif new_text.to_upper() == "NO":
		update_display(false, "\n" + Objects.no[waiting])
		waiting_for_ans = false
	else:
		update_display(false, "\nPlease answer YES or NO.")		
		
func parse_input(input):
	input = separate_input(input)
	match(input):
		"QUIT":
			get_tree().quit()
		"HELP":
			change_moves = false
			var help_text = File.new()
			help_text.open("res://main/help.tres", File.READ)
			update_display(false, help_text.get_as_text())
		"PICK UP":
			if target == "BULLET":
				if Objects.bullets.has(curr_loc):
					bullet_count = bullet_count + 1
					update_bullet_icons(true)
					Objects.bullets.erase(curr_loc)
					$"../take".play()
					change_moves = true
					update_display("GREEN", "\ntook " + target)
					Player.score += 10
				else:
					for i in Objects.bullets:
						if Objects.static_object_location.has(i):
							if  Objects.static_object_location[i] == curr_loc:
								bullet_count = bullet_count + 1
								update_bullet_icons(true)
								Objects.bullets.erase(curr_loc)
								$"../take".play()
								change_moves = true
								update_display("GREEN", "\ntook " + target)
			else:
				if target == "CAR KEYS":
					target = "CAR KEY"
				if Objects.location.has(target) and Player.inventory.size() < 5:
					Player.inventory.append(target)
					Objects.location.erase(target)
					$"../take".play()
					change_moves = true
					update_display("GREEN", "\ntook " + target)
					if Objects.picked_up.has(target) and Objects.picked_up[target] == 0:
						Objects.picked_up[target] = 1
						Player.monster_distance = max_monster_distance
						if buy_time.has(target):
							Player.score = Player.score + 20
							update_display(false, "You have bought yourself more time.")
						else:
							Player.score = Player.score + 10
				else:
					if Player.inventory.size() >= 5:
						update_display(false, "You don't have enough space to carry that.")
					else:
						update_display(false, "I don't know what that is.")
		"DROP":
			if Player.inventory.find(target) != -1:
				$"../drop".play()
				change_moves = true
				Player.inventory.erase(target)
				Objects.location[target] = curr_loc
				update_display("GREEN", "\ndropped " + target)
		"INVENTORY":
			change_moves = false
			if Player.inventory.size() > 0:
				update_display(false, "\nYou are holding (" + str(Player.inventory.size()) + "/5):\n")
				for i in Player.inventory:
					update_display(false, i)
			else:
				update_display(false, "your hands are empty")
		"USE SHOVEL":
			if Player.inventory.has("SHOVEL") and Objects.dig.has(curr_loc):
				$"../shovel".play()
				change_moves = true
				target = Objects.dig[curr_loc]
				generate_object_examine()
				var prev_string = Locations.examine.get(curr_loc).split("\n\n")
				var new_string = ""
				if curr_loc == "HOVEL":
					new_string = "There is a hastily-dug hole in the packed earth."
					prev_string[1] = prev_string[1] + "\nDOWN is a dark opening" 
				elif curr_loc == "GRAVEYARD":
					new_string = "There is a large hole in one of the fresh graves."
					Objects.bullets.erase(Objects.dig[curr_loc])
					Objects.bullets.append(curr_loc)
				elif curr_loc == "SOUTH BEACH":
					new_string = "There is a small hole in the sandy beach."
					Objects.bullets.erase(Objects.dig[curr_loc])
					Objects.bullets.append(curr_loc)
				Locations.examine[curr_loc] = prev_string[0] + "\n" + new_string + "\n\n" + prev_string[1]
				Objects.dig.erase(curr_loc)
			elif  Objects.dig.has(curr_loc) and not Player.inventory.has("SHOVEL"):
				update_display(false, "You don't have a SHOVEL")
			else:
				update_display(false, "There is nothing to dig")
		"USE GUN":
			change_moves = true
			if must_shoot:
				must_shoot = false
			if Player.inventory.has(".38 REVOLVER"):
				if bullet_count != 0:
					$"../gun".play()
					update_bullet_icons(false)
					bullet_count = bullet_count - 1
					if Player.monster_distance <= 2:
						bullet_success += 1
						if bullet_success != 6:
							update_display(false, "\nYou fire your gun at the creature. It screams and disappears. You have bought yourself some more time.")
							Player.monster_distance = Player.monster_distance + max_monster_distance
						else:
							check_ending("KILL")
					else:
						update_display(false, "\nYou fire your gun. Nothing else happens.")
				elif bullet_count == 0:
					update_display(false, "\nYou hear a loud click as you pull the trigger. No more bullets.")
			else:
				update_display(false, "\nYou have nothing to shoot.")
		"USE OBJECT":
			var has_item = Player.inventory.find(target)
			if has_item != -1:
				change_moves = true
				if target == "BOOTLEG LIQUOR":
					update_display("GREEN", "used " + target)
					Player.monster_distance = Player.monster_distance + 1
					Locations.usable_item.erase(curr_loc)
					Player.inventory.erase(target)
					update_sanity(-10)
					if Objects.used_item_text.has(target):
						Player.score += 10
						update_display(false, "\n" + Objects.used_item_text[target])
				elif target == "RUNIC MEDALLION":
					update_display("GREEN", "used " + target)
					Player.inventory.erase(target)
					Player.monster_distance = Player.monster_distance + 1
					Locations.usable_item.erase(curr_loc)
					if Objects.used_item_text.has(target):
						Player.score += 10
						update_display(false, "\n" + Objects.used_item_text[target])
						Locations.examine["RITUAL ROOM"] = Locations.alternate_examine["RITUAL ROOM"]
				elif Locations.usable_item.has(curr_loc) and Locations.usable_item[curr_loc] == target:
					Locations.locked.erase(curr_loc)
					if !multi_use_objects.has(target):
						Player.inventory.erase(target)
					update_display("GREEN", "used " + target)
					Player.monster_distance = Player.monster_distance + 1
					Locations.usable_item.erase(curr_loc)
					if Locations.alternate_examine.has(curr_loc):
						Locations.examine[curr_loc] = Locations.alternate_examine[curr_loc]
					if Objects.used_item_text.has(target):
						Player.score += 10
						update_display(false, "\n" + Objects.used_item_text[target])
				else:
					update_display(false, "I don't see why...")
			else:
				update_display(false, "You don't have that.")
		"TIME":
			change_moves = false
			update_display("GREEN", "TOTAL TIME: " + str(stepify(Time.get_ticks_msec() / (1000.00 * 60.00), .01)))
		"MUTE":
			change_moves = false
			Music.volume_db = -80
			update_display("GREEN", "MUTED")
		"UNMUTE":
			change_moves = false
			Music.volume_db = -24.048
			update_display("GREEN", "UNMUTED")
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
				update_display(false, "The keypad beeps cheerily and a tiny green light flashes. The door swings open and you look inside. There is something in there.")
				Locations.examine["DR OFFICE"] = Locations.alternate_examine["DR OFFICE"]
				Objects.location["PISTON"] = "SAFE"
				Objects.static_object["SAFE"] = "The safe is wide open."
			else:
				update_display(false, "The keypad honks at you angrily and a tiny red light flashes. That wasnt the right code.")
		"EXAMINE OBJECT":
			if Objects.static_object.has(target) and Objects.static_object_location.get(target) == curr_loc:
				change_moves = true
				if target == "CAR":
					check_complete()
				else:
					generate_object_examine()
				if target == "KEYPAD":
					check_password = true
			else:
				update_display(false, "I don't know what that means.")
				
func update_bullet_icons(add_bullet):
	if add_bullet:
		if bullet_count-1 >= 0:
			bullet_icons[bullet_count-1].visible = true
	else:
		if bullet_count-1 >= 0:
			bullet_icons[bullet_count].visible = false
				
func separate_input(text):
	if text != "" and text != null:
		change_moves = false
	if check_password:
		target = text
		return "PASSWORD"
	text = text.to_upper()
	if text.find_last("EXAMINE") != -1:
		target = text.trim_prefix("EXAMINE")
		if target == "" or target == " " or target == null:
			return "EXAMINE"
		else:
			target = target.trim_prefix(" ")
			target = target.trim_suffix(" ")
			return "EXAMINE OBJECT"
	if text.find_last("PICK UP") != -1:
		target = text.trim_prefix("PICK UP ")
		return "PICK UP"
	elif text.find_last("TAKE") != -1:
		target = text.trim_prefix("TAKE ")
		return "PICK UP"
	elif text.find_last("DROP") != -1:
		target = text.trim_prefix("DROP ")
		return "DROP"
	elif text.find_last("USE") != -1:
		target = text.trim_prefix("USE")
		if target == "" or target == " " or target == null:
			return "USE"
		else:
			target = target.trim_prefix(" ")
			target = target.trim_suffix(" ")
			if target == "SHOVEL":
				return "USE SHOVEL"
			elif target == "GUN" or target == "REVOLVER" or target == ".38 REVOLVER":
				return "USE GUN"
			return "USE OBJECT"
	if text.find_last("HELP") != -1:
		return "HELP"
	if text == "I":
		return "INVENTORY"
	if text == "EX" or text.begins_with("EX "):
		target = text.trim_prefix("EX")
		if target == "" or target == " " or target == null:
			return "EXAMINE"
		else:
			target = target.trim_prefix(" ")
			target = target.trim_suffix(" ")
			return "EXAMINE OBJECT"
	if text == "L" or text.begins_with("L "):
		target = text.trim_prefix("L")
		if target == "" or target == " " or target == null:
			return "EXAMINE"
		else:
			target = target.trim_prefix(" ")
			target = target.trim_suffix(" ")
			return "EXAMINE OBJECT"
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
	if text == "D":
		return "DOWN"
	if text == "U":
		return "UP"
	return text
	
func generate_examine():
	change_moves = true
	if curr_loc == "RITUAL ROOM" and !Locations.usable_item.has(curr_loc):
		Locations.examine["RITUAL ROOM"] = Locations.alternate_examine["RITUAL ROOM"]
	var examine = Locations.examine.get(curr_loc)
	check_for_sounds()
	update_display("GREEN", "\n" + curr_loc + "\n")
	var bullet = Objects.bullets.has(curr_loc)
	var has_bullet = ""
	if bullet == true:
		has_bullet = "\nThere is a BULLET"
		var examine_arr = examine.split("\n\n")
		update_display(false, examine_arr[0] + "\n" + examine_objs(curr_loc) + "\n" + str(has_bullet) + "\n" + examine_arr[1])
		
	else:
		var examine_arr = examine.split("\n\n")
		if examine_arr.size() == 2:
			update_display(false, examine_arr[0] + "\n" + examine_objs(curr_loc) + "\n" + examine_arr[1])
		if examine_arr.size() == 1:
			update_display(false, examine_arr[0] + "\n" + examine_objs(curr_loc))
	if Objects.questions.has(curr_loc):
		question_text = "(green)\n" + Objects.questions[curr_loc] + "(white)"
		waiting = curr_loc
		waiting_for_ans = true
	if curr_loc == "RITUAL ROOM":
		if Locations.usable_item.has(curr_loc):
			parse_input("SOUTH")
			Locations.locked["TEMPLE"] = "RITUAL ROOM"
		else:
			check_ending("RITUAL")
	if curr_loc == "TEMPLE":
		Locations.examine["TEMPLE"] = Locations.alternate_examine["TEMPLE"]
				
func examine_objs(object):
	var object_arr = []
	for item in Objects.location:
		if Objects.location.get(item) == object:
			object_arr.push_back(item)
	var examine_objs_str = "\n"
	for obj in object_arr:
		examine_objs_str = examine_objs_str + Objects.examine.get(obj) + "\n"
	return examine_objs_str
	
func check_for_sounds():
	if foghorn_present.find(curr_loc) != -1:
		$"../foghorn".play()
	else:
		$"../FoghornTimer".stop()
	if wilds_present.find(curr_loc) != -1:
		reset_sounds()
		$"../forest_background".play()
	elif river_present.find(curr_loc) != -1:
		reset_sounds()
		$"../river_background".play()
	elif dock_present.find(curr_loc) != -1:
		reset_sounds()
		$"../dock_background".play()
	elif cave_present.find(curr_loc) != -1:
		reset_sounds()
		$"../cave_background".play()
	elif beach_present.find(curr_loc) != -1:
		reset_sounds()
		$"../ocean_background".play()
	else:
		reset_sounds()
		
func reset_sounds():
	$"../river_background".stop()
	$"../forest_background".stop()
	$"../dock_background".stop()
	$"../cave_background".stop()
	$"../ocean_background".stop()

func generate_object_examine():
	var bullet = Objects.bullets.has(target)
	var has_bullet = " "
	if bullet == true:
		has_bullet = "\nThere is a BULLET"
	var examine = Objects.static_object.get(target)
	update_display("GREEN", "\n" + target + "\n")
	update_display(false, examine + "\n" + str(has_bullet) + examine_objs(target))
	if Objects.sanity_loss.get(target) != null:
		update_sanity(Objects.sanity_loss.get(target))
		Objects.sanity_loss.erase(target)
	if Objects.questions.has(target):
		question_text = "(green)\n" + Objects.questions[target] + "(white)"
		waiting = target
		waiting_for_ans = true
		
func update_sanity(sanity_damage):
	Player.sanity = Player.sanity - sanity_damage
	if sanity_damage > 0:
		sanity_delta.text = "-" + str(sanity_damage)
		question_text = "(red)\nYOU LOST SANITY(white)"
	else:
		sanity_delta.text = "+" + str(-1 * sanity_damage)
		question_text = "(red)\nYOU GAINED SANITY(white)"
	delta_timer.start()
	progress_bar.value = Player.sanity
		
func check_travel(next_loc):
	if Locations.locked.has(curr_loc) and Locations.locked[curr_loc] == next_loc:
		if curr_loc == "HOVEL" or curr_loc == "CAVES":
			update_display(false, "It's too dark to see anything.")
		else:
			update_display(false, "It's locked...")
	else:
		Player.monster_distance = Player.monster_distance + 1
		return true
	return false
	
func check_complete():
	if Player.inventory.find("BATTERY") != -1 and Player.inventory.find("ALTERNATOR") != -1 and Player.inventory.find("SPARK PLUG") != -1 and Player.inventory.find("CAR KEY") != -1 and Player.inventory.find("BATTERY") != -1:
		check_ending("ESCAPE")
	else:
		generate_object_examine()
		
func check_ending(which_ending):
	start_text = true
	game_over = true
	match(which_ending):
		"ESCAPE":
			$"../car_start".play()
			Player.score = Player.score + 30
			if Player.sanity < 20:
				Player.ending = "YOU ESCAPED BUT LOST YOUR MIND"
				which_ending = "ESCAPE_INSANE"
			elif Player.sanity > 80:
				Player.ending = "YOU ESCAPED WITH YOUR SANITY INTACT"
				which_ending = "ESCAPE_SANE"
		"KILL":
			Player.ending = "YOU KILLED THE CREATURE AND ESCAPED"
			Player.score = Player.score + 30
		"MONSTER":
			Player.ending = "YOU WERE KILLED BY THE CREATURE"
			Player.score = Player.score - 30
		"RIVER":
			Player.ending = "YOU DROWNED"
			Player.score = Player.score - 20
		"INSANITY":
			Player.ending = "YOU WENT MAD"
			Player.score = Player.score - 25
		"RITUAL":
			Player.ending = "YOU JOINED THE CULTISTS"
			Player.score = Player.score + 25
	update_display(false, "\n" + Endings.endings[which_ending])
		
func _on_delta_timer_timeout():
	delta_timer.stop()
	sanity_delta.text = ""
	
func _on_typing_timer_timeout():
	if temp_text.length() > 0:
		display_text.percent_visible = 100
		if temp_text.begins_with("(green)"):
			start_text = true
			display_text.push_color(Color.green)
			temp_text = temp_text.trim_prefix("(green)")
		if temp_text.begins_with("(red)"):
			start_text = true
			display_text.push_color(Color.red)
			temp_text = temp_text.trim_prefix("(red)")
		if temp_text.begins_with("(white)"):
			start_text = false
			display_text.push_color(Color.white)
			temp_text = temp_text.trim_prefix("(white)")
		if temp_text.length() > 0:
			display_text.add_text(temp_text[0])
			temp_text = temp_text.trim_prefix(temp_text[0])
	else:
		if monster_text != "":
			temp_text = temp_text + monster_text
			monster_text = ""
		elif question_text != "":
			temp_text = temp_text + question_text
			question_text = ""
		else:
			typing_timer.stop()
			is_typing = false
		if start_text and !game_over:
			start_text = false
		if game_over:
			end_scene = true
			
func change_sanity_text(letter):
	if Player.sanity < 5:
		sanity_text = !sanity_text
		if sanity_text:
			temp_text[0] = " "
	elif Player.sanity < 10:
		sanity_text = !sanity_text
		if sanity_text:
			temp_text[0] = temp_text[0].to_upper()
	else:
		sanity_text = false

func _on_FoghornTimer_timeout():
	$"../foghorn".play()

func _on_foghorn_finished():
	$"../FoghornTimer".start()

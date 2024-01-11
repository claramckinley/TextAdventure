extends Node
# add bootleg liqour somewhere

var examine = {
	"ROOM 428": "You are in a bleak excuse for a room. Exposed wires dangle from the ceiling around a solitary flickering bulb; the bed is small, rumpled, and covered with stained bedsheets and a pillow without a case.
	\n\n\nTo the WEST is the door to the hallway, marks on the door frame suggesting the recent removal of a bolt,
	\nTo the NORTH is a door with no handles.",
	
	"BATHROOM": "You are in a discouraging relic of a bathroom: there is an ancient marble bowl, a tin tub, and musty wood paneling around all of the plumbing fixtures. There is a little window above the tub.
	\nTo the SOUTH is a door with no handles.",
	
	"MAIN ROAD": "You are on a wide road, the surface worn and cracked.
	\nTo the EAST is your dingey hotel, 
	\nTo the WEST appears to be a dark forest, thick with trees and tall grass, 
	\nTo the SOUTH you see a town.",
	
	"WEST OF HOTEL": "Beside you is a sagging hotel, peeling paint and a creaking sign welcome you. Your car is parked in front.
	\nTo the EAST is the front door to the hotel,
	\nTo the WEST is what looks like the main road.",
	
	"WILDS": "You are quite suddenly engulfed in a sea of branches and weeds. It is shockingly disorienting and it feels as though the woods are crawling over your skin. 
	\nTo the EAST you can just barely make out the edge of the road through the thicket.",
	
	"TOWN SQUARE": "You come upon an open concourse with an unkept circular green in the center, clearly some kind of town square. A leaning statue occupies the center of the green, though it appears as though it has been erroded beyond recognition. The square and indeed all of the buildings surrounding it are eerliy silent, not even a breeze disturbing the stagnant air.\n	
	\nTo the WEST you see a large pillard hall hung with torn, faded tapestries,
	\nTo the NORTH you can see the curve of the main road you came in on,  
	\nTo the SOUTHWEST is a brick building with dark windows,  
	\nTo the EAST appears to be a general store with harsh flickering lights, 
	\nTo the NORTHEAST is a narrow building with a faded sign on the front. You can only make out a few letters: DROF-, 
	\nTo the SOUTHEAST you can see the spire of a lighthouse, clearly not in use, 
	\nTo the SOUTH you see a bridge.",
	
	"HOTEL LOBBY": "You are in the shabby lobby of a small hotel. Dim lights highlight faded carpet and peeling wallpaper. There is a lone concierge desk, dusty with lack of use and a wall of keys hanging in silent disarray. It appears there are quite a few vacancies.
	\nTo the WEST is a simple brown door
	\nTo the EAST is a rickety set of stairs barely wide enough to fit one person.",
	
	"HOUSING BRIDGE": "You approach a bridge spanning a deep river gorge. 
	\nTo the SOUTH you see houses, 
	\nTo the NORTH you can see the town square.",
	
	"HOUSING DISTRICT": "You stand in a small roundabout, boarded up houses and tilting mailboxes stick out of the ground like teeth. 
	\nTo the NORTH is the bridge over the gorge, 
	\nTo the WEST you see a ghoulish steeple tower above the houses in front of you, 
	\nTo the EAST you can see the lighthouse in the distance, 
	\nTo the SOUTHWEST stands a house that appears to be vaguely tenented, though the windows are still boarded up. There is a crack of light seeping through them, 
	\nTo the SOUTH you see a deserted hovel, 
	\nTo the SOUTHEAST you see a confusingly lavish mansion.",
	
	"OLD CHURCH": "You stand inside an old church. Pews sagging under the weight of years; once-vibrant stained glass now milky with caked-on dust; scattered hymnals litter the floor, pages torn. 
	\nTo the EAST is the housing district, 
	\nTo the WEST is a simple wooden door,
	\nTo the SOUTHWEST is a modest graveyard",
	
	"CHURCH SANCTUARY": "You stand in a small alcove behind the church alter, the walls are covered in dusty shelves with glass vials and flasks. Labels aged beyond recognition carefully organize the specimens. In quite a few there appear to be bloated objects floating or sunk to the bottom.
	\nTo the EAST is a simple wooden door",
	
	"GRAVEYARD": "You stand in a graveyard. A handful of moss-laden tombstones pepper freshly-churned earth piled in neat mounds. A large tree stads at the far end of the lot.
	\nTo the NORTHEAST is the old church, its decaying steeple casting a long shadow over the graveyard
	\nTo the NORTHWEST is an old, rickety bridge",
	
	"OLD BRIDGE": "You are on a rickety bridge. Worn planks creak with each step you take and the entire crossing sways uneasily under your weight.
	\nTo the NORTH is a small path that cuts into the bushes,
	\nTo the SOUTH you can see a small graveyard",
	
	"SMALL PATH": "You are on a slim unkept path, barely wide enough for you to squeeze through. The branches press tightly against you but there is a clear way through. 
	\nTo the NORTH is a dense forest, 
	\nTo the SOUTH is a narrow, rickety bridge, 
	\nTo the SOUTHEAST you notice a steady roaring sound",
	
	"RIVER EDGE": "You traverse your way down a trecherous path. It takes a while but eventually you make it to the end. A wide, deafening river roars past you, drowning out all other sound. 
	\nTo the NORTHWEST you see the edge of a small path leading back up along the side of the steep incline",
	
	"STORE": "You stand in the town's general store. There are only a few aisles but every one seems near-empty of goods. Except for the salt, which has been untouched. There is one checkout lane open, an elderly, bearded man with sunken eyes and blueish skin stares blankly at the wall.
	\nTo the WEST is the door",
	
	"DR OFFICE": "You stand in what appears to be a local doctor's office. There is a framed photograph of a river gorge spanned by a rickety bridge and a few upended waiting-room seats. On one wall there is a nondescript grey door with a keypad on it.
	\nTo the EAST is a dark hallway,
	\nTo the SOUTHWEST is the door",
	
	"DARK HALL": "You walk down the dark hallway and enter a back room where a cart of sterile instruments sits prepped in a makeshift operating room. A folding card table stands in the center covered with a slightly stained white sheet.
	\nTo the WEST is the waiting room",
	
	"LIBRARY": "You are in a library with impressively towering shelves that brush the surprisingly high ceiling. The books are meticulously organized and a dusty card catalog stands off to your right. A few books lay open on a central table as though forgotten mid-read.
	\nTo the NORTHEAST is the door",
	
	"CITY HALL": "You are in a large circular room with a raised bench at the far end, gavels lay abandoned atop stacks of yellowing parchment. There stands a display case in the center of the room cordoned off with velvet ropes and surrounded in concentric circles by folding chairs. 
	\nTo the EAST is the door",
	
	"LIGHTHOUSE": "You stand inside of the lighthouse. The walls are rounded, made of red bricks and the floor is muddied with criss-crossing footprints. In the center of the room is an iron spiral staircase that reaches far up to the top of the lighthouse. In the room with you is a modest cot, a writing desk with a wire lamp and a ratty shade, and a cabinet.
	\nUP is the top of the lighthouse
	\nTo the NORTHWEST is a path, 
	\nTo the WEST is a cluster of houses, 
	\nTo the SOUTH appears to be access to the water, 
	\nTo the NORTH is a rocky trail along the edge of the water,
	\nTo the NORTHEAST are some docks",
	
	"TOP OF LIGHTHOUSE": "You are at the top of the lighthouse. A huge beacon lamp sits in the center of the open-air room, though the glass in the light has been shattered and covers the floor. A chain with a delicate gold cross lays on the ground.
	\nDOWN is the lighthouse",
	
	"DOCKS": "You stand on a decaying dock. You can see dilapidated pilings, encrusted with barnacles amid the murky expanse of the waterfront. Out in the distance you can spot what seems to be a small two-man rowboat in the choppy water, though you cannot see any figures.
	\nTo the SOUTHWEST is the entrance to the lighthouse",
	
	"LIGHTHOUSE BRIDGE": "You cross a sturdy little bridge short enough for you to have leapt from start to finish. Iron railings border the sides, though peering over the edge grants you a vertigo-inducing view of water far below.
	\nTo the SOUTHEAST is a lighthouse,
	\nTo the NORTHWEST is the town square",
	
	"BEACH": "You stand on a bleak beachfront. The sand is gray and a thick line of greasy seaweed marks where the water reaches its height.
	\nTo the SOUTH you can see some kind of structure at the end of the beach
	\nTo the NORTH is the lighthouse",
	
	"SOUTH BEACH": "You stand in front of a large burnt-out bonfire. The ground is covered with ash and surrounding the pile are crooked stones with eldritch carvings hacked into their surfaces, dark splashes of mysterious ichor mars the face of the one beside you.
	\nTo the NORTH you can see the lighthosue",
	
	"HOUSE": "You stand inside a small, bare, one-bedroom house. There is a twin-sized bed in the corner and a bowl of brown water on the ground beside it. Hay covers the floor, a half-hearted attempt at a carpet, and a tiny desk has been shoved into the corner. In the dim light from an exposed bulb on the ceiling you can see that the walls, ground, ceiling, and furniture have all been mercilously carved and etched with black ink. Symbols upon symbols of nautical horror surround you and envelop you.
	\nTo the NORTHEAST is the door",
	
	"HOVEL": "You enter the deserted hovel whose dark gaping windows and perilous lean suggest you dont take your time. Inside is bare: no furniture, windows boarded up, exposed beams above your head, floor made of packed earth. 
	\nTo the NORTH is the door",
	
	"MANSION": "You enter an opulent mansion. A dazzling grand staircase winds upward in front of you and lush draperies adorn every surface.
	\nTo the SOUTHEAST is the staircase
	\nTo the SOUTHWEST is a door
	\nTo the NORTHWEST is the front door",
	
	"UPSTAIRS": "You walk up the stairs, feeling transported to a world of dramatic riches. The banister is a thick, dark wood, so shiny you can see your reflection.
	\nTo the SOUTHEAST is a lone door,
	\nTo the NORTHWEST is the staircase",
	
	"KITCHEN": "You are in the mansion's kitchen. A set of large farmhouse sinks take up much of the far wall and hooks decorate the walls holding an assortment of botanical curiosities.
	\nTo the NORTHEAST is a door",
	
	"BEDROOM":"You stand in a bedroom unlike any you have seen before. Luxury drips off of every surface: the sumptuous bedding,the gilded furniture, the silk drapes, even a delicate fragrance wafts through the room carrying an aura of refinement.
	\nTo the NORTHWEST is a door",
	
	"CAVES": "You enter an exapansive cavern extending into blackness around you. You can hear the drip drip drip of water somewhere off in a direction you cant quite place.
	\nTo the SOUTH is a perilously rocky trail, butting against the sea, 
	\nTo the EAST is a low tunnel, the floor of which is wet and sharp with obsidian rocks",
	
	"LOW TUNNEL": "You lay on your stomach inn extremely low tunnel. In front of you is a small door, as though for a child to crawl through. The door is locked and wont budge however much you beat it but you do notice an odd triangular indentation in the center.
	\nTo the EAST is the odd locked door,
	\nTo the WEST is the large cavern",
	
	"TEMPLE": "You scramble through the tunnel on your stomach and stand to find yourself in the confines of a temple. Ancient, cyclopean stones rise like jagged teeth, their surfaces coated in grotesque engravings depicting eldritch rites otherworldly abominations. The temple's architecture defies earthly geometry, twisting reality itself into a cosmic alien leviathon. At the far end of the horrific chamber is a central altar surrounded by unearthly flickering candles. 
	\nTo the NORTH is an arched, stone door with a large golden knob the size of your head in the center,
	\nTo the WEST is the low tunnel",
	
	"RITUAL ROOM": "",
	
	"TUNNELS": "The earth has been dug out around you to a height you need to stoop to fit through, the walls are shoulder-width apart and it is pitch black. Your flashlight casts a spotlight on the dark soil around you. You can see some roots reaching through above your head.
	\nUP is back into the hovel
	\nTo the SOUTH the tunnel continues.",
	
	"DEEP TUNNELS": "A dead end.
	\nTo the NORTH the tunnel continues."
}

var blockers = {
	"TUNNELS": "FLASHLIGHT",
	"TEMPLE": "STRANGE TRIANGLE"
}

var up = {
	"LIGHTHOUSE": "TOP OF LIGHTHOUSE",
	"TUNNELS": "HOVEL"
}

var down = {
	"TOP OF LIGHTHOUSE": "LIGHTHOUSE",
	"HOVEL": "TUNNELS"
}

var north = {
	"TOWN SQUARE": "MAIN ROAD",
	"HOUSING BRIDGE": "TOWN SQUARE",
	"HOUSING DISTRICT": "HOUSING BRIDGE",
	"OLD BRIDGE": "SMALL PATH",
	"SMALL PATH": "WILDS",
	"BEACH": "LIGHTHOUSE",
	"HOVEL": "HOUSING DISTRICT",
	"LIGHTHOUSE": "CAVES",
	"ROOM 428": "BATHROOM",
	"SOUTH BEACH": "BEACH",
	"DEEP TUNNELS": "TUNNELS"
}

var east = {
	"MAIN ROAD": "WEST OF HOTEL",
	"WEST OF HOTEL": "HOTEL LOBBY",
	"WILDS": "MAIN ROAD",
	"TOWN SQUARE": "STORE",
	"HOUSING DISTRICT": "LIGHTHOUSE",
	"OLD CHURCH": "HOUSING DISTRICT",
	"CITY HALL": "TOWN SQUARE",
	"CAVES": "LOW TUNNEL",
	"LOW TUNNEL": "TEMPLE",
	"HOTEL LOBBY": "ROOM 428",
	"DR OFFICE": "DARK HALL",
	"CHURCH SANCTUARY": "OLD CHURCH"
}

var south = {
	"MAIN ROAD": "TOWN SQUARE",
	"TOWN SQUARE": "HOUSING BRIDGE",
	"HOUSING BRIDGE": "HOUSING DISTRICT",
	"HOUSING DISTRICT": "HOVEL",
	"OLD BRIDGE": "GRAVEYARD",
	"SMALL PATH": "OLD BRIDGE",
	"LIGHTHOUSE": "BEACH",
	"CAVES": "LIGHTHOUSE",
	"BATHROOM": "ROOM 428",
	"BEACH": "SOUTH BEACH",
	"TUNNELS": "DEEP TUNNELS"
}

var west = {
	"MAIN ROAD": "WILDS",
	"WEST OF HOTEL": "MAIN ROAD",
	"TOWN SQUARE": "CITY HALL",
	"HOTEL LOBBY": "WEST OF HOTEL",
	"HOUSING DISTRICT": "OLD CHURCH",
	"STORE": "TOWN SQUARE",
	"LIGHTHOUSE": "HOUSING DISTRICT",
	"LOW TUNNEL": "CAVES",
	"TEMPLE": "LOW TUNNEL",
	"ROOM 428": "HOTEL LOBBY",
	"DARK HALL": "DR OFFICE",
	"OLD CHURCH": "CHURCH SANCTUARY"
}

var northeast = {
	"TOWN SQUARE": "DR OFFICE",
	"GRAVEYARD": "OLD CHURCH",
	"LIBRARY": "TOWN SQUARE",
	"LIGHTHOUSE": "DOCKS",
	"HOUSE": "HOUSING DISTRICT",
	"KITCHEN": "MANSION"
}

var northwest = {
	"GRAVEYARD": "OLD BRIDGE",
	"RIVER EDGE": "SMALL PATH",
	"LIGHTHOUSE": "LIGHTHOUSE BRIDGE",
	"MANSION": "HOUSING DISTRICT",
	"UPSTAIRS": "MANSION",
	"BEDROOM": "UPSTAIRS",
	"LIGHTHOUSE BRIDGE": "TOWN SQUARE",
}

var southeast = {
	"TOWN SQUARE": "LIGHTHOUSE",
	"HOUSING DISTRICT": "MANSION",
	"SMALL PATH": "RIVER EDGE",
	"MANSION": "UPSTAIRS",
	"UPSTAIRS": "BEDROOM",
	"LIGHTHOUSE BRIDGE": "LIGHTHOUSE",
}

var southwest = {
	"TOWN SQUARE": "LIBRARY",
	"HOUSING DISTRICT": "HOUSE",
	"OLD CHURCH": "GRAVEYARD",
	"DR OFFICE": "TOWN SQUARE",
	"MANSION": "KITCHEN",
	"DOCKS": "LIGHTHOUSE"
}

var cross = {
}

#func can_fit():
#	if Player.inventory.size() > 3:
#		return "You are carrying too much stuff"
	

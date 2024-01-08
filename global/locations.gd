extends Node
# add bootleg liqour somewhere

var examine = {
	"ROOM 428": "You are in a bleak excuse for a room. Exposed wires dangle from the ceiling around a solitary flickering bulb; the bed is small, rumpled, and covered with stained bedsheets and a pillow without a case.
	\nTo the WEST is the door to the hallway, marks on the door frame suggesting the recent removal of a bolt,
	\nTo the NORTH is a door with no handles.",
	
	"BATHROOM": "You are in a discouraging relic of a bathroom: there is an ancient marble bowl, a tin tub, and musty wood paneling around all of the plumbing fixtures. 
	\nTo the SOUTH is a door with no handles.",
	
	"MAIN ROAD": "You are on a wide road, the surface worn and cracked .
	\nTo the EAST is your dingey hotel, 
	\nTo the WEST appears to be a dark forest, thick with trees and tall grass, 
	\nTo the SOUTH you see a town.",
	
	"WEST OF HOTEL": "Beside you is a listing hotel, peeling paint and a creaking sign welcome you. 
	\nYou see your car parked out front (could you open it?), 
	\nTo the EAST is the front door to the hotel,
	\nTo the WEST is what looks like the main road.",
	
	"WILDS": "You are quite suddenly engulfed in a sea of branches and weeds. It is shockingly disorienting and it feels as though the woods are crawling over your skin. 
	\nTo the EAST you can just barely make out the edge of the road through the thicket.",
	
	"TOWN SQUARE": "You come upon an open concourse with an unkept circular green in the center, clearly some kind of town square. A leaning statue occupies the center of the green, though it appears as though it has been erroded beyond recognition.\n	
	\nTo the WEST you see a large pillard hall hung with torn, faded tapestries,
	\nTo the NORTH you can see the curve of the main road you came in on,  
	\nTo the SOUTHWEST is a squat building with dark windows,  
	\nTo the EAST appears to be a general store with harsh flickering lights, 
	\nTo the NORTHEAST is a narrow building with a faded sign on the front. You can only make out a few letters: DR-, 
	\nTo the SOUTHEAST you can see the spire of a lighthouse, clearly not in use, 
	\nTo the SOUTH you see a bridge.",
	
	"HOTEL": "You are in the shabby lobby of a small hotel. Dim lights highlight faded carpet and peeling wallpaper. There is a lone concierge desk, dusty with lack of use and a wall of keys hanging in silent disarray. It appears there are quite a few vacancies.
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
	
#	"UNDER THE CHURCH"
	
	"GRAVEYARD": "You stand in a graveyard. A handful of moss-laden tombstones pepper freshly-churned earth piled in neat mounds.
	\nTo the NORTHEAST is the old church, its decaying steeple casting a long shadow over the graveyard
	\nTo the NORTHWEST is an old, rickety bridge",
	
	"OLD BRIDGE": "You are on a rickety bridge. Worn planks creak with each step you take and the entire crossing sways uneasily under your weight.
	\nTo the NORTH is a small path that cuts into the bushes,
	\nTo the SOUTH you can see a small graveyard",
	
	"SMALL PATH": "You are on a slim unkept path, barely wide enough for you to squeeze through. The branches press tightly against you but there is a clear way through. 
	\nTo the NORTH is a dense forest, 
	\nTo the SOUTH is a narrow, rickety bridge, 
	\nTo the SOUTHEAST you notice a steady roaring sound",
	
	"RIVER EDGE": "A wide, deafening river roars past you, drowning out all other sound. 
	\nTo the NORTHWEST you see the edge of a small path leading into the brush",
	
	"STORE": "You stand in the town's general store. There are only a few aisles but every one seems near-empty of goods. Except for the salt, which has been untouched. There is one checkout lane open, an elderly, bearded man with sunken eyes and blueish skin stares blankly at the wall.
	\nTo the WEST is the door",
	
	"DR OFFICE": "You stand in what appears to be a local doctor's office. There is a framed photograph of a river gorge spanned by a rickety bridge and a few upended waiting-room seats. 
	\nTo the EAST is a dark hallway,
	\nTo the SOUTHWEST is the door",
	
	"DARK HALL": "You walk down the dark hallway and enter a back room where a cart of sterile instruments sits prepped in a makeshift operating room. A folding card table stands in the center covered with a slightly stained white sheet.
	\nTo the WEST is the waiting room",
	
	"LIBRARY": "You are in a library with impressively towering shelves that brush the surprisingly high ceiling. The books are meticulously organized and a dusty card catalogue stands off to your right. 
	\nTo the NORTHEAST is the door",
	
	"CITY HALL": "You are in a large circular room with a raised bench at the far end, gavels lay abandoned atop stacks of yellowing parchemnt. There stands a display case in the center of the room cordoned off with velvet ropes and surrounded in concentric circles by folding chairs. 
	\nTo the EAST is the door",
	
	"LIGHTHOUSE": "You stand inside of the lighthouse. , 
	\nTo the NORTHWEST is a path, 
	\nTo the WEST is a cluster of houses, 
	\nTo the SOUTH appears to be access to the water, 
	\nTo the NORTH is a rocky trail along the edge of the water,
	\nTo the NORTHEAST are some docks",
	
	"TOP OF LIGHTHOUSE": "",
	
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
	
	"HOUSE": "You stand inside a small, bare, one-bedroom house. There is a twin-sized bed in the corner and a bowl of brown water on the ground beside it. Hay covers the floor, a half-hearted attempt at a carpet, and a tiny desk has been shoved into the corner. In the dim light from an exposed bulb on the ceiling you can see that the walls, floor, ceiling, and furniture have all been mercilously carved and etched with black ink. Symbols upon symbols of nautical horror surround you and envelop you.
	\nTo the NORTHEAST is the door",
	
	"HOVEL": "You enter the deserted hovel whose dark gaping windows and perilous lean suggest you dont take your time.Inside 
	\nTo the NORTH is the door",
	
	"MANSION": "You enter an opulent mansion. A dazzling grand staircase winds upward in front of you and lush draperies adorn every surface.
	\nTo the SOUTHEAST is the staircase
	\nTo the SOUTHWEST is a door
	\nTo the NORTHWEST is the front door",
	
	"UPSTAIRS": "You 
	\nTo the SOUTHEAST is a lone door,
	\nTo the NORTHWEST is the staircase",
	
	"KITCHEN": "
	\nTo the NORTHEAST is a door"
	
	"BEDROOM":"
	\nTo the NORTHWEST is a door"
	
	"CAVES": "You enter an exapansive cavern extending into blackness around you. You can hear the drip drip drip of water somewhere off in a direction you cant quite place.
	\nTo the SOUTH is a perilously rocky trail, butting against the sea, 
	\nTo the EAST is a low tunnel, the floor of which is wet and sharp with obsidian rocks",
	
	"TEMPLE": "You scramble through the tunnel on your stomach and stand to find yourself in a lavish temple, the walls of which are draped in massive tapestries with haunting aquatic imagery. Gold sparkles upon every surface and the air smells strongly of salt.
	\nTo the WEST is the low tunnel",
	
	"CAR": "The hood of the car creaks open and you take stock. 
	\nThere are parts missing, cables unhooked and yawning, previously-occupied spaces. After a brief survey of the damage you note that you are missing: 
	\nthe BATTERY, 
	\na PISTON, 
	\na SPARK PLUG, 
	\nthe ALTERNATOR, 
	\nand, though you left the car unlocked, you are missing your CAR KEYS",
	
	"BOOK ONE": "____ was founded in 1685. Notable for its shipbuilding and the riots of 1838, the town became extremely superstitious and closed off from the world",
	
	"DISPLAY CASE": "Inside is an amulet of strange, unearthly splendor: swirling nautical carvings surround oppulent cerulean gems. The carvings are near-unintelligible, though with a curiously disturbing element you can't quite put your finger on."
}

var blockers = {
	"STORE": "KEY"
}

var open = {
	"WEST OF HOTEL": "CAR",
	"CITY HALL": "DISPLAY CASE"
}

var close = {
	"CAR": "WEST OF HOTEL",
	"DISPLAY CASE": "CITY HALL"
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
	"ROOM 428": "BATHROOM"
}

var east = {
	"MAIN ROAD": "WEST OF HOTEL",
	"WEST OF HOTEL": "HOTEL",
	"WILDS": "MAIN ROAD",
	"TOWN SQUARE": "STORE",
	"HOUSING DISTRICT": "LIGHTHOUSE",
	"OLD CHURCH": "HOUSING DISTRICT",
	"CITY HALL": "TOWN SQUARE",
	"CAVES": "TEMPLE",
	"HOTEL": "ROOM 428",
	"DR OFFICE": "DARK HALL"
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
	"BATHROOM": "ROOM 428"
}

var west = {
	"MAIN ROAD": "WILDS",
	"WEST OF HOTEL": "MAIN ROAD",
	"TOWN SQUARE": "CITY HALL",
	"HOTEL": "WEST OF HOTEL",
	"HOUSING DISTRICT": "OLD CHURCH",
	"STORE": "TOWN SQUARE",
	"LIGHTHOUSE": "HOUSING DISTRICT",
	"TEMPLE": "CAVES",
	"ROOM 428": "HOTEL",
	"DARK HALL": "DR OFFICE"
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
	"BEDROOM": "UPSTAIRS"
}

var southeast = {
	"TOWN SQUARE": "LIGHTHOUSE",
	"HOUSING DISTRICT": "MANSION",
	"SMALL PATH": "RIVER EDGE",
	"MANSION": "UPSTAIRS",
	"UPSTAIRS": "BEDROOM"
}

var southwest = {
	"TOWN SQUARE": "LIBRARY",
	"HOUSING DISTRICT": "HOUSE",
	"OLD CHURCH": "GRAVEYARD",
	"DR OFFICE": "TOWN SQUARE",
	"MANSION": "KITCHEN"
}

var up = {
}

var down = {
}

var cross = {
}

extends Node
# add bootleg liqour somewhere

var examine = {
	"ROOM 428": "You are in a bleak excuse for a room. Exposed wires dangle from the ceiling around a solitary flickering bulb; the bed is small, rumpled, and covered with stained bedsheets and a pillow without a case.\n\n\nTo the WEST is the door to the hallway, marks on the door frame suggesting the recent removal of a bolt,\nTo the NORTH is a door with no handles.",
	"BATHROOM": "You are in a discouraging relic of a bathroom: there is an ancient marble bowl, a tin tub, and musty wood paneling around all of the plumbing fixtures. There is a little window above the tub.\n\n\nTo the SOUTH is a door with no handles.",
	"MAIN ROAD": "You are on a wide road, the surface worn and cracked.\n\n\nTo the EAST is your dingey hotel, \nTo the WEST appears to be a dark forest, thick with trees and tall grass, \nTo the SOUTH you see a town.",
	"WEST OF HOTEL": "Beside you is a sagging hotel, peeling paint and a creaking sign welcome you. Your car is parked in front. As you step out of the hotel it feels as though there is something following you. Something lurking in the distance, watching you. \n\n\nTo the EAST is the front door to the hotel,\nTo the NORTH is the side of the hotel,\nTo the WEST is what looks like the main road.",
	"NORTH OF HOTEL": "You are at the side of the hotel, a building surrouneded by thick wilderness too close to navigate. Hidden in the vegetation, almost overtaken by nature, is a rickety wooden shed. \n\n\nTo the NORTH is the wooden shed,\nTo the SOUTH is the front of the hotel.",
	"HOTEL SHED": "You are standing in a narrow wooden shed. Rusted tools hang from crooked nails in gnarled slats of wood. Even in the morning light, the shed is a dark, claustraphobic place.  \n\n\nTo the SOUTH is the exit.",
	"WILDS": "You are quite suddenly engulfed in a sea of branches and weeds. It is shockingly disorienting and it feels as though the woods are crawling over your skin. Not even a buzz or a chirp breaks the silence.\n\n\nTo the EAST you can just barely make out the edge of the road through the thicket.",
	"TOWN SQUARE": "You come upon an open concourse with an unkept circular green in the center, clearly some kind of town square. A leaning statue occupies the center of the green, though it appears as though it has been erroded beyond recognition. In front of the statue is a wrought iron bench; laying on the bench is a person sleeping, a hat covering their face. The square and indeed all of the buildings surrounding it are eerily silent, not even a breeze disturbing the stagnant air.\n	\n\n\nTo the WEST you see a large pillared hall hung with torn, faded tapestries,\nTo the NORTH you can see the curve of the main road you came in on,  \nTo the SOUTHWEST is a brick building with dark windows,  \nTo the EAST appears to be a general store with harsh flickering lights, \nTo the NORTHEAST is a narrow building with a faded sign on the front. You can only make out a few letters: DROF-, \nTo the SOUTHEAST you can see the spire of a lighthouse, clearly not in use, \nTo the SOUTH you see a bridge.",
	"HOTEL LOBBY": "You are in the shabby lobby of a small hotel. Dim lights highlight faded carpet and peeling wallpaper. There is a lone concierge desk, dusty with lack of use and a wall of keys hanging in silent disarray. It appears there are quite a few vacancies.\n\n\nTo the WEST is the exit\nTo the EAST is a rickety set of stairs barely wide enough to fit one person.",
	"HOUSING BRIDGE": "You approach a bridge spanning a deep river gorge. As you cross you feel eyes on you, but when you whip your head around you see no one.\n\n\nTo the SOUTH you see houses, \nTo the NORTH you can see the town square.",
	"HOUSING DISTRICT": "You stand in a small roundabout, boarded up houses and tilting mailboxes stick out of the ground like teeth. \n\n\nTo the NORTH is the bridge over the gorge, \nTo the WEST you see a ghoulish steeple tower above the houses in front of you, \nTo the EAST you can see the lighthouse in the distance, \nTo the SOUTHWEST stands a house that appears to be vaguely tenented, though the windows are still boarded up. There is a crack of light seeping through them, \nTo the SOUTH you see a deserted hovel, \nTo the SOUTHEAST you see a confusingly lavish mansion.",
	"OLD CHURCH": "You stand inside an old church. Pews sagging under the weight of years; once-vibrant stained glass now milky with caked-on dust; scattered hymnals litter the floor, pages torn. \n\n\nTo the EAST is the exit, \nTo the WEST is a plain door,\nTo the SOUTHWEST is a modest graveyard",
	"CHURCH SANCTUARY": "You stand in a small alcove behind the church altar, an out-of-place marble block amid aging wood. The walls are covered in dusty shelves with glass vials and flasks. Labels aged beyond recognition carefully organize the specimens. In quite a few there appear to be bloated objects floating or sunk to the bottom.\n\n\nTo the EAST is a simple wooden door",
	"GRAVEYARD": "You stand in a graveyard. A handful of moss-laden tombstones pepper freshly-churned earth piled in neat mounds. A large tree stands at the far end of the lot.\n\n\nTo the NORTHEAST is the old church, its decaying steeple casting a long shadow over the graveyard\nTo the NORTHWEST is an old, rickety bridge",
	"OLD BRIDGE": "You are on a rickety bridge. Worn planks creak with each step you take and the entire crossing sways uneasily under your weight. A fluttering piece of a long-passed newspaper is plastered against the railing.\n\n\nTo the NORTH is a small path that cuts into the bushes,\nTo the SOUTH you can see a small graveyard",
	"SMALL PATH": "You are on a slim unkept path, barely wide enough for you to squeeze through. The branches press tightly against you but there is a clear way through. \n\n\nTo the NORTH is a dense forest, \nTo the SOUTH is a narrow, rickety bridge, \nTo the SOUTHEAST you notice a steady roaring sound",
	"RIVER EDGE": "You traverse your way down a trecherous path. It takes a while but eventually you make it to the end. A wide, deafening river roars past you, drowning out all other sound. \n\n\nTo the NORTHWEST you see the edge of a small path leading back up along the side of the steep incline",
	"STORE": "You stand in the town's general store. There are only a few aisles but every one seems near-empty of goods. Except for the salt, which has been untouched. Crumpled packaging crowds the floor. There is one checkout lane open, an elderly, bearded man with sunken eyes and blueish skin stares blankly at the wall.\n\n\nTo the WEST is the exit",
	"DR OFFICE": "You stand in what appears to be a local doctor's office. There is a framed photograph of a river gorge spanned by a rickety bridge and a few upended waiting-room seats. On one wall there is a nondescript grey safe with a keypad on it.\n\n\nTo the EAST is a dark hallway,\nTo the SOUTHWEST is the exit",
	"DARK HALL": "You walk down the dark hallway and enter a back room where a cart of sterile instruments sits prepped in a makeshift operating room. A folding card table stands in the center covered with a slightly stained white sheet.\n\nTo the WEST is the waiting room",
	"LIBRARY": "You are in a library with impressively towering shelves that brush the surprisingly high ceiling. The books are meticulously organized and a dusty card catalog stands off to your right. A few books lay open on a central table as though forgotten mid-read.\n\n\nTo the NORTHEAST is the exit",
	"CITY HALL": "You are in a large circular room with a raised bench at the far end, gavels lay abandoned atop stacks of yellowing parchment. There stands a display case in the center of the room cordoned off with velvet ropes and surrounded in concentric circles by folding chairs. \n\n\nTo the EAST is the exit",
	"LIGHTHOUSE": "You stand inside of the lighthouse. The walls are rounded, made of red bricks and the floor is muddied with criss-crossing footprints. In the center of the room is an iron spiral staircase that reaches far up to the top of the lighthouse. In the room with you is a modest cot, a writing desk with a wire lamp and a ratty shade, and a cabinet.\n\n\nUP is the top of the lighthouse\nTo the NORTHWEST is a path, \nTo the WEST is a cluster of houses, \nTo the SOUTH appears to be access to the water, \nTo the NORTH is a rocky trail along the edge of the water,\nTo the NORTHEAST are some docks",
	"TOP OF LIGHTHOUSE": "You are at the top of the lighthouse. A huge beacon lamp sits in the center of the open-air room, though inside of it is just an empty hole to screw in a lightbulb. The glass from one of the windows has been shattered and covers the floor. A chain with a delicate gold cross lays on the ground.\n\n\nDOWN is the lighthouse",
	"DOCKS": "You stand on a decaying dock. You can see dilapidated pilings, encrusted with barnacles amid the murky expanse of the waterfront. Out in the distance you can spot what seems to be a small two-man rowboat in the choppy water, though you cannot see any figures.\n\n\nTo the SOUTHWEST is the entrance to the lighthouse",
	"LIGHTHOUSE BRIDGE": "You cross a sturdy little bridge short enough for you to have leapt from start to finish. Iron railings border the sides, though peering over the edge grants you a vertigo-inducing view of water far below. You glance over the railing to see a small ledge just wide enough for you to sit on. \n\n\nTo the SOUTHEAST is a lighthouse,\nTo the NORTHWEST is the town square",
	"LIGHTHOUSE BRIDGE LEDGE": "You sit precariously over thin air, perched on a sliver of ledge over an inconceivable drop.\n\n\nThe bridge is UP.",
	"BEACH": "You stand on a bleak beachfront. The sand is gray and a thick line of greasy seaweed marks where the water reaches its height.\n\n\nTo the SOUTH you can see some kind of structure at the end of the beach\nTo the EAST looks like access around the base of the lighthouse, though you would have to traverse some slippery rocks,\nTo the NORTH is the lighthouse",
	"BASE OF LIGHTHOUSE": "You scramble over the wet rocks and find purchase on the other side. In front of you there is a large, dark shape on the ground.\n\n\nTo the WEST is the beach",
	"SOUTH BEACH": "You stand in front of a large burnt-out bonfire. The sandy ground is covered with ash and surrounding the pile are crooked stones with eldritch carvings hacked into their surfaces, dark splashes of mysterious ichor mar the face of the one beside you.\n\n\nTo the NORTH you can see the lighthouse",
	"HOUSE": "You stand inside a small, bare, one-bedroom house. There is a twin-sized bed in the corner and a bowl of brown water on the ground beside it. Hay covers the floor, a half-hearted attempt at a carpet, and a tiny desk has been shoved into the corner. In the dim light from an exposed bulb on the ceiling you can see that the walls, ground, ceiling, and furniture have all been mercilously carved and etched with black ink. Symbols upon symbols of nautical horror surround you and envelop you.\n\n\nTo the NORTHEAST is the exit",
	"HOVEL": "You enter the deserted hovel whose dark gaping windows and perilous lean suggest you dont take your time. Inside is bare: no furniture, windows boarded up, exposed beams above your head, floor made of packed earth. \n\n\nTo the NORTH is the exit",
	"MANSION": "You stand in an opulent mansion. A dazzling grand staircase winds upward in front of you and lush draperies adorn every surface.\n\n\nTo the SOUTHEAST is the staircase\nTo the SOUTHWEST is a door\nTo the NORTHWEST is the exit",
	"UPSTAIRS": "You walk up the stairs, feeling transported to a world of dramatic riches. The banister is a thick, dark wood, so shiny you can see your reflection.\n\n\nTo the SOUTHEAST is a lone door,\nTo the NORTHWEST is down the stairs",
	"KITCHEN": "You are in the mansion's kitchen. A set of large farmhouse sinks take up much of the far wall and hooks decorate the walls holding an assortment of botanical curiosities.\n\n\nTo the NORTHEAST is a door",
	"BEDROOM":"You stand in a bedroom unlike any you have seen before. Luxury drips off of every surface: the sumptuous bedding, the gilded furniture, the silk drapes, even a delicate fragrance wafts through the room carrying an aura of refinement.\n\n\nTo the NORTHWEST is a door",
	"CAVES": "You enter an exapansive cavern extending into blackness around you. You can hear the drip drip drip of water somewhere off in a direction you cant quite place.\n\n\nTo the SOUTH is a perilously rocky trail, butting against the sea, \nTo the EAST is a low tunnel, the floor of which is wet and sharp with obsidian rocks",
	"LOW TUNNEL": "You lay on your stomach in an extremely low tunnel. In front of you is a small door, as though for a child to crawl through. The door is locked and wont budge however much you beat it but you do notice an odd triangular indentation in the center.\n\n\nTo the EAST is the odd locked door,\nTo the WEST is the large cavern",
	"TEMPLE": "You scramble through the tunnel on your stomach and stand to find yourself in the confines of a temple. Ancient, cyclopean stones rise like jagged teeth, their surfaces coated in grotesque engravings depicting eldritch rites and otherworldly abominations. The temple's architecture defies earthly geometry, twisting reality itself into a cosmic alien leviathon. At the far end of the horrific chamber is a central podium surrounded by unearthly flickering candles. \n\n\nTo the NORTH is an arched, stone door with a large golden knob the size of your head in the center,\nTo the WEST is the low tunnel",
	"RITUAL ROOM": "The strange door swings open into a small room with low ceilings and jagged stone walls glistening with moisture. Candles and an eerie light illuminate the scene before you. 15 or so figures circle around a dark, dark pit in the middle of the room. The figures frantically chanting: Iä! Iä! Cthulhu fhtagn! Ph'nglui mglw'nafh Cthulhu R'lyeh wgah-nagl fhtagn! Wide-eyed you stumble back and one of the hooded figures jerks up and looks directly at you. It stops its chanting, raises one long-sleeved arm towards you, and emits an otherworldly screech. You scramble out of the room and slam the door behind you. You hear a clunk and the handle wont turn anymore.\n\n\n",
	"TUNNELS": "The earth has been dug out around you to a height you need to stoop to fit through, the walls are shoulder-width apart and it is pitch black. Your flashlight casts a spotlight on the dark soil around you. You can see some roots reaching through above your head.\n\n\nUP is back into the hovel\nTo the SOUTH the tunnel continues.",
	"DEEP TUNNELS": "A dead end.\n\n\nTo the NORTH the tunnel continues."
}

var locked = {
	"HOVEL": "TUNNELS",
	"LOW TUNNEL": "TEMPLE",
	"CAVES": "LOW TUNNEL",
}

var usable_item = {
	"HOVEL": "FLASHLIGHT",
	"CAVES": "FLASHLIGHT",
	"LOW TUNNEL": "STRANGE TRIANGLE",
	"TOP OF LIGHTHOUSE": "LIGHTBULB"
}

var alternate_examine = {
	"DR OFFICE": "You stand in what appears to be a local doctor's office. There is a framed photograph of a river gorge spanned by a rickety bridge and a few upended waiting-room seats. On the back wall there is an open safe.\n\nTo the EAST is a dark hallway,\nTo the SOUTHWEST is the door",
	"TEMPLE": "You stand in the confines of a temple. Ancient, cyclopean stones rise like jagged teeth, their surfaces coated in grotesque engravings depicting eldritch rites and otherworldly abominations. The temple's architecture defies earthly geometry, twisting reality itself into a cosmic alien leviathon. At the far end of the horrific chamber is a central altar surrounded by unearthly flickering candles. \n\n\nTo the NORTH is an arched, stone door with a large golden knob the size of your head in the center,\nTo the WEST is the low tunnel.",
	"LOW TUNNEL": "You lay on your stomach in an extremely low tunnel. In front of you is a small door, as though for a child to crawl through. The door has an odd triangular indentation in the center with a strange triangluar object resting in it.\n\n\nTo the EAST is the odd unlocked door,\nTo the WEST is the large cavern",
	"TOP OF LIGHTHOUSE": "You are at the top of the lighthouse. A huge beacon lamp sits in the center of the open-air room with its light ablaze. You cannot see anything other than unbearably blinding light as you try to look around the room.\n\n\nDOWN is the lighthouse",
	"RITUAL ROOM": "The strange door swings open into a small room with low ceilings and jagged stone walls glistening with moisture. Candles and an eerie light illuminate the scene before you. 15 or so figures circle around a dark, dark pit in the middle of the room. The figures frantically chanting: Iä! Iä! Cthulhu fhtagn! Ph'nglui mglw'nafh Cthulhu R'lyeh wgah-nagl fhtagn! The runic medallion around your neck hums with anticipation and your body tenses with excitement. As though in a dream, you step forward to join your brothers and sisters.\n\n\n"
}

var up = {
	"LIGHTHOUSE": "TOP OF LIGHTHOUSE",
	"TUNNELS": "HOVEL",
	"LIGHTHOUSE BRIDGE LEDGE": "LIGHTHOUSE BRIDGE"
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
	"DEEP TUNNELS": "TUNNELS",
	"TEMPLE": "RITUAL ROOM",
	"WEST OF HOTEL": "NORTH OF HOTEL",
	"NORTH OF HOTEL": "HOTEL SHED"
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
	"CHURCH SANCTUARY": "OLD CHURCH",
	"BEACH": "BASE OF LIGHTHOUSE"
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
	"TUNNELS": "DEEP TUNNELS",
	"RITUAL ROOM": "TEMPLE",
	"NORTH OF HOTEL": "WEST OF HOTEL",
	"HOTEL SHED": "NORTH OF HOTEL"
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
	"OLD CHURCH": "CHURCH SANCTUARY",
	"BASE OF LIGHTHOUSE": "BEACH"
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
	"TOWN SQUARE": "LIGHTHOUSE BRIDGE",
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

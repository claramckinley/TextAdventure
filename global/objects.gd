extends Node

var location = {
	"FLASHLIGHT": "STORE",
	"SILVER KEY": "BRICKS",
	"STRANGE TRIANGLE": "CHURCH",
	"BATTERY": "TOP OF LIGHTHOUSE",
	"SPARK PLUG": "TREE",
	"CAR KEY": "WILDS",
	"PISTON": "",
	"ALTERNATOR": "DEEP TUNNELS",
	"KEY 428": ""
}

var examine = {
	"KEY 428": "There is a hotel KEY 428.",
	"FISH TALISMAN": "There is a FISH TALISMAN",
	"FLASHLIGHT": "There is a normal FLASHLIGHT",
	"STRANGE TRIANGLE": "A STRANGE TRIANGLE. One side has a three-pronged tooth protruding about half an inch and the other has an intricate releif of triangles.",
	"BATTERY": "A compact metal box, adorned with a network of cables and terminals: the BATTERY",
	"SPARK PLUG": "A slender metal rod crowned with a ceramic insulator: the SPARK PLUG",
	"CAR KEY": "A ring with a set of three ordinary keys, including your house key and a small corkscrew: the CAR KEY",
	"PISTON": "A short, almost wrench-like metal object with a hefty round head: the PISTON",
	"ALTERNATOR": "A cylindrical metal block with spiked with metal fins: the ALTERNATOR"
}

var static_object = {
	"BED": "It is disgusting. You don't want to sit on it.",
	"BULB": "The bulb is grimy and shifts when you pull on the attached chain. Where you touch the bulb wipes away clean.",
	"PILLOW": "The pillow has the faint, yellow outline of someones head. When you look under it, though, you find what looks like a wad of very old seaweed.",
	"WIRES": "A tangle of colorful wires is all that holds the bulb to the ceiling, protruding from a small jagged hole.",
	"MARBLE BOWL": "Its a toilet.",
	"TUB": "It is a good-sized tub, fairly deep with a drain stopper on a chain dangling over the edge. There is a black water line circling the sides.",
	"WINDOW": "You look through the little window and see the whole town, all the way out to a dark distant reef in the sea. Between you and the water there are buildings in disrepair and low flickering lights illuminating dim circles along the roads. A dark lighthouse stands by a beach far away.",
	"CARPET": "The carpet started life a proud, swirling mosaic of green and blue, but now is a light grey so worn through in points that there is no color at all.",
	"WALLPAPER": "The wallpaper has a subtle floral motif.",
	"CONCIERGE DESK": "Its a sturdy brown desk marred by years of use and stained with the dirt of travelers.",
	"KEYS": "A grid of 5 by 5 hooks boasts a hearty 24 keys. The 25th is in your pocket. You are the sole guest here.",
	"CAR": "The hood of the car creaks open and you take stock. 
	\nThere are parts missing, cables unhooked and yawning, previously-occupied spaces. After a brief survey of the damage you note that you are missing: 
	\nthe BATTERY, 
	\na PISTON, 
	\na SPARK PLUG, 
	\nthe ALTERNATOR, 
	\nand, though you left the car unlocked, you are missing your CAR KEYS",
	"HOTEL": "It is a borderline dangerous-looking building far more tall than it is wide. You can see your room way up on the fourth floor and the light you left on.",
	"ROAD": "Its a normal asphalt road.",
	"GREEN": "The green could have been a refreshing splash of color in the square if not for the brown knee-high overgrown weeds. 'Green' may have been generous.",
	"STATUE": "A larger-than-life statue that once-upon-a-time stood proudly in the center of town to welcome newcomers and inspire locals. Now the face has been smoothed to a flat round ball. Newer carvings stand out crudely on the white material: they almost look like an attempted likeness of scales.",
	"BENCH": "Its a large bench like that in a government office. There are three chairs tucked neatly in behind the bench.",
	"PARCHMENT": "Only a fragment of these papers is legible but you can make out: 'Petition to exile d-' Then it cuts off.",
	"CHAIRS": "There are three rows of cheap folding chairs in concentric circles. A few of the chairs have been knocked over. You do note that the chairs are not as dusty as the rest of the buildings you have seen.",
	"DISPLAY CASE": "Inside is an amulet of strange, unearthly splendor: swirling nautical carvings surround oppulent cerulean gems. The carvings are near-unintelligible, though with a curiously disturbing element you can't quite put your finger on.",
	"CARD CATALOG": "You roll open the first drawer and start leafing through. After a few minutes of browsing you see that an entire drawer has been dedicated to 'Legends of the Sea' or so the label tells you. Another drawer is labeled 'Occult'.",
	"BOOKS": "There are three books left on the table. 'The Other Gods', 'The Nameless City', 'A History of _____",
	"A HISTORY": "You read: \n\n'____ was founded in 1685. Notable for its shipbuilding and the riots of 1838, the town became extremely superstitious and closed off from the rest of the world.'",
	"THE OTHER GODS": "Much of the tome is illegibile but after flipping through some pages you find something you can make out: \n\n'Then suddenly I saw it. With only a slight churning to mark its rise to the surface, the thing slid into view above the dark waters. Vast, Polyphemus-like, and loathsome, it darted like a stupendous monster of nightmares to the monolith, about which it flung its gigantic scaly arms, the while it bowed its hideous head and gave vent to certain measured sounds. I think I went mad then.'",
	"THE NAMELESS CITY": "It begins: \n\n'When I drew nigh the Nameless City I knew it was accursed. I was travelling in a parched and terrible valley under the moon, and afar I saw it protruding uncannily above the sands as parts of a corpse may protrude from an ill-made grave.' \n\nThen you cannot make out any more.",
	"SHELVES": "The shelves are tightly packed with books of all shapes, sizes, colors, and languages. It is a truly astounding collection for such a small town.",
	"AISLES": "The aisles hold squat racks of packaging and cardboard mostly. There is not much left on them otherwise.",
	"PACKAGING": "The packaging reveals that just about everything that was on the shelf was food and all of it is gone. You see twinkie wrappers, meat packaging, dry pasta containers, empty milk cartons...",
	"SALT": "The salt appears to be the only untouched good. There are rows upon rows of cylindrical containers on the otherwise empty shelves.",	
	"MAN": "The man looks half-alive. You notice that he has a large bald spot on the left side of his head. You can see his scalp. His clothes are wet and dripping steadily onto the linoleum floor. You nod at him awkwardly and he stares blankly through you.",
	"PHOTOGRAPH": "It looks to be a picture of the gorge running through town. As you look closely you can see what look like tiny dark figures along the bank of the river at the base of the gorge.",
	"KEYPAD": "The keypad has the number 0-9, # and *. Enter a code.",
	"SAFE": "It seems to be an ordinary safe",
	"SEATS": "The chairs seem like they would be comfortable. Wonder why they are knocked over?",
	"INSTRUMENTS": "The array appears to be comprehensive. You see forceps, a bone saw, syringes, pliers, even a bottle of chloroform. Unlike the sterility of the rest of the objets there is also a crumpled piece of paper.",
	"CRUMPLED PAPER": "You uncrumple the ball of paper to find chicken-scratch notes, most of which make no sense to you. Scrawled in the top corner you see the number 4798.",
	"CART": "It is a metal rolling cart with a bar for a hand towel to hang.",
	"SHEET": "It is stained and rumpled. Gross.",
	"CARD TABLE": "It is a normal folding table, one you would be more likely to imagine playing a game at rather than lying down on.",
	"GORGE": "The gorge is far far below you, but you can see rushing water churning and the roar reaches you even here.",
	"BRIDGE": "It is a sturdy bridge with a steep drop to nothing below.",
	"ROUNDABOUT": "In the center of the roundabout is a cluster of weeds and a pile of miscellaneous garbage. In another time it would've been a nice little neighborhood.",
	"MAILBOXES": "The mailboxes are stuffed with unopeened mail. Except for the one in front of the mansion, which has been recently emptied and freshly painted.",
	"HOUSES": "There are a smattering of inhabited houses with rags stuffed in broken windows and dead fish lying in their yards, but the majority of homes were apparently deserted with occasional gaps where tumbledown chimneys and cellar walls told of buildings that had collapsed.",
	"TWIN SIZED BED": "It looks a little rumpled as though someone has used it in the past few days.",
	"BROWN WATER": "You can only imagine the use of such murky water by the bed.",
	"HAY": "They tried to soften the hard floor. Doesn't help much.",
	"DESK": "There are no drawers but on the top are dark, angry swirls of the black ink. Nothing else sits on the desk.",
	"WALLS": "The walls are so tangled with symbols that it is hard to even pick out a single image. But with some study under the flickering light above you, grotesque, otherworldly forms twist and writhe to the forefront.",
	"GROUND": "Below your feet are more etchings, you can feel the deep grooves through the soles of your shoes. Someone has obsessively carved each lines over and over and over.",
	"CEILING": "Above you is just a mass of tentacles, overlapping and interweaving. You feel them reaching for you and the ceiling feels as though is is sinking towards you. But, no. It just the all-consuming madness of the artistry. Its enveloping.",
	"SYMBOLS": "You see waves and creatures. Tentacles reaching and wrapping and horrors tugging at the sails of crudely drawn ships. You see madness carved into these surfaces, though the artists madness or your own you are not sure.",
	"DRAPERIES": "The curtains obscure much of the walls, creating a tent-like atmosphere of silky luxury.",
	"STAIRCASE": "It truly is a grand staircase. The marble steps contain swirls of their natural beauty, clearly only the highest quality of building materials.",
	"BANISTER": "You can see yourself in the shiny wood. You are looking tired.",
	"BEDDING": "The bed is neatly made with layers and layers of plush blankets and silk sheets. The pillows are fluffed and make you think back to your own yellow, stained pillow missing its case in your hotel room.",
	"FURNITURE": "The edges of everything in the room sparkles with gold. Not just an outer coating of it too, but fully made of an impossible amount of gold. Even with the low light in the room it is semi-blinding.",
	"DRAPES": "They are so thick and heavy that they black out all of the light the window is letting in. Only a thin shaft makes it through, striping across the floor in front of you.",
	"SINKS": "The sinks are wide and deep. As you approach, though, you see they are filled with water and dishes, bubbles still drifting on the surface. Was someone just here?",
	"HOOKS": "The kitchen walls are near-packed with hooks and shelves. It has a very busy eclectic feel, very different from the rest of the mansion..",
	"CURIOSITIES": "You see bundles of basil and thyme, of course. But you also see knots of purple weeds and glistening yellow bulbs oozing substances into a puddle on the ground.",
	"PURPLE WEEDS": "They are thin spindles with miniscule violet thorns covering every surface",
	"YELLOW BULBS": "They are oblong and yellow with a tiny sprout at the top.",
	"WINDOWS": "They are boarded up.",
	"BEAMS": "They seem to droop under the weight of the building.",
	"FLOOR": "The dirt looks as though someone has disturbed it and then packed it back down tight.",
	"PACKED EARTH": "The dirt looks as though someone has disturbed it and then packed it back down tight.",
	"TRAP DOOR" : "After displacing much of the earth from the floor you reveal a trap door. You heave it open and peer down into a black abyss.
	\nDOWN is the dark opening",
	"PEWS": "The pews are covered with an extremely thick layer of dust. As you walk by them though, some of that dust kicks into the air and you cough.",
	"STAINED GLASS": "Strangely, the imagery does not seem to be typically religious. These windows look extremely old but they also bare similar themes to those you have seen about town. There is water and marble buildings. Tenctacles. Hideous creatures. You look away.",
	"HYMNALS": "They are illegible.",
	"VIALS": "Within the vials you can see bugs and small creatures, some from land critters and some aquatic ones.",
	"FLASKS": "Dark yellow and brown liquid fills the flasks. You pick one up and swirl it around. Thick sediment shifts on the bottom revealing a black blob that expands and contracts with the movement of the liquid.",
	"LABELS": "They are so worn with age you cant read any text. The sticky residue remains is all that remains.",
	"SPECIMENS": "Disturbing chunks float around in the largest vials. From your limited knowledge you are able to recognize organs: a small brain, a heart, a stomach, some objects that look uncomfortably like human fingers.",
	"OBJECTS": "They are disgusting, whatever they are.",
	"TOMBSTONES": "The tombstones are laid out in an unorganized smattering. Many of them are blank, merely marking the presence of a grave, not identifying the person within.",
	"MOUNDS": "The ground around some of the headstones is darker than the rest of the earth and raised, as though a freshly-filled grave. Or freshly disturbed.",
	"SHALLOW GRAVE": "You sink to your knees and dig with your hands, dirt worming its way under your fingertips. It doesnt take long for you to brush against something hard. With a little more effort you reveal a pile of bones. Yes, a pile. These were already bones when tossed into this hole and covered.",
	"BONES": "They are surprisingly white. You don't know if that means they are very very old or very very fresh...Either way you can see deep gouges along a lot of them.",
	"RICKETY BRIDGE": "I wouldnt stand here for too long...",
	"BRANCHES": "The leaves are thick and the branches are sharp but your skin is mostly covered so it mostly just feels tight.",
	"RIVER": "It is so loud here you cant think. There is a river.",
	"BRICKS": "You notice one brick sticking out from the wall more than the others. You jiggle it free with your fingers and it slides out, revealing a very narrow pocket with a silver key.",
	"SPIRAL STAIRCASE": "The stairs ascend in a dizzying helix, a thicker core pole in the center of them supporting the majority of the weight.",
	"COT": "The cot has been made up, though I wouldn't say it looks very comfortable.",
	"WRITING DESK": "You approach the desk and see a leather-bound diary. It looks old but when you flip through its pages the ink is still dark.",
	"DIARY": "You open the diary and begin scanning the first page. What you glean can only be described as the ravings of a madman: \n" + FileAccess.open("res://main/diary.txt", FileAccess.READ).get_as_text(),
	"LAMP": "The light from the lamp is warm and gentle. It is the only light in the room and fills it with a cozy glow.",
	"WIRE LAMP": "The light from the lamp is warm and gentle. It is the only light in the room and fills it with a cozy glow.",
	"CABINET": "The cabinet has double doors. You pull them both open and can see two sets of the same blue overalls, a green long-sleeved shirt. At the bottom of the cabinet is a set of galoshes and hung on a hook on the door is a yellow bucket hat.",
	"SHIRT": "It is a well-made forest green shirt. Looks warm.",
	"OVERALLS": "They are working clothes. The knees and elbows have been covered with patches and multicolored threads have been used to patch up various sections.",
	"BUCKET HAT": "The hat has a rain-slicking texture. Good for someone who has to brave the elements.",
	"GALOSHES": "They're too big for you.",
	"FOOTPRINTS": "The footprints seem to all be from one pair of boots. Most likely our mysterious lighthouse keeper.",
	"BEACON LAMP": "Inside the lamp you can just see a large bulb, though the outer glass of the lamp is gone but for jagged pieces around the edge.",
	"GLASS": "The glass catches what light there still is in the sky and sparkles. It crunches under your feet as you maneuver around the small enclosure.",
	"CHAIN": "The chain has been snapped.",
	"CROSS": "The chain has been snapped.",
	"PILINGS": "They are covered in sea life, mostly hard-shelled creatures hanging on for dear life.",
	"WATER": "The water is rough. The dark depths unnerve you more than you would have expected and in the distance you can see white capping the peaks of the waves.",
	"ROWBOAT": "From what you can tell this far away it is a very small row boat. Likely a grown adult's knees would be zipped together to even fit. It is far too small for the roughness of the water.",
	"SEAWEED": "It looks nasty.",
	"BONFIRE": "It must've been an absolutely massive fire. The sheer size of the aftermath points to the largest fire you would have ever seen.",
	"ASH": "It is ash. An educated guess suggests it came from the bonfire.",
	"STONES": "The stones are smooth and round. Completely smooth and round like a large hip-height ball. When you run your hands across the surface of one it feels almost silky soft.",
	"CARVINGS": "The carvings sear themselves into your brain. When you close your eyes you still see them. They are carved with confident, elegant swoops as though painted onto the stones, though the gashes are inches deep.",
	"ICHOR": "You can only imagine what the reddish substance could be. When you touch it, dark reddish-brown flakes come off on your fingers.",
	"CAVERN": "Its too dark to see much of anything past your hand in front of your face.",
	"ENGRAVINGS": "The symbols seem to squirm with an alien life of their own. Each stroke tells of cosmic entities and ancient rituals beyond mortal comprehension. You clutch your head. It hurts to look at them.",
	"CANDLES": "The candles flicker with an otherworldly light. They seem to be glowing rather than burning.",
	"ALTAR": "It is an unholy monolith, bearing sigils that seem to writhe and shift in the dim, ethereal light",
	"TREE": "The tree is tall and full of leaves, shading the graves beneath it."
}

var static_object_location = {
	"BED": "ROOM 428",
	"BULB": "ROOM 428",
	"PILLOW": "ROOM 428",
	"WIRES": "ROOM 428",
	"MARBLE BOWL": "BATHROOM",
	"TUB": "BATHROOM",
	"WINDOW": "BATHROOM",
	"CARPET": "HOTEL LOBBY",
	"WALLPAPER": "HOTEL LOBBY",
	"CONCIERGE DESK": "HOTEL LOBBY",
	"KEYS": "HOTEL LOBBY",
	"CAR": "WEST OF HOTEL",
	"HOTEL": "WEST OF HOTEL",
	"ROAD": "MAIN ROAD",
	"GREEN": "TOWN SQUARE",
	"STATUE": "TOWN SQUARE",
	"BENCH": "CITY HALL",
	"PARCHMENT": "CITY HALL",
	"DISPLAY CASE": "CITY HALL",
	"CHAIRS": "CITY HALL",
	"CARD CATALOG": "LIBRARY",
	"BOOKS": "LIBRARY",
	"THE OTHER GODS": "LIBRARY",
	"THE NAMELESS CITY": "LIBRARY",
	"A HISTORY": "LIBRARY",
	"SHELVES": "LIBRARY",
	"AISLES": "STORE",
	"SALT": "STORE",
	"PACKAGING": "STORE",
	"MAN": "STORE",
	"PHOTOGRAPH": "DR OFFICE",
	"KEYPAD": "DR OFFICE",
	"SAFE": "DR OFFICE",
	"SEATS": "DR OFFICE",
	"INSTRUMENTS": "DARK HALL",
	"CART": "DARK HALL",
	"CARD TABLE": "DARK HALL",
	"SHEET": "DARK HALL",
	"CRUMPLED PAPER": "DARK HALL",
	"GORGE": "HOUSING BRIDGE",
	"BRIDGE": "HOUSING BRIDGE",
	"ROUNDABOUT": "HOUSING DISTRICT",
	"MAILBOXES": "HOUSING DISTRCIT",
	"HOUSES": "HOUSING DISTRICT",
	"TWIN SIZED BED": "HOUSE",
	"BROWN WATER": "HOUSE",
	"HAY": "HOUSE",
	"DESK": "HOUSE",
	"WALLS": "HOUSE",
	"GROUND": "HOUSE",
	"CEILING": "HOUSE",
	"SYMBOLS": "HOUSE",
	"DRAPERIES": "MANSION",
	"STAIRCASE": "MANSION",
	"BANISTER": "UPSTAIRS",
	"BEDDING": "BEDROOM",
	"FURNITURE": "BEDROOM",
	"DRAPES": "BEDROOM",
	"SINKS": "KITCHEN",
	"HOOKS": "KITCHEN",
	"PURPLE WEEDS": "KITCHEN",
	"YELLOW BULBS": "KITCHEN",
	"CURIOSITIES": "KITCHEN",
	"WINDOWS": "HOVEL",
	"BEAMS": "HOVEL",
	"FLOOR": "HOVEL",
	"TRAP DOOR": "HOVEL",
	"PACKED EARTH": "HOVEL",
	"PEWS": "OLD CHURCH",
	"STAINED GLASS": "OLD CHURCH",
	"HYMNALS": "OLD CHURCH",
	"VIALS": "CHURCH SANCTUARY",
	"FLASKS": "CHURCH SANCTUARY",
	"LABELS": "CHURCH SANCTUARY",
	"SPECIMENS": "CHURCH SANCTUARY",
	"OBJECTS": "CHURCH SANCTUARY",
	"TOMBSTONES": "GRAVEYARD",
	"MOUNDS": "GRAVEYARD",
	"BONES": "GRAVEYARD",
	"TREE": "GRAVEYARD",
	"RICKETY BRIDGE": "OLD BRIDGE",
	"BRANCHES":"SMALL PATH",
	"RIVER": "RIVER EDGE",
	"BRICKS": "LIGHTHOUSE",
	"SPIRAL STAIRCASE": "LIGHTHOUSE",
	"COT": "LIGHTHOUSE",
	"WRITING DESK": "LIGHTHOUSE",
	"LAMP": "LIGHTHOUSE",
	"WIRE LAMP": "LIGHTHOUSE",
	"CABINET": "LIGHTHOUSE",
	"FOOTPRINTS": "LIGHTHOUSE",
	"DIARY": "LIGHTHOUSE",
	"SHIRT": "LIGHTHOUSE",
	"OVERALLS": "LIGHTHOUSE",
	"BUCKET HAT": "LIGHTHOUSE",
	"GALOSHES": "LIGHTHOUSE",
	"BEACON LAMP": "TOP OF LIGHTHOUSE",
	"GLASS": "TOP OF LIGHTHOUSE",
	"CHAIN": "TOP OF LIGHTHOUSE",
	"CROSS": "TOP OF LIGHTHOUSE",
	"PILINGS": "DOCKS",
	"WATER": "DOCKS",
	"ROWBOAT": "DOCKS",
	"SEAWEED": "BEACH",
	"BONFIRE": "SOUTH BEACH",
	"ASH": "SOUTH BEACH",
	"STONES": "SOUTH BEACH",
	"CARVINGS": "SOUTH BEACH",
	"ICHOR": "SOUTH BEACH",
	"CAVERN": "CAVES",
	"CANDLES": "TEMPLE",
	"ENGRAVINGS": "TEMPLE",
	"ALTAR": "TEMPLE"
}

var dig = {
	"GRAVEYARD": "SHALLOW GRAVE",
	"HOVEL": "TRAP DOOR"
}
var sanity_loss = {
	"KEYS": 3,
	"CAR": 10,
	"PARCHMENT": 3,
	"STATUE": 5,
	"DISPLAY CASE": 10,
	"MAN": 2,
	"PHOTOGRAPH": 3,
	"INSTRUMENTS": 7,
	"SYMBOLS": 10,
	"STAINED GLASS": 3,
	"CARVINGS": 5,
	"ENGRAVINGS": 5,
	"ALTAR": 5,
	"WINDOW": -3,
	"A HISTORY": -4,
	"BUCKET HAT": -5
}

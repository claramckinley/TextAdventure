extends Node

var examine = {
	"HOTEL": "this is the hotel",
	"CHURCH": "this is the church",
	"STORE": "this is the general store",
	"LIGHTHOUSE": "this is a lighthouse",
	"BRIDGE": "this is a bridge",
	"HOUSE": "this is someones house"
}

var blockers = {
	"STORE" = "KEY"
}

var north = {
	"HOTEL": "CHURCH"
}

var east = {
	"STORE": "HOTEL"
}

var south = {
	"CHURCH": "HOTEL"
}

var west = {
	"CHURCH": "STORE"
}

var northeast = {
}

var northwest = {
}

var southeast = {
}

var southwest = {
}

var up = {
}

var down = {
}

var cross = {
}

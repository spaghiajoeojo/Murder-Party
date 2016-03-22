
extends "db_item.gd"

# member variables here, example:
# var a=2
# var b="textvar"
export(String) var corresponding
export(String, "digit", "proof", "gun") var type

var inserted = false

func _ready():
	# Initialization here
	connect("visibility_changed",self,"insert")
	
func insert():
	inserted = true
	get_parent().get_node(type+corresponding).in_database = true



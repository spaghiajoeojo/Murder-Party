
extends "db_item.gd"

# member variables here, example:
# var a=2
# var b="textvar"

export(bool) var in_database = false

func _ready():
	# Initialization here
	connect("visibility_changed",self,"show_info")
	
func show_info():
	if(not in_database):
		self.set("visibility/visible", false)
		get_parent().get_node("search_error").show()
	



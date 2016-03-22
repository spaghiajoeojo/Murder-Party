
extends WindowDialog

# member variables here, example:
# var a=2
# var b="textvar"


func _ready():
	# Initialization here
	var name = get_name()
	var code = name.substr(name.length()-5,5)
	set_title(code+" - Evidence")
	set_process(true)
	self.connect("visibility_changed",self,"block_buttons")
	
func block_buttons():
	get_parent().get_parent().get_node("main_buttons/Button").set_disabled(get("visibility/visible"))
	get_parent().get_parent().get_node("main_buttons/Button1").set_disabled(get("visibility/visible"))
	get_parent().get_parent().get_node("main_buttons/Button2").set_disabled(get("visibility/visible"))
	get_parent().get_parent().get_node("to_desktop").set_disabled(get("visibility/visible"))
	
	
func _process(delta):
	if(get_system().db == null):
		return
	
	get_system().db[self.get_name()] = self
	set_process(false)

func get_system():
	return get_node("../..")

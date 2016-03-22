
extends WindowDialog

# member variables here, example:
# var a=2
# var b="textvar"

export(bool) var protected = true
export(String) var password

func _ready():
	# Initialization here
	connect("visibility_changed",self,"on_open_app")
	get_node("login").password = password
	
func clear_viewer():
	get_node("email_list/VBoxContainer").set("visibility/visible",false)
	get_node("email_viewer/VBoxContainer").set("visibility/visible",false)
	
func show_content():
	get_node("email_list/VBoxContainer").set("visibility/visible",true)
	get_node("email_viewer/VBoxContainer").set("visibility/visible",true)
	
func on_open_app():
	clear_viewer()
	if(get("visibility/visible")==true):
		if(protected):
			get_node("login").show()
			get_node("login/TextEdit").grab_focus()
		else:
			show_content()
	else:
		get_node("login").hide()



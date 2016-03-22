
extends Button

# member variables here, example:
# var a=2
# var b="textvar"
export(String) var from
export(String) var to
export(String) var subject
export(String, MULTILINE) var message

func _ready():
	# Initialization here
	connect("pressed",self,"selected")
	set_text(from)
	get_parent().get_node("HBoxContainer/email_number").add_email()
	
func selected():
	get_parent().get_parent().get_parent().get_node("email_viewer/VBoxContainer/HBoxContainer/from").set_text("FROM: "+from)
	get_parent().get_parent().get_parent().get_node("email_viewer/VBoxContainer/HBoxContainer/to").set_text("TO: "+to)
	get_parent().get_parent().get_parent().get_node("email_viewer/VBoxContainer/subject").set_text("SUBJECT: "+subject)
	get_parent().get_parent().get_parent().get_node("email_viewer/VBoxContainer/message").set_text(message)



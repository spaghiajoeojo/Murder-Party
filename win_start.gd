
extends Button

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	connect("pressed",self,"_on_pressed")
	
func _on_pressed():
	get_node("TextureFrame").set("visibility/visible", true)
	set_process_input(true)
	
func _input(event):
	if(event.type==InputEvent.MOUSE_BUTTON and event.button_index == BUTTON_LEFT):
		get_node("TextureFrame").set("visibility/visible", false)
		set_process_input(false)



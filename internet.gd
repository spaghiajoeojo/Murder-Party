
extends TextureButton

# member variables here, example:
# var a=2
# var b="textvar"

var timer


func _ready():
	# Initialization here
	timer = get_node("Timer")
	connect("pressed",self,"play")
	timer.set_wait_time(17)
	print(timer.get_wait_time())
	timer.connect("timeout", self, "popup")
	
func play():
	if(not get_node("internet").is_active()):
		get_node("internet").play("modem")
		timer.start()
		
	
		
		
func popup():
	var popup = get_parent().get_parent().get_parent().get_node("network_error")
	#popup.set_global_pos(Vector2(650,350))
	popup.show()
	print("mammt")
	




extends Label

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Initialization here
	set_process(true)
	
func _process(delta):
	var t = OS.get_time()
	var minute = t["minute"]
	var second = t["second"]
	if(minute<10):
		minute = "0"+str(minute)
	if(second<10):
		second = "0"+str(second)
	set_text(str(t["hour"],":",minute,":",second))



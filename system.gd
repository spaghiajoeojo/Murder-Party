
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var popup

var input_text

var timer = Timer.new()


var type = "proof"
var cod = ""

var db = Dictionary()

func _ready():
	# Initialization here
	add_child(timer)
	timer.set_wait_time(1)
	timer.connect("timeout", self, "default_font_color")
	popup = get_node("code_window")
	input_text = get_node("code_window/form")
	set_process(true)
	
func default_font_color():
	input_text.set("custom_colors/font_color", Color(1,1,1))
	
	
	
func _process(delta):
	
	if(Input.is_action_pressed("ui_accept") and input_text.has_focus()):
		_on_Search_pressed()




func _on_Button_pressed():
	type = "proof"
	popup.show()
	input_text.grab_focus()


func _on_Search_pressed():
	cod = input_text.get_text().to_lower()
	
	var found = false
	for k in db.keys():
		if(type+"-"+cod==k):
			found = true
	
	if(not found):
		input_text.set("custom_colors/font_color", Color(1,0,0))
		if(not get_node("gui_sound").is_active()):
			get_node("gui_sound").play("error")
			timer.start()
	else:
		if(type=="proof" or type=="gun"):
			#print("showing proof")
			input_text.set("custom_colors/font_color", Color(0,1,0))
			get_node("Loading/AnimationPlayer").play("load")
		elif(type=="digit"):
			#print("showing digit")
			input_text.set("custom_colors/font_color", Color(0,0,1))
			get_node("search_digit/AnimationPlayer").play("searching")
		if(not get_node("gui_sound").is_active()):
			get_node("gui_sound").play("ok")
	
	


func _on_Button1_pressed():
	type = "digit"
	popup.show()
	input_text.grab_focus()


func _on_WindowDialog_hide():
	default_font_color()
	input_text.set_text("")
	open_data()


func _on_to_desktop_pressed():
	self.hide()

func open_data():
	print(type+"-"+cod)
	for k in db.keys():
		if(type+"-"+cod==k):
			db[type+"-"+cod].show()


func _on_Button2_pressed():
	type = "gun"
	popup.show()
	input_text.grab_focus()

extends Node

var  label = RichTextLabel
var time = Timer
@export var Short : Color
@export var OgColor : Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $RichTextLabel
	time = $Timer
	OgColorRet()
	time.start()
	
func _process(delta):
	update_label_text()
	if time.time_left <= 10:
		label.modulate = Short
	else:
		OgColorRet()
		
func OgColorRet():
	label.modulate = OgColor
		
func update_label_text():
	label.text = str(ceil(time.time_left))

func _on_timer_timeout() -> void:
	print("Done")

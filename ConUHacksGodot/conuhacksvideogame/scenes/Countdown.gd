extends Node

var  label = RichTextLabel
var time = Timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label = $RichTextLabel
	time = $Timer
	
	time.start()
	
func _process(delta):
	update_label_text()

func update_label_text():
	label.text = str(ceil(time.time_left))

func _on_timer_timeout() -> void:
	print("Done")

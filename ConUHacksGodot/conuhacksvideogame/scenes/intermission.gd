extends Control

var  countdown_label = RichTextLabel
var time = Timer
@export var OgColor : Color

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	countdown_label = $RichTextLabel
	time = $Timer
	time.start()
	
func _process(_delta):
	update_label_text()
	if time.time_left <= 0:
		get_tree().change_scene_to_file("res://round.tscn")
		
func update_label_text():
	countdown_label.text = str(ceil(time.time_left))

func _on_timer_timeout() -> void:
	print("Done")

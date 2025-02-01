extends Control

var tips_array: Array[String] = [
	"[center] Tip: Don't Die! [/center]", 
	"[center] Tip: Press the Shoot Button to Shoot! [/center]",
	"[center] Tip: Pressing the Quit Button does not start the game... [/center]",
	"[center] Tip: Every round is only 40 seconds long so get your opponent quickly! [/center]"
	]
@onready var tip_text: RichTextLabel = $TipText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Main Menu Running...")
	make_random_tip()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func make_random_tip():
	var chosen_tip = randf_range(0, tips_array.size()) #randf_range takes a RANDOM NUMBER between a given min and max value
	#.size() is the length of the array
	tip_text.text = tips_array[chosen_tip]

func _on_start_button_button_down() -> void: #when start button is pressed
	get_tree().change_scene_to_file("res://scenes/Test1.tscn")
	print("Start Button Pressed...")
	


func _on_quit_button_button_down() -> void: #when quit button is pressed
	get_tree().quit() #quits the game lol

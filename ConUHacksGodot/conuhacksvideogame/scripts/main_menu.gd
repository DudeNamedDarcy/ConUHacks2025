extends Control

var tips_array: Array[String] = [
	"[center] Tip: Don't Die! [/center]", 
	"[center] Tip: Press the Place Turret Button to Place A Deady Turret! [/center]",
	"[center] Tip: Pressing the Quit Button does not start the game... [/center]",
	"[center] Tip: This Game basically devolved into a bullet hell. Have fun! [/center]",
	"[center] Tip: Pressing the Y key does absolutely nothing! [/center]",
	"[center] Tip: Both YOUR turret and the enemy's turret can damage you! Watch out for all bullets! [/center]"
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
	get_tree().change_scene_to_file("res://scenes/start_up_menu.tscn")
	print("Start Button Pressed...")
	


func _on_quit_button_button_down() -> void: #when quit button is pressed
	get_tree().quit() #quits the game lol

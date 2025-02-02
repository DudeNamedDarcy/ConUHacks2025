extends Control

@onready var winner_player : Label = $Label2
@onready var who_won_text: RichTextLabel = $"Who Won Text"
@onready var p1: AnimatedSprite2D = $P1
@onready var p2: AnimatedSprite2D = $P2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Global.player_one_won)
	print(Global.player_two_won)
	Global.in_startup = false
	$P1.visible = false
	$P2.visible = false
	declare_winner()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("player1DOWN"):
			Global.player_one_won = true

func declare_winner():
	if (Global.player_one_won == 10):
		who_won_text.text = "[center] Player 1 Won! [/center]"
		$P1.visible = true
	if (Global.player_two_won == 10):
		who_won_text.text = "[center] Player 2 Won! [/center]"
		$P2.visible = true
		


func _on_play_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/intermission.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
	

extends Node2D

@export var total_rounds = 0
@export var player_one_rounds = 0
@export var player_two_rounds = 0
 
@onready var player_one_score: Node2D = $score1
@onready var player_two_score: Node2D = $score2

@onready var player_one_rounds_text: RichTextLabel = $UILayer/UI_Control/PlayerOneRoundsText
@onready var player_two_rounds_text: RichTextLabel = $UILayer/UI_Control/PlayerTwoRoundsText

############################# DELETE IF DOESNT WORK
@onready var player_one_score_text: RichTextLabel = $UILayer/UI_Control/PlayerOneScoreText
@onready var player_two_score_text: RichTextLabel = $UILayer/UI_Control/PlayerTwoScoreText
##############################

@onready var player_1: CharacterBody2D = $player1
@onready var player_2: CharacterBody2D = $player2

@onready var round_wait_timer: Timer = $RoundWaitTimer

@onready var HP: Node2D = $Health1

signal SetUpRound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.in_startup = false
	set_up_for_round()
	player_one_rounds_text.text = "Player 1 Rounds Won: 0" ######################
	player_two_rounds_text.text = "Player 2 Rounds Won: 0" ######################
	player_one_score_text.text = "Score: 0" ######################
	player_two_score_text.text = "Score: 0" ######################
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	HP._ready()
	HP._process(0.0)

func set_up_for_round():
	player_1.position = Vector2(300, 200)
	player_2.position = Vector2(900, 500)
	emit_signal("SetUpRound")

func player_one_round_won():
	set_up_for_round()
	player_one_rounds += 1
	if (player_one_rounds >= 5):
		player_one_rounds_text.text = "Player 1 Won!!!"
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		#player_one_score.addtoScore1()
	else:
		player_one_rounds_text.text = "Player 1 Rounds Won: " + str(player_one_rounds) #str() turns integer into a String	
		#Global.player_one_score._addtoScore1() ####################################################
		player_one_score_text.text = "Score: "+ str(player_one_score)

func player_two_round_won():
	set_up_for_round()
	player_two_rounds += 1
	if (player_two_rounds >= 5):
		player_two_rounds_text.text = "Player 2 Won!!!"
		get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		#player_two_rounds_text.text = "Player 2 Won!!!"
		#Global.player_two_score._addtoScore2() #########################################################
	else:
		player_two_rounds_text.text = "Player 2 Rounds Won: " + str(player_two_rounds) #str() turns integer into a String
		player_two_score_text.text = "Score: "+ str(player_one_score)

func _on_player_1_player_one_dead() -> void:
	player_two_round_won()


func _on_player_2_player_two_dead() -> void:
	player_one_round_won()


func _on_player_two_dead() -> void:
	pass # Replace with function body.
	
	

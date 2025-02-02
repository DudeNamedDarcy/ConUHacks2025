extends Node2D

@export var total_rounds = 0
@export var player_one_rounds = 0
@export var player_two_rounds = 0
 
@onready var player_one_score: Node2D = $score1
@onready var player_two_score: Node2D = $score2

@onready var player_one_rounds_text: RichTextLabel = $UILayer/UI_Control/PlayerOneRoundsText
@onready var player_two_rounds_text: RichTextLabel = $UILayer/UI_Control/PlayerTwoRoundsText

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_one_rounds_text.text = "Player 1: 0"
	player_two_rounds_text.text = "Player 2: 0"
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		player_one_round_won()


func player_one_round_won():
	player_one_rounds += 1
	print(player_one_rounds)
	if (player_one_rounds >= 5):
		print("Player One Won!")
		player_one_rounds_text.text = "Player 1 Won!!!"
		player_one_score.addtoScore1()
		
	else:
		player_one_rounds_text.text = "Player 1 Rounds Won: " + str(player_one_rounds) #str() turns integer into a String
		if (player_one_rounds % 2 == 0):
			player_two_round_won()
	
func player_two_round_won():
	player_two_rounds += 1
	if (player_two_rounds >= 5):
		print("Player Two Won!")
		player_two_rounds_text.text = "Player 2 Won!!!"
		player_two_score.addtoScore2()
	else:
		player_two_rounds_text.text = "Player 2 Rounds Won: " + str(player_two_rounds) #str() turns integer into a String

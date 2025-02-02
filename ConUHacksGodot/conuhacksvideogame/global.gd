extends Node

const NUMBER_OF_ROUNDS = 5
# const BIGGEST_POSSIBLE_SCORE = 5 * 200

var round_count = 0
var p1_score = 0
var p2_score = 0

var player1_win = false
var player2_win = false

var winner_player = ""

var player_one_health = 100
var player_two_health = 100

var player_one_won = 0
var player_two_won = 0

var in_startup = false


# var p1_health = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _set_p1_score(score):
	p1_score = score
	
func _set_p2_score(score):
	p2_score = score
	
func _get_p1_score():
	return p1_score
	
func _get_p2_score():
	return p2_score

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(round_count == NUMBER_OF_ROUNDS):
		if(p1_score > p2_score):
			winner_player = "Player 1"
		else:
			winner_player = "Player 2"
		
func _addtoScore1():
	p1_score += 200
	
func _addtoScore2():
	p2_score += 200

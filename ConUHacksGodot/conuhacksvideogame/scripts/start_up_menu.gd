extends Node2D


@onready var p_1_ready_text: RichTextLabel = $CanvasLayer/Player1SetUpText/P1ReadyText
@onready var p_2_ready_text: RichTextLabel = $CanvasLayer/Player2SetUpText/P2ReadyText
@onready var countdown_timer: Timer = $CountdownTimer

var player_one_ready = false
var player_two_ready = false
var are_both_players_ready = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	p_1_ready_text.hide()
	p_2_ready_text.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	check_if_both_are_ready()
	if (are_both_players_ready == true):
		get_tree().change_scene_to_file("res://scenes/intermission.tscn")

	if Input.is_action_just_pressed("player1SHOOT"):
		player_one_ready = true
		p_1_ready_text.show()

	if Input.is_action_just_pressed("player2SHOOT"):
		player_two_ready = true
		p_2_ready_text.show()

func check_if_both_are_ready():
	if (player_one_ready && player_two_ready):
		are_both_players_ready = true

func _on_countdown_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

extends CharacterBody2D

@export var move_speed: float = 250

#health stuff
var this_player_two_health = 100
var max_health = 100

@onready var turret = preload("res://scenes/player_2_turret.tscn")
@onready var main = get_tree().get_root().get_node(".") #gets the top node of the level as a variable
@onready var placing_turret_timer: Timer = $"Placing Turret Timer"


var allowed_to_place = true

signal PlayerTwoDead

func _ready() -> void:
	this_player_two_health = max_health

func _physics_process(_delta):
	this_player_two_health = Global.player_two_health
	var input_direction = Vector2(
		Input.get_action_strength("player2RIGHT") - Input.get_action_strength("player2LEFT"),
		Input.get_action_strength("player2DOWN") - Input.get_action_strength("player2UP"))
	#var prev = Vector2(input_direction)
	
	velocity = input_direction * move_speed  # Use the built-in velocity property
	rotation = velocity.angle()
	move_and_slide()
	
	#if input_direction == Vector2(0,0) and prev != Vector2(0,0):
		#$Sprite2D.look_at(Vector2())
		#prev = Vector2(0,0)
	#
	if Input.is_action_just_pressed("player2SHOOT"):
		if (allowed_to_place == true):
			place_turret()
		else:
			pass

	if (this_player_two_health < 10):
		player_two_death()

func place_turret():
	allowed_to_place = false
	#placing_turret_timer.start()
	var turret_instance = turret.instantiate() #creates a clone of the turret
	turret_instance.position = position #makes the position of the turret the same as the player
	main.add_child.call_deferred(turret_instance) # makes the turret a child of the level, not the child, so it doesn't move with the player

func player_two_death():
	emit_signal("PlayerTwoDead")

func _on_round_set_up_round() -> void:
	Global.player_two_health = 100


func _on_placing_turret_timer_timeout() -> void:
	allowed_to_place = true


func _on_player_two_dead() -> void:
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

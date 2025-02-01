extends CharacterBody2D

@export var move_speed: float = 100

@onready var turret = preload("res://scenes/player_2_turret.tscn")
@onready var main = get_tree().get_root().get_node(".") #gets the top node of the level as a variable

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("player2RIGHT") - Input.get_action_strength("player2LEFT"),
		Input.get_action_strength("player2DOWN") - Input.get_action_strength("player2UP")
	)

	velocity = input_direction * move_speed  # Use the built-in velocity property
	
	move_and_slide()
	
	if Input.is_action_just_pressed("player2SHOOT"):
		place_turret()

func place_turret():
	var turret_instance = turret.instantiate() #creates a clone of the turret
	turret_instance.position = position #makes the position of the turret the same as the player
	main.add_child.call_deferred(turret_instance) # makes the turret a child of the level, not the child, so it doesn't move with the player

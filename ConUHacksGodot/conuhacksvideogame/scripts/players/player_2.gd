extends CharacterBody2D

@export var move_speed: float = 250
@export var health: float = 100

@onready var turret = preload("res://scenes/player_2_turret.tscn")
@onready var main = get_tree().get_root().get_node(".") #gets the top node of the level as a variable

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("player2RIGHT") - Input.get_action_strength("player2LEFT"),
		Input.get_action_strength("player2DOWN") - Input.get_action_strength("player2UP")
	)
	var prev = Vector2(input_direction)
	
	velocity = input_direction * move_speed  # Use the built-in velocity property
	rotation = velocity.angle()
	move_and_slide()
	
	if input_direction == Vector2(0,0) and prev != Vector2(0,0):
		$Sprite2D.look_at(Vector2())
		prev = Vector2(0,0)
	
	if Input.is_action_just_pressed("player2SHOOT"):
		place_turret()

func lost_health():
	health -= 10
	print(health)

func place_turret():
	var turret_instance = turret.instantiate() #creates a clone of the turret
	turret_instance.position = position #makes the position of the turret the same as the player
	main.add_child.call_deferred(turret_instance) # makes the turret a child of the level, not the child, so it doesn't move with the player

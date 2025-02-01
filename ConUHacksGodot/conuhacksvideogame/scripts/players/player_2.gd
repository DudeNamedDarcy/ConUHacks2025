extends CharacterBody2D

@export var move_speed: float = 100
const BULLET_SCENE = preload("res://scenes/bullet.tscn")
@onready var bullet_spawner: Node2D = $BulletSpawner

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("player2RIGHT") - Input.get_action_strength("player2LEFT"),
		Input.get_action_strength("player2DOWN") - Input.get_action_strength("player2UP")
	)

	velocity = input_direction * move_speed  # Use the built-in velocity property
	
	if Input.is_action_just_pressed("player1SHOOT"):
		print("shooting!")
		var bullet = BULLET_SCENE.instantiate() #makes a copy of the bullet scene
		var tree = get_tree().current_scene
		tree.add_child(bullet) #add the bullet clone to the tree of this scene
		bullet.position = bullet_spawner.position
	move_and_slide()

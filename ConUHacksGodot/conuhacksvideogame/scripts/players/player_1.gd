extends CharacterBody2D


@export var move_speed: float = 250

@onready var turret = preload("res://scenes/player_1_turret.tscn")
@onready var main = get_tree().get_root().get_node(".") #gets the top node of the level as a variable

func _ready() -> void:
	pass


func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("player1RIGHT") - Input.get_action_strength("player1LEFT"),
		Input.get_action_strength("player1DOWN") - Input.get_action_strength("player1UP"))
	rotation = 90
	
	velocity = input_direction * move_speed  # Use the built-in velocity property
	rotation = velocity.angle()
	move_and_slide()
	
	if Input.is_action_just_pressed("player1SHOOT"):
		place_turret()

func place_turret():
	var turret_instance = turret.instantiate() #creates a clone of the turret
	turret_instance.position = position #makes the position of the turret the same as the player
	main.add_child.call_deferred(turret_instance) # makes the turret a child of the level, not the child, so it doesn't move with the player

##func shoot():
	#const BULLET_SCENE = preload("res://scenes/bullet.tscn")
	#@onready var main = get_tree().get_root().get_node("player1")
	#@onready var bullet_spawner: Node2D = $BulletSpawner
	#var bullet_speed = 600
	#@onready var bullet = preload("res://scenes/projectile.tscn")
	#var bullet_instance = bullet.instantiate() #makes a copy of the bullet scene
	#bullet_instance.direction = bullet_spawner.rotation
	#bullet_instance.spawnPosition = bullet_spawner.position
	#bullet_instance.spawnRotation = bullet_spawner.rotation
	#main.add_child.call_deferred(bullet_instance)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.match("projectile"):
		print("health DAMAGE!!!")

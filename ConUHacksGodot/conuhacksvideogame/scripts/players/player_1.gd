extends CharacterBody2D

@export var move_speed: float = 250

#health stuff
var this_player_one_health = 100
var max_health = 100

#@onready var health_bar: Node2D = $HealthBar
@onready var turret = preload("res://scenes/player_1_turret.tscn")
@onready var main = get_tree().get_root().get_node(".") #gets the top node of the level as a variable
@onready var turret_place_timer: Timer = $"Turret Place Timer"

var allowed_to_place = true

signal PlayerOneDead

func _ready() -> void:
	this_player_one_health = max_health


func _physics_process(delta):
	this_player_one_health = Global.player_one_health
	var input_direction = Vector2(
		Input.get_action_strength("player1RIGHT") - Input.get_action_strength("player1LEFT"),
		Input.get_action_strength("player1DOWN") - Input.get_action_strength("player1UP"))
	#rotation = 90
	
	velocity = input_direction * move_speed  # Use the built-in velocity property
	rotation = velocity.angle()
	move_and_slide()
	
	if Input.is_action_just_pressed("player1SHOOT"):
		if allowed_to_place == true :
			place_turret()
		else:
			pass


	if (this_player_one_health < 10):
		player_one_death()

func place_turret():
	allowed_to_place = false
	turret_place_timer.start()
	var turret_instance = turret.instantiate() #creates a clone of the turret
	turret_instance.position = position #makes the position of the turret the same as the player
	main.add_child.call_deferred(turret_instance) # makes the turret a child of the level, not the child, so it doesn't move with the player


func player_one_death():
	emit_signal("PlayerOneDead")
	#queue_free()
	#PLAYER TWO WINS!!!


func _on_round_set_up_round() -> void:
	Global.player_one_health = 100


func _on_turret_place_timer_timeout() -> void:
	allowed_to_place = true



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

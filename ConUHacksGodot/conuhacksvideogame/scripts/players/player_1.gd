extends CharacterBody2D

const BULLET_SCENE = preload("res://scenes/bullet.tscn")

@onready var main = get_tree().get_root().get_node("player1")

@onready var bullet_spawner: Node2D = $BulletSpawner

@export var move_speed: float = 100
var bullet_speed = 600
@onready var bullet = preload("res://scenes/projectile.tscn")

func _ready() -> void:
	pass


func _physics_process(delta):
	var input_direction = Vector2(
		Input.get_action_strength("player1RIGHT") - Input.get_action_strength("player1LEFT"),
		Input.get_action_strength("player1DOWN") - Input.get_action_strength("player1UP")
	)

	velocity = input_direction * move_speed  # Use the built-in velocity property
	rotation = velocity.angle()
	move_and_slide()
	
	if Input.is_action_just_pressed("player1SHOOT"):
		shoot()


func shoot():
	var bullet_instance = bullet.instantiate() #makes a copy of the bullet scene
	bullet_instance.direction = bullet_spawner.rotation
	bullet_instance.spawnPosition = bullet_spawner.position
	bullet_instance.spawnRotation = bullet_spawner.rotation
	main.add_child.call_deferred(bullet_instance)

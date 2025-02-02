extends CharacterBody2D

var speed = 100

var direction: float
var spawnPosition: Vector2
var spawnRotation: float
var projectile_health = 100
signal decreaseHealthOne

func _ready() -> void:
	global_position = spawnPosition
	global_rotation = spawnRotation

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(direction)
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.match("player1"): #checks if body hit is from player1
		damage_player_one()

	if body.name.match("player2"): #checks if body hit is from player2
		damage_player_two()

func damage_player_one():
	print("hit player one!")
	Global.player_one_health -= 10
	print(Global.player_one_health)
	queue_free()

func damage_player_two():
	print("hit player two!")
	Global.player_two_health -= 10
	print(Global.player_two_health)
	queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

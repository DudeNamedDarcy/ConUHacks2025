extends CharacterBody2D

var speed = 100

var direction: float
var spawnPosition: Vector2
var spawnRotation: float
signal decrease_health_two

func _ready() -> void:
	global_position = spawnPosition
	global_rotation = spawnRotation

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(direction)
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name.match("player1"): #checks if body hit is from player1
		print("hit player one!")
		queue_free()

	if body.name.match("player2"): #checks if body hit is from player2
		print("hit player two!")
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()

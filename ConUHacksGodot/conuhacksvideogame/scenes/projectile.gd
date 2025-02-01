extends CharacterBody2D

var speed = 100

var direction: float
var spawnPosition: Vector2
var spawnRotation: float

func _ready() -> void:
	global_position = spawnPosition
	global_rotation = spawnRotation

func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -speed).rotated(direction)
	move_and_slide()

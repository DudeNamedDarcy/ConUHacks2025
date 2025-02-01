extends Node2D

@onready var main = get_tree().get_root().get_node("ShootTest")
@onready var projectile = load("res://scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func shoot():
	var instance = projectile.instantiate()
	instance.direction = rotation
	instance.spawnPosition = global_position
	instance.spawnRotation = rotation
	main.add_child.call_deferred(instance)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	shoot()

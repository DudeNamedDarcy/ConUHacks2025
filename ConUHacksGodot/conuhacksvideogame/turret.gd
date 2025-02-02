extends Node2D
@onready var bullet = preload("res://scenes/projectile_turret_one.tscn")
@onready var bullet_fire_timer: Timer = $BulletFireTimer
@onready var main = get_tree().get_root().get_node(".") #gets the top node of the level as a variable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bullet_fire_timer_timeout() -> void:
	var bullet = bullet.instantiate()
	bullet.direction = randf_range(rotation - 0.7, rotation + 0.7)
	#print(bullet.direction)
	bullet.spawnPosition = global_position
	bullet.spawnRotation = rotation
	main.add_child.call_deferred(bullet)
	$AudioListener2D/SingleGunshot.play()
	await $AudioListener2D/SingleGunshot.finished

func _on_death_timer_timeout() -> void:
	queue_free()

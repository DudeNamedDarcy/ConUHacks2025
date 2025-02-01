extends CharacterBody2D

const SPEED = 200

# ignore this
# var velocity = Vector2.ZERO

func _physics_process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	
	if Input.is_action_pressed("player1RIGHT"):
		velocity.x += SPEED
	elif Input.is_action_pressed("player1LEFT"):
		velocity.x -= SPEED
	
	if Input.is_action_pressed("player1DOWN"):
		velocity.y += SPEED
	elif Input.is_action_pressed("player1UP"):
		velocity.y -= SPEED
	
	move_and_collide(velocity * delta)

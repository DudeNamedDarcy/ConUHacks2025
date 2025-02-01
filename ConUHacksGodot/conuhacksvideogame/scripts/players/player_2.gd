extends CharacterBody2D

@export var move_speed: float = 100

func _physics_process(_delta):
	var input_direction = Vector2(
		Input.get_action_strength("player2RIGHT") - Input.get_action_strength("player2LEFT"),
		Input.get_action_strength("player2DOWN") - Input.get_action_strength("player2UP")
	)

	# Normalize the direction to prevent diagonal speed boost
	if input_direction.length() > 0:
		input_direction = input_direction.normalized()

	velocity = input_direction * move_speed  # Use the built-in velocity property
	move_and_slide()

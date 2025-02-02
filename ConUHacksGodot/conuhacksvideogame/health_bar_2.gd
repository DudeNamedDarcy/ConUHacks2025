extends Node

@export var max_health = 100
var health = 100

@onready var HP_perc = $Label_HEALTH_PLAYER2
@onready var health_bar: ProgressBar = $Health_Bar_PLAYER2

func update_health_bar(given_health):
	$Health_Bar_PLAYER2.value = given_health
	
func take_damage(damage):
	health -= damage
	update_health_bar(health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	HP_perc = $Health_Bar_PLAYER2
	
	if health <= 25:
		var r = abs(health * 0.01 - 1.0)
		var g = health * 0.01
		var b = 0.0
		$Label_HEALTH_PLAYER2.modulate = Color(r, b, g)
	
	if health == 0:
		print("You died!")
		$Label_HEALTH_PLAYER2.visible = true
		
	#if Input.get_action_strength("Damage"):
		#take_damage(1)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	update_health_bar(health)
	$Label_HEALTH_PLAYER2.visible = false

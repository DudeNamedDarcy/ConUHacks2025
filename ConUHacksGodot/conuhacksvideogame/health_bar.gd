extends Node2D
#Added to CharacterBody2D

@export var max_health = 100
var health = 100

@export var LOW_HP : Color
@export var Og_HP : Color
var Health_label = RichTextLabel
var HP_perc = ProgressBar


func update_health_bar():
	$Health_bar.value = health
	
func take_damage(damage):
	health -= damage
	update_health_bar()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Health_label = $RichTextLabel
	HP_perc = $Health_bar
	if health == 0:
		print("You died!")
		
	if Input.get_action_strength("Damage"):
		take_damage(1)
		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	update_health_bar()

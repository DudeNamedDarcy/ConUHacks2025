extends Node

@export var max_health = 100
var health = 100

@onready var HP_perc = $Health_bar
@onready var health_bar: ProgressBar = $Health_bar



func update_health_bar(given_health):
	$Health_bar.value = given_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Global.player_one_health = health_bar.value
	
	if health <= 25:
		var r = abs(health * 0.01 - 1.0)
		var g = health * 0.01
		var b = 0.0
		$Health_bar.modulate = Color(r, b, g)
	
	if health == 0:
		print("You died!")
		$RichTextLabel.visible = true
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	update_health_bar(health)
	$RichTextLabel.visible = false

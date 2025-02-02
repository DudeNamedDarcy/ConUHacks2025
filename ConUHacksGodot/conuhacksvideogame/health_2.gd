extends Node2D

@export var max_health = 100
var health = 100
@onready var HP_perc = $Health_bar
@onready var health_bar: ProgressBar = $Health_bar



func update_health_bar(given_health):
	$Health_bar.value = given_health
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	health_bar.value = Global.player_two_health
	
	if $Health_bar.value > 25:
		var g = 255
		var r = 0.0
		var b = 0.0
		$Health_bar.modulate = Color(r, g, b)
	
	if $Health_bar.value <=5:
		print("You died!")
		$RichTextLabel.visible = true
	
	if $Health_bar.value <= 25:
		var r = 255
		var g = 0.0
		var b = 0.0
		$Health_bar.modulate = Color(r, b, g)
		

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health
	update_health_bar(health)
	$RichTextLabel.visible = false
	

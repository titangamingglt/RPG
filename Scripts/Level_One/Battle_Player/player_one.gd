extends Node2D
export var health = 100 setget set_hp
onready var health_text = $VBoxContainer/Player_health
onready var player_selected_text = $VBoxContainer/Player_selected
export var player_damage =30
var selected = false
func _ready():
	GlobalBattle.player_damage =player_damage
	health_text.text=str("Player health " , health)
	player_selected_text.text = str("Player Selected" , selected)
	pass
func _process(delta):
	player_selected_text.text = str("Player Selected" , selected)
	health_text.text=str("Player health " , health)
func set_hp(damage):
	health = damage
	


func _on_player_image_pressed():
	selected= true
	GlobalBattle.player_damage = player_damage
	print("selected")

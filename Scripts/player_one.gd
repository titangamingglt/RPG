extends HBoxContainer
export var health = 100 setget set_hp
onready var health_text = $VBoxContainer/Player_health
onready var player_selected_text = $VBoxContainer/Player_selected
var image = ["res://Sprite/protrait/kang.png","res://Sprite/protrait/simponi.png"]
var selected = false
func _ready():
	randomize()
	var imagae_choice = image[randi()%2]
	$player_image.set_normal_texture(load(imagae_choice))
	health_text.text=str("Player health " , health)
	player_selected_text.text = str("Player Selected" , selected)
	pass
func _process(delta):
	player_selected_text.text = str("Player Selected" , selected)
	
func set_hp(damage):
	health = damage
	health_text.text=str("Player health " , health)


func _on_player_image_pressed():
	selected= true

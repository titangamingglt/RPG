extends Node2D
onready var slider= $Slider
onready var scroll=$Slider/Scroll
var slider_height
var slider_width
func _ready():
	slider_height=slider.texture.get_height()/2
	slider_width=slider.texture.get_width()/2
func _process(delta):
	scroll.position.x=0
	if Input.is_action_pressed("click"):
		scroll.position.y=get_global_mouse_position().y


extends KinematicBody2D

func _ready():
	pass
func _input(event):
	if event.is_pressed() and event.is_action("ui_right"):
		position.x+=10
	if event.is_pressed() and event.is_action("ui_left"):
		position.x-=10
	if event.is_pressed() and event.is_action("ui_up"):
		position.y-=10
	if event.is_pressed() and event.is_action("ui_down"):
		position.y+=10

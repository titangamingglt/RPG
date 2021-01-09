extends Node2D
onready var _dialog_slection = "res://Demo/intro_dialog_bake.tres"
func _ready():
	$intro_animation.play("intro")
	$AudioStreamPlayer.play()

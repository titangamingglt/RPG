extends Node2D
onready var dialog =$YSort/UI_Layout/Dialoge
onready var _dialog_slection = "res://Dialouge/bake.tres"
func _ready():
	DialogGlobal._requesting_dialog(_dialog_slection,"Opening")

func _choice(did, nid, choice):
	if nid ==3 and  choice == "No" :
		get_tree().quit()
#

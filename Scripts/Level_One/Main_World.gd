extends Node2D
onready var dialog =$YSort/UI_Layout/Dialoge
onready var _dialog_slection = "res://Dialouge/bake.tres"
func _ready():
	pass
#	DialogGlobal._requesting_dialog(_dialog_slection,"Opening")

func _choice(did, nid, choice):
	if nid ==3 and  choice == "No" :
		get_tree().quit()
#


func _on_Battle_int_area_entered(area):
	$AnimationPlayer.play("change_scene")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://Scenes/Main/Battel_system/Battle_System.tscn")

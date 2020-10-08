extends StaticBody2D
onready var conv= "res://Dialouge/bake.tres"
onready var dia_name =""
var interacting =false
func _ready():
	DialogGlobal.connect("requested_info",self,"_requested_info")
	pass

func _input(event):
	if event.is_action_pressed("interaction"):
		if interacting:
			if GlobalQuest.quest.quest_one.status == "nc":
				dia_name = "NPC_Before_Quest"
				DialogGlobal._requesting_dialog(conv,"NPC_Before_Quest")
			elif GlobalQuest.quest.quest_one.status == "c":
				dia_name = "NPC_After_Quest"
				DialogGlobal._requesting_dialog(conv,"NPC_After_Quest")
			elif GlobalQuest.quest.quest_one.status == "og":
				dia_name = "NPC_Quest_Not_Complete"
				DialogGlobal._requesting_dialog(conv,"NPC_Quest_Not_Complete")
func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		interacting=true



func _on_Area2D_area_exited(area):
	if area.is_in_group("player"):
		interacting=false

func _requested_info():
	if DialogGlobal.nid ==9 and DialogGlobal.choice =="Yes":
			GlobalQuest.quest.quest_one.status = "og"
			

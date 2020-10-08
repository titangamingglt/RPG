extends Area2D 
var interaction
func _ready():
	pass

func _input(event):
	if event.is_action_pressed("interaction"):
		if interaction:
			GlobalQuest.quest.quest_one.status= "c"
			queue_free()

func _on_Necklace_area_entered(area):
	if area.is_in_group("player"):
		interaction = true

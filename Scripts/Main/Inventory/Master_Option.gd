extends Control
onready var option_tab= $main_panel/option_tab
var opened= false

func _ready():
	visible =false
	pass
func _input(event):
	if event.is_action_pressed("inventory"):
		if opened:
			visible=false
			opened =false
			option_tab.visible=false
		else :
			opened = true
			visible=true

func _on_equipment_pressed():
	option_tab.visible=true

